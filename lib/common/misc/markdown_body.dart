import 'package:dio_hub/app/settings/palette.dart';
import 'package:dio_hub/common/misc/code_block_view.dart';
import 'package:dio_hub/common/misc/copy_button.dart';
import 'package:dio_hub/common/misc/image_loader.dart';
import 'package:dio_hub/common/misc/loading_indicator.dart';
import 'package:dio_hub/common/misc/patch_viewer.dart';
import 'package:dio_hub/common/wrappers/api_wrapper_widget.dart';
import 'package:dio_hub/main.dart';
import 'package:dio_hub/services/markdown/markdown_service.dart';
import 'package:dio_hub/style/border_radiuses.dart';
import 'package:dio_hub/utils/link_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:highlight/highlight.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart';
import 'package:provider/provider.dart';

class MarkdownRenderAPI extends StatelessWidget {
  const MarkdownRenderAPI(this.data, {super.key, this.repoName, this.branch});
  final String data;
  final String? repoName;
  final String? branch;

  @override
  Widget build(final BuildContext context) => APIWrapper<String>(
        apiCall: ({required final refresh}) =>
            MarkdownService.renderMarkdown(data, context: repoName),
        loadingBuilder: (final context) => const Padding(
          padding: EdgeInsets.symmetric(vertical: 48),
          child: LoadingIndicator(),
        ),
        responseBuilder: (final context, final data) => MarkdownBody(
          data,
          context: repoName,
          branch: branch,
        ),
      );
}

class MarkdownBody extends StatefulWidget {
  const MarkdownBody(
    this.content, {
    super.key,
    this.context,
    this.branch,
    this.defaultBodyStyle,
  });
  final String content;
  final String? context;
  final String? branch;
  final Style? defaultBodyStyle;
  @override
  MarkdownBodyState createState() => MarkdownBodyState();
}

class MarkdownBodyState extends State<MarkdownBody> {
  late String content;
  late dom.Document doc;
  @override
  void initState() {
    updateData(widget.content);
    super.initState();
  }

  void updateData(final String data) {
    final document = parse(data);
    // The list of tags to perform modifications on.
    final tags = <String>['h1', 'h2', 'h3', 'h4', 'h5', 'h6'];
    for (final element in tags) {
      final elements = document.getElementsByTagName(element);
      performModifications(elements);
    }
    doc = document;
  }

  @override
  void didUpdateWidget(covariant final MarkdownBody oldWidget) {
    updateData(widget.content);
    super.didUpdateWidget(oldWidget);
  }

  void performModifications(final List<dom.Element> elements) {
    for (final node in elements) {
      node.attributes.addAll(
        {
          'id': node.text
              .toLowerCase()
              .replaceAll(' ', '-')
              .replaceAll(RegExp(r'[^0-9a-zA-Z-]+'), ''),
        },
      );
    }
  }

