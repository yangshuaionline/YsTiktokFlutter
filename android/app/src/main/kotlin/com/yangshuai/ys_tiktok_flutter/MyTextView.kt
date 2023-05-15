package com.yangshuai.ys_tiktok_flutter

import android.content.Context
import io.flutter.embedding.engine.FlutterEngineCache
import io.flutter.plugin.common.MethodChannel

/**
 * @Author yangshuai
 * @Date 2023-04-27 周四 16:06
 * @Description TODO
 */
class MyTextView(context: Context) : androidx.appcompat.widget.AppCompatTextView(context) {
    override fun onTextChanged(text: CharSequence?, start: Int, lengthBefore: Int, lengthAfter: Int) {
        super.onTextChanged(text, start, lengthBefore, lengthAfter)
        val arguments = mutableMapOf<String, Any>()
        arguments["text"] = text.toString()
        val event = mapOf(
            "eventType" to "onTextChanged",
            "arguments" to arguments
        )
        val channel = MethodChannel(FlutterEngineCache.getInstance().get("my_engine_id")!!.dartExecutor.binaryMessenger, "com.example.test/nativeTextView")
        channel.invokeMethod("onEvent", event)
    }
}