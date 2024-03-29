import 'package:diohub/common/bottom_sheet/bottom_sheets.dart';
import 'package:diohub/common/misc/info_card.dart';
import 'package:diohub/common/misc/ink_pot.dart';
import 'package:diohub/common/wrappers/infinite_scroll_wrapper.dart';
import 'package:diohub/common/wrappers/provider_loading_progress_wrapper.dart';
import 'package:diohub/models/repositories/branch_list_model.dart';
import 'package:diohub/models/repositories/repository_model.dart';
import 'package:diohub/providers/repository/branch_provider.dart';
import 'package:diohub/services/repositories/repo_services.dart';
import 'package:diohub/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';

class BranchButton extends StatelessWidget {
  const BranchButton({final RepositoryModel? repo, super.key}) : _repo = repo;
  final RepositoryModel? _repo;

  double get height => 55;

  @override
  Widget build(final BuildContext context) =>
      ProviderLoadingProgressWrapper<RepoBranchProvider>(
        loadingBuilder: (final BuildContext context) => Container(),
        childBuilder: (
          final BuildContext context,
          final RepoBranchProvider value,
        ) =>
            InfoCard(
          leading: InfoCard.leadingIcon(
            icon: Octicons.git_branch,
          ),
          trailing: InfoCard.dropdownTrailingIcon,
          onTap: () async {
            try {
              final String currentBranch =
                  context.read<RepoBranchProvider>().currentSHA;
              Future<void> changeBranch(final String branch) async {
                await Provider.of<RepoBranchProvider>(
                  context,
                  listen: false,
                ).setBranch(branch);
              }

              await BottomSheetPagination<RepoBranchListItemModel>(
                paginatedListItemBuilder: (
                  final BuildContext context,
                  final ScrollWrapperBuilderData<RepoBranchListItemModel> data,
                ) =>
                    Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Card(
                    // borderRadius: medBorderRadius,
                    color: data.item.name == currentBranch
                        ? context.colorScheme.primary
                        : context.colorScheme.surface,
                    child: InkPot(
                      onTap: () async {
                        await changeBranch(data.item.name!);
                        if (context.mounted) {
                          Navigator.pop(context);
                        }
                      },
                      child: _buildListBranchItem(data, currentBranch, context),
                    ),
                  ),
                ),
                paginationFuture: (
                  data,
                ) async =>
                    RepositoryServices.fetchBranchList(
                  _repo!.url!,
                  data.pageNumber,
                  data.pageSize,
                  refresh: data.refresh,
                ),
                title: 'Branches in ${_repo?.owner?.login!}/${_repo?.name}',
              ).openSheet(context);
            } on Exception catch (e) {
              rethrow;
            }
          },
          child: Row(
            children: <Widget>[
              Text(
                value.currentSHA,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      );

  Padding _buildListBranchItem(
    final ScrollWrapperBuilderData<RepoBranchListItemModel> data,
    final String currentBranch,
    final BuildContext context,
  ) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
              visible: _repo!.defaultBranch == data.item.name,
              replacement: Container(),
              child: Text(
                'Default',
                style: context.textTheme.bodySmall,
              ),
            ),
          ],
        ),
      );
}

// class BranchMultiItemAdapter extends PaginatedInfoCardAdapter<BranchModel> {
//   BranchMultiItemAdapter({
//     required super.availableList,
//   }) : super(
//           singleItemBehavior: null,
//         );
//
//   @override
//   bool get isExpanded => false;
//
//   @override
//   // TODO: implement paginatedSheet
//   BottomSheetPagination<NodeWithPaginationInfo<BranchModel>>
//       get paginatedSheet => throw UnimplementedError();
//
//   @override
//   // TODO: implement title
//   String get title => throw UnimplementedError();
//
//   @override
//   // TODO: implement viewBuilder
//   WidgetBuilder get viewBuilder => throw UnimplementedError();
// }
