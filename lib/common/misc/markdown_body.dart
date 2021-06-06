import 'package:dio_hub/common/misc/code_block_view.dart';
import 'package:dio_hub/common/misc/image_loader.dart';
import 'package:dio_hub/common/misc/loading_indicator.dart';
import 'package:dio_hub/common/wrappers/api_wrapper_widget.dart';
import 'package:dio_hub/services/markdown/markdown_service.dart';
import 'package:dio_hub/style/border_radiuses.dart';
import 'package:dio_hub/style/colors.dart';
import 'package:dio_hub/utils/copy_to_clipboard.dart';
import 'package:dio_hub/utils/link_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/html_parser.dart';
import 'package:flutter_html/style.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MarkdownRenderAPI extends StatelessWidget {
  final String data;
  final String? repoName;
  final String? branch;
  const MarkdownRenderAPI(this.data, {Key? key, this.repoName, this.branch})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return APIWrapper<String>(
      apiCall: MarkdownService.renderMarkdown(data, context: repoName),
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
  final String content;
  final String? context;
  final String? branch;

  const MarkdownBody(this.content, {Key? key, this.context, this.branch})
      : super(key: key);

  @override
  _MarkdownBodyState createState() => _MarkdownBodyState();
}

class _MarkdownBodyState extends State<MarkdownBody> {
  late String content;

  @override
  void initState() {
    updateData(widget.content);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant MarkdownBody oldWidget) {
    updateData(widget.content);
    super.didUpdateWidget(oldWidget);
  }

  void updateData(String data) {
    // data = emoteText(data);
    // data = mdToHtml(data, repo: widget.repo);
    // log(data);

    // log(data);
    // var document = parse(data);
    // The list of tags to perform modifications on.
    // List<String> tags = ['p', 'li'];
    // tags.forEach((element) {
    //   var elements = document.getElementsByTagName(element);
    //   performModifications(elements);
    // });
    content = data;
  }

