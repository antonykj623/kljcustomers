package com.kljcafe.customers.kljcafe_customers

import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import io.flutter.embedding.engine.FlutterEngine
import android.content.Context
import android.content.SharedPreferences
class MainActivity : FlutterActivity(){

    private val CHANNEL = "native_prefs"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CHANNEL
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
    }
}
