import 'package:dio_hub/app/Dio/cache.dart';
import 'package:dio_hub/app/Dio/dio.dart';
import 'package:dio_hub/common/api_wrapper_widget.dart';
import 'package:dio_hub/common/code_block_view.dart';
import 'package:dio_hub/common/image_loader.dart';
import 'package:dio_hub/common/shimmer_widget.dart';
import 'package:dio_hub/style/borderRadiuses.dart';
import 'package:dio_hub/style/colors.dart';
import 'package:dio_hub/utils/copy_to_clipboard.dart';
import 'package:dio_hub/utils/link_handler.dart';
import 'package:dio_hub/utils/markdown_to_html.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/html_parser.dart';
import 'package:flutter_html/style.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MarkdownBody extends StatefulWidget {
  final String? content;
  final String? repo;
  final String? branch;
  MarkdownBody(this.content, {this.branch, this.repo});

  @override
  _MarkdownBodyState createState() => _MarkdownBodyState();
}

class _MarkdownBodyState extends State<MarkdownBody> {
  late String content;

  @override
  void initState() {
    updateData(widget.content!);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant MarkdownBody oldWidget) {
    updateData(widget.content!);
    super.didUpdateWidget(oldWidget);
  }

  void updateData(String data) {
    // data = emoteText(data);
    data = mdToHtml(data, repo: widget.repo);
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
    return Html(
      data: content,
      onLinkTap: (String? url, RenderContext rContext,
          Map<String, String> attributes, data) {
        return linkHandler(context, url);
      },
      style: {
        'a': Style(textDecoration: TextDecoration.none),
        'blockquote': Style(
          padding: EdgeInsets.zero,
          margin: EdgeInsets.zero,
        ),
      },
      customRender: {
        'a': (RenderContext renderContext, Widget child) {
          if (!(renderContext.tree.element!.text.startsWith('#') ||
              renderContext.tree.element!.text.startsWith('@')))
            return GestureDetector(
                onTap: () => renderContext.parser.onLinkTap!(
                    renderContext.tree.attributes['href']!,
                    renderContext,
                    renderContext.tree.attributes,
                    renderContext.tree.element),
                onLongPress: () {
                  linkHandler(context, renderContext.tree.attributes['href']!,
                      showSheetOnDeepLink: true);
                },
                child: child);
          String link = renderContext.tree.attributes['href']!;
          if (renderContext.tree.element!.text.startsWith('#'))
            link = link.replaceAll(
                'https://github.com', 'https://api.github.com/repos');
          return APIWrapper(
            getCall: GetDio.getDio(
                    applyBaseURL: false,
                    acceptHeader: '',
                    cacheOptions: CacheManager.defaultCache())
                .get(link),
            fadeIntoView: false,
            loadingBuilder: (context) {
              return ShimmerWidget(
                child: IgnorePointer(child: child),
                baseColor: Colors.white,
              );
            },
            responseBuilder: (context, response) {
              return InkWell(
                  onTap: () => renderContext.parser.onLinkTap!(
                      renderContext.tree.attributes['href']!,
                      renderContext,
                      renderContext.tree.attributes,
                      renderContext.tree.element),
                  onLongPress: () {
                    linkHandler(context, renderContext.tree.attributes['href']!,
                        showSheetOnDeepLink: true);
                  },
                  child: child);
            },
            errorBuilder: (context, error) {
              return Text(
                renderContext.tree.element!.text,
                style: renderContext.tree.style
                    .generateTextStyle()
                    .copyWith(color: AppColor.grey3),
              );
            },
          );
        },
        'table': (RenderContext renderContext, Widget child) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: (renderContext.tree as TableLayoutElement)
                .toWidget(renderContext),
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
        'img': (RenderContext renderContext, Widget child) {
          String src = renderContext.tree.element!.attributes['src']!;
          if ((!src.startsWith('https://') && !src.startsWith('http://')))
            src =
                'https://raw.githubusercontent.com/${widget.repo}/${widget.branch}/$src';
          else if (src.startsWith('https://github.com/${widget.repo}/blob/'))
            src = src.replaceFirst('https://github.com/${widget.repo}/blob/',
                'https://raw.githubusercontent.com/${widget.repo}/');
          if (src.split('.').last.contains('svg'))
            return SvgPicture.network(src);
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
        'code': (RenderContext context, Widget child) {
          return Container(
            decoration: BoxDecoration(
                color: AppColor.grey,
                borderRadius: AppThemeBorderRadius.smallBorderRadius),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 0),
              child: child,
            ),
          );
        },
        'pre': (RenderContext renderContext, Widget child) {
          return ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: renderContext.tree.children.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                    color: AppColor.background,
                    borderRadius: AppThemeBorderRadius.smallBorderRadius),
                child: _CodeView(renderContext, index),
              );
            },
          );
        },
        'blockquote': (RenderContext context, Widget child) {
          return Container(
            padding: EdgeInsets.only(left: 12),
            decoration: BoxDecoration(
                border: Border(
                    left: BorderSide(color: Colors.grey.shade400, width: 2))),
            child: child,
          );
        }
      },
    );
  }
}

class _CodeView extends StatefulWidget {
  final RenderContext renderContext;
  final int index;
  _CodeView(this.renderContext, this.index);
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
    copyToClipboard(
        widget.renderContext.tree.children[widget.index].element!.text);
    await Future.delayed(Duration(seconds: 4));
    setState(() {
      copied = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget child = Padding(
      padding: const EdgeInsets.only(top: 32.0, right: 16, left: 16, bottom: 8),
      child: CodeBlockView(
        widget.renderContext.tree.children[widget.index].element!.text,
        language: widget.renderContext.tree.children[widget.index].element
            ?.attributes['class']
            ?.substring(9),
      ),
    );
    return Stack(
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
                    borderRadius: AppThemeBorderRadius.smallBorderRadius,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        copied ? Icons.check_rounded : Icons.copy_rounded,
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
                    borderRadius: AppThemeBorderRadius.smallBorderRadius,
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
    );
  }
}
