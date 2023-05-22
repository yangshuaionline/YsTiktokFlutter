import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../router/Router.dart';
import '../../widget/Bottons.dart';

///欢迎页面  启动页
class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<StatefulWidget> createState() => _WelcomePageState();

}

class _WelcomePageState extends State<WelcomePage>{
  late final MyButton _button = MyButton(
    text: "开始",
    textColor: Colors.white,
    fontSize: 15.sp,
    onPressed: _goNext,
  );
  final PageController _controller = PageController();
  @override
  void initState() {
    super.initState();
    setState(() {
    });
  }
  void _goNext(){
    Navigator.of(context).pop();
    Navigator.pushNamed(context, routerLogin);
  }
  @override
  void didUpdateWidget(covariant WelcomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        allowImplicitScrolling: true,
        controller: _controller,
        children: [
          Image.asset('assets/images/welcome1.jpg', fit: BoxFit.cover) ,
          Image.asset('assets/images/welcome2.jpg', fit: BoxFit.cover) ,
          Stack(
            fit:StackFit.expand,//拉伸，占满屏幕
            clipBehavior:Clip.none,
            alignment: Alignment.center,
            children: <Widget>[
              Image.asset('assets/images/welcome3.png', fit: BoxFit.cover),
              Positioned(
                bottom: 50.0.h,
                left: 50.0.w,
                right: 50.0.w,
                child: _button,
              ),
            ],
          ),
        ],
      ),
    );
  }

}
