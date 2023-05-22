import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Const.dart';
///单点击按钮
class MyButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String text;//比方说发送验证码
  final Color textColor;//字体颜色
  final double fontSize;//字体大小
  final MyButtonState myButtonState = MyButtonState();
  MyButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.textColor,
    required this.fontSize,
  }) : super(key: key);



  @override
  MyButtonState createState(){
    return myButtonState;
  }
}

class MyButtonState extends State<MyButton> with AutomaticKeepAliveClientMixin{
  String _text = "";
  bool _canClick = true;//是否可以点击
  Color _btBgColor = Colors.blue;

  @override
  void initState() {
    super.initState();
    if(_text.isEmpty) _text = widget.text;
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.dependOnInheritedWidgetOfExactType<IconTheme>();
  }
  setText(String msg){
    setState(() {
      _text = msg;
      _canClick = false;
      _btBgColor = Colors.grey;
    });
  }
  setTextCanClick(){
    setState(() {
      _canClick = true;
      _btBgColor = Colors.blue;
    });
  }
  _buttonPressed(){
    setState(() {
      if(_canClick){
        widget.onPressed.call();
      }else{
        return;
      }
    });
  }

  @override
  void didUpdateWidget(covariant MyButton oldWidget) {
    // 如果二次加载，刷新状态
    print("=====================================>");
    if(oldWidget != widget){
      _text = "";
      _canClick = true;//是否可以点击
      _btBgColor = Colors.blue;
      if(_text.isEmpty) _text = widget.text;
    }
    super.didUpdateWidget(oldWidget);

  }
  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: _buttonPressed,
      style: ButtonStyle(
        //定义文本的样式 设置效果之后，这里设置的颜色是不起作用的
        textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(fontSize: 18.sp)),
        //设置按钮上字体与图标的颜色
        // foregroundColor: MaterialStateProperty.all(Colors.white),
        //更优美的方式来设置
        foregroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.focused) && !states.contains(MaterialState.pressed)) {
            //获取焦点时的颜色
            return _btBgColor;
          } else if (states.contains(MaterialState.pressed)) {
            //按下时的颜色
            return Colors.white;
          }
          //默认状态使用灰色
          return _btBgColor;
        },
        ),
        //背景颜色
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          //设置按下时的背景颜色
          if (states.contains(MaterialState.pressed)) {
            return _btBgColor;
          }
          //默认不使用背景颜色
          return _btBgColor;
        }),
        //设置水波纹颜色
        overlayColor: _canClick == true?MaterialStateProperty.all(Colors.blueGrey):null,
        //设置阴影  不适用于这里的TextButton
        elevation: MaterialStateProperty.all(0),
        //设置按钮内边距
        padding: MaterialStateProperty.all(EdgeInsets.all(5.w)),
        //设置按钮的大小
        minimumSize: MaterialStateProperty.all(Size(screenWidth.w, 50.w)),
        //设置边框
        // side: MaterialStateProperty.all(BorderSide(color: Colors.blue, width: 0.5.w)),
        //外边框装饰 会覆盖 side 配置的样式
        shape: MaterialStateProperty.all(StadiumBorder()),
      ),
      child: Text(
        _text,
        style: TextStyle(
          color: widget.textColor,
          fontSize: widget.fontSize,
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
