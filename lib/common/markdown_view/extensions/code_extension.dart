part of 'markdown_extensions.dart';

_MarkdownExtension _codeExtension(final BuildContext context) =>
    _MarkdownExtension(
      tag: 'code',
      builder: _CodeWidget.new,
    );

class _CodeWidget extends _ExtensionWidget {
  const _CodeWidget(super.extensionContext);

  @override
  Widget build(final BuildContext context) => Card(
        // color: red,
        // decoration: BoxDecoration(
        //   // color: context.palette.faded1,
        //   borderRadius: smallBorderRadius,
        // ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: defaultChild,
        ),
      );
}
