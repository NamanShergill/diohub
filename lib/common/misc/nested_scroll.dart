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
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      key: nestedScrollViewKey,
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

          return widget.body;
        },
      ),
    );
  }
}
