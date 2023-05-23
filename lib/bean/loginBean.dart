

import '../menu/userEnum.dart';

class LoginBean{
  //uid
  int id;
  //头像
  String headPic;
  //用户名
  String userName;
  //密码
  String pw;
  //账号
  String account;
  //手机号
  String phone;
  //ip地址
  String ip;
  //int pos职位
  int pos;
  //个人简介
  String introduction;
  //登录type 0为app  1为运营后台
  int loginType;
  //token
  String token;
  LoginBean(this.id,this. headPic,this. userName,this. pw,this. account,this. phone,
      this.ip,this. pos,this. introduction,this. loginType,this. token);
  factory LoginBean.fromMap(Map map){
    var id = map[User.idKey];
    var headPic = map[User.headPicKey];
    var userName = map[User.userNameKey];
    var pw = map[User.pwKey];
    var account = map[User.accountKey];
    var phone = map[User.phoneKey];
    var ip = map[User.ipKey];
    var pos = map[User.posKey];
    var introduction = map[User.introductionKey];
    var loginType = map[User.loginTypeKey];
    var token = map[User.tokenKey];
    return LoginBean(id,headPic,userName,pw,account,phone,ip,pos,introduction,loginType,token);
  }
}