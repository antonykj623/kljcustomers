package com.kljcafe.customers.kljcafe_customers

import android.app.Activity
import android.content.Context
import android.content.Intent
import android.content.SharedPreferences
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant
import com.kljcafe.customers.kljcafe_customers.NotificationHelper

class MainActivity : FlutterFragmentActivity() {

    // -------- CHANNELS --------
    private val PREF_CHANNEL = "native_prefs"
    private val QR_CHANNEL = "qr_scanner_channel"

    private val QR_REQUEST_CODE = 1001
    private var qrResultCallback: MethodChannel.Result? = null



    private val NOTIFICATION_CHANNEL = "native_notifications"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {

        // 🔥 REQUIRED for older plugins + FragmentActivity
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        super.configureFlutterEngine(flutterEngine)

        // ---------------- PREF CHANNEL ----------------
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            PREF_CHANNEL
        ).setMethodCallHandler { call, result ->

            val prefs: SharedPreferences =
                getSharedPreferences("native_storage", Context.MODE_PRIVATE)

            when (call.method) {

                "setString" -> {
                    val key = call.argument<String>("key")
                    val value = call.argument<String>("value")
                    prefs.edit().putString(key, value).apply()
                    result.success(null)
                }

                "getString" -> {
                    val key = call.argument<String>("key")
                    val value = prefs.getString(key, null)
                    result.success(value)
                }

                else -> result.notImplemented()
            }
        }

        // ---------------- QR SCANNER CHANNEL ----------------
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            QR_CHANNEL
        ).setMethodCallHandler { call, result ->

            if (call.method == "openQRScanner") {
                qrResultCallback = result
                val intent = Intent(this, QRScannerActivity::class.java)
                startActivityForResult(intent, QR_REQUEST_CODE)
            } else {
                result.notImplemented()
            }
        }

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            NOTIFICATION_CHANNEL
        ).setMethodCallHandler { call, result ->

            if (call.method == "showNotification") {
                val title = call.argument<String>("title") ?: "Notification"
                val message = call.argument<String>("message") ?: ""
                NotificationHelper.createChannel(this)
                NotificationHelper.showNotification(this, title, message)
                result.success(null)
            } else {
                result.notImplemented()
            }
        }







    }

    // -------- RECEIVE QR RESULT --------
    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)

        if (requestCode == QR_REQUEST_CODE) {
            if (resultCode == Activity.RESULT_OK) {
                val qrText = data?.getStringExtra("qr_result")
                qrResultCallback?.success(qrText)
            } else {
                qrResultCallback?.error("CANCELLED", "QR scan cancelled", null)
            }
            qrResultCallback = null
        }
    }


}
