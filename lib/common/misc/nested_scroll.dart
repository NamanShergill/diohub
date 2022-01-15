import 'package:flutter/material.dart';

class NestedScroll extends StatelessWidget {
  const NestedScroll(
      {Key? key,
      required this.header,
      required this.body,
      required this.scrollController})
      : super(key: key);
  final Widget header;
  final Widget body;
  final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      controller: scrollController,
      headerSliverBuilder: (context, value) {
        return [
          SliverOverlapAbsorber(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            sliver: SliverSafeArea(
              sliver: SliverToBoxAdapter(child: header),
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
