part of 'bottom_sheets.dart';

class BottomSheetBodyList extends StatelessWidget {
  const BottomSheetBodyList({
    Key? key,
    this.itemPadding = const EdgeInsets.all(8),
    required this.children,
  }) : super(key: key);
  final EdgeInsets itemPadding;
  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: itemPadding,
          child: children[index],
        );
      },
      separatorBuilder: (context, index) => const Divider(
        height: 0,
      ),
      itemCount: children.length,
    );
  }
}

typedef ScrollBuilder = Widget Function(
  BuildContext context,
  void Function(void Function()) setState,
  ScrollController scrollController,
);

class BottomSheetBodyScrollable extends StatelessWidget {
  const BottomSheetBodyScrollable({
    Key? key,
    required this.scrollBuilder,
    this.initialChildSize = 0.7,
    this.maxChildSize = 1,
    this.expand = false,
    this.minChildSize = 0.6,
  }) : super(key: key);
  final ScrollableWidgetBuilder scrollBuilder;
  final double initialChildSize;
  final double maxChildSize;
  final bool expand;
  final double minChildSize;
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: initialChildSize,
      maxChildSize: maxChildSize,
      expand: expand,
      minChildSize: minChildSize,
      builder: scrollBuilder.call,
    );
  }
}
