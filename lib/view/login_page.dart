import 'package:app_module/base/base.dart';
import 'package:app_module/viewmodel/login_provide.dart';
import 'package:flutter/material.dart';

class LoginPage extends PageProvideNode<LoginProvide> {
  @override
  Widget buildContent(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Login"),
      ),
    );
  }
}
