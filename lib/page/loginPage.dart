import 'dart:convert';
import 'dart:io';

import 'package:clipboard/clipboard.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';
import 'package:ys_tiktok_flutter/bean/loginBean.dart';
import 'package:ys_tiktok_flutter/http/httpUtils.dart';
import 'package:ys_tiktok_flutter/persistence/userStorage.dart';
import '../const.dart';
import '../http/baseRes.dart';
import '../router/Router.dart';
import '../utils/phone.dart';
import '../widget/Bottons.dart';
import '../widget/CountdownTimer.dart';
import '../widget/RegExp.dart';
import '../widget/Toasts.dart';
//****/

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with WidgetsBindingObserver {
  bool isChecked = true;
  String _phoneText = "";//手机号输入内容
  String _codeText = "";
  int _remainingSeconds = countdown;
  CountdownTimer? _countdownTimer;
  late final MyButton _myButton = MyButton(
    text: "获取验证码",
    textColor: Colors.white,
    fontSize: 12.sp,
    onPressed: _getCode,
  );
  late final MyButton _bgLogin = MyButton(
    text: "登录",
    textColor: Colors.white,
    fontSize: 15.sp,
    onPressed: _login,
  );
  //todo 开头不能限制1，限制1之后输入不进去内容
  final RegExp _digitsOnly = RegExp(r'\d+');
  // 软键盘高度
  double _keyboardHeight = 0;
  // 可控制ListView滑动
  final _scrollController = ScrollController();
  final TextEditingController _controller = TextEditingController();
  // 用于获取目标Widget的位置坐标
  final _targetWidgetKey = GlobalKey();
  @override
  void initState() {
    super.initState();
    // 添加监听，didChangeMetrics
    WidgetsBinding.instance.addObserver(this);
  }
  //输入手机号码监听
  _textChangedPhone(String text){
    setState(() {
      _phoneText = text;
    });
  }
  _getCode() async {
    if(_phoneText.isEmpty){
      setState(() {
        showToast("手机号不能为空！", 16.0.sp);
      });
      return;
    }
    if(!isPhone(_phoneText)){
      setState(() {
        showToast("手机号格式错误！", 16.0.sp);
      });
      return;
    }
    //验证手机号
    bool isValid = validateChinesePhoneNumber(_phoneText);
    if(isValid){
      BaseRes res = await HttpUtils.get(HttpUtils.getCode, {"phone":_phoneText,"code_type":0});
      if(res.code == 200){
        int code = res.data;
        setState(() {
          showToast("$code", 16.0.sp);
        });
        //复制验证码到剪切板
        FlutterClipboard.copy("$code").then(( value ) => Logger().i('copied'));
        //开线程
        _countdownTimer = CountdownTimer(
          Duration(seconds: _remainingSeconds),
          const Duration(seconds: seconds),
        );
        setState(() {
          //修改文字 60s
          _myButton.myButtonState.setText("${_remainingSeconds}S");
        });
        _countdownTimer?.listen((count) {
          setState(() {
            _remainingSeconds = count.remaining.inSeconds;
            //修改文字  <60S
            _myButton.myButtonState.setText("${_remainingSeconds}S");
          });

          if (_remainingSeconds <= 0) {
            setState(() {
              //修改文字  0
              _myButton.myButtonState.setText("重新获取");
              _myButton.myButtonState.setTextCanClick();
              _remainingSeconds = countdown;
            });
          }
        });
        _countdownTimer?.start();
      }else{
        setState(() {
          showToast(res.message, 16.0.sp);
        });
      }
    }else{
      setState(() {
        showToast("请输入正确手机号！", 16.0.sp);
      });
    }
  }
  //输入验证码监听
  _textChangedCode(String text){
    setState(() {
      _codeText = text;
    });
  }
  _login() async {
    _myButton.myButtonState.setText("登录");
    if(_phoneText.isEmpty){
      setState(() {
        showToast("手机号不能为空！", 16.0.sp);
        _myButton.myButtonState.setTextCanClick();
      });
      return;
    }
    if(!isVerificationCode(_codeText)){
      setState(() {
        showToast("验证码错误！", 16.0.sp);
        _myButton.myButtonState.setTextCanClick();
      });
      return;
    }
    if(!isChecked){
      setState(() {
        showToast("请先阅读并勾选协议！", 16.0.sp);
        _myButton.myButtonState.setTextCanClick();
      });
      return;
    }
    BaseRes res = await HttpUtils.get(HttpUtils.setLogin, {"phone":_phoneText,"code":_codeText,"login_type":0});
    if(res.code == 200){
      LoginBean bean = LoginBean.fromMap(res.data);
      UserStorage.set(res.data);
      UserStorage.getToken().then((value) => Logger().i("token======>$value"));
      //登录成功，关闭当前页面
      Navigator.of(context).pop();
    }else{
      setState(() {
        showToast(res.message, 16.0.sp);
      });
    }

  }
  // 当应用程序的尺寸发生变化时会调用
  @override
  void didChangeMetrics() {
    // 获取页面高度
    var pageHeight = MediaQuery.of(context).size.height;
    if (pageHeight <= 0) {
      return;
    }

    // 软键盘顶部  px
    final keyboardTopPixels = MediaQuery.of(context).size.height - MediaQuery.of(context).viewInsets.bottom;
    // 转换为 dp
    final keyboardTopPoints = keyboardTopPixels / MediaQuery.of(context).devicePixelRatio;
    // 软键盘高度
    final keyboardHeight = pageHeight - keyboardTopPoints;

    if (keyboardHeight <= 0) {
      setState(() {
        _keyboardHeight = 0;
        // Logger().i("=====>$_keyboardHeight");
      });
      return;
    }else{
      setState(() {
        if(_keyboardHeight == keyboardHeight){
          _keyboardHeight = 0;
        }else {
          _keyboardHeight = keyboardHeight;
          //弹起软键盘  从剪切板种获取数据
          FlutterClipboard.paste().then((value) {
            // Do what ever you want with the value.
            setState(() {
              String code = value;
              _controller.text = code;
              FlutterClipboard.copy("").then(( value ) => Logger().i('cleared'));
            });
          });
        }
        Logger().i("$_keyboardHeight");
      });
    }
    // 获取目标位置的坐标
    RenderBox? renderBox =
    _targetWidgetKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) {
      return;
    }
    // 转换为全局坐标
    final bottomOffset =
    renderBox.localToGlobal(Offset(0, renderBox.size.height));
    final targetDy = bottomOffset.dy;
    // 获取要滚动的距离
    // 即被软键盘挡住的那段距离 加上 _scrollController.offset 已经滑动过的距离
    final offsetY =
        keyboardHeight - (pageHeight - targetDy) + _scrollController.offset;
    // 滑动到指定位置
    if (offsetY > 0) {
      _scrollController.animateTo(
        offsetY,
        duration: kTabScrollDuration,
        curve: Curves.ease,
      );
    }
  }
  @override
  void dispose() {
    _countdownTimer?.cancel();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      // appBar: AppBar(
      //   title: Text("登录"),
      // ),
      body: GestureDetector(
        // 点击空白位置关闭软键盘
        onTap: (){
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child:SingleChildScrollView (
          controller: _scrollController,
          // physics:const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(left: 15.w,right: 15.w,top: 50.w,bottom: 50.w),
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  "assets/images/logo.png",
                  width: 100.w,
                  height: 100.w,
                ),
                Container(
                  margin: EdgeInsets.only(top: 50.w, bottom: 100.w),
                  child: Text(
                    "专注于高品质的装修",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 25.sp,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 0.w, bottom: 50.w),
                  child: Text(
                    "请输入您的手机号码，进行登录或注册操作",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
                //手机号
                Row(
                  mainAxisAlignment: MainAxisAlignment.center ,
                  children: <Widget>[
                    Center(
                      child: SizedBox(
                        height: 30.w,
                        child: Text(
                          '手机号',
                          style: TextStyle(
                            fontSize: 15.sp, // 字体大小
                            color: Colors.black, // 字体颜色
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        height: 30.w,
                        child: TextField(
                          controller: _controller,
                          keyboardType: TextInputType.number,
                          onChanged: _textChangedPhone,
                          // textAlign: TextAlign.left,
                          // textAlignVertical: TextAlignVertical.center,
                          inputFormatters: [
                            // FilteringTextInputFormatter.allow(RegExp(r"^\d{0,11}$"))
                            // LengthLimitingTextInputFormatter(_maxInputLength)
                            FilteringTextInputFormatter(
                              _digitsOnly,
                              allow: true, // 允许输入数字
                            ),
                            LengthLimitingTextInputFormatter(phoneNum), // 限制最大长度为 11
                          ],
                          decoration: InputDecoration(
                            hintText: "请输入您的手机号",
                            hintStyle: TextStyle(color: Colors.grey,fontSize: 15.sp),
                            // labelText: _phoneText,
                            labelStyle: TextStyle(color: Colors.blue,fontSize: 15.sp),
                            //hintText: "请输入信息",
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent, width: 0.w,),
                              borderRadius: BorderRadius.circular(37),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent, width: 0.w,),
                              borderRadius: BorderRadius.circular(37),
                            ),
                            //去掉动态效果
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            // contentPadding: EdgeInsets.symmetric(vertical: 15.w),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 80.w,
                      height: 30.w,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(25.r),
                          right: Radius.circular(25.r),
                        ),
                      ),
                      child: Center(
                          child:_myButton
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 5.w),
                  child: Divider(
                    color: Colors.grey,
                    height: 0.5.w,
                  ),
                ),
                SizedBox(height: 20.w),
                Row(
                  children: [
                    Center(
                      child: Text(
                        '验证码',
                        style: TextStyle(
                          fontSize: 15.sp, // 字体大小
                          color: Colors.black, // 字体颜色
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        key: _targetWidgetKey,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          // textAlign: TextAlign.left,
                          // textAlignVertical: TextAlignVertical.center,
                          onChanged: _textChangedCode,
                          // textAlign: TextAlign.left,
                          // textAlignVertical: TextAlignVertical.center,
                          inputFormatters: [
                            // FilteringTextInputFormatter.allow(RegExp(r"^\d{0,11}$"))
                            // LengthLimitingTextInputFormatter(_maxInputLength)
                            FilteringTextInputFormatter(
                              _digitsOnly,
                              allow: true, // 允许输入数字
                            ),
                            LengthLimitingTextInputFormatter(codeNum),
                          ],
                          decoration: InputDecoration(
                            hintText: "请输入短信验证码",
                            hintStyle: TextStyle(color: Colors.grey,fontSize: 15.sp),
                            // labelText: "请输入您的验证码",
                            labelStyle: TextStyle(color: Colors.black,fontSize: 15.sp),
                            //hintText: "请输入信息",
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent, width: 0.w,),
                              borderRadius: BorderRadius.circular(37),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent, width: 0.w,),
                              borderRadius: BorderRadius.circular(37),
                            ),

                            //去掉动态效果
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            // contentPadding: EdgeInsets.symmetric(vertical: 15.w),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 5.w),
                  child: Divider(
                    color: Colors.grey,
                    height: 0.5.w,
                  ),
                ),
                SizedBox(height: 20.w),
                Container(
                  height: 40.w,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(25.r),
                      right: Radius.circular(25.r),
                    ),
                  ),
                  child: Center(
                    child: _bgLogin,
                  ),
                ),
                SizedBox(height: 20.w),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center, // 沿主轴居中对齐
                  crossAxisAlignment: CrossAxisAlignment.center, // 沿次轴居中对齐
                  children: <Widget>[
                    Checkbox(
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value??false;
                        });
                      },
                    ),
                    Text("登录即代表同意",style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                    ),),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, routerAgreement, arguments: {
                          "title": '用户协议',
                          "content1": '鲸至生活用户协议',
                          "content2": '一、用户协议\n'
                              '内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容\n'
                              '\n'
                              '\n'
                              '二、用户协议\n'
                              '内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫',
                        });
                      },
                      child: Text(
                        "用户协议",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                    Text("和",style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                    ),),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, routerAgreement, arguments: {
                          'title': '隐私政策',
                          "content1": '鲸至生活隐私协议',
                          "content2": '一、隐私政策\n'
                              '内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容\n'
                              '\n'
                              '\n'
                              '二、隐私政策\n'
                              '内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫内容南宫',
                        });
                      },
                      child: Text(
                        "隐私政策",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ],
                ),
                // SizedBox(height: 100.w),
                // 动态变换高度，保证ListView可滑动
                SizedBox(height: _keyboardHeight)
              ],
            ),
          ),
        ),
      )
    );
  }
}