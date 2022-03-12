import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';

// Why this, you ask? Well, because the flutter team forgot to consider multiple
// scrollable children being under a single NestedScrollView sharing the same
// PrimaryScrollController, causing the flutter_scroll_to_top package to break
// if used in tabViews.
// https://github.com/flutter/flutter/issues/36419
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
  late _ScrollAbsorber scrollAbsorber = _ScrollAbsorber(nestedScrollViewKey);
  @override
  Widget build(BuildContext context) {
    final scrollController = PrimaryScrollController.of(context);

    return NestedScrollView(
      key: nestedScrollViewKey,
      controller: scrollController,
      headerSliverBuilder: (context, value) {
        return [
          SliverOverlapAbsorber(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            sliver: SliverSafeArea(
              bottom: false,
              sliver: MultiSliver(children: widget.header(context, value)),
            ),
          ),
        ];
      },
      body: Builder(
        builder: (context) {
          NestedScrollView.sliverOverlapAbsorberHandleFor(context);

          return NotificationListener<ScrollUpdateNotification>(
              onNotification: (notification) {
                scrollAbsorber.absorbScrollNotification(notification);
                return true;
              },
              child: widget.body);
        },
      ),
    );
  }
}

// Replacement for ListView/SingleChildScrollView to be used under [NestedScroll]
// for scrolling to function properly.
class NestedScrollableChild extends StatelessWidget {
  const NestedScrollableChild({Key? key, required this.child})
      : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollUpdateNotification>(
        // Prevents scroll notifications from propogating up to parent [NestedScroll]
        // to prevent scrolling from breaking.
        onNotification: (notification) => true,
        child: SingleChildScrollView(child: child));
  }
}

// class CustomScroll extends StatelessWidget {
//   const CustomScroll({Key? key, required this.child}) : super(key: key);
//   final Widget child;
//   @override
//   Widget build(BuildContext context) {
//     return CustomScrollView(
//       slivers: [
//         SliverToBoxAdapter(child: child),
//       ],
//     );
//   }
// }

class _ScrollAbsorber {
  _ScrollAbsorber(this.nestedScrollViewKey);
  final GlobalKey<NestedScrollViewState> nestedScrollViewKey;

  void absorbScrollNotification(ScrollUpdateNotification notification) {
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
    // print(notification);
    if (notification.metrics.axis == Axis.vertical) {
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
