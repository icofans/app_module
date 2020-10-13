import 'package:app_module/common/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingView extends StatelessWidget {
  @override
  Widget build(Object context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: SizedBox(
          height: 200.0,
          width: 300.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 50.0,
                height: 50.0,
                child: SpinKitFadingCube(
                  color: Util.color666(context),
                  size: 25.0,
                ),
              ),
              SizedBox(height: 8),
              Container(
                child: Text("加载中..."),
              )
            ],
          ),
        ),
      ),
    );
  }
}
