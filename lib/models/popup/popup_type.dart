import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

enum PopupType {
  failed,
  success,
  info,
  persistent,
}

class AppPopupData {
  PopupType? popupType;
  final String? title;
  final IconData? icon;
  final FlushbarPosition position;
  final FlushbarStyle style;
  final Function? onTap;

  AppPopupData(
      {this.title,
      this.icon,
      this.popupType,
      this.onTap,
      this.position = FlushbarPosition.BOTTOM,
      this.style = FlushbarStyle.FLOATING});
}
