import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class Utils {
  static FlushBarShow(String Message, BuildContext context) {
    Flushbar(
      message: Message,
      icon: Icon(
        Icons.info_outline,
        size: 28.0,
        color: Colors.blue[300],
      ),
      duration: Duration(seconds: 3),
      leftBarIndicatorColor: Colors.blue[300],
    )..show(context);
  }
}
