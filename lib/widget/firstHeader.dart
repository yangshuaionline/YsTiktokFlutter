import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tapped/tapped.dart';

import '../style/style.dart';
import '../utils/device.dart';
import 'selectText.dart';
///首页得header
class FirstHeader extends StatefulWidget {
  final Function? onSearch;
  const FirstHeader({Key? key, this.onSearch,}) : super(key: key);
  @override
  State createState() => _FirstHeaderState();
}

class _FirstHeaderState extends State<FirstHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.black.withOpacity(0.3),
      height: 45.w+getNavBarHeight(context),
      color: ColorPlate.black,
      padding:  EdgeInsets.only(left: 15.w,top: getNavBarHeight(context),right: 15.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Tapped(
              onTap: widget.onSearch,
              child:Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  height: 35.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.r),
                    color: Colors.white,
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                        size: 20.w,
                        color: Colors.grey,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10.w),
                        child: Text(
                          '可查找案例、设计师、商品...',
                          style: TextStyle(fontSize: 12.sp,color: Colors.grey),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  )
              ),
            ),
          ),
          Tapped(
            child: Container(
              color: Colors.black.withOpacity(0),
              padding: EdgeInsets.all(4),
              alignment: Alignment.centerRight,
              child: Icon(
                Icons.headset_mic_outlined,
                color: Colors.white.withOpacity(0.66),
              ),
            ),
          ),
          Tapped(
            child: Container(
              color: Colors.black.withOpacity(0),
              padding: EdgeInsets.all(4),
              alignment: Alignment.centerRight,
              child: Icon(
                Icons.doorbell_outlined,
                color: Colors.white.withOpacity(0.66),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
