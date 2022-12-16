import 'package:doctor_system/models/app_colors.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

import '../enums/toast_status.dart';

class ToastConfig {
  static showToast({
    required String msg,
    required ToastStates toastStates,
  }) =>
      Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: chooseToastColor(toastStates),
        textColor: Colors.white,
        fontSize: 16.0,
      );
}

Color chooseToastColor(ToastStates state) {
  late Color color;
  switch (state) {
    case ToastStates.Success:
      color = AppColors.kGreenColor;
      break;
    case ToastStates.Error:
      color = AppColors.kOrangeColor;
      break;
    case ToastStates.Warning:
      color = AppColors.kPinkColor;
      break;
  }

  return color;
}
