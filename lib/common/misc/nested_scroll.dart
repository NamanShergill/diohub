import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';

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
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
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
