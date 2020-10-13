import 'package:app_module/common/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';

enum ToastPosition { top, center, bottom }

class Toast {
  static void show(
      {BuildContext context, IconData icon, String msg, ToastGravity gravity}) {
    msg = msg ?? "未知错误";
    if (context != null) {
      icon = icon ?? Icons.error;
      FToast fToast = FToast();
      fToast.init(context);
      Widget toast = Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: Color(0xB2000000),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: Util.colorWhite(context),
              size: 19,
            ),
            SizedBox(
              width: 8.0,
            ),
            Text(
              msg,
              style: TextStyle(
                  fontSize: Util.font15,
                  color: Util.colorWhite(context),
                  fontWeight: Util.medium),
            ),
          ],
        ),
      );
      fToast.showToast(
        child: toast,
        gravity: ToastGravity.BOTTOM,
        toastDuration: Duration(seconds: 2),
      );
    } else {
      Fluttertoast.showToast(
          msg: msg,
          timeInSecForIosWeb: 1,
          backgroundColor: Color(0xB2000000),
          fontSize: 14.0);
    }
  }

  static FToast fToast;
  static void showLoading({BuildContext context, String msg}) {
    if (context != null) {
      fToast = FToast();
      fToast.init(context);
      Widget toast = Container(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Container(
            decoration: BoxDecoration(
                color: Color(0x60000000),
                borderRadius: BorderRadius.all(Radius.circular(12))),
            width: 200.0,
            height: 150.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 50.0,
                  height: 50.0,
                  child: SpinKitFadingCube(
                    color: Util.colorWhite(context),
                    size: 25.0,
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  child: Text(
                    "加载中",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
      );
      fToast.showToast(
        child: toast,
        gravity: ToastGravity.CENTER,
        toastDuration: Duration(seconds: 50),
      );
    }
  }

  static void hideLoading() {
    if (fToast != null) {
      fToast.removeCustomToast();
    }
  }
}
