import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:onehub/common/animations/size_expanded_widget.dart';
import 'package:onehub/common/button.dart';
import 'package:onehub/common/provider_loading_progress_wrapper.dart';
import 'package:onehub/providers/base_provider.dart';
import 'package:onehub/providers/repository/code_provider.dart';
import 'package:onehub/style/borderRadiuses.dart';
import 'package:onehub/style/colors.dart';
import 'package:onehub/view/repository/code/browser_list_tiles.dart';
import 'package:provider/provider.dart';

class CodeBrowser extends StatefulWidget {
  @override
  _CodeBrowserState createState() => _CodeBrowserState();
}

class _CodeBrowserState extends State<CodeBrowser>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      color: AppColor.onBackground,
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          SizedBox(
            height: 16,
          ),
          Consumer<CodeProvider>(
            builder: (context, value, _) {
              return Visibility(
                  visible: (value?.tree?.length ?? 0) > 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 16),
                    child: SizeExpandedSection(
                      child: Button(
                        enabled: value.status == Status.loaded,
                        // color: AppColor.background,
                        listenToLoadingController: false,
                        onTap: () {
                          Provider.of<CodeProvider>(context, listen: false)
                              .popTree();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(LineIcons.arrowLeft),
                            SizedBox(
                              width: 8,
                            ),
                            Text('Back'),
                          ],
                        ),
                      ),
                    ),
                  ));
            },
          ),
          SizedBox(
            height: 8,
          ),
          ProviderLoadingProgressWrapper<CodeProvider>(
            childBuilder: (context, value) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Container(
                      height: 30,
                      child: ListView.separated(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: value.tree.length,
                          separatorBuilder: (context, index) {
                            return Text(' /');
                          },
                          itemBuilder: (context, index) {
                            return Text(
                              ' ' + value.tree[index].path,
                              style: TextStyle(
                                  color: index == value.tree.length - 1
                                      ? AppColor.accent
                                      : Colors.white,
                                  fontWeight: index == value.tree.length - 1
                                      ? FontWeight.bold
                                      : FontWeight.w500),
                            );
                          }),
                    ),
                  ),
                  SizeExpandedSection(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: AppThemeBorderRadius.medBorderRadius,
                            border:
                                Border.all(color: AppColor.grey, width: 0.5)),
                        child: ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return BrowserListTile(
                                  value.codeTree.tree[index]);
                            },
                            separatorBuilder: (context, index) {
                              return Divider(
                                height: 0,
                              );
                            },
                            itemCount: value.codeTree.tree.length),
                      ),
                    ),
                  ),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
