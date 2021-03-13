import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/html_parser.dart';
import 'package:flutter_html/style.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onehub/common/bottom_sheet.dart';
import 'package:onehub/common/image_loader.dart';
import 'package:onehub/common/shimmer_widget.dart';
import 'package:onehub/style/borderRadiuses.dart';
import 'package:onehub/style/colors.dart';

class MarkdownBody extends StatelessWidget {
  final String content;
  final String repo;
  final String branch;
  MarkdownBody(this.content, {this.branch, this.repo});
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
        'img': (RenderContext renderContext, Widget child,
            Map<String, String> attributes, data) {
          String src = attributes['src'];
          if (!src.startsWith('https://') && !src.startsWith('http://'))
            src = 'https://raw.githubusercontent.com/$repo/$branch/$src';
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
                border:
                    Border(left: BorderSide(color: AppColor.grey3, width: 2))),
            child: Text(
              data.text.trim(),
              style: TextStyle(color: AppColor.grey3, fontSize: 12),
            ),
          );
        }
      },
    );
  }
}
