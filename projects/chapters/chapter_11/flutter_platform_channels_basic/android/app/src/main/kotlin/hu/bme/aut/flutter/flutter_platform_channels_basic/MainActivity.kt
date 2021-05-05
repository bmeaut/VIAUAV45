package hu.bme.aut.flutter.flutter_platform_channels_basic

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import android.content.Context
import android.content.Intent
import android.hardware.Sensor
import android.hardware.SensorEvent
import android.hardware.SensorEventListener
import android.hardware.SensorManager
import android.os.Bundle

class MainActivity : FlutterActivity(), SensorEventListener {

    //region sensor specific code
    private lateinit var sensorManager: SensorManager
    private var tempSensor: Sensor? = null
    private var currentTempFromSensor: Int = 0

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        // Get an instance of the sensor service, and use that to get an instance of
        // a particular sensor.
        sensorManager = getSystemService(Context.SENSOR_SERVICE) as SensorManager
        tempSensor = sensorManager.getDefaultSensor(Sensor.TYPE_AMBIENT_TEMPERATURE)
    }
    //endregion

    //region Flutter specific code
    private val CHANNEL = "hu.bme.aut.flutter/data"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            // Note: this method is invoked on the main thread.
            if (call.method == "getPlatformSpecificData") {
                val currentTemp = getPlatformSpecificData()
                if (currentTemp != null) {
                    result.success(currentTemp)
                } else {
                    result.error("UNAVAILABLE", "Temperature level not available.", null)
                }
            } else {
                result.notImplemented()
            }
        }
    }
    //endregion

    //region sensor specific code
    override fun onSensorChanged(event: SensorEvent?) {
        currentTempFromSensor = event!!.values[0].toInt()
    }

    override fun onAccuracyChanged(sensor: Sensor?, accuracy: Int) {
        // Do something here if sensor accuracy changes.
    }

    override fun onResume() {
        super.onResume()
        sensorManager.registerListener(this, tempSensor, SensorManager.SENSOR_DELAY_NORMAL)
    }

    override fun onPause() {
        super.onPause()
        sensorManager.unregisterListener(this)
    }
    //endregion

    private fun getPlatformSpecificData(): Int {
        //return 30
        return currentTempFromSensor
    }
}
