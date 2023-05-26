import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class SysSize {
  static double selected = 15.w;
  static double normal = 15.w;
}

class StandardTextStyle {
  ///选中文字 白色
  static TextStyle selected = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: SysSize.selected,
    inherit: true,
    color: Colors.white
  );
  ///普通文字  灰色
  static TextStyle normal = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: SysSize.normal,
    inherit: true,
    color: Colors.grey
  );
}

class ColorPlate {
  // 配色
  static const Color orange = const Color(0xffFFC459);
  static const Color yellow = const Color(0xffF1E300);
  static const Color green = const Color(0xff7ED321);
  static const Color red = const Color(0xffEB3838);
  static const Color darkGray = const Color(0xff4A4A4A);
  static const Color gray = const Color(0xff9b9b9b);
  static const Color lightGray = const Color(0xfff5f5f4);
  static const Color black = const Color(0xff000000);
  static const Color white = const Color(0xffffffff);
  static const Color clear = const Color(0);

  /// 深色背景
  static const Color back1 = const Color(0xff1D1F22);

  /// 比深色背景略深一点
  static const Color back2 = const Color(0xff121314);
}
