import 'package:flutter/material.dart';
///朋友
class FriendWidget extends StatefulWidget {
  const FriendWidget({super.key});
  @override
  State<FriendWidget> createState() => _FriendWidgetState();
}

class _FriendWidgetState extends State<FriendWidget> with SingleTickerProviderStateMixin{
  int _counter = 0;
  String title = "朋友";
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