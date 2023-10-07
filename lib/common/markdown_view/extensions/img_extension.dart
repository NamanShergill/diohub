part of 'markdown_extensions.dart';

typedef MarkdownImgSrcModifiers = String Function(MarkdownImgSrcData srcData);

_MarkdownExtension _imgExtension(
  final BuildContext context, {
  required final List<MarkdownImgSrcModifiers> imgSrcModifiers,
}) =>
    _MarkdownExtension(
      tag: 'img',
      builder: (final extensionContext) => _ImgWidget(
        extensionContext,
        imgSrcModifiers: imgSrcModifiers,
      ),
    );

class _ImgWidget extends _ExtensionWidget {
  const _ImgWidget(
    super.extensionContext, {
    required this.imgSrcModifiers,
  });
  final List<MarkdownImgSrcModifiers> imgSrcModifiers;

  @override
  Widget build(final BuildContext context) => _ImgRender(
        imgSrcModifiers: imgSrcModifiers,
        attributes: attributes!,
        fallbackChild: defaultChild,
      );
}

class MarkdownImgSrcData {
  MarkdownImgSrcData(this.src);

  final String src;

  bool get isHttp => src.startsWith('https://') || src.startsWith('http://');

  bool isInRepoContext(final String repoContext) =>
      src.startsWith('https://github.com/$repoContext/blob/');
}

class _ImgRender extends StatefulWidget {
  const _ImgRender({
    required this.imgSrcModifiers,
    required this.attributes,
    required this.fallbackChild,
  });
  final List<MarkdownImgSrcModifiers> imgSrcModifiers;
  final LinkedHashMap<Object, String> attributes;
  final Widget fallbackChild;
  @override
  State<_ImgRender> createState() => _ImgRenderState();
}

class _ImgRenderState extends State<_ImgRender> {
  late String src = widget.attributes['src']!;
  @override
  Widget build(final BuildContext context) {
    for (final modifier in widget.imgSrcModifiers) {
      src = modifier.call(
        MarkdownImgSrcData(src),
      );
    }
    if (src.split('.').last.contains('svg')) {
      return SvgPicture.network(
        src,
      );
    }
    return Padding(
      padding: const EdgeInsets.all(4),
      child: ImageLoader(
        src,
        height: double.tryParse(
          widget.attributes['height'] ?? '',
        ),
        width: double.tryParse(
          widget.attributes['width'] ?? '',
        ),
        // Some SVGs don't have svg in their URL so will miss the
        // if check above. They will fail in the image loader
        // so will build here.
        errorBuilder: (final context) => SvgPicture.network(
          src,
        ),
      ),
    );
  }
}
