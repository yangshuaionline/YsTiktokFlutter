


import 'package:banner_carousel/banner_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../utils/refresher.dart';
import '../widget/Toasts.dart';
import '../widget/firstHeader.dart';
///首页，抖音视频播放
class FirstPage extends StatefulWidget{
  const FirstPage({super.key});
  @override
  State createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  List<String> items = ["1", "2", "3", "4", "5", "6", "7", "8"];
  List<BannerModel> listBanners = [
    BannerModel(imagePath: "https://picjumbo.com/wp-content/uploads/the-golden-gate-bridge-sunset-1080x720.jpg", id: "1"),
    BannerModel(imagePath: "https://picjumbo.com/wp-content/uploads/the-golden-gate-bridge-sunset-1080x720.jpg", id: "2"),
    BannerModel(imagePath: "https://picjumbo.com/wp-content/uploads/the-golden-gate-bridge-sunset-1080x720.jpg", id: "3"),
    BannerModel(imagePath: "https://picjumbo.com/wp-content/uploads/the-golden-gate-bridge-sunset-1080x720.jpg", id: "4"),
  ];
  RefreshController refreshController =
  RefreshController(initialRefresh: false);

  void onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    refreshController.refreshCompleted();
  }

  void onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    items.add((items.length + 1).toString());
    if (mounted)
      setState(() {

      });
    refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            children: [
              FirstHeader(
                  onSearch: (){
                    showToast("跳转过来了", 12.sp);
                  }
              ),
              Expanded(
                  flex: 1,
                  child:getSmartRefresher(refreshController,onRefresh,onLoading,ListView.builder(
                    itemBuilder: (c, i){
                      if(i == 0){
                        return Card(child: Center(child: BannerCarousel.fullScreen(
                          banners: listBanners,
                          animation: false,
                        )));
                      }else{
                        return Card(child: Center(child: Text(items[i])));
                      }
                    } ,
                    itemExtent: 100.0,
                    itemCount: items.length,
                  ),
                  )

              )
            ]
        ));

  }
}
