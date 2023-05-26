import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';
import 'package:ys_tiktok_flutter/widget/SelectText.dart';
import '../persistence/userStorage.dart';
import '../router/Router.dart';
import '../widget/homeTabBar.dart';
import 'firstPage.dart';
/// 单独修改了bottomSheet组件的高度
import '../other/bottomSheet.dart' as CustomBottomSheet;
///Home页面
///页面包括底部四个button和页面整体得交互
class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  /// tab标签
  HomePageTag tabBarType = HomePageTag.home;



  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {

  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
    Future.delayed(Duration.zero, () {
      UserStorage.getToken().then((value){
        if(value.isEmpty){
          Navigator.pushNamed(context, routerWelcome);
        }else{
          Logger().i("已经登录，token为===>$value");
        }
      });

    });
  }
  HomePageTag onTagAAA(){
    return HomePageTag.home;
  }
  @override
  Widget build(BuildContext context) {
    Widget? currentPage = const FirstPage();
    switch (tabBarType) {
      case HomePageTag.home:
        currentPage = const FirstPage();
        break;
      case HomePageTag.friend:
        currentPage = const FirstPage();
        break;
      case HomePageTag.push:

        break;
      case HomePageTag.message:
        currentPage = const FirstPage();
        break;
      case HomePageTag.mine:
        currentPage = const FirstPage();
        break;
    }
    return Scaffold(
      body: currentPage,
      bottomNavigationBar: HomeTabBar(
        hasBackground: true,
        current: tabBarType,
        onTabSwitch:(type){
          setState(() {
            tabBarType = type;
            //切换时候的限制操作
          });
        },
        onAddButton:() async {
          //中间按钮的点击事件（发布）
          Navigator.pushNamed(context, routerPush);
        },
      ),
    );
  }
}
