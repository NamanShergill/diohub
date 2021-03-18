import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/html_parser.dart';
import 'package:flutter_html/style.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:onehub/common/bottom_sheet.dart';
import 'package:onehub/common/image_loader.dart';
import 'package:onehub/common/shimmer_widget.dart';
import 'package:onehub/style/borderRadiuses.dart';
import 'package:onehub/style/colors.dart';
import 'package:onehub/utils/regex.dart';

class MarkdownBodyController {
  late void Function(String string) update;
}

class MarkdownBody extends StatefulWidget {
  final String? content;
  final String? repo;
  final String? branch;
  final MarkdownBodyController? controller;
  MarkdownBody(this.content, {this.branch, this.repo, this.controller});

  @override
  _MarkdownBodyState createState() => _MarkdownBodyState(controller);
}

class _MarkdownBodyState extends State<MarkdownBody> {
  _MarkdownBodyState(MarkdownBodyController? controller) {
    if (controller != null) controller.update = updateData;
  }
  late String content;

  @override
  void initState() {
    updateData(md.markdownToHtml(widget.content!));
    super.initState();
  }

  void updateData(String data) {
    var document = parse(data);
    // The list of tags to perform modifications on.
    List<String> tags = ['p', 'li'];
    tags.forEach((element) {
      var elements = document.getElementsByTagName(element);
      performModifications(elements);
    });
    content = document.outerHtml;
  }

  void performModifications(elements) {
    for (dom.Element node in elements) {
      // Make a snapshot of the nodes list as the current one would change
      // in the loops.
      List<dom.Node> unModifiedNodes = List.from(node.nodes);
      for (int i = 0; i < unModifiedNodes.length; i++) {
        // Select the child node.
        dom.Node childNode = unModifiedNodes[i];
        // Check if the node type is Text.
        if (childNode is dom.Text) {
          // Split strings if they start with @ or digits if they start with #.
          RegExp exp =
              RegExp(r'(@[a-zA-Z0-9_/]+?(?![a-zA-Z0-9_/]))|((?=/#(\d+)/))');
          List<String?> strings = childNode.text.splitWithDelim(exp);
          // Insert new elements just before the current element node.
          strings.forEach(
            (e) {
              // Change @<string> to a URL to a Github profile.
              if (e!.startsWith('@')) {
                // If string has a '/' in it, it is likely a mention to a
                // Github team.
                if (e.contains('/'))
                  node.insertBefore(
                      parseFragment(
                          '<a href="https://github.com/orgs/${e.split('/').first.substring(0)}/teams/${e.split('/').last}" style="color: #ffffff; font-weight:bold">$e</a>'),
                      childNode);
                else
                  node.insertBefore(
                      parseFragment(
                          '<a href="https://github.com/${e.substring(1)}" style="color: #ffffff; font-weight:bold">$e</a>'),
                      childNode);
              }
              // Todo: Add issue redirection case.
              // Change #<digits> to a URL to a repo issue. Will need issueURL.
              else if (e.startsWith('#')) {
                node.insertBefore(
                    parseFragment(
                        '<a href="https://github.com/${e.substring(1)}" style="font-weight:bold">$e</a>'),
                    childNode);
              }
              // Just add the normal string if the cases above don't match.
              else {
                node.insertBefore(parseFragment(e), childNode);
              }
            },
          );
          // Remove the current element node, as the children inside have been
          // accordingly parsed and changed.
          childNode.remove();
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Html(
      data: content,
      onLinkTap: (String? url, RenderContext rContext,
          Map<String, String> attributes, data) {
        return showURLBottomActionsMenu(context, url);
      },
      style: {
        'a': Style(textDecoration: TextDecoration.none),
        'blockquote': Style(padding: EdgeInsets.zero, margin: EdgeInsets.zero),
      },
      customRender: {
        // Todo: Add regex for mentioned users later.
        // 'p': (RenderContext context, Widget child,
        //     Map<String, String> attributes, data) {
        //   print(data.nodes);
        //
        //   List widgets = [];
        //   for (var node in data.nodes) {
        //     // print(node.runtimeType);
        //     // print(node.nodeType.toString() + node.);
        //     if (node is dom.Text) {
        //       print('sldn sd' + node.text);
        //       widgets.add(TextSpan(text: 'kjdn sd'));
        //     } else {
        //       node.
        //       widgets.add(node.sourceSpan);
        //     }
        //   }
        //   return Text.rich(TextSpan(
        //       children:
        //           List.generate(widgets.length, (index) => widgets[index])));
        // if (data.text.contains(RegExp(r'(?=@)'))) {
        //                                  RegExp exp = RegExp(r'(?=@)');
        //                                  print(data.text.splitWithDelim(exp));
        //                                  return Wrap(
        //                                    children: [
        //                                      child,
        //                                    ],
        //                                  );
        //                                };
        // return child;
        // },
        'img': (RenderContext renderContext, Widget child,
            Map<String, String> attributes, data) {
          String src = attributes['src']!;
          if (!src.startsWith('https://') && !src.startsWith('http://'))
            src =
                'https://raw.githubusercontent.com/${widget.repo}/${widget.branch}/$src';
          if (src.split('.').last.contains('svg'))
            return SvgPicture.network(
              src,
              placeholderBuilder: (renderContext) {
                return ShimmerWidget(
                  borderRadius: AppThemeBorderRadius.smallBorderRadius,
                  child: Container(
                    height: 20,
                    width: 80,
                    color: Colors.grey,
                  ),
                );
              },
            );
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: ImageLoader(
              src,
              // Some SVGs don't have svg in their URL so will miss the
              // if check above. They will fail in the image loader
              // so will build here.
              errorBuilder: (renderContext) {
                return SvgPicture.network(
                  src,
                  placeholderBuilder: (renderContext) {
                    return ShimmerWidget(
                      borderRadius: AppThemeBorderRadius.smallBorderRadius,
                      child: Container(
                        height: 20,
                        width: 80,
                        color: Colors.grey,
                      ),
                    );
                  },
                );
              },
            ),
          );
        },
        'code': (RenderContext context, Widget child,
            Map<String, String> attributes, data) {
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
        'pre': (RenderContext context, Widget child,
            Map<String, String> attributes, data) {
          return ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: data!.children.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                    color: AppColor.background,
                    borderRadius: AppThemeBorderRadius.smallBorderRadius),
                child: Scrollbar(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 8.0,
                        right: 8,
                        left: 8,
                      ),
                      child: HighlightView(
                        data.children[index].text,
                        backgroundColor: Colors.transparent,
                        language: data.children[index].className.isNotEmpty
                            ? data.children[index].className.substring(9)
                            : 'txt',
                        theme: monokaiSublimeTheme,
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
        'blockquote': (RenderContext context, Widget child,
            Map<String, String> attributes, data) {
          return Container(
            padding: EdgeInsets.only(left: 12),
            decoration: BoxDecoration(
                border: Border(
                    left: BorderSide(color: Colors.grey.shade400, width: 2))),
            child: Text(
              data!.text.trim(),
              style: TextStyle(color: Colors.grey.shade400, fontSize: 12),
            ),
          );
        }
      },
    );
  }
}
