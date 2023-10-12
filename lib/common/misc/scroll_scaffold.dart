import 'package:dio_hub/common/misc/nested_scroll.dart';
import 'package:dio_hub/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';

class ScrollScaffold extends StatelessWidget {
  const ScrollScaffold({
    this.header,
    this.subHeader,
    required this.body,
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
    final child = Scaffold(
      appBar: appBar,
      body: NestedScroll(
        header: (final (BuildContext, {bool isInnerBoxScrolled}) data) =>
            <Widget>[
          if (header != null)
            SliverToBoxAdapter(
              child: header,
            ),
          if (subHeader != null)
            SliverPinnedHeader(
                child: Theme(
              data: context.themeData.copyWith(
                colorScheme: context.themeData.colorScheme.copyWith(
                  surfaceVariant: Colors.transparent,
                ),
              ),
              // tabBarTheme: context.themeData.tabBarTheme.copyWith(col)),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 100),
                color: data.isInnerBoxScrolled
                    ? context.colorScheme.surface
                    : context.colorScheme.background,
                child: subHeader,
              ),
            )),
        ],
        body: body,
      ),
    );
    return wrapperBuilder?.call(context, child) ?? child;
  }
}
