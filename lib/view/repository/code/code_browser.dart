import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:onehub/common/animations/size_expanded_widget.dart';
import 'package:onehub/common/bottom_sheet.dart';
import 'package:onehub/common/button.dart';
import 'package:onehub/common/loading_indicator.dart';
import 'package:onehub/common/provider_loading_progress_wrapper.dart';
import 'package:onehub/providers/base_provider.dart';
import 'package:onehub/providers/repository/branch_provider.dart';
import 'package:onehub/providers/repository/code_provider.dart';
import 'package:onehub/providers/repository/repository_provider.dart';
import 'package:onehub/style/borderRadiuses.dart';
import 'package:onehub/style/colors.dart';
import 'package:onehub/view/repository/code/browser_list_tiles.dart';
import 'package:onehub/view/repository/code/commit_browser.dart';
import 'package:onehub/view/repository/code/commit_info_button.dart';
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
              return Column(
                children: [
                  value.commitLock && value.tree.length != 0
                      ? SizeExpandedSection(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              children: [
                                Button(
                                  listenToLoadingController: false,
                                  padding: EdgeInsets.all(8),
                                  child: Column(
                                    children: [
                                      Text(
                                        'Currently browsing commit ${value.tree.last.commit.sha.substring(0, 6)}.',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'Load the latest code?',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12),
                                      ),
                                    ],
                                  ),
                                  onTap: value.status == Status.loaded
                                      ? () {
                                          value.unlockCodeFromCommit();
                                        }
                                      : null,
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                              ],
                            ),
                          ),
                        )
                      : Container(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Button(
                      padding:
                          EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                      color: AppColor.background,
                      listenToLoadingController: false,
                      onTap: value.status == Status.loaded
                          ? () {
                              String repoUrl = context
                                  .read<RepositoryProvider>()
                                  .repositoryModel
                                  .url;

                              String branchName = context
                                  .read<RepoBranchProvider>()
                                  .branch
                                  .name;

                              String path =
                                  context.read<CodeProvider>().getPath();

                              bool isLocked =
                                  context.read<CodeProvider>().commitLock;
                              showScrollableBottomActionsMenu(context,
                                  titleWidget: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Text(
                                          'Commit History',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Octicons.git_branch,
                                              size: 14,
                                            ),
                                            SizedBox(
                                              width: 4,
                                            ),
                                            Text(branchName),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ), child: (sheetContext, controller) {
                                return CommitBrowser(
                                  controller: controller,
                                  currentSHA: value.tree.last.commit.sha,
                                  isLocked: isLocked,
                                  repoURL: repoUrl,
                                  path: path,
                                  branchName: branchName,
                                  onSelected: (String sha) {
                                    return Provider.of<CodeProvider>(context,
                                            listen: false)
                                        .changeBaseSHA(sha);
                                  },
                                );
                              });
                            }
                          : null,
                      child: value.status == Status.loaded ||
                              (value.commitLock && value.tree.length > 0)
                          ? CommitInfoButton()
                          : LoadingIndicator(),
                    ),
                  ),
                ],
              );
            },
          ),
          ProviderLoadingProgressWrapper<CodeProvider>(
            childBuilder: (context, value) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Visibility(
                    visible: value.tree.length > 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 16,
                        ),
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
                                  return Center(child: Text(' /'));
                                },
                                itemBuilder: (context, index) {
                                  return Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      borderRadius: AppThemeBorderRadius
                                          .smallBorderRadius,
                                      onTap: () {
                                        if (index != value.tree.length - 1)
                                          Provider.of<CodeProvider>(context,
                                                  listen: false)
                                              .popTreeUntil(value.tree[index]);
                                      },
                                      child: Center(
                                        child: Text(
                                          ' ' +
                                              (index == 0
                                                  ? Provider.of<
                                                              RepositoryProvider>(
                                                          context)
                                                      .repositoryModel
                                                      .name
                                                  : value
                                                      .tree[index - 1]
                                                      .tree[value
                                                          .pathIndex[index - 1]]
                                                      .path),
                                          style: TextStyle(
                                              color:
                                                  index == value.tree.length - 1
                                                      ? AppColor.accent
                                                      : Colors.white,
                                              fontWeight:
                                                  index == value.tree.length - 1
                                                      ? FontWeight.bold
                                                      : FontWeight.w500),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizeExpandedSection(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ClipRRect(
                        borderRadius: AppThemeBorderRadius.medBorderRadius,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  AppThemeBorderRadius.medBorderRadius,
                              border:
                                  Border.all(color: AppColor.grey, width: 0.5)),
                          child: ListView.separated(
                              physics: BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return BrowserListTile(
                                    value.tree.last.tree[index],
                                    Provider.of<RepositoryProvider>(context,
                                            listen: false)
                                        .repositoryModel
                                        .url,
                                    index);
                              },
                              separatorBuilder: (context, index) {
                                return Divider(
                                  height: 0,
                                );
                              },
                              itemCount: value.tree.last.tree.length),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
            loadingBuilder: (context) {
              return Container();
            },
          )
        ],
      ),
    );
  }
}
