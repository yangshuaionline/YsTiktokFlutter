

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../Const.dart';
import '../router/RouteGenerator.dart';
import '../router/Router.dart';
import '../style/style.dart';

/// 整体设置  初始化
Widget setInit(Widget widget){
  return setScreenUtilInit(widget);
}
// 屏幕适配
Widget setScreenUtilInit(Widget widget){
  return ScreenUtilInit(
    designSize: const Size(screenWidth, screenHeight),
    minTextAdapt: true,
    splitScreenMode: true,
    builder: (context , child) => setRefreshConfiguration(widget),
  );
}

//设置刷新加载
Widget setRefreshConfiguration(Widget widget){
  return RefreshConfiguration(
    // 刷新头
      headerBuilder: () => const WaterDropHeader(),
      // 加载尾
      footerBuilder:  () => const ClassicFooter(),
      // 触发刷新距离
      headerTriggerDistance: 80.0.w,
      // 设置回弹
      springDescription:const SpringDescription(stiffness: 170, damping: 16, mass: 1.9),
      // 头部最大得拖动范围
      maxOverScrollExtent :100.w,
      // 底部最大得拖动范围
      maxUnderScrollExtent:0.w,
      //此属性与PageView和TabBarView不兼容。如果需要TabBarView左右滑动，则需要将其设置为true。
      enableScrollWhenRefreshCompleted: true,
      //在加载失败的情况下，用户仍然可以通过手势上拉来触发更多的加载。
      enableLoadingWhenFailed : true,
      //当Viewport小于一个屏幕时，禁用上拉以加载更多功能
      hideFooterWhenNotFull: false,
      //BallisticScrollActivity触发加载更多
      enableBallisticLoad: true,
      child: setRouter(widget)
  );
}

//设置路由 以及初始化
Widget setRouter(Widget widget){
  return MaterialApp(
    title: appName,
    initialRoute: routerHome,
    onGenerateRoute: RouteGenerator.generateRoute,
    theme: ThemeData(
      // colorScheme: const  ColorScheme(
      //     primary: Colors.redAccent,//上方标题栏颜色
      //     primaryVariant: Colors.white,
      //     secondary: Colors.green,
      //     background: Colors.white,
      //     error: Colors.red,
      //     brightness:Brightness.light,
      //     onBackground: Colors.pink,
      //     secondaryVariant: Colors.white,
      //     onError: Colors.yellow,
      //     onPrimary: Colors.white,//字体颜色
      //     onSecondary: Colors.redAccent,
      //     onSurface: Colors.redAccent,
      //     surface: Colors.redAccent,
      //   // all fields should have a value
      // ),
      // brightness: Brightness.light,
      hintColor: Colors.white,
      // accentColor: Colors.white,
      primaryColor: ColorPlate.orange,
      primaryColorBrightness: Brightness.light,
      scaffoldBackgroundColor: ColorPlate.back1,
      dialogBackgroundColor: ColorPlate.back2,
      // accentColorBrightness: Brightness.light,
      textTheme: const TextTheme(bodyText1: StandardTextStyle.normal,),
      // inputDecorationTheme: const InputDecorationTheme(
      //   labelStyle: TextStyle(color: Colors.grey)
      // ),
    ),
    home: widget,
  );
}