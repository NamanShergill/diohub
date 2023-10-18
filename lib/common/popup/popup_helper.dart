import 'package:another_flushbar/flushbar.dart';
import 'package:diohub/models/popup/popup_type.dart';
import 'package:diohub/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';

class DialogHelper {
  // static exit(context) => showDialog(
  //     context: context, builder: (context) => const ExitConfirmationDialog());

  static Future<void> appPopup(
    final BuildContext context,
    final AppPopupData appPopup,
  ) async =>
      Flushbar<dynamic>(
        margin: const EdgeInsets.all(8),
        borderRadius: BorderRadius.circular(8),
        shouldIconPulse: false,
        animationDuration: const Duration(milliseconds: 750),
        reverseAnimationCurve: Curves.decelerate,
        forwardAnimationCurve: Curves.decelerate,
        boxShadows: <BoxShadow>[
          BoxShadow(
            color: appPopup.popupType == PopupType.failed
                ? context.colorScheme.error
                : context.colorScheme.surface,
            offset: const Offset(0, 1),
            blurRadius: 1,
          ),
        ],
        backgroundGradient: LinearGradient(
          colors: appPopup.popupType == PopupType.failed
              ? <Color>[
                  const Color(0xffF9484A),
                  const Color(0xffa71d31),
                ]
              : <Color>[
                  const Color(0xff0BAB64),
                  const Color(0xff3BB78F),
                ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        duration: const Duration(seconds: 3),
        icon: Icon(
          appPopup.icon ??
              (appPopup.popupType == PopupType.failed
                  ? MdiIcons.information
                  : MdiIcons.checkCircle),
          // size: 30,
        ),
        messageText: Text(
          appPopup.title!,
          // style: const TextStyle(
          //   18,
          //   fontWeight: FontWeight.w600,
          // ),
        ),
      ).show(context);
}
