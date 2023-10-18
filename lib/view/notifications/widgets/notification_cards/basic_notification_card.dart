import 'package:diohub/common/animations/fade_animation_widget.dart';
import 'package:diohub/common/misc/shimmer_widget.dart';
import 'package:diohub/models/events/notifications_model.dart';
import 'package:diohub/services/activity/notifications_service.dart';
import 'package:diohub/style/border_radiuses.dart';
import 'package:diohub/utils/get_date.dart';
import 'package:diohub/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class BasicNotificationCard extends StatefulWidget {
  const BasicNotificationCard({
    required this.notification,
    this.footerBuilder,
    this.loading = false,
    this.onTap,
    this.iconBuilder,
    super.key,
  });
  final WidgetBuilder? iconBuilder;
  final WidgetBuilder? footerBuilder;
  final bool loading;
  final NotificationModel notification;
  final VoidCallback? onTap;

  @override
  BasicNotificationCardState createState() => BasicNotificationCardState();
}

class BasicNotificationCardState extends State<BasicNotificationCard> {
  // Need to add a key to [Slidable] child widget
  // to prevent unnecessary rebuilds.
  GlobalKey key = GlobalKey();

  Future<void> markAsRead() async {
    await NotificationsService.markThreadAsRead(widget.notification.id);
    setState(() {
      widget.notification.unread = false;
    });
    await HapticFeedback.mediumImpact();
  }

  @override
  Widget build(final BuildContext context) => Slidable(
        enabled: widget.notification.unread!,
        startActionPane: ActionPane(
          motion: const DrawerMotion(),
          extentRatio: 0.4,
          dismissible: DismissiblePane(
            dismissThreshold: 0.4,
            closeOnCancel: true,
            confirmDismiss: () async {
              await markAsRead();
              return false;
            },
            onDismissed: () {},
          ),
          children: <Widget>[
            SlidableAction(
              icon: MdiIcons.notificationClearAll,
              // backgroundColor:
              // Provider.of<PaletteSettings>(context).currentSetting.green,
              label: 'Mark as read',
              onPressed: (final _) => markAsRead,
            ),
          ],
        ),
        endActionPane: ActionPane(
          motion: const DrawerMotion(),
          extentRatio: 0.4,
          children: <Widget>[
            SlidableAction(
              icon: MdiIcons.check,
              backgroundColor: Colors.green,
              label: 'Mark as read',
              onPressed: (final _) => markAsRead,
            ),
          ],
        ),
        key: UniqueKey(),
        child: Material(
          key: key,
          color: widget.notification.unread!
              ? context.colorScheme.surfaceVariant
              : context.colorScheme.surface,
          child: InkWell(
            onTap: () async {
              if (widget.notification.unread ?? false) {
                await markAsRead();
              }
              widget.onTap?.call();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: widget.iconBuilder!(context),
                      ),
                      Visibility(
                        visible: widget.notification.unread!,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: ClipOval(
                            child: Container(
                              height: 10,
                              width: 10,
                              color: context.colorScheme.primary,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Flexible(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Flexible(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                  widget.notification.repository!.fullName!,
                                  style: const TextStyle(
                                      // color: Provider.of<PaletteSettings>(context)
                                      //     .currentSetting
                                      //     .faded3,
                                      ),
                                ),
                              ),
                            ),
                            Text(
                              getDate(widget.notification.updatedAt.toString()),
                              style: const TextStyle(
                                  // color: Provider.of<PaletteSettings>(context)
                                  //     .currentSetting
                                  //     .faded3,
                                  ),
                            ),
                          ],
                        ),
                        Flexible(
                          child: Text(
                            widget.notification.subject!.title!,
                            style: context.textTheme.bodyLarge?.copyWith(
                              color: widget.notification.unread!
                                  ? context.colorScheme.onPrimary
                                  : context.colorScheme.onSurface,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        FadeAnimationSection(
                          expand: !widget.loading,
                          child: widget.footerBuilder!(context),
                        ),
                        if (widget.loading) footerLoading(),
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

  Widget footerLoading() => Row(
        children: <Widget>[
          const ShimmerWidget(
            child: ClipOval(
              child: SizedBox(
                height: 20,
                width: 20,
              ),
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: ShimmerWidget(
              borderRadius: medBorderRadius,
              child: Container(
                decoration: const BoxDecoration(
                    // color: Provider.of<PaletteSettings>(context)
                    //     .currentSetting
                    //     .faded1,
                    ),
                height: 20,
              ),
            ),
          ),
        ],
      );
}
