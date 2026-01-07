package com.kljcafe.customers.kljcafe_customers

import android.Manifest
import android.app.Activity
import android.content.Context
import android.content.Intent
import android.content.SharedPreferences
import android.content.pm.PackageManager
import android.os.Build
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : FlutterFragmentActivity() {

    // -------- CHANNEL NAMES --------
    private val PREF_CHANNEL = "native_prefs"
    private val QR_CHANNEL = "qr_scanner_channel"
    private val NOTIFICATION_CHANNEL = "native_notifications"

    // -------- REQUEST CODES --------
    private val QR_REQUEST_CODE = 1001
    private val CAMERA_PERMISSION_CODE = 2001
    private val NOTIFICATION_PERMISSION_CODE = 2002

    private var qrResultCallback: MethodChannel.Result? = null
    private var pendingQRScan = false

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
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
                    result.success(prefs.getString(key, null))
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

                if (ContextCompat.checkSelfPermission(
                        this,
                        Manifest.permission.CAMERA
                    ) != PackageManager.PERMISSION_GRANTED
                ) {
                    pendingQRScan = true
                    ActivityCompat.requestPermissions(
                        this,
                        arrayOf(Manifest.permission.CAMERA),
                        CAMERA_PERMISSION_CODE
                    )
                } else {
                    openQRScanner()
                }
            } else {
                result.notImplemented()
            }
        }

        // ---------------- NOTIFICATION CHANNEL ----------------
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            NOTIFICATION_CHANNEL
        ).setMethodCallHandler { call, result ->

            when (call.method) {

                "showNotification" -> {
                    val title = call.argument<String>("title") ?: "Notification"
                    val message = call.argument<String>("message") ?: ""

                    if (checkNotificationPermission()) {
                        NotificationHelper.createChannel(this)
                        NotificationHelper.showNotification(this, title, message)
                    }

                    result.success(null)
                }

                "requestNotificationPermission" -> {
                    checkNotificationPermission()
                    result.success(null)
                }

                else -> result.notImplemented()
            }
        }
    }

    // -------- OPEN QR SCANNER --------
    private fun openQRScanner() {
        val intent = Intent(this, QRScannerActivity::class.java)
        startActivityForResult(intent, QR_REQUEST_CODE)
    }

    // -------- NOTIFICATION PERMISSION (ANDROID 13+) --------
    private fun checkNotificationPermission(): Boolean {
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
            if (ContextCompat.checkSelfPermission(
                    this,
                    Manifest.permission.POST_NOTIFICATIONS
                ) != PackageManager.PERMISSION_GRANTED
            ) {
                ActivityCompat.requestPermissions(
                    this,
                    arrayOf(Manifest.permission.POST_NOTIFICATIONS),
                    NOTIFICATION_PERMISSION_CODE
                )
                false
            } else {
                true
            }
        } else {
            true
        }
    }

    // -------- PERMISSION RESULT HANDLER --------
    override fun onRequestPermissionsResult(
        requestCode: Int,
        permissions: Array<out String>,
        grantResults: IntArray
    ) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults)

        when (requestCode) {

            CAMERA_PERMISSION_CODE -> {
                if (grantResults.isNotEmpty() && grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                    if (pendingQRScan) {
                        openQRScanner()
                        pendingQRScan = false
                    }
                } else {
                    qrResultCallback?.error(
                        "PERMISSION_DENIED",
                        "Camera permission denied",
                        null
                    )
                    qrResultCallback = null
                    pendingQRScan = false
                }
            }
        }
    }

    // -------- RECEIVE QR RESULT --------
    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)

        if (requestCode == QR_REQUEST_CODE) {
            if (resultCode == Activity.RESULT_OK) {
                qrResultCallback?.success(data?.getStringExtra("qr_result"))
            } else {
                qrResultCallback?.error("CANCELLED", "QR scan cancelled", null)
            }
            qrResultCallback = null
        }
    }
}
