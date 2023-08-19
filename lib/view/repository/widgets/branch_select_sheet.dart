import 'package:dio_hub/app/settings/palette.dart';
import 'package:dio_hub/common/wrappers/infinite_scroll_wrapper.dart';
import 'package:dio_hub/models/repositories/branch_list_model.dart';
import 'package:dio_hub/services/repositories/repo_services.dart';
import 'package:dio_hub/style/border_radiuses.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';

class BranchSelectSheet extends StatelessWidget {
  const BranchSelectSheet(this.repoURL,
      {this.defaultBranch,
      this.currentBranch,
      this.onSelected,
      this.controller,
      Key? key})
      : super(key: key);
  final String repoURL;
  final String? defaultBranch;
  final String? currentBranch;
  final ValueChanged<String>? onSelected;
  final ScrollController? controller;
  @override
  Widget build(BuildContext context) {
    return InfiniteScrollWrapper<RepoBranchListItemModel>(
      listEndIndicator: false,
      topSpacing: 8,
      separatorBuilder: (context, index) => const SizedBox(
        height: 16,
      ),
      future: (data) {
        return RepositoryServices.fetchBranchList(
            repoURL, data.pageNumber, data.pageSize,
            refresh: data.refresh);
      },
      scrollController: controller,
      builder: (data) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Material(
            borderRadius: medBorderRadius,
            color: data.item.name == currentBranch
                ? Provider.of<PaletteSettings>(context).currentSetting.accent
                : Provider.of<PaletteSettings>(context)
                    .currentSetting
                    .secondary,
            child: InkWell(
              borderRadius: medBorderRadius,
              onTap: () {
                onSelected!(data.item.name!);
                Navigator.pop(context);
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Row(
                        children: [
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
                                      : FontWeight.normal),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: defaultBranch == data.item.name,
                      replacement: Container(),
                      child: const Text(
                        'Default',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
