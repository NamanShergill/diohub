import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:onehub/common/animations/size_expanded_widget.dart';
import 'package:onehub/common/api_wrapper_widget.dart';
import 'package:onehub/common/button.dart';
import 'package:onehub/common/loading_indicator.dart';
import 'package:onehub/common/provider_loading_progress_wrapper.dart';
import 'package:onehub/models/repositories/commit_model.dart';
import 'package:onehub/providers/base_provider.dart';
import 'package:onehub/providers/repository/branch_provider.dart';
import 'package:onehub/providers/repository/code_provider.dart';
import 'package:onehub/providers/repository/repository_provider.dart';
import 'package:onehub/services/git_database/git_database_service.dart';
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
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Button(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      enabled: value.status == Status.loaded,
                      color: AppColor.background,
                      listenToLoadingController: false,
                      onTap: () {},
                      child: value.status == Status.loaded
                          ? APIWrapper<List<CommitModel>>(
                              apiCall: GitDatabaseService.getCommitsList(
                                  repoURL: Provider.of<RepositoryProvider>(
                                          context,
                                          listen: false)
                                      .repositoryModel
                                      .url,
                                  branch: Provider.of<RepoBranchProvider>(
                                          context,
                                          listen: false)
                                      .branch
                                      .name,
                                  path: value.getPath(),
                                  pageNumber: 1,
                                  pageSize: 1),
                              responseBuilder: (context, value) {
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Octicons.git_commit),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Text(
                                          '${value[0].sha.substring(0, 6)}',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Icon(Icons.arrow_drop_down),
                                  ],
                                );
                              },
                            )
                          : LoadingIndicator(),
                    ),
                  ),
                ],
              );
            },
          ),
          SizedBox(
            height: 16,
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
                      child: Row(
                        children: [
                          ListView.separated(
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
                                    borderRadius:
                                        AppThemeBorderRadius.smallBorderRadius,
                                    onTap: () {
                                      if (index != value.tree.length - 1)
                                        Provider.of<CodeProvider>(context,
                                                listen: false)
                                            .popTreeUntil(value.tree[index]);
                                    },
                                    child: Center(
                                      child: Text(
                                        ' ' + value.tree[index].path,
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
                          Text(' /'),
                        ],
                      ),
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
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return BrowserListTile(
                                    value.codeTree.tree[index],
                                    Provider.of<RepositoryProvider>(context,
                                            listen: false)
                                        .repositoryModel
                                        .url);
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
