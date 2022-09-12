import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

import '../constants/color_constants.dart';
import 'navigation_service.dart';

void flushBar({
  int duration = 2,
  @required String? text,
  String title = "Alert",
  Color backgroundColor = Colors.black26,
}) async {
  await dismiss();
  Flushbar(
    title: title,
    flushbarPosition: FlushbarPosition.TOP,
    margin: const EdgeInsets.all(8),
    borderRadius: const BorderRadius.all(Radius.circular(8)),
    backgroundColor: ColorConstants.primaryThemeColor,
    flushbarStyle: FlushbarStyle.FLOATING,
    message: text,
    duration: Duration(seconds: duration),
  ).show(NavigationService.navigatorKey.currentState!.context);
}

Future<void> dismiss() async {
  if (!Flushbar().isDismissed()) {
    await Flushbar().dismiss();
  }
}
