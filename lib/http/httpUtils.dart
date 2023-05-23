import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ys_tiktok_flutter/http/baseRes.dart';

class HttpUtils {
  static String baseUrl = "http://192.168.1.207:8080";
  //获取验证码
  static String getCode = "/login/getCode";
  //登录
  static String setLogin = "/login/setLogin";
  static Future<BaseRes> get(String path, Map<String, dynamic> data) async {
    Response response = await Dio().get("$baseUrl$path",queryParameters: data);
    BaseRes baseRes = BaseRes.fromMap(response.data);
    return Future(() => baseRes);
  }

  static Future<BaseRes> post(String path,Map<String, dynamic> data) async {
    Response response = await Dio().post("$baseUrl$path",data: data);
    BaseRes baseRes = BaseRes.fromMap(response.data);
    return Future(() => baseRes);
  }
}