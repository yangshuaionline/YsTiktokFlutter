
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class YsCameraBarBean{
  void Function() takePhotoOk;
  void Function()? takePhotoCancel;
  YsCameraBarBean({required this.takePhotoOk,this.takePhotoCancel});
}
///相机下方按钮
class YsCameraBar extends StatefulWidget{
  YsCameraBarBean bean;
  YsCameraBar({super.key,required this.bean});

  @override
  State<StatefulWidget> createState() => YsCameraBarState();
}

class YsCameraBarState extends State<YsCameraBar>{

  Widget getWidget(){
    if(widget.bean.takePhotoCancel != null){
      return Container(
        width: double.infinity,
        height: 50.w,
        child: Row(
          children: [
            FloatingActionButton(
              onPressed: widget.bean.takePhotoCancel,
              child: const Icon(Icons.delete_forever),
            ),
            const Expanded(
              flex: 1,
              child: Center(

              ),),
            FloatingActionButton(
              onPressed: widget.bean.takePhotoOk,
              child: const Icon(Icons.check),
            )
          ],
        )
      );
    }else{
      return FloatingActionButton(
        onPressed: widget.bean.takePhotoOk,
        child: const Icon(Icons.camera_alt),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return getWidget();
  }

}