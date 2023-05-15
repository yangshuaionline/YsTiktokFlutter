import 'package:flutter/material.dart';

import '../main.dart';
import '../page/ErrorPage.dart';
import '../page/PageTiktok.dart';
import '../page/agreement/PageAgreement.dart';
import '../page/login/PageLogin.dart';
import '../page/welcome/PageWelcome.dart';
import 'Router.dart';
//路由管理器
class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case routerHome:
        return MaterialPageRoute(builder: (_) => const MyApp());
      case routerLogin:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case routerWelcome:
        return MaterialPageRoute(builder: (_) => const WelcomePage());
      case routerAgreement:
        final args = settings.arguments as Map<String, dynamic>;
        String title = args['title'];
        String content1 = args['content1'];
        String content2 = args['content2'];
        return MaterialPageRoute(builder: (_) => PageAgreement(title: title, content1: content1,content2: content2));
      case routerTiktok:
        return MaterialPageRoute(builder: (_) => const PageTiktok());
      default:
        return MaterialPageRoute(builder: (_) => const ErrorPage(error:"路由配置错误"));
    }
  }
}
