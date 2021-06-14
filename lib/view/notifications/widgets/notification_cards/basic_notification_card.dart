import 'package:dio_hub/app/settings/palette.dart';
import 'package:dio_hub/common/animations/size_expanded_widget.dart';
import 'package:dio_hub/common/misc/shimmer_widget.dart';
import 'package:dio_hub/models/events/notifications_model.dart';
import 'package:dio_hub/services/activity/notifications_service.dart';
import 'package:dio_hub/style/border_radiuses.dart';
import 'package:dio_hub/utils/get_date.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

class BasicNotificationCard extends StatefulWidget {
  final WidgetBuilder? iconBuilder;
  final WidgetBuilder? footerBuilder;
  final bool loading;
  final NotificationModel? notification;
  final Function? onTap;
  const BasicNotificationCard(
      {this.footerBuilder,
      this.loading = false,
      this.onTap,
      this.iconBuilder,
      this.notification,
      Key? key})
      : super(key: key);

  @override
  _BasicNotificationCardState createState() => _BasicNotificationCardState();
}

class _BasicNotificationCardState extends State<BasicNotificationCard> {
  // Need to add a key to [Slidable] child widget
  // to prevent unnecessary rebuilds.
  GlobalKey key = GlobalKey();

  void markAsRead() {
    HapticFeedback.vibrate();
    NotificationsService.markThreadAsRead(widget.notification!.id);
    setState(() {
      widget.notification!.unread = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: const SlidableDrawerActionPane(),
      enabled: widget.notification!.unread!,
      actions: [
        IconSlideAction(
          icon: LineIcons.check,
          color: Provider.of<PaletteSettings>(context).currentSetting.green,
          caption: 'Mark as read',
          onTap: () {
            markAsRead();
          },
        ),
      ],
      secondaryActions: [
        IconSlideAction(
          icon: LineIcons.check,
          color: Provider.of<PaletteSettings>(context).currentSetting.green,
          caption: 'Mark as read',
          onTap: () {
            markAsRead();
          },
        ),
      ],
      actionExtentRatio: 0.4,
      dismissal: SlidableDismissal(
        child: SizeExpandedSection(
          axis: Axis.horizontal,
          animationCurve: Curves.easeOutExpo,
          child: Container(
            height: 120,
            color: Provider.of<PaletteSettings>(context).currentSetting.green,
            child: const Center(
              child: Text('Mark as read?'),
            ),
          ),
        ),
        onWillDismiss: (_) {
          markAsRead();
          return false;
        },
        closeOnCanceled: true,
        dismissThresholds: const {
          SlideActionType.primary: 0.4,
          SlideActionType.secondary: 0.4
        },
      ),
      key: UniqueKey(),
      child: Material(
        key: key,
        color: widget.notification!.unread!
            ? Provider.of<PaletteSettings>(context).currentSetting.secondary
            : Colors.transparent,
        child: InkWell(
          onTap: () {
            markAsRead();
            widget.onTap!();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Row(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: widget.iconBuilder!(context),
                    ),
                    Visibility(
                        visible: widget.notification!.unread!,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipOval(
                            child: Container(
                              height: 10,
                              width: 10,
                              color: Provider.of<PaletteSettings>(context)
                                  .currentSetting
                                  .accent,
                            ),
                          ),
                        )),
                  ],
                ),
                const SizedBox(
                  width: 8,
                ),
                Flexible(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(
                                widget.notification!.repository!.fullName!,
                                style: TextStyle(
                                    color: Provider.of<PaletteSettings>(context)
                                        .currentSetting
                                        .faded3),
                              ),
                            ),
                          ),
                          Text(
                            getDate(widget.notification!.updatedAt.toString()),
                            style: TextStyle(
                                color: Provider.of<PaletteSettings>(context)
                                    .currentSetting
                                    .faded3),
                          ),
                        ],
                      ),
                      Flexible(
                        child: Text(
                          widget.notification!.subject!.title!,
                          style: TextStyle(
                              color: widget.notification!.unread!
                                  ? Provider.of<PaletteSettings>(context)
                                      .currentSetting
                                      .baseElements
                                  : Provider.of<PaletteSettings>(context)
                                      .currentSetting
                                      .faded3,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      !widget.loading
                          ? widget.footerBuilder!(context)
                          : footerLoading(),
                      const SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget footerLoading() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ShimmerWidget(
          child: ClipOval(
            child: Container(
              height: 20,
              width: 20,
              color: Colors.grey,
            ),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: ShimmerWidget(
            borderRadius: AppThemeBorderRadius.medBorderRadius,
            child: Container(
              decoration: BoxDecoration(
                color:
                    Provider.of<PaletteSettings>(context).currentSetting.faded1,
              ),
              height: 20,
            ),
          ),
        ),
      ],
    );
  }
}
