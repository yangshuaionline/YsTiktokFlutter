
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../style/style.dart';
import 'SelectText.dart';

enum HomePageTag {
  home,
  friend,
  push,
  message,
  mine
}
/// 首页tab标签
class HomeTabBar extends StatelessWidget {
  final Function(HomePageTag)? onTabSwitch;
  final Function()? onAddButton;

  final bool hasBackground;
  final HomePageTag? current;

  const HomeTabBar({
    Key? key,
    this.onTabSwitch,
    this.current,
    this.onAddButton,
    this.hasBackground: false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final EdgeInsets padding = MediaQuery.of(context).padding;
    Widget row = Row(
      children: <Widget>[
        Expanded(
          child: GestureDetector(
            child: SelectText(
              isSelect: current == HomePageTag.home,
              title: '首页',
            ),
            onTap: () => onTabSwitch?.call(HomePageTag.home),
          ),
        ),
        Expanded(
          child: GestureDetector(
            child: SelectText(
              isSelect: current == HomePageTag.friend,
              title: '朋友',
            ),
            onTap: () => onTabSwitch?.call(HomePageTag.friend),
          ),
        ),
        Expanded(
          child: GestureDetector(
            child: Icon(
              Icons.add_circle,
              size: 32.w,
              color: Colors.white,
            ),
            onTap: () => onAddButton?.call(),
          ),
        ),
        Expanded(
          child: GestureDetector(
            child: SelectText(
              isSelect: current == HomePageTag.message,
              title: '消息',
            ),
            onTap: () => onTabSwitch?.call(HomePageTag.message),
          ),
        ),
        Expanded(
          child: GestureDetector(
            child: SelectText(
              isSelect: current == HomePageTag.mine,
              title: '我',
            ),
            onTap: () => onTabSwitch?.call(HomePageTag.mine),
          ),
        ),
      ],
    );
    return Container(
      color: hasBackground ? ColorPlate.back2 : ColorPlate.back2.withOpacity(0),
      child: Container(
        padding: EdgeInsets.only(bottom: padding.bottom),
        height: 50 + padding.bottom,
        child: row,
      ),
    );
  }
}
