import 'package:diohub/common/misc/nested_scroll.dart';
import 'package:diohub/common/misc/scroll_dynamic_elevation.dart';
import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';

class ScrollScaffold extends StatelessWidget {
  const ScrollScaffold({
    required this.body,
    this.header,
    this.subHeader,
    super.key,
    this.appBar,
    this.wrapperBuilder,
  });
  final PreferredSizeWidget? appBar;
  final Widget? header;
  final Widget? subHeader;
  final Widget body;
  final Widget Function(BuildContext context, Widget child)? wrapperBuilder;
  @override
  Widget build(final BuildContext context) {
    final Scaffold child = Scaffold(
      appBar: appBar,
      body: NestedScroll(
        header: (final (BuildContext, {bool isInnerBoxScrolled}) data) =>
            <Widget>[
          if (header != null)
            SliverToBoxAdapter(
              child: ScrollDynamicElevation(
                child: header!,
              ),
            ),
          if (subHeader != null)
            SliverPinnedHeader(
              child: ScrollDynamicElevation(
                child: subHeader!,
              ),
            ),
        ],
        body: body,
      ),
    );
    return wrapperBuilder?.call(context, child) ?? child;
  }
}