  // void performModifications(elements) {
  //   for (dom.Element node in elements) {
  //     // Make a snapshot of the nodes list as the current one would change
  //     // in the loops.
  //     List<dom.Node> unModifiedNodes = List.from(node.nodes);
  //     for (int i = 0; i < unModifiedNodes.length; i++) {
  //       // Select the child node.
  //       dom.Node childNode = unModifiedNodes[i];
  //       // Check if the node type is Text.
  //       if (childNode is dom.Text) {
  //         // Split strings if they start with @ or digits if they start with #.
  //         RegExp exp =
  //             RegExp(r'(@[a-zA-Z0-9_/]+?(?![a-zA-Z0-9_/]))|((?=/#(\d+)/))');
  //         List<String?> strings = childNode.text.splitWithDelim(exp);
  //         // Insert new elements just before the current element node.
  //         strings.forEach(
  //           (e) {
  //             // Change @<string> to a URL to a Github profile.
  //             if (e!.startsWith('@')) {
  //               // If string has a '/' in it, it is likely a mention to a
  //               // Github team.
  //               if (e.contains('/'))
  //                 node.insertBefore(
  //                     parseFragment(
  //                         '<a href="https://github.com/orgs/${e.split('/').first.substring(0)}/teams/${e.split('/').last}" style="color: #ffffff; font-weight:bold">$e</a>'),
  //                     childNode);
  //               else
  //                 node.insertBefore(
  //                     parseFragment(
  //                         '<a href="https://github.com/${e.substring(1)}" style="color: #ffffff; font-weight:bold">$e</a>'),
  //                     childNode);
  //             }
  //             // Change #<digits> to a URL to a repo issue. Will need issueURL.
  //             else if (e.startsWith('#')) {
  //               node.insertBefore(
  //                   parseFragment(
  //                       '<a href="https://github.com/${e.substring(1)}" style="font-weight:bold">$e</a>'),
  //                   childNode);
  //             }
  //             // Just add the normal string if the cases above don't match.
  //             else {
  //               node.insertBefore(parseFragment(e), childNode);
  //             }
  //           },
  //         );
  //         // Remove the current element node, as the children inside have been
  //         // accordingly parsed and changed.
  //         childNode.remove();
  //       }
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Html(
        data: content,
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
          'p': Style(
            padding: EdgeInsets.zero,
            margin: const EdgeInsets.symmetric(vertical: 8),
          ),
        },
        customRender: {
          'a': (RenderContext renderContext, Widget child) {
            return GestureDetector(
              onTap: () {
                return linkHandler(
                    context, renderContext.tree.attributes['href']);
              },
              onLongPress: () {
                return linkHandler(
                    context, renderContext.tree.attributes['href'],
                    showSheetOnDeepLink: true);
              },
              child: child,
            );
          },
          'blockquote': (RenderContext context, Widget child) {
            return Container(
              padding: const EdgeInsets.only(left: 12),
              decoration: BoxDecoration(
                  border: Border(
                      left: BorderSide(color: Colors.grey.shade400, width: 2))),
              child: child,
            );
          },
          'code': (RenderContext context, Widget child) {
            return Container(
              decoration: BoxDecoration(
                  color: AppColor.grey,
                  borderRadius: AppThemeBorderRadius.smallBorderRadius),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 6.0, vertical: 0),
                child: child,
              ),
            );
          },
          'div': (RenderContext context, Widget child) {
            final String? divClass = context.tree.attributes['class'];
            if (divClass == 'border rounded-1 my-2') {
              return Container(
                decoration: BoxDecoration(
                    border: Border.all(color: AppColor.grey3, width: 0.3),
                    borderRadius: AppThemeBorderRadius.smallBorderRadius),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: child,
                ),
              );
            } else if (divClass == 'blob-wrapper blob-wrapper-embedded data') {
              // Todo: Format embedded code.
              // print(context.tree.element!.outerHtml);
              // return Html(data: context.tree.element!.outerHtml);
            } else if (context.tree.children.isNotEmpty) {
              if (context.tree.children.first.name == 'pre') {
                return _CodeView(
                  context.tree.children.first.element!.text,
                  language: context.tree.element?.attributes['class']
                      ?.replaceAll('highlight highlight-source-', ''),
                );
              }
            }
            return child;
          },
          'g-emoji': (RenderContext renderContext, Widget child) {
            return child;
          },
          'img': (RenderContext renderContext, Widget child) {
            String src = renderContext.tree.element!.attributes['src']!;
            if ((!src.startsWith('https://') && !src.startsWith('http://'))) {
              src =
                  'https://raw.githubusercontent.com/${widget.context}/${widget.branch}/$src';
            } else if (src
                .startsWith('https://github.com/${widget.context}/blob/')) {
              src = src.replaceFirst(
                  'https://github.com/${widget.context}/blob/',
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
          //           .copyWith(color: AppColor.grey3),
          //       child: child,
          //     );
          //   }
          //   return child;
          // },
          'pre': (RenderContext renderContext, Widget child) {
            if (renderContext.tree.children.first.name == 'code') {
              return _CodeView(renderContext.tree.element!.text);
            }
            return child;
          },
          'table': (RenderContext renderContext, Widget child) {
            // print(renderContext.tree.children.first);
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: (renderContext.tree as TableLayoutElement)
                  .toWidget(renderContext),
            );
          },
          'td': (RenderContext renderContext, Widget child) {
            return Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColor.grey3, width: 0.3),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: child,
                    ),
                  ),
                ),
              ],
            );
          },
          'th': (RenderContext renderContext, Widget child) {
            return Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColor.grey3, width: 0.3),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: child,
                    ),
                  ),
                ),
              ],
            );
          },
        },
      ),
    );
  }
}

class _CodeView extends StatefulWidget {
  final String data;
  final String? language;
  const _CodeView(this.data, {this.language});
  @override
  __CodeViewState createState() => __CodeViewState();
}

class __CodeViewState extends State<_CodeView> {
  bool wrapText = false;
  bool copied = false;

  void copy() async {
    setState(() {
      copied = true;
    });
    copyToClipboard(widget.data);
    await Future.delayed(const Duration(seconds: 4));
    setState(() {
      copied = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget child = Padding(
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
                color: AppColor.background,
                borderRadius: AppThemeBorderRadius.smallBorderRadius),
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
                        InkWell(
                            borderRadius:
                                AppThemeBorderRadius.smallBorderRadius,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                copied
                                    ? Icons.check_rounded
                                    : Icons.copy_rounded,
                                size: 14,
                                color: copied ? Colors.white : AppColor.grey3,
                              ),
                            ),
                            onTap: copied
                                ? null
                                : () {
                                    copy();
                                  }),
                        InkWell(
                            borderRadius:
                                AppThemeBorderRadius.smallBorderRadius,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.wrap_text_rounded,
                                size: 14,
                                color: wrapText ? Colors.white : AppColor.grey3,
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                wrapText = !wrapText;
                              });
                            }),
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
