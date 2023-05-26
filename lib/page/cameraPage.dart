
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';
import 'package:ys_tiktok_flutter/widget/camera/cameraBar.dart';
import 'package:ys_tiktok_flutter/widget/camera/cameraImage.dart';

class CameraPage extends StatefulWidget{
  const CameraPage({super.key});

  @override
  State<StatefulWidget> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> with WidgetsBindingObserver{
  bool isInit = false;
  bool _isPhoto = false;//判断是否拍照了
  late List<CameraDescription> _cameras;
  late CameraController controller ;
  late File imageFile;
  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    setCameras();
  }

  Future<void> setCameras() async {
    _cameras = await availableCameras();
    controller = CameraController(_cameras[0], ResolutionPreset.max);
    controller.initialize().then((value){
      if(!mounted){
        return;
      }
      isInit = true;
      setState(() {

      });
    });
  }
  Future<void> _takePhoto() async {
    try {
      final XFile file = await controller.takePicture();
      Logger().i(file.path);
      imageFile = File(file.path);
      _isPhoto = true;
      setState(() {});
      // 处理拍摄到的图片
    } catch (e) {
      // 拍照异常处理
    }
  }
  void _setOk(){

  }
  void _setCancel(){
    _isPhoto = false;
    setState(() {

    });
  }
  /// 显示相机、图片、视频的widget
  Widget _buildCameraPreview() {
    if (!controller.value.isInitialized) {
      return Container();
    }
    YsCameraBean bean;
    //判断是否为拍照
    if(_isPhoto){
      //显示照片
      bean = YsCameraBean().setPhoto(imageFile,controller);
    }else{
      //显示相机
      bean = YsCameraBean().setCamera(controller);
    }
    return YsCameraImage(bean: bean);
  }
  /// 按钮
  Widget _getFloatingAction(){
    YsCameraBarBean bean;
    if(_isPhoto){
      bean = YsCameraBarBean(takePhotoOk: _setOk,takePhotoCancel: _setCancel);
    }else{
      bean = YsCameraBarBean(takePhotoOk: _takePhoto);
    }
    return YsCameraBar(bean: bean);
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    if(!isInit){
      return const Text("");
    }else{
      return MaterialApp(
        home: Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          body: Container(
            child: _buildCameraPreview(),
          ),
          floatingActionButton: _getFloatingAction(),
        ),
      );
    }
  }
}