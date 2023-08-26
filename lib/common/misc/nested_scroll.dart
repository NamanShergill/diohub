import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';

class NestedScroll extends StatelessWidget {
  const NestedScroll({
    Key? key,
    required this.header,
    required this.body,
  }) : super(key: key);
  final List<Widget> Function(BuildContext context,
      {required bool isInnerBoxScrolled}) header;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, value) {
        return [
          SliverOverlapAbsorber(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            sliver: SliverSafeArea(
              bottom: false,
              sliver: MultiSliver(
                children: header(
                  context,
                  isInnerBoxScrolled: value,
                ),
              ),
            ),
          ),
        ];
      },
      body: Builder(
        builder: (context) {
          NestedScrollView.sliverOverlapAbsorberHandleFor(context);

          return body;
        },
      ),
    );
  }
}
