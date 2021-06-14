import 'package:another_flushbar/flushbar.dart';
import 'package:dio_hub/app/settings/palette.dart';
import 'package:dio_hub/common/popup/exit_confirm.dart';
import 'package:dio_hub/models/popup/popup_type.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

class DialogHelper {
  static exit(context) => showDialog(
      context: context, builder: (context) => const ExitConfirmationDialog());

  static appPopup(context, AppPopupData appPopup) => Flushbar(
        margin: const EdgeInsets.all(8),
        borderRadius: BorderRadius.circular(8),
        shouldIconPulse: false,
        animationDuration: const Duration(milliseconds: 750),
        flushbarPosition: FlushbarPosition.BOTTOM,
        flushbarStyle: FlushbarStyle.FLOATING,
        reverseAnimationCurve: Curves.decelerate,
        forwardAnimationCurve: Curves.decelerate,
        boxShadows: [
          BoxShadow(
              color: appPopup.popupType == PopupType.failed
                  ? Colors.redAccent
                  : Provider.of<PaletteSettings>(context).currentSetting.green,
              offset: const Offset(0.0, 1.0),
              blurRadius: 1.0)
        ],
        backgroundGradient: LinearGradient(
          colors: appPopup.popupType == PopupType.failed
              ? [
                  const Color(0xffF9484A),
                  const Color(0xffa71d31),
                ]
              : [
                  const Color(0xff0BAB64),
                  const Color(0xff3BB78F),
                ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        isDismissible: true,
        duration: const Duration(seconds: 3),
        icon: Icon(
          appPopup.icon ??
              (appPopup.popupType == PopupType.failed
                  ? LineIcons.exclamationCircle
                  : LineIcons.checkCircle),
          size: 30,
        ),
        messageText: Text(
          appPopup.title!,
          style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ).show(context);
}
