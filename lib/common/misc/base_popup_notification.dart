import 'dart:async';

import 'package:diohub/common/animations/size_expanded_widget.dart';
import 'package:diohub/common/misc/button.dart';
import 'package:flutter/material.dart';

class BasePopupNotification extends StatelessWidget {
  const BasePopupNotification({
    this.title,
    this.onTap,
    this.dismissOnTap = true,
    this.listenToLoadingController = true,
    this.color,
    this.notificationController,
    super.key,
  });

  final String? title;
  final Function? onTap;
  final bool listenToLoadingController;
  final Color? color;
  final bool dismissOnTap;
  final StreamController<Widget?>? notificationController;

  @override
  Widget build(final BuildContext context) => SizeExpandedSection(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: StringButton(
            color: color,
            onTap: onTap != null
                ? () async {
                    await onTap!(context);
                    if (dismissOnTap && notificationController != null) {
                      notificationController!.add(null);
                    }
                  }
                : null,
            title: title,
          ),
          // child: Material(
          //   borderRadius: AppThemeBorderRadius.medBorderRadius,
          //   color: Provider.of<PaletteSettings>(context).currentSetting.error,
          //   child: InkPot(
          //     onTap: () {
          //       PopupNotificationController.addPopUpNotification(null);
          //       onTap(context);
          //     },
          //     borderRadius: AppThemeBorderRadius.medBorderRadius,
          //     child: Column(
          //       mainAxisSize: MainAxisSize.min,
          //       children: [
          //         Container(
          //             decoration: BoxDecoration(
          //               borderRadius: AppThemeBorderRadius.medBorderRadius,
          //             ),
          //             width: double.infinity,
          //             child: Center(
          //               child: Padding(
          //                 padding: const EdgeInsets.all(16.0),
          //                 child: Text(
          //                   title,
          //                   style: Theme.of(context)
          //                       .textTheme
          //                       .bodyLarge
          //                       .copyWith(fontWeight: FontWeight.bold),
          //                 ),
          //               ),
          //             )),
          //       ],
          //     ),
          //   ),
          // ),
        ),
      );
}
