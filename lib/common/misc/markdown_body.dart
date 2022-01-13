import 'package:dio_hub/app/settings/palette.dart';
import 'package:dio_hub/common/misc/code_block_view.dart';
import 'package:dio_hub/common/misc/copy_button.dart';
import 'package:dio_hub/common/misc/image_loader.dart';
import 'package:dio_hub/common/misc/loading_indicator.dart';
import 'package:dio_hub/common/misc/patch_viewer.dart';
import 'package:dio_hub/common/wrappers/api_wrapper_widget.dart';
import 'package:dio_hub/services/markdown/markdown_service.dart';
import 'package:dio_hub/style/border_radiuses.dart';
import 'package:dio_hub/utils/link_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart';
import 'package:provider/provider.dart';

class MarkdownRenderAPI extends StatelessWidget {
  const MarkdownRenderAPI(this.data, {Key? key, this.repoName, this.branch})
      : super(key: key);
  final String data;
  final String? repoName;
  final String? branch;

  @override
  Widget build(BuildContext context) {
    return APIWrapper<String>(
      apiCall: (refresh) =>
          MarkdownService.renderMarkdown(data, context: repoName),
      loadingBuilder: (context) {
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 48),
          child: LoadingIndicator(),
        );
      },
      responseBuilder: (context, data) {
        return MarkdownBody(
          data,
          context: repoName,
          branch: branch,
        );
      },
    );
  }
}

class MarkdownBody extends StatefulWidget {
  const MarkdownBody(this.content,
      {Key? key, this.context, this.branch, this.defaultBodyStyle})
      : super(key: key);
  final String content;
  final String? context;
  final String? branch;
  final Style? defaultBodyStyle;
  @override
  _MarkdownBodyState createState() => _MarkdownBodyState();
}

class _MarkdownBodyState extends State<MarkdownBody> {
  late String content;
  late dom.Document doc;
  @override
  void initState() {
    updateData(widget.content);
    super.initState();
  }

  void updateData(String data) {
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
  void didUpdateWidget(covariant MarkdownBody oldWidget) {
    updateData(widget.content);
    super.didUpdateWidget(oldWidget);
  }

  void performModifications(List<dom.Element> elements) {
    for (final node in elements) {
      node.attributes.addAll({
        'id': node.text
            .toLowerCase()
            .replaceAll(' ', '-')
            .replaceAll(RegExp(r'[^0-9a-zA-Z-]+'), '')
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Html.fromDom(
      document: doc,
      // onLinkTap: (String? url, RenderContext rContext,
      //     Map<String, String> attributes, data) {
      //   return linkHandler(context, url);
      // },
      tagsList: Html.tags..add('g-emoji'),
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
              width: 0.2),
        ),
        'td': Style(
          border: Border.all(
              color:
                  Provider.of<PaletteSettings>(context).currentSetting.faded3,
              width: 0.2),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        ),
        'th': Style(
          border: Border.all(
              color:
                  Provider.of<PaletteSettings>(context).currentSetting.faded3,
              width: 0.2),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        ),
      },
      onLinkTap: (url, rdrContext, attributes, element) {
        return linkHandler(context, url);
      },
      customRender: {
        // 'a': (renderContext, child) {
        //   return GestureDetector(
        //     onTap: () {
        //       return linkHandler(
        //           context, renderContext.tree.attributes['href']);
        //     },
        //     onLongPress: () {
        //       return linkHandler(
        //           context, renderContext.tree.attributes['href'],
        //           showSheetOnDeepLink: true);
        //     },
        //     child: child,
        //   );
        // },
        'li': (context, child) {},
        'blockquote': (context, child) {
          return Container(
            padding: const EdgeInsets.only(left: 12),
            decoration: BoxDecoration(
                border: Border(
                    left: BorderSide(color: Colors.grey.shade400, width: 2))),
            child: child,
          );
        },
        'code': (rdrCtx, child) {
          return Container(
            decoration: BoxDecoration(
                color:
                    Provider.of<PaletteSettings>(context).currentSetting.faded1,
                borderRadius: smallBorderRadius),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 0),
              child: child,
            ),
          );
        },
        'div': (rdr, child) {
          final divClass = rdr.tree.attributes['class'];
          if (divClass == 'border rounded-1 my-2') {
            return Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Provider.of<PaletteSettings>(context)
                          .currentSetting
                          .faded3,
                      width: 0.3),
                  borderRadius: smallBorderRadius),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: child,
              ),
            );
          } else if (divClass == 'blob-wrapper blob-wrapper-embedded data') {
            // Todo: Format embedded code.
            // return Html(data: context.tree.element!.outerHtml);
          } else if (rdr.tree.children.isNotEmpty) {
            if (rdr.tree.children.first.name == 'pre') {
              return _CodeView(
                rdr.tree.children.first.element!.text,
                language: rdr.tree.element?.attributes['class']
                    ?.replaceAll('highlight highlight-source-', ''),
              );
            }
          }
          return child;
        },
        'g-emoji': (renderContext, child) {
          return child;
        },
        'img': (renderContext, child) {
          var src = renderContext.tree.element!.attributes['src']!;
          if (!src.startsWith('https://') && !src.startsWith('http://')) {
            src =
                'https://raw.githubusercontent.com/${widget.context}/${widget.branch}/$src';
          } else if (src
              .startsWith('https://github.com/${widget.context}/blob/')) {
            src = src.replaceFirst('https://github.com/${widget.context}/blob/',
                'https://raw.githubusercontent.com/${widget.context}/');
          }
          if (src.split('.').last.contains('svg')) {
            return SvgPicture.network(src);
          }
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: ImageLoader(
              src,
              height: double.tryParse(
                  renderContext.tree.element?.attributes['height'] ?? ''),
              width: double.tryParse(
                  renderContext.tree.element?.attributes['width'] ?? ''),
              // Some SVGs don't have svg in their URL so will miss the
              // if check above. They will fail in the image loader
              // so will build here.
              errorBuilder: (context) {
                return SvgPicture.network(src);
              },
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
        'pre': (renderContext, child) {
          if (renderContext.tree.children.first.name == 'code') {
            return _CodeView(renderContext.tree.element!.text);
          }
          return child;
        },
        'table': (renderContext, child) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: (renderContext.tree as TableLayoutElement)
                .toWidget(renderContext),
          );
        },
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
}

class _CodeView extends StatefulWidget {
  const _CodeView(this.data, {this.language});
  final String data;
  final String? language;
  @override
  __CodeViewState createState() => __CodeViewState();
}

class __CodeViewState extends State<_CodeView> {
  bool wrapText = false;

  @override
  Widget build(BuildContext context) {
    final Widget child = Padding(
      padding: const EdgeInsets.only(top: 32.0, right: 16, left: 16, bottom: 8),
      child: CodeBlockView(
        widget.data,
        language: widget.language,
      ),
    );
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                color: Provider.of<PaletteSettings>(context)
                    .currentSetting
                    .primary,
                borderRadius: smallBorderRadius),
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
                          onWrap: (value) {
                            setState(() {
                              wrapText = value;
                            });
                          },
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
