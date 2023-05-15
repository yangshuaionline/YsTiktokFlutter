package com.yangshuai.ys_tiktok_flutter.video

import android.app.Activity
import android.os.Build
import android.view.ViewGroup
import androidx.annotation.RequiresApi

/**
 * @Author yangshuai
 * @Date 2023-04-13 周四 10:24
 * @Description 视频播放入口
 */
object VideoUser {
    /**
     * tiktok布局嵌入
     * */
    @RequiresApi(Build.VERSION_CODES.LOLLIPOP)
    fun setTiktok(activity: Activity, viewGroup: ViewGroup, bean: VideoBean){
        val view = TiktokView(activity,viewGroup)
        viewGroup.addView(view)
    }

}