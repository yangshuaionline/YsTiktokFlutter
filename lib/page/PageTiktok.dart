
import 'package:flutter/material.dart';

import '../plateform/VideoPlatform.dart';

class PageTiktok extends StatefulWidget{
  const PageTiktok({super.key});

  @override
  State<StatefulWidget> createState() {
    return _PageTiktokState();
  }
}
class _PageTiktokState extends State<PageTiktok> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // icon: const Icon(Icons.arrow_back_ios,color: Colors.white,),
    // leading: IconButton(
    //   onPressed: () => Navigator.pop(context), // 返回上一页
    // ),
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: getNativeChildVideoTiktok(),
          ),
          IconButton(
            icon: const Icon(Icons.arrow_back_ios,color: Colors.white,),
            onPressed: () => Navigator.pop(context), // 返回上一页
          ),
        ],
      ),
    );
  }
}