package com.yangshuai.ys_tiktok_flutter.video

import android.content.Context
import android.os.Build
import android.util.AttributeSet
import android.view.View
import android.view.ViewGroup
import android.widget.LinearLayout
import androidx.annotation.RequiresApi
import androidx.recyclerview.widget.OrientationHelper
import androidx.recyclerview.widget.RecyclerView
import com.yangshuai.ys_tiktok_flutter.R
import com.yangshuai.ys_tiktok_flutter.video.adapter.VideoTiktokRecyclerViewAdapter
import com.yangshuai.ys_tiktok_flutter.video.bean.PlatformlVideoBean
import com.yangshuai.ys_tiktok_flutter.video.jzvideo.Jzvd
import com.yangshuai.ys_tiktok_flutter.video.jzvideo.JzvdStdTikTok
import com.yangshuai.ys_tiktok_flutter.video.jzvideo.OnViewPagerListener
import com.yangshuai.ys_tiktok_flutter.video.jzvideo.ViewPagerLayoutManager
import io.flutter.plugin.platform.PlatformView

/**
 * @Author yangshuai
 * @Date 2023-04-13 周四 13:36
 * @Description TODO
 */
@RequiresApi(Build.VERSION_CODES.LOLLIPOP)
class TiktokView:LinearLayout, PlatformView {
    var viewGroup:ViewGroup? = null
    var rv:RecyclerView? = null
    //var videos = ArrayList<VideoBean>();
    var videoList = ArrayList<PlatformlVideoBean.RecordsBean>();
    //lateinit var adapter: PlatformVideoRecyclerViewAdapter
    var adapter: VideoTiktokRecyclerViewAdapter? = null
    var recyclerViewLayoutManager: ViewPagerLayoutManager? = null
    private var mCurrentPosition = -1
    private var itemHeight:Int = -1
    constructor(context: Context,viewGroup: ViewGroup):this(context){
        this.viewGroup = viewGroup
    }
    constructor(context: Context,viewGroup: ViewGroup,height: Int):this(context,viewGroup){
        this.itemHeight = height
    }
    constructor(context:Context):this(context, null)
    constructor(context: Context, attrs: AttributeSet?):this(context, attrs, 0)
    constructor(context: Context, attrs: AttributeSet?, defStyleAttr: Int):this(context, attrs, defStyleAttr, 0)
    constructor(context: Context, attrs: AttributeSet?, defStyleAttr: Int, defStyleRes: Int):super(context,attrs,defStyleAttr,defStyleRes){
        val view = View.inflate(context, R.layout.video_tiktok,viewGroup)
        rv = view?.findViewById(R.id.video_rv)
        for(i in 0..12){
            val bean = PlatformlVideoBean.RecordsBean()
            bean.videoUrl = "http://xiaotouhang.oss-cn-beijing.aliyuncs.com/xxth/manager/766e3bd859de4d15b3e65602845b8c14.mp4"
            videoList.add(bean)
        }
        if(recyclerViewLayoutManager == null) recyclerViewLayoutManager = ViewPagerLayoutManager(context, OrientationHelper.VERTICAL)
        addView(view)
        post {
            if(adapter == null) adapter = VideoTiktokRecyclerViewAdapter(context,itemHeight, videoList)
            rv?.let {
                it.layoutManager = recyclerViewLayoutManager
                it.adapter = adapter
            }
            recyclerViewLayoutManager?.setOnViewPagerListener(object : OnViewPagerListener {
                override fun onInitComplete() {
                    autoPlayVideo(0)
                }

                override fun onPageRelease(isNext: Boolean, position: Int) {
                    // 滑动时，释放上一个
                    if (mCurrentPosition == position) {
                        Jzvd.releaseAllVideos()
                    }
                }

                override fun onPageSelected(position: Int, isBottom: Boolean) {
                    //滑动后的当前Item ，具体自行打印
                    if (mCurrentPosition == position) {
                        return
                    }
                    autoPlayVideo(0)
                    mCurrentPosition = position
                    if (isBottom) {
                        //是最底部，执行加载更多数据
//                    pageNum++
//                    loadVideoData()
                    }
                }

            })
        }

    }
    private fun autoPlayVideo(pos:Int) {
        rv?.let {
            it.getChildAt(pos)?.let {view ->
                val player: JzvdStdTikTok = view.findViewById(R.id.jz_video)
                player.startVideoAfterPreloading()
            }?:let {
                return
            }
        }?:let {
            return
        }
    }

    /**
     * 对接flutter
     * */
//    private val showTextView: TextView = TextView(context)

    init {
//        showTextView.text = "hello This is android view"
    }
    override fun getView(): View {
        return this
    }

    override fun dispose() {

    }
}