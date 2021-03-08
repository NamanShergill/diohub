import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/monokai-sublime.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/html_parser.dart';
import 'package:flutter_html/style.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onehub/common/bottom_sheet.dart';
import 'package:onehub/common/image_loader.dart';
import 'package:onehub/common/loading_indicator.dart';
import 'package:onehub/common/provider_loading_progress_wrapper.dart';
import 'package:onehub/common/shimmer_widget.dart';
import 'package:onehub/providers/repository/readme_provider.dart';
import 'package:onehub/style/borderRadiuses.dart';
import 'package:onehub/style/colors.dart';

class RepositoryReadme extends StatefulWidget {
  final String repoURL;
  RepositoryReadme(this.repoURL);

  @override
  _RepositoryReadmeState createState() => _RepositoryReadmeState();
}

class _RepositoryReadmeState extends State<RepositoryReadme>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      color: AppColor.onBackground,
      child: ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ProviderLoadingProgressWrapper<RepoReadmeProvider>(
              loadingBuilder: (context) {
                return Padding(
                  padding: const EdgeInsets.only(top: 48.0),
                  child: LoadingIndicator(),
                );
              },
              childBuilder: (context, value) {
                return Html(
                    data: value.readme.content,
                    onLinkTap: (String url, RenderContext rContext,
                        Map<String, String> attributes, data) {
                      return showURLBottomActionsMenu(context, url);
                    },
                    style: {
                      'a': Style(textDecoration: TextDecoration.none),
                    },
                    customRender: {
                      'img': (RenderContext context, Widget child,
                          Map<String, String> attributes, data) {
                        return Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: ImageLoader(
                            attributes['src'],
                            errorBuilder: (context) {
                              return SvgPicture.network(
                                attributes['src'],
                                placeholderBuilder: (context) {
                                  return ShimmerWidget(
                                    borderRadius:
                                        AppThemeBorderRadius.smallBorderRadius,
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
                              borderRadius:
                                  AppThemeBorderRadius.smallBorderRadius),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6.0, vertical: 0),
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
                                    borderRadius:
                                        AppThemeBorderRadius.smallBorderRadius),
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
                                        language: data.children[index].className
                                                .isNotEmpty
                                            ? data.children[index].className
                                                ?.substring(9)
                                            : 'txt',
                                        theme: monokaiSublimeTheme,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            });
                      }
                    });
              },
            ),
          ),
          SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
