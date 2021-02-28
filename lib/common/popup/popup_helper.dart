import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:onehub/common/popup/exit_confirm.dart';
import 'package:onehub/models/popup/popup_type.dart';
import 'package:onehub/style/colors.dart';

class DialogHelper {
  static exit(context) => showDialog(
      context: context, builder: (context) => ExitConfirmationDialog());

  static appPopup(context, AppPopupData appPopup) => Flushbar(
        margin: EdgeInsets.all(8),
        borderRadius: 8,
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
                  : AppColor.sucsses,
              offset: Offset(0.0, 2.0),
              blurRadius: 3.0)
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
          appPopup.title,
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ).show(context);
}
