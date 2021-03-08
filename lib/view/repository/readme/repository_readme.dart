import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/html_parser.dart';
import 'package:flutter_html/style.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onehub/common/api_wrapper_widget.dart';
import 'package:onehub/common/bottom_sheet.dart';
import 'package:onehub/common/image_loader.dart';
import 'package:onehub/common/loading_indicator.dart';
import 'package:onehub/common/shimmer_widget.dart';
import 'package:onehub/models/repositories/readme_model.dart';
import 'package:onehub/services/repositories/repo_services.dart';
import 'package:onehub/style/borderRadiuses.dart';
import 'package:onehub/style/colors.dart';
import 'package:onehub/style/syntax_highlight.dart';

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
            child: APIWrapper<RepositoryReadmeModel>(
              apiCall: RepositoryServices.fetchReadme(widget.repoURL),
              loadingBuilder: (context) {
                return Padding(
                  padding: const EdgeInsets.only(top: 48),
                  child: LoadingIndicator(),
                );
              },
              responseBuilder: (context, RepositoryReadmeModel data) {
                return Html(
                    data: data.content,
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
                                    color: Colors.white,
                                    borderRadius:
                                        AppThemeBorderRadius.smallBorderRadius),
                                child: Scrollbar(
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0, horizontal: 16),
                                      child: HighlightView(
                                        data.children[index].text,
                                        language: data.children[index].className
                                                .isNotEmpty
                                            ? data.children[index].className
                                                ?.substring(9)
                                            : 'txt',
                                        theme: syntaxHighlight,
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
