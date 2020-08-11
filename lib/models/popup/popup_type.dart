import 'package:flutter/material.dart';

enum PopupType {
  failed,
  success,
  info,
}

class AppPopupData {
  PopupType popupType;
  final String title;
  final String subtitle;
  final IconData icon;

  AppPopupData({this.title, this.subtitle, this.icon});
}
