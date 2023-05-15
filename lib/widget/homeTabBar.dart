
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../style/style.dart';
import 'SelectText.dart';

enum HomePageTag {
  home,
  find,
  goods,
  mine,
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
              isSelect: current == HomePageTag.find,
              title: '发现',
            ),
            onTap: () => onTabSwitch?.call(HomePageTag.find),
          ),
        ),
        Expanded(
          child: GestureDetector(
            child: Icon(
              Icons.add_circle_outline,
              size: 32,
            ),
            onTap: () => onAddButton?.call(),
          ),
        ),
        Expanded(
          child: GestureDetector(
            child: SelectText(
              isSelect: current == HomePageTag.goods,
              title: '好物',
            ),
            onTap: () => onTabSwitch?.call(HomePageTag.goods),
          ),
        ),
        Expanded(
          child: GestureDetector(
            child: SelectText(
              isSelect: current == HomePageTag.mine,
              title: '我的',
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
