package com.yangshuai.ys_tiktok_flutter

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.FrameLayout
import android.widget.TextView
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.android.FlutterView
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.dart.DartExecutor
import io.flutter.plugin.common.MethodChannel

class TiktokActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_tiktok)
        val textView = findViewById<TextView>(R.id.tv)
        textView.text = "Hello Android"
        val flutterEngine = FlutterEngine(this)
        flutterEngine.dartExecutor.executeDartEntrypoint(
            DartExecutor.DartEntrypoint.createDefault()
        )

        val channel = MethodChannel(flutterEngine.dartExecutor, "com.jzsh.www.jzsh_flutter/nativeTextView")
        channel.setMethodCallHandler { call, result ->
            when (call.method) {
                "getText" -> result.success(textView.text.toString())
                else -> result.notImplemented()
            }
        }

        val flutterView = FlutterView(this)
        flutterView.attachToFlutterEngine(flutterEngine)

        val layoutParams = FrameLayout.LayoutParams(
            FrameLayout.LayoutParams.MATCH_PARENT,
            FrameLayout.LayoutParams.MATCH_PARENT)

        val container = findViewById<FrameLayout>(R.id.container)
        container.addView(flutterView, layoutParams)
    }
}