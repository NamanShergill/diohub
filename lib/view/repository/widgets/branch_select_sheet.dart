import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:onehub/common/infinite_scroll_wrapper.dart';
import 'package:onehub/models/repositories/branch_list_model.dart';
import 'package:onehub/services/repositories/repo_services.dart';
import 'package:onehub/style/borderRadiuses.dart';
import 'package:onehub/style/colors.dart';

class BranchSelectSheet extends StatelessWidget {
  final String repoURL;
  final String defaultBranch;
  final String currentBranch;
  final ValueChanged<String> onSelected;
  final ScrollController controller;
  BranchSelectSheet(this.repoURL,
      {this.defaultBranch,
      this.currentBranch,
      this.onSelected,
      this.controller});
  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context).size;
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      controller: controller,
      children: [
        Container(
          height: _media.height * 0.85,
          child: InfiniteScrollWrapper<RepoBranchListItemModel>(
            listEndIndicator: false,
            divider: false,
            firstDivider: false,
            future: (int pageNumber, int perPage) {
              return RepositoryServices.fetchBranchList(
                  repoURL, pageNumber, perPage);
            },
            refreshFuture: (int pageNumber, int perPage) {
              return RepositoryServices.fetchBranchList(
                  repoURL, pageNumber, perPage, true);
            },
            builder: (context, item, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Material(
                  borderRadius: AppThemeBorderRadius.medBorderRadius,
                  color: item.name == currentBranch
                      ? AppColor.accent
                      : AppColor.onBackground,
                  child: InkWell(
                    borderRadius: AppThemeBorderRadius.medBorderRadius,
                    onTap: () {
                      onSelected(item.name);
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
                                Icon(Octicons.git_branch, color: Colors.white),
                                SizedBox(
                                  width: 8,
                                ),
                                Flexible(
                                  child: Text(
                                    item.name,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Visibility(
                            visible: defaultBranch == item.name,
                            child: Text(
                              'Default',
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
