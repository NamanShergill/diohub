part of 'bottom_sheets.dart';

class BottomSheetHeaderText extends StatelessWidget {
  const BottomSheetHeaderText({
    required this.headerText,
    super.key,
  });
  final String headerText;
  // final TextStyle? headerTextStyle;
  @override
  Widget build(final BuildContext context) => Text(
        headerText,
        style: context.textTheme.titleSmall?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      );
}
