package com.yangshuai.ys_tiktok_flutter

import android.os.Build
import android.os.Bundle
import android.os.PersistableBundle
import android.view.View
import androidx.annotation.RequiresApi
import com.yangshuai.ys_tiktok_flutter.utils.WindowsUtils
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?, persistentState: PersistableBundle?) {
        super.onCreate(savedInstanceState, persistentState)
        val root: View = window.decorView.rootView
        root.setBackgroundColor(resources.getColor(R.color.black)) // 这里将背景颜色设置为资源文件中定义的颜色


    }
//    override fun onCreate(savedInstanceState: Bundle?) {
//        super.onCreate(savedInstanceState)
//        val view:View = View.inflate(this,R.layout.activity_tiktok,null)
//        val textView = view.findViewById<AppCompatTextView>(R.id.tv)
//        textView.text = "Hello Android"
//        val flutterEngine = FlutterEngine(this)
//        flutterEngine.dartExecutor.executeDartEntrypoint(
//            DartExecutor.DartEntrypoint.createDefault()
//        )
//
//        val channel = MethodChannel(flutterEngine.dartExecutor, "com.jzsh.www.jzsh_flutter/nativeTextView")
//        channel.setMethodCallHandler { call, result ->
//            when (call.method) {
//                "getText" -> result.success(textView.text.toString())
//                else -> result.notImplemented()
//            }
//        }
//
//        val flutterView = FlutterView(this)
//        flutterView.attachToFlutterEngine(flutterEngine)
//
//        val layoutParams = FrameLayout.LayoutParams(
//            FrameLayout.LayoutParams.WRAP_CONTENT,
//            FrameLayout.LayoutParams.WRAP_CONTENT)
//
//        val container = view.findViewById<FrameLayout>(R.id.container)
//        container.addView(flutterView, layoutParams)
//        val params = ViewGroup.LayoutParams(
//            FrameLayout.LayoutParams.WRAP_CONTENT,
//            FrameLayout.LayoutParams.WRAP_CONTENT)
//        addContentView(view,params)
//    }


    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        val registry = flutterEngine.platformViewsController.registry
        val list:MutableList<String> = mutableListOf()
        //刷抖音形式的，flutter插入Android全屏视频
        list.add(FlutterConst.video_tiktok_full)
        for(item in list.iterator()){
            registry.registerViewFactory(item, NativeViewFactory(flutterEngine.dartExecutor,item))
        }
    }
    @RequiresApi(Build.VERSION_CODES.JELLY_BEAN_MR1)
    override fun onResume() {
        super.onResume()
        Const.displayMetrics = resources.displayMetrics
        Const.screenWidth = Const.displayMetrics?.widthPixels
        Const.screenHeight = WindowsUtils.getFullActivityHeight(this)
    }
}
