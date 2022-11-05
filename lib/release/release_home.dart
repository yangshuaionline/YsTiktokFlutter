import 'package:flutter/material.dart';
///发布
class ReleaseHomeWidget extends StatefulWidget {
  const ReleaseHomeWidget({super.key});
  @override
  State<ReleaseHomeWidget> createState() => _ReleaseHomeWidgetState();
}

class _ReleaseHomeWidgetState extends State<ReleaseHomeWidget> with SingleTickerProviderStateMixin{
  int _counter = 0;
  String title = "发布";
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