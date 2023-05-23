
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ys_tiktok_flutter/bean/loginBean.dart';
import '../menu/userEnum.dart';


///用户信息存储
class UserStorage {
  static const String key = "user_";
  static void set(Map<String, dynamic> data) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt("$key${User.idKey}", data[User.idKey]);
    await prefs.setString("$key${User.headPicKey}", data[User.headPicKey]);
    await prefs.setString("$key${User.userNameKey}", data[User.userNameKey]);
    await prefs.setString("$key${User.pwKey}", data[User.pwKey]);
    await prefs.setString("$key${User.accountKey}", data[User.accountKey]);
    await prefs.setString("$key${User.phoneKey}", data[User.phoneKey]);
    await prefs.setString("$key${User.ipKey}", data[User.ipKey]);
    await prefs.setInt("$key${User.posKey}", data[User.posKey]);
    await prefs.setString("$key${User.introductionKey}", data[User.introductionKey]);
    await prefs.setInt("$key${User.loginTypeKey}", data[User.loginTypeKey]);
    await prefs.setString("$key${User.tokenKey}", data[User.tokenKey]);
  }

  static Future<LoginBean> get() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    LoginBean bean = LoginBean.fromMap({
      User.idKey:prefs.getInt("$key${User.idKey}"),
      User.headPicKey:prefs.getString("$key${User.headPicKey}"),
      User.userNameKey:prefs.getString("$key${User.userNameKey}"),
      User.pwKey:prefs.getString("$key${User.pwKey}"),
      User.accountKey:prefs.getString("$key${User.accountKey}"),
      User.phoneKey:prefs.getString("$key${User.phoneKey}"),
      User.ipKey:prefs.getString("$key${User.ipKey}"),
      User.posKey:prefs.getInt("$key${User.posKey}"),
      User.introductionKey:prefs.getString("$key${User.introductionKey}"),
      User.loginTypeKey:prefs.getInt("$key${User.loginTypeKey}"),
      User.tokenKey:prefs.getString("$key${User.tokenKey}")
    });
    return Future(() => bean);
  }

  static void setToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("$key${User.tokenKey}", token);
  }

  static Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("$key${User.tokenKey}");
    if(token == null) return Future(() => "");
    return Future(() => token);
  }

}