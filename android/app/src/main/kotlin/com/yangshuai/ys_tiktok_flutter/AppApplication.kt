package com.yangshuai.ys_tiktok_flutter

import android.content.Context
import com.danikula.videocache.HttpProxyCacheServer
import org.litepal.LitePal
import org.litepal.LitePalApplication

/**
 * @Author yangshuai
 * @Date 2023-04-27 周四 18:05
 * @Description TODO
 */
class AppApplication: LitePalApplication() {
    companion object{
        @JvmStatic
        fun getProxy(context: Context): HttpProxyCacheServer {
            val app: AppApplication = context.applicationContext as AppApplication
            return app.porxy?.let {
                app.porxy
            }?:let {
                app.newProxy().also { app.porxy = it }
            }
        }
    }

    //视频缓存
    private var porxy: HttpProxyCacheServer? = null
    override fun onCreate() {
        super.onCreate()
//        MultiDex.install(this);
        LitePal.initialize(this) //初始化数据库
    }


    private fun newProxy(): HttpProxyCacheServer {
        return HttpProxyCacheServer(this)
    }
}