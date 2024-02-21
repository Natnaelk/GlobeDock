import 'dart:async';

import 'package:globedock/src/common/colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

FutureOr<dynamic> showToast({
  required String msg,
  Color? backgroundColor,
  Color? textColor,
}) {
  return Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    fontSize: 16,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: backgroundColor ?? ColorLight.primary,
    textColor: textColor ?? Colors.white,
  );
}
