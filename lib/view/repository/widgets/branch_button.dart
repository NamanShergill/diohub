import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:onehub/common/animations/fade_animation_widget.dart';
import 'package:onehub/common/bottom_sheet.dart';
import 'package:onehub/common/loading_indicator.dart';
import 'package:onehub/common/provider_loading_progress_wrapper.dart';
import 'package:onehub/models/repositories/repository_model.dart';
import 'package:onehub/providers/repository/branch_provider.dart';
import 'package:onehub/style/borderRadiuses.dart';
import 'package:onehub/style/colors.dart';
import 'package:onehub/view/repository/widgets/branch_select_sheet.dart';
import 'package:provider/provider.dart';

class BranchButton extends StatelessWidget {
  final RepositoryModel _repo;
  BranchButton({RepositoryModel repo}) : _repo = repo;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Material(
        color: AppColor.onBackground,
        elevation: 2,
        borderRadius: AppThemeBorderRadius.medBorderRadius,
        child: Container(
            decoration: BoxDecoration(
                borderRadius: AppThemeBorderRadius.medBorderRadius),
            child: ProviderLoadingProgressWrapper<RepoBranchProvider>(
              loadingBuilder: (context) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: LoadingIndicator(),
                    ),
                  ],
                );
              },
              childBuilder: (context, value) {
                return FadeAnimationSection(
                  child: InkWell(
                    onTap: () {
                      String currentBranch =
                          context.read<RepoBranchProvider>().branch.name;
                      void changeBranch(String branch) {
                        Provider.of<RepoBranchProvider>(context, listen: false)
                            .changeBranch(branch);
                      }

                      showScrollableBottomActionsMenu(context,
                          titleText: 'Select Branch',
                          child: (context, scrollController) {
                        return BranchSelectSheet(
                          _repo.url,
                          controller: scrollController,
                          currentBranch: currentBranch,
                          defaultBranch: _repo.defaultBranch,
                          onSelected: (String branch) {
                            changeBranch(branch);
                          },
                        );
                      });
                    },
                    borderRadius: AppThemeBorderRadius.medBorderRadius,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: AppThemeBorderRadius.medBorderRadius),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Row(
                                children: [
                                  Icon(Octicons.git_branch),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Flexible(child: Text(value.branch.name)),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Icon(Icons.arrow_drop_down),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            )),
      ),
    );
  }
}
