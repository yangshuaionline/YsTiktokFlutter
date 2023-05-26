import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../style/style.dart';
///文字选择
class SelectText extends StatelessWidget {
  const SelectText({
    Key? key,
    this.isSelect = true,
    this.title,
  }) : super(key: key);

  final bool isSelect;
  final String? title;

  @override
  Widget build(BuildContext context) {
    TextStyle style = (isSelect ? StandardTextStyle.selected : StandardTextStyle.normal);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.w),
      color: Colors.black.withOpacity(0),
      child: Text(
        title ?? '??',
        textAlign: TextAlign.center,
        style: style,
      ),
    );
  }
}
