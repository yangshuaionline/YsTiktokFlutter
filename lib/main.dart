import 'package:flutter/material.dart';
import 'package:ys_tiktok_flutter/friend/friend_home.dart';
import 'package:ys_tiktok_flutter/home/home_home.dart';
import 'package:ys_tiktok_flutter/message/message_home.dart';
import 'package:ys_tiktok_flutter/mine/mine_home.dart';
import 'package:ys_tiktok_flutter/release/release_home.dart';
///main
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        splashColor: Colors.transparent, // 点击时的高亮效果设置为透明
        highlightColor: Colors.transparent, // 长按时的扩散效果设置为透明
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class MainTab{
  late int index;
  late Widget widget;
  MainTab(this.index, this.widget);
}
class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{
  int _counter = 0;
  final List<Widget> _pageList = <Widget>[
    const HomeWidget(),//主页
    const FriendWidget(),//朋友
    const ReleaseHomeWidget(),//发布
    const MessageWidget(),//消息
    const MineHomeWidget()];//我
  String title = "You have pushed the button this many times";
  String getTitle(){
    if(_counter == 0) return "000";
    return title;
  }
  @override
  void initState(){
    super.initState();
  }
  /// 生命周期函数，组件销毁时调用
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageList[_counter],
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,//去掉点击效果
          highlightColor: Colors.transparent,//去掉点击效果
        ),
        child: BottomNavigationBar(
          onTap: (int index){
            setState(() {
              _counter = index;//更新UI
            });
            // if (kDebugMode) print("$_counter");//打印页面数据
          },
          // iconSize: 1,
          selectedItemColor:Colors.blue,
          unselectedItemColor:Colors.grey,
          // backgroundColor:Colors.transparent,
          currentIndex: _counter,
          type: BottomNavigationBarType.fixed, //配置底部tabs可以有多个按钮
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
            BottomNavigationBarItem(icon: Icon(Icons.person_add), label: "朋友"),
            BottomNavigationBarItem(icon: Icon(Icons.add_box_outlined),label:"发布"),
            BottomNavigationBarItem(icon: Icon(Icons.message), label: "消息"),
            BottomNavigationBarItem(icon: Icon(Icons.person_pin), label: "我"),
          ],
        ),
      )
    );
  }
}
