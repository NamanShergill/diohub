part of 'bottom_sheets.dart';

class BottomSheetHeaderText extends StatelessWidget {
  const BottomSheetHeaderText({
    Key? key,
    required this.headerText,
    this.headerTextStyle,
  }) : super(key: key);
  final String headerText;
  final TextStyle? headerTextStyle;
  @override
  Widget build(BuildContext context) {
    return Text(
      headerText,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ).merge(headerTextStyle),
    );
  }
}
