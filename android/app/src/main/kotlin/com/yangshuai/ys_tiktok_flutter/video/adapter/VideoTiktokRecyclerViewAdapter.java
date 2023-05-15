package com.yangshuai.ys_tiktok_flutter.video.adapter;

import android.content.Context;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import com.yangshuai.ys_tiktok_flutter.AppApplication;
import com.yangshuai.ys_tiktok_flutter.R;
import com.yangshuai.ys_tiktok_flutter.video.bean.PlatformlVideoBean;
import com.yangshuai.ys_tiktok_flutter.video.db.VideoDB;
import com.yangshuai.ys_tiktok_flutter.video.jzvideo.JZDataSource;
import com.yangshuai.ys_tiktok_flutter.video.jzvideo.Jzvd;
import com.yangshuai.ys_tiktok_flutter.video.jzvideo.JzvdStdTikTok;
import com.yangshuai.ys_tiktok_flutter.Const;
import org.litepal.LitePal;
import org.litepal.crud.callback.FindMultiCallback;
import org.litepal.crud.callback.SaveCallback;
import java.util.LinkedHashMap;
import java.util.List;

public class VideoTiktokRecyclerViewAdapter extends RecyclerView.Adapter<VideoTiktokRecyclerViewAdapter.VideoTiktokViewHolder> {
    private Context context;
    private int height;
    private List<PlatformlVideoBean.RecordsBean> list;
    public VideoTiktokRecyclerViewAdapter(Context context,int height, List<PlatformlVideoBean.RecordsBean> dataList) {
        this.context = context;
        this.height = height;
        this.list = dataList;
    }

    private void logAll(){
        LitePal.findAllAsync(VideoDB.class).listen(new FindMultiCallback<VideoDB>() {
            @Override
            public void onFinish(List<VideoDB> list) {
                Log.d("=====>","SQL中数据总数"+list.size());
                //查询到的结果集将回调到此方法中
                for(int i = 0;i<list.size();i++){
                    Log.d("=====>","|||"+list.get(i).getKey()+"|||"+list.get(i).getUrl());
                }
            }
        });
    }

    @NonNull
    @Override
    public VideoTiktokViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View view = View.inflate(context, R.layout.video_tiktok_item,null);
        return new VideoTiktokViewHolder(view);
    }

    @Override
    public void onBindViewHolder(@NonNull VideoTiktokViewHolder holder, int position) {
        Log.d("=====>走一次","================>"+position);
//        Log.i("传过来的333==》",""+height);
//        if(height!=-1){
//            Log.i("传过来的444=》",""+height);
//            ViewGroup.LayoutParams layoutParams = new ViewGroup.LayoutParams(
//                    ViewGroup.LayoutParams.MATCH_PARENT, // 宽度使用 MATCH_PARENT
//                    height // 设置高度为 300 像素
//            );
//            holder.jzVideo.setLayoutParams(layoutParams);
//        }
        if(Const.INSTANCE.getScreenHeight()!=null){
            ViewGroup.LayoutParams layoutParams = new ViewGroup.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, // 宽度使用 MATCH_PARENT
                    Const.INSTANCE.getScreenHeight() // 设置高度为 300 像素
            );
            holder.jzVideo.setLayoutParams(layoutParams);
        }


        PlatformlVideoBean.RecordsBean data = list.get(position);
        String proxyUrl = null;
        try {
            LinkedHashMap map = new LinkedHashMap();
            proxyUrl = AppApplication.getProxy(context).getProxyUrl(data.getVideoUrl());
            //        map.put("高清", proxyUrl);
            //        map.put("标清", VideoConstant.videoUrls[0][6]);
            //        map.put("普清", VideoConstant.videoUrlList[0]);
        }catch (Exception e){
            Log.d("=====>视频缓存异常",e.getMessage().toString());
            proxyUrl = data.getVideoUrl();
        }
        try {
            JZDataSource jzDataSource = new JZDataSource(proxyUrl);
            jzDataSource.looping = true;//设置循环播放
            holder.jzVideo.setUp(jzDataSource, Jzvd.SCREEN_FULLSCREEN);
        }catch (Exception e){
            Log.d("=====>视频播放异常",e.getMessage().toString());
        }

//        BaseBindingAdapter.loadImage(jzVideo.posterImageView, data.getCover());
//        BaseBindingAdapter.loadImage(jzVideo.posterImageView, data.getVideoUrl());
        try {
//            List<VideoDB> resources = LitePal.where("key ="+position).find(VideoDB.class);
//            if(resources.isEmpty()){
//
//            }else{
//                for(int i = 0;i<resources.size();i++){
//                    VideoDB db = resources.get(i);
//                    db.setAgree(111);
//                    db.setAgree(true);
//                    db.setCollect(222);
//                    db.setCollect(false);
//                    db.setImg(data.getCover());
//                    db.setUrl(proxyUrl);
//                    db.updateAsync(1).listen(new UpdateOrDeleteCallback() {
//                        @Override
//                        public void onFinish(int rowsAffected) {
//                            Log.d("=====>","更新结果"+rowsAffected);
//                            logAll();
//                        }
//                    });
//                }
//            }
            VideoDB db = new VideoDB();
            db.setKey(position);
            db.setAgree(111);
            db.setAgree(true);
            db.setCollect(222);
            db.setCollect(false);
            db.setImg(data.getCover());
            db.setUrl(proxyUrl);
            db.saveOrUpdateAsync("key = "+position).listen(new SaveCallback() {
                @Override
                public void onFinish(boolean success) {
                    Log.d("=====>","保存结果"+success);
                    logAll();
                }
            });

        }catch (Exception e){
            Log.d("=====>视频SQL存储异常",e.getMessage().toString());
        }
    }

    @Override
    public int getItemCount() {
        return list.size();
    }

    static class VideoTiktokViewHolder extends RecyclerView.ViewHolder{
//        holder.itemView.findViewById(R.id.jz_video);
        JzvdStdTikTok jzVideo;
        public VideoTiktokViewHolder(@NonNull View itemView) {
            super(itemView);
            jzVideo = itemView.findViewById(R.id.jz_video);
        }
    }
}
