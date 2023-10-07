part of 'markdown_extensions.dart';

_MarkdownExtension _aExtension(final BuildContext context) =>
    _MarkdownExtension(
      tag: 'a',
      builder: _AWidget.new,
    );

class _AWidget extends _ExtensionWidget {
  const _AWidget(super.extensionContext);

  @override
  Widget build(final BuildContext context) {
    if (attributes?['href']?.startsWith('#') ?? false) {
      return extensionContext.childWithStyle(
        Style(
          fontWeight: FontWeight.bold,
        ),
      );
    }
    return GestureDetector(
      onTap: () async => linkHandler(
        context,
        attributes!['href'],
      ),
      onLongPress: () async => linkHandler(
        context,
        attributes!['href'],
        showSheetOnDeepLink: true,
      ),
      child: defaultChild,
    );
  }
}
