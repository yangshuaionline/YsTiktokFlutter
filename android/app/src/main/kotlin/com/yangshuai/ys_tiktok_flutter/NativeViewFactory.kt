package com.yangshuai.ys_tiktok_flutter

import android.content.Context
import android.os.Build
import android.widget.FrameLayout
import androidx.annotation.RequiresApi
import com.yangshuai.ys_tiktok_flutter.video.TiktokView
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory

/**
 * @Author yangshuai
 * @Date 2023-04-27 周四 16:38
 * @Description
 * Flutter调用Android的view入口集合
 */
class NativeViewFactory(val messenger:BinaryMessenger,val from:String): PlatformViewFactory(StandardMessageCodec.INSTANCE) {
    //接收传过来的值
    //        if(args is Map<*, *>){
//            args.forEach { (key, value) ->
//                if(key == "height"){
////                    println("传过来的111=》$key -> $value")
//                    var height = -1
//                    try {
//                        println("传过来的666=》")
//                        val dvalue = value as Double
//                        println("传过来的777=》")
//                        height = dvalue.toInt()
//                        println("传过来的888=》")
//                    }catch (e:Exception){
//                        println("传过来的555=》${e.message.toString()}")
//                    }
//
//                    println("传过来的222=》$key -> $height")
//                    return TiktokView(context,layout,height)
//                }
//            }
//        }
    @RequiresApi(Build.VERSION_CODES.LOLLIPOP)
    override fun create(context: Context, viewId: Int, args: Any?): PlatformView {

        val layout = FrameLayout(context)
        layout.layoutParams = FrameLayout.LayoutParams(
            FrameLayout.LayoutParams.MATCH_PARENT,
            FrameLayout.LayoutParams.MATCH_PARENT
        )
        return when(from){
            //刷抖音形式的，flutter插入Android全屏视频
            FlutterConst.video_tiktok_full -> TiktokView(context,layout)
            else-> TiktokView(context,layout)
        }
    }
}