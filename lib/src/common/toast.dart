import 'dart:async';

import 'package:globedock/src/common/colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

FutureOr<dynamic> showToast(
    {required String msg,
    Color? backgroundColor,
    Color? textColor,
    BuildContext? context}) {
  return Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_LONG,
    fontSize: 16,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: backgroundColor ?? ColorLight.primary,
    textColor: textColor ?? Theme.of(context!).cardColor,
  );
}
