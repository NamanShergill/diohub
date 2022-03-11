import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';

class NestedScroll extends StatefulWidget {
  const NestedScroll({
    Key? key,
    required this.header,
    required this.body,
  }) : super(key: key);
  final List<Widget> Function(BuildContext context, bool isInnerBoxScrolled)
      header;
  final Widget body;

  @override
  State<NestedScroll> createState() => _NestedScrollState();
}

class _NestedScrollState extends State<NestedScroll> {
  final GlobalKey<NestedScrollViewState> nestedScrollViewKey =
      GlobalKey<NestedScrollViewState>();
  late ScrollAbsorber scrollAbsorber = ScrollAbsorber(nestedScrollViewKey);
  final ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      key: nestedScrollViewKey,
      controller: scrollController,
      headerSliverBuilder: (context, value) {
        return [
          SliverOverlapAbsorber(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            sliver: SliverSafeArea(
              sliver: MultiSliver(children: widget.header(context, value)),
            ),
          ),
        ];
      },
      body: Builder(
        builder: (context) {
          NestedScrollView.sliverOverlapAbsorberHandleFor(context);

          return NotificationListener(
              onNotification: (notification) {
                scrollAbsorber
                    .absorbScrollNotification(notification as Notification);
                return true;
              },
              child: widget.body);
        },
      ),
    );
  }
}

class ScrollAbsorber {
  ScrollAbsorber(this.nestedScrollViewKey);
  final GlobalKey<NestedScrollViewState> nestedScrollViewKey;

  void absorbScrollNotification(Notification notification) {
    final nestedScrollView =
        nestedScrollViewKey.currentWidget as NestedScrollView;
    var scrolled = 0.0;
    // if (notification is OverscrollNotification) {
    //   // print(notification.overscroll);
    //   if (notification.metrics.axis == Axis.vertical) {
    //     scrolled = notification.overscroll;
    //   }
    // }
    // if (notification is ScrollUpdateNotification) {
    //   if (notification.metrics.axis == Axis.vertical &&
    //       (notification.scrollDelta ?? 0) > 0) {
    //     scrolled = notification.scrollDelta ?? 0;
    //   }
    // }

    if (notification is ScrollMetricsNotification &&
        notification.metrics.axis == Axis.vertical) {
      scrolled = notification.metrics.pixels;
      // print(scrolled);
      if (scrolled > -10 && scrolled < 20) {
        return;
      }
      if (scrolled < 0) {
        scrolled = scrolled / 5;
      } else {
        scrolled = scrolled / 10;
      }
    }
    if (scrolled < -2 || scrolled > 2) {
      final primaryScrollController = nestedScrollView.controller!;
      primaryScrollController.jumpTo(primaryScrollController.offset + scrolled);
    }
  }
}
