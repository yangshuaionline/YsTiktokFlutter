import 'package:flutter/material.dart';
///消息
class MessageWidget extends StatefulWidget {
  const MessageWidget({super.key});
  @override
  State<MessageWidget> createState() => _MessageWidgetState();
}

class _MessageWidgetState extends State<MessageWidget> with SingleTickerProviderStateMixin{
  int _counter = 0;
  String title = "消息";
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