import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/html_parser.dart';
import 'package:flutter_html/style.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:onehub/common/bottom_sheet.dart';
import 'package:onehub/common/image_loader.dart';
import 'package:onehub/common/shimmer_widget.dart';
import 'package:onehub/style/borderRadiuses.dart';
import 'package:onehub/style/colors.dart';

class MarkdownBodyController {
  void Function(String string) update;
}

class MarkdownBody extends StatefulWidget {
  final String content;
  final String repo;
  final String branch;
  final MarkdownBodyController controller;
  MarkdownBody(this.content, {this.branch, this.repo, this.controller});

  @override
  _MarkdownBodyState createState() => _MarkdownBodyState(controller);
}

class _MarkdownBodyState extends State<MarkdownBody> {
  _MarkdownBodyState(MarkdownBodyController controller) {
    if (controller != null) controller.update = updateData;
  }
  String content;

  @override
  void initState() {
    content = md.markdownToHtml(widget.content);
    super.initState();
  }

  void updateData(String data) {
    setState(() {
      content = md.markdownToHtml(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Html(
      data: content,
      onLinkTap: (String url, RenderContext rContext,
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
          String src = attributes['src'];
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
            itemCount: data.children.length,
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
                            ? data.children[index].className?.substring(9)
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
              data.text.trim(),
              style: TextStyle(color: Colors.grey.shade400, fontSize: 12),
            ),
          );
        }
      },
    );
  }
}
