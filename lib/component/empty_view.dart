import 'package:app_module/common/util.dart';
import 'package:flutter/material.dart';

class EmptyView extends StatelessWidget {
  final String message;
  const EmptyView({Key key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, Util.setHeight(20), 0, 0),
      color: Util.colorBackground(context),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 245 / 117,
            child: Image(image: Util.imageNamed("ico_empty")),
          ),
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
