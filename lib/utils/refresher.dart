

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
/// 刷新加载 得调用
SmartRefresher getSmartRefresher(
    RefreshController refreshController,
    VoidCallback onRefresh,
    VoidCallback onLoading,
    Widget widget,){
  return SmartRefresher(
    enablePullDown: true,
    enablePullUp: true,
    header: const WaterDropHeader(),
    footer: CustomFooter(
      builder: _getFooterBuilder(),
    ),
    controller: refreshController,
    onRefresh: onRefresh,
    onLoading: onLoading,
    child: widget,
  );
}

FooterBuilder _getFooterBuilder(){
  return  (BuildContext context, LoadStatus? mode) {
    Widget body;
    if (mode == LoadStatus.idle) {
      body = const Text("pull up load");
    }
    else if (mode == LoadStatus.loading) {
      body = const CupertinoActivityIndicator();
    }
    else if (mode == LoadStatus.failed) {
      body = const Text("Load Failed!Click retry!");
    }
    else if (mode == LoadStatus.canLoading) {
      body = const Text("release to load more");
    }
    else {
      body = const Text("No more Data");
    }
    return SizedBox(
      height: 55.0.w,
      child: Center(child: body),
    );
  };
}