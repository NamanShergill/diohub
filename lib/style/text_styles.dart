import 'package:dio_hub/style/colors.dart';
import 'package:flutter/material.dart';

class AppThemeTextStyles {
  static TextStyle appBarTitle =
      TextStyle(fontWeight: FontWeight.bold, fontSize: 16);
  static TextStyle eventCardHeaderBold = TextStyle(fontWeight: FontWeight.bold);
  static TextStyle eventCardHeaderMed = TextStyle();
  static TextStyle eventCardChildTitle =
      TextStyle(fontSize: 15, fontWeight: FontWeight.bold);
  static TextStyle eventCardChildTitleSmall = TextStyle(fontSize: 12);
  static TextStyle eventCardChildSubtitle = TextStyle(fontSize: 13);
  static TextStyle eventCardChildFooter =
      TextStyle(fontSize: 11, color: AppColor.grey3);
  static TextStyle basicIssueEventCardText = TextStyle(color: AppColor.grey3);
}
