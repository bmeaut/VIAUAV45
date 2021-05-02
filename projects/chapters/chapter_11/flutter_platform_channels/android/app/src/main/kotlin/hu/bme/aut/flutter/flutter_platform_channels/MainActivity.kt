package hu.bme.aut.flutter.flutter_platform_channels

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {

    private val CHANNEL = "hu.bme.aut.flutter/data"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            // Note: this method is invoked on the main thread.
            if (call.method == "getPlatformSpecificData") {
                val currentTemp = getPlatformSpecificData()
                if (currentTemp != "") {
                    result.success(currentTemp)
                } else {
                    result.error("UNAVAILABLE", "Temperature level not available.", null)
                }
            } else {
                result.notImplemented()
            }
        }
    }

    private fun getPlatformSpecificData(): String {
        val currentTemp = "30"
        return currentTemp
    }

}
