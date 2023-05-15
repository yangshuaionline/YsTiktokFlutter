
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import '../nativeConst.dart';
import '../page/ErrorPage.dart';
///视频平台通讯

////刷抖音形式的，flutter插入Android/IOS全屏视频,Flutter端参数
Widget getNativeChildVideoTiktok(){
  if(defaultTargetPlatform == TargetPlatform.android){
    // String jsonString = '{"width": $screenWidth, "height": $screenHeight}';
    return AndroidView(
      viewType: videoFull,
      creationParamsCodec: StandardMessageCodec(),
      creationParams: <String, dynamic>{
        // "width":screenWidth.h,
        // "height":screenHeight.w
      },
    );
  }else if(defaultTargetPlatform == TargetPlatform.iOS){
    return const UiKitView(viewType: videoFull);
  }
  return  const ErrorPage(error: "不支持的平台");
}