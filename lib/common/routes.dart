import 'package:app_module/view/login_page.dart';
import 'package:flutter/material.dart';

class Routes {
  /// 配置路由页面
  ///
  /// Routes.main
  static const String login = "/login";

  /// 路由Map集合
  ///
  /// Routes.routes
  static final routes = <String, WidgetBuilder>{
    // '/': (BuildContext context) => HomePage(),
    login: (context) => LoginPage(),
    // login: (context) {
    //   return LoginPage(ModalRoute.of(context).settings.arguments);
    // },
  };

  /// 路由拦截函数
  ///
  /// Routes.onGenerateRoute
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    String routeName = settings.name;
    if (routeName == '/') {
      // if (isLogin) {
      //   return MaterialPageRoute(
      //     builder: (context) {
      //       return HomePage();
      //     },
      //   );
      // } else {
      //   return MaterialPageRoute(
      //     builder: (context) {
      //       return LoginIdentityPage();
      //     },
      //   );
      // }
    }
    return MaterialPageRoute(builder: (context) => null);
  }
}
