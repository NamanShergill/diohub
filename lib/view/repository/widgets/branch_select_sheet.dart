import 'package:dio_hub/common/wrappers/infinite_scroll_wrapper.dart';
import 'package:dio_hub/models/repositories/branch_list_model.dart';
import 'package:dio_hub/services/repositories/repo_services.dart';
import 'package:dio_hub/style/border_radiuses.dart';
import 'package:dio_hub/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class BranchSelectSheet extends StatelessWidget {
  const BranchSelectSheet(
    this.repoURL, {
    this.defaultBranch,
    this.currentBranch,
    this.onSelected,
    this.controller,
    super.key,
  });
  final String repoURL;
  final String? defaultBranch;
  final String? currentBranch;
  final ValueChanged<String>? onSelected;
  final ScrollController? controller;
  @override
  Widget build(final BuildContext context) =>
      InfiniteScrollWrapper<RepoBranchListItemModel>(
        listEndIndicator: false,
        separatorBuilder: (final BuildContext context, final int index) =>
            const SizedBox(
          height: 16,
        ),
        future: (
          final ({
            RepoBranchListItemModel? lastItem,
            int pageNumber,
            int pageSize,
            bool refresh
          }) data,
        ) async =>
            RepositoryServices.fetchBranchList(
          repoURL,
          data.pageNumber,
          data.pageSize,
          refresh: data.refresh,
        ),
        scrollController: controller,
        builder: (
          final BuildContext context,
          final ({int index, RepoBranchListItemModel item, bool refresh}) data,
        ) =>
            Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Card(
            // borderRadius: medBorderRadius,
            color: data.item.name == currentBranch
                ? context.colorScheme.primary
                : null,
            child: InkWell(
              borderRadius: medBorderRadius,
              onTap: () {
                onSelected!(data.item.name!);
                Navigator.pop(context);
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                      child: Row(
                        children: <Widget>[
                          const Icon(Octicons.git_branch),
                          const SizedBox(
                            width: 8,
                          ),
                          Flexible(
                            child: Text(
                              data.item.name!,
                              style: TextStyle(
                                fontWeight: data.item.name == currentBranch
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: defaultBranch == data.item.name,
                      replacement: Container(),
                      child: Text(
                        'Default',
                        style: context.textTheme.bodySmall,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
