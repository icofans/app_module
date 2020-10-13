import 'package:app_module/common/util.dart';
import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  final String message;
  const ErrorView({Key key, this.message = "加载失败"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, Util.setHeight(20), 0, 0),
      color: Util.colorWhite(context),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(Icons.error, size: Util.setWidth(60)),
          Text(
            message,
            style: TextStyle(
              fontSize: Util.font17,
              fontWeight: Util.medium,
              color: Util.colorEmptyText(context),
            ),
          )
        ],
      ),
    );
  }
}
