import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:onehub/common/infinite_scroll_wrapper.dart';
import 'package:onehub/models/repositories/commit_model.dart';
import 'package:onehub/services/git_database/git_database_service.dart';
import 'package:onehub/style/borderRadiuses.dart';
import 'package:onehub/style/colors.dart';

class CommitBrowser extends StatelessWidget {
  final ScrollController controller;
  final String currentSHA;
  final bool isLocked;
  final ValueChanged<String> onSelected;
  final String repoURL;
  final String path;
  final String branchName;
  CommitBrowser(
      {this.controller,
      this.currentSHA,
      this.isLocked,
      this.onSelected,
      this.path,
      this.repoURL,
      this.branchName});
  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context).size;

    return ListView(
      physics: NeverScrollableScrollPhysics(),
      controller: controller,
      shrinkWrap: true,
      children: [
        Container(
          height: _media.height * 0.85,
          child: InfiniteScrollWrapper<CommitModel>(
            future: (pageNumber, pageSize) {
              return GitDatabaseService.getCommitsList(
                repoURL: repoURL,
                pageNumber: pageNumber,
                pageSize: pageSize,
                path: path,
                sha: isLocked ? currentSHA : branchName,
              );
            },
            refreshFuture: (pageNumber, pageSize) {
              return GitDatabaseService.getCommitsList(
                  repoURL: repoURL,
                  pageNumber: pageNumber,
                  pageSize: pageSize,
                  path: path,
                  sha: branchName,
                  refresh: true);
            },
            builder: (context, item, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Material(
                  borderRadius: AppThemeBorderRadius.medBorderRadius,
                  color: isLocked && currentSHA == item.sha
                      ? AppColor.accent
                      : AppColor.onBackground,
                  child: InkWell(
                    borderRadius: AppThemeBorderRadius.medBorderRadius,
                    onTap: () {
                      onSelected(item.sha);
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Row(
                              children: [
                                Icon(Octicons.git_commit, color: Colors.white),
                                SizedBox(
                                  width: 8,
                                ),
                                Flexible(
                                  child: Text(
                                    item.sha,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Visibility(
                            visible: isLocked && currentSHA == item.sha,
                            child: Text(
                              'Currently Viewing',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Colors.white),
                            ),
                            replacement: Container(),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
