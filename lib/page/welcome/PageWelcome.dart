import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../router/Router.dart';
import '../../widget/Bottons.dart';
import '../login/PageLogin.dart';

///欢迎页面  启动页
class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: CarouselSlider(
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height,
                viewportFraction: 1.0,
                enableInfiniteScroll: false,
              ),
              items: [
                Image.asset('assets/images/welcome1.jpg', fit: BoxFit.cover),
                Image.asset('assets/images/welcome2.jpg', fit: BoxFit.cover),
                Stack(
                  children: [
                    Image.asset('assets/images/welcome3.png', fit: BoxFit.cover),
                    Positioned(
                      bottom: 50.0.h,
                      left: 50.0.w,
                      right: 50.0.w,
                      child: MyButton(
                        text: "开始",
                        textColor: Colors.white,
                        fontSize: 15.sp,
                        onPressed: (){
                          // Fluttertoast.showToast(
                          //   msg: "请输入正确手机号！",
                          //   toastLength: Toast.LENGTH_SHORT,
                          //   gravity: ToastGravity.CENTER,
                          //   timeInSecForIosWeb: 1,
                          //   backgroundColor: Colors.grey,
                          //   textColor: Colors.white,
                          //   fontSize: 16.0.sp,
                          // );
                          Navigator.of(context).pop();
                          Navigator.pushNamed(context, routerLogin);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
