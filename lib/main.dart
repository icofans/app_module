import 'package:app_module/base/app_module.dart';
import 'package:app_module/common/routes.dart';
import 'package:app_module/theme/theme_provide.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // wait init
  await init();
  Provider.debugCheckInvalidValueType = null;

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // 屏幕适配
    return ChangeNotifierProvider.value(
      value: ThemeProvide(),
      child: Consumer<ThemeProvide>(
        builder: (context, provider, child) {
          return MaterialApp(
            routes: Routes.routes,
            initialRoute: Routes.login,
            onGenerateTitle: (context) {
              return "Demo";
            },
            theme: provider.getTheme(context: context),
            darkTheme: provider.getTheme(context: context, isDarkMode: true),
          );
        },
      ),
    );
  }
}
