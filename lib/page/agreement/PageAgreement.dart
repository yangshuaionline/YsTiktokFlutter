import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
///用户协议   隐私协议
class PageAgreement extends StatelessWidget {
  String title;
  String content1;
  String content2;
  PageAgreement({super.key,required this.title, required this.content1, required this.content2});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( // 设置AppBar
        centerTitle: true,
        title: Text(title),
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(color: Colors.black,fontSize: 15.sp),
        iconTheme: IconThemeData(
            color: Colors.black
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView( //
        physics:const BouncingScrollPhysics(),// 内容部分可以滚动
        child: Column(
          children: [
            Padding( // 标题文本
              padding: EdgeInsets.all(15.0.w),
              child: Text(
                content1,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.sp),
                textAlign: TextAlign.center,
              ),
            ),
            Padding( // 正文文本
              padding: EdgeInsets.all(15.0.w),
              child: Text(
                content2,
                style: TextStyle(fontSize: 15.sp),
                textAlign: TextAlign.justify,
              ),
            ),
            SizedBox(height: 20.w),
          ],
        ),
      ),
    );
  }
}
