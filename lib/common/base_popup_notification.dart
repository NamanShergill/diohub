import 'dart:async';

import 'package:dio_hub/common/animations/size_expanded_widget.dart';
import 'package:dio_hub/style/colors.dart';
import 'package:flutter/material.dart';

import 'button.dart';

class BasePopupNotification extends StatelessWidget {
  final String? title;
  final Function? onTap;
  final bool listenToLoadingController;
  final Color? color;
  final bool dismissOnTap;
  final StreamController<Widget?>? notificationController;
  BasePopupNotification(
      {this.title,
      this.onTap,
      this.dismissOnTap = true,
      this.listenToLoadingController = true,
      this.color,
      this.notificationController});

  @override
  Widget build(BuildContext context) {
    return SizeExpandedSection(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StringButton(
          color: color ?? AppColor.red,
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
        //   color: AppColor.error,
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
