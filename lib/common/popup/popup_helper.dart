import 'package:another_flushbar/flushbar.dart';
import 'package:dio_hub/common/popup/exit_confirm.dart';
import 'package:dio_hub/models/popup/popup_type.dart';
import 'package:dio_hub/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class DialogHelper {
  static exit(context) => showDialog(
      context: context, builder: (context) => ExitConfirmationDialog());

  static appPopup(context, AppPopupData appPopup) => Flushbar(
        margin: EdgeInsets.all(8),
        borderRadius: BorderRadius.circular(8),
        shouldIconPulse: false,
        animationDuration: Duration(milliseconds: 750),
        flushbarPosition: FlushbarPosition.BOTTOM,
        flushbarStyle: FlushbarStyle.FLOATING,
        reverseAnimationCurve: Curves.decelerate,
        forwardAnimationCurve: Curves.decelerate,
        boxShadows: [
          BoxShadow(
              color: appPopup.popupType == PopupType.failed
                  ? Colors.redAccent
                  : AppColor.green,
              offset: Offset(0.0, 1.0),
              blurRadius: 1.0)
        ],
        backgroundGradient: LinearGradient(
          colors: appPopup.popupType == PopupType.failed
              ? [
                  Color(0xffF9484A),
                  Color(0xffa71d31),
                ]
              : [
                  Color(0xff0BAB64),
                  Color(0xff3BB78F),
                ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        isDismissible: true,
        duration: Duration(seconds: 3),
        icon: Icon(
          appPopup.icon ??
              (appPopup.popupType == PopupType.failed
                  ? LineIcons.exclamationCircle
                  : LineIcons.checkCircle),
          color: Colors.white,
          size: 30,
        ),
        messageText: Text(
          appPopup.title!,
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ).show(context);
}
