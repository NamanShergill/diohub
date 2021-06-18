import 'dart:async';

import 'package:dio_hub/app/settings/palette.dart';
import 'package:dio_hub/common/animations/size_expanded_widget.dart';
import 'package:dio_hub/common/misc/button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BasePopupNotification extends StatelessWidget {
  const BasePopupNotification(
      {this.title,
      this.onTap,
      this.dismissOnTap = true,
      this.listenToLoadingController = true,
      this.color,
      this.notificationController,
      Key? key})
      : super(key: key);
  final String? title;
  final Function? onTap;
  final bool listenToLoadingController;
  final Color? color;
  final bool dismissOnTap;
  final StreamController<Widget?>? notificationController;

  @override
  Widget build(BuildContext context) {
    return SizeExpandedSection(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StringButton(
          color:
              color ?? Provider.of<PaletteSettings>(context).currentSetting.red,
          onTap: onTap != null
              ? () async {
                  await onTap!(context);
                  if (dismissOnTap && notificationController != null) {
                    notificationController!.add(null);
                  }
                }
              : null,
          title: title,
          listenToLoadingController: listenToLoadingController,
        ),
        // child: Material(
        //   borderRadius: AppThemeBorderRadius.medBorderRadius,
        //   color: Provider.of<PaletteSettings>(context).currentSetting.error,
        //   child: InkWell(
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
        //                       .bodyText1
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
}
