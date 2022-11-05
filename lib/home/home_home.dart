import 'package:flutter/material.dart';
///首页
class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});
  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> with SingleTickerProviderStateMixin{
  int _counter = 0;
  String title = "首页";
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
  Column build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      // children: _pageList,
      children: <Widget>[
        Text(
          title,
        ),
        Text(
          '$_counter',
          style: Theme.of(context).textTheme.headline4,
        ),
      ],
    );
  }
}