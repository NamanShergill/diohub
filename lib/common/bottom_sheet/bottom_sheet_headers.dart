part of 'bottom_sheets.dart';

class BottomSheetHeaderText extends StatelessWidget {
  const BottomSheetHeaderText({
    required this.headerText,
    super.key,
    this.headerTextStyle,
  });
  final String headerText;
  final TextStyle? headerTextStyle;
  @override
  Widget build(final BuildContext context) => Text(
        headerText,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ).merge(headerTextStyle),
      );
}
