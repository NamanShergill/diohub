part of 'markdown_extensions.dart';

_MarkdownExtension _divExtension(final BuildContext context) =>
    _MarkdownExtension(
      tag: 'div',
      builder: _DivWidget.new,
    );

class _DivWidget extends _ExtensionWidget {
  const _DivWidget(
    super.extensionContext,
  );

  @override
  Widget build(final BuildContext context) {
    if (divClass == 'border rounded-1 my-2') {
      return DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(
            color: context.palette.faded3,
            width: 0.3,
          ),
          borderRadius: smallBorderRadius,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: defaultChild,
        ),
      );
    } else if (divClass == 'blob-wrapper blob-wrapper-embedded data') {
      // TODO(namanshergill): Format embedded code.
      // return Html(data: context.tree.element!.outerHtml);
    } else if (extensionContext.elementChildren.isNotEmpty) {
      if (extensionContext.elementChildren.first.localName == 'pre') {
        return _CodeView(
          extensionContext.elementChildren.first.text,
          language: extensionContext.element?.attributes['class']
              ?.replaceAll('highlight highlight-source-', '')
              .split(' ')
              .first,
        );
      }
    }
    return defaultChild;
  }
}