  @override
  Widget build(final BuildContext context) => Html.fromDom(
        document: doc,
        // onLinkTap: (String? url, RenderContext rContext,
        //     Map<String, String> attributes, data) {
        //   return linkHandler(context, url);
        // },
        tagsList: Html.tags
          ..addAll(
            ['g-emoji'],
          ),
        style: {
          'a': Style(textDecoration: TextDecoration.none),
          'blockquote': Style(
            padding: EdgeInsets.zero,
            margin: EdgeInsets.zero,
          ),
          if (widget.defaultBodyStyle != null) 'body': widget.defaultBodyStyle!,
          'p': Style(
            padding: EdgeInsets.zero,
            margin: const EdgeInsets.symmetric(vertical: 8),
          ),
          'table': Style(
            border: Border.all(
              color:
                  Provider.of<PaletteSettings>(context).currentSetting.faded3,
              width: 0.2,
            ),
          ),
          'td': Style(
            border: Border.all(
              color:
                  Provider.of<PaletteSettings>(context).currentSetting.faded3,
              width: 0.2,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          ),
          'th': Style(
            border: Border.all(
              color:
                  Provider.of<PaletteSettings>(context).currentSetting.faded3,
              width: 0.2,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          ),
        },
        onLinkTap:
            (final url, final rdrContext, final attributes, final element) =>
                linkHandler(context, url),
        customRender: {
          'a': (final renderContext, final child) {
            if (renderContext.tree.attributes['href']?.startsWith('#') ==
                true) {
              return null;
            }
            return GestureDetector(
              onTap: () => linkHandler(
                context,
                renderContext.tree.attributes['href'],
              ),
              onLongPress: () => linkHandler(
                context,
                renderContext.tree.attributes['href'],
                showSheetOnDeepLink: true,
              ),
              child: child,
            );
          },
          'li': (final context, final child) {},
          'blockquote': (final context, final child) => Container(
                padding: const EdgeInsets.only(left: 12),
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(color: Colors.grey.shade400, width: 2),
                  ),
                ),
                child: child,
              ),
          'code': (final rdrCtx, final child) => DecoratedBox(
                decoration: BoxDecoration(
                  color: Provider.of<PaletteSettings>(context)
                      .currentSetting
                      .faded1,
                  borderRadius: smallBorderRadius,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: child,
                ),
              ),
          'div': (final rdr, final child) {
            final divClass = rdr.tree.attributes['class'];
            if (divClass == 'border rounded-1 my-2') {
              return DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Provider.of<PaletteSettings>(context)
                        .currentSetting
                        .faded3,
                    width: 0.3,
                  ),
                  borderRadius: smallBorderRadius,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: child,
                ),
              );
            } else if (divClass == 'blob-wrapper blob-wrapper-embedded data') {
              // TODO(namanshergill): Format embedded code.
              // return Html(data: context.tree.element!.outerHtml);
            } else if (rdr.tree.children.isNotEmpty) {
              if (rdr.tree.children.first.name == 'pre') {
                return _CodeView(
                  rdr.tree.children.first.element!.text,
                  language: rdr.tree.element?.attributes['class']
                      ?.replaceAll('highlight highlight-source-', '')
                      .split(' ')
                      .first,
                );
              }
            }
            return child;
          },
          'g-emoji': (final renderContext, final child) => child,
          'img': (final renderContext, final child) {
            var src = renderContext.tree.element!.attributes['src'];
            if (!src.startsWith('https://') && !src.startsWith('http://')) {
              src =
                  'https://raw.githubusercontent.com/${widget.context}/${widget.branch}/$src';
            } else if (src
                .startsWith('https://github.com/${widget.context}/blob/')) {
              src = src.replaceFirst(
                'https://github.com/${widget.context}/blob/',
                'https://raw.githubusercontent.com/${widget.context}/',
              );
            }
            if (src.split('.').last.contains('svg')) {
              return SvgPicture.network(src);
            }
            return Padding(
              padding: const EdgeInsets.all(4),
              child: ImageLoader(
                src,
                height: double.tryParse(
                  renderContext.tree.element?.attributes['height'] ?? '',
                ),
                width: double.tryParse(
                  renderContext.tree.element?.attributes['width'] ?? '',
                ),
                // Some SVGs don't have svg in their URL so will miss the
                // if check above. They will fail in the image loader
                // so will build here.
                errorBuilder: (final context) => SvgPicture.network(src),
              ),
            );
          },
          // 'p': (RenderContext renderContext, Widget child) {
          //   final String? pClass = renderContext.tree.attributes['class'];
          //   if (pClass == 'mb-0 color-text-tertiary') {
          //     return DefaultTextStyle(
          //       style: renderContext.style
          //           .generateTextStyle()
          //           .copyWith(color: Provider.of<PaletteSettings>(context).currentSetting.grey3),
          //       child: child,
          //     );
          //   }
          //   return child;
          // },
          'pre': (final renderContext, final child) {
            if (renderContext.tree.children.first.name == 'code') {
              return _CodeView(renderContext.tree.element!.text);
            }
            return child;
          },
          'table': (final renderContext, final child) => SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: (renderContext.tree as TableLayoutElement)
                    .toWidget(renderContext),
              ),
          // 'td': (renderContext, child) {
          //   return Row(
          //     children: [
          //       Expanded(
          //         child: Container(
          //           decoration: BoxDecoration(
          //             border: Border.all(
          //                 color: Provider.of<PaletteSettings>(context)
          //                     .currentSetting
          //                     .faded3,
          //                 width: 0.3),
          //           ),
          //           child: Padding(
          //             padding: const EdgeInsets.all(8.0),
          //             child: child,
          //           ),
          //         ),
          //       ),
          //     ],
          //   );
          // },
          // 'th': (renderContext, child) {
          //   return Row(
          //     children: [
          //       Expanded(
          //         child: Container(
          //           decoration: BoxDecoration(
          //             border: Border.all(
          //                 color: Provider.of<PaletteSettings>(context)
          //                     .currentSetting
          //                     .faded3,
          //                 width: 0.3),
          //           ),
          //           child: Padding(
          //             padding: const EdgeInsets.all(8.0),
          //             child: child,
          //           ),
          //         ),
          //       ),
          //     ],
          //   );
          // },
        },
      );
}

class _CodeView extends StatefulWidget {
  const _CodeView(
    this.data, {
    this.language,
  });
  final String data;
  final String? language;
  @override
  __CodeViewState createState() => __CodeViewState();
}

class __CodeViewState extends State<_CodeView> {
  bool wrapText = false;

  @override
  Widget build(final BuildContext context) {
    final Widget child = Padding(
      padding: const EdgeInsets.only(top: 32, right: 16, left: 16, bottom: 8),
      child: CodeBlockView(
        widget.data,
        language: widget.language,
      ),
    );
    return Row(
      children: [
        Expanded(
          child: DecoratedBox(
            decoration: BoxDecoration(
              color:
                  Provider.of<PaletteSettings>(context).currentSetting.primary,
              borderRadius: smallBorderRadius,
            ),
            child: Stack(
              children: [
                if (!wrapText)
                  Scrollbar(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: child,
                    ),
                  ),
                if (wrapText) child,
                if (widget.language != null &&
                    allLanguages.containsKey(widget.language))
                  Positioned(
                    left: 8,
                    top: 8,
                    child: Text(
                      widget.language!,
                      style: context.textTheme.labelSmall?.copyWith(
                        color: context.palette.faded3,
                        letterSpacing: 0,
                      ),
                    ),
                  ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Material(
                    color: Colors.transparent,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CopyButton(
                          widget.data,
                          size: 14,
                        ),
                        WrapIconButton(
                          wrap: wrapText,
                          size: 14,
                          onWrap: (final value) {
                            setState(() {
                              wrapText = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// CustomRenderMatcher _tagMatcher(String tag) =>
//     (context) => context.tree.element?.localName == tag;

// CustomRender _widgetRender(
//         Widget Function(RenderContext, Widget child) builder) =>
//     CustomRender.widget(
//       widget: (p0, p1) {
//         TextSpan child;
//         if (p1.call().isNotEmpty) {
//           child = TextSpan(
//             style: p0.style.generateTextStyle(),
//             children: p1.call(),
//           );
//         } else {
//           // print(p0.tree.element?.parent?.);
//           child = TextSpan(
//             // style: p0..style.generateTextStyle().merge(other),
//             text: p0.tree.element?.text ?? '',
//           );
//         }
//         return builder.call(
//           p0,
//           Text.rich(
//             child,
//           ),
//         );
//       },
//     );
