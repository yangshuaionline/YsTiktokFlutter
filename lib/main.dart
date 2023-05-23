import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:ys_tiktok_flutter/page/homePage.dart';
import 'package:ys_tiktok_flutter/utils/system.dart';
///底层页
///初始化整个APP得基础操作
void main() async{

  /// 自定义报错页面
  if (kReleaseMode) {
    ErrorWidget.builder = (FlutterErrorDetails flutterErrorDetails) {
      debugPrint(flutterErrorDetails.toString());
      return const Material(
        child: Center(
            child: Text(
              "发生了没有处理的错误\n请通知开发者",
              textAlign: TextAlign.center,
            )
        ),
      );
    };
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    //屏幕适配全局初始化
    return setInit(const HomePage());
  }
}
