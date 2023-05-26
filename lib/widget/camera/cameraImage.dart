
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class YsCameraBean{
  File? imageFile;
  CameraController? controller;
  bool isPhoto = false ;//是否为图片，否为相机
  ///设置图片
  YsCameraBean setPhoto(File imageFile,CameraController controller){
    this.imageFile = imageFile;
    this.controller = controller;
    isPhoto = true;
    return this;
  }
  ///设置相机
  YsCameraBean setCamera(CameraController controller){
    this.controller = controller;
    isPhoto = false;
    return this;
  }
}
///相机展示图片和相机图像的widget
class YsCameraImage extends StatefulWidget{
  final YsCameraBean bean;
  const YsCameraImage({super.key,
    required this.bean});

  @override
  State<StatefulWidget> createState() => YsCameraImageState();

}

class YsCameraImageState extends State<YsCameraImage>{

  Widget getWidget(double previewRatio){
    if(widget.bean.isPhoto){
      return Center(
        child: Image(
          image: FileImage(widget.bean.imageFile??File("")),
        ),
      );
    }else{
      return AspectRatio(
        aspectRatio: previewRatio,
        child: CameraPreview(widget.bean.controller!),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    var previewRatio = widget.bean.controller!.value.aspectRatio;
    return Stack(
      children: [
        FittedBox(
          fit: BoxFit.fitHeight,
          child: SizedBox(
              width: MediaQuery.of(context).size.height / previewRatio,
              height: MediaQuery.of(context).size.height,
              child:  getWidget(previewRatio)
          ),
        ),
      ],
    );
  }
}