import 'package:dio_hub/common/animations/fade_animation_widget.dart';
import 'package:dio_hub/common/bottom_sheet.dart';
import 'package:dio_hub/common/shimmer_widget.dart';
import 'package:dio_hub/common/wrappers/provider_loading_progress_wrapper.dart';
import 'package:dio_hub/models/repositories/repository_model.dart';
import 'package:dio_hub/providers/repository/branch_provider.dart';
import 'package:dio_hub/style/border_radiuses.dart';
import 'package:dio_hub/style/colors.dart';
import 'package:dio_hub/view/repository/widgets/branch_select_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';

class BranchButton extends StatelessWidget {
  final RepositoryModel? _repo;
  final double height = 55;
  const BranchButton({RepositoryModel? repo, Key? key})
      : _repo = repo,
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: AppColor.onBackground,
        elevation: 2,
        borderRadius: AppThemeBorderRadius.medBorderRadius,
        child: Container(
            decoration: BoxDecoration(
                borderRadius: AppThemeBorderRadius.medBorderRadius),
            child: ProviderLoadingProgressWrapper<RepoBranchProvider>(
              loadingBuilder: (context) {
                return ShimmerWidget(
                  borderRadius: AppThemeBorderRadius.medBorderRadius,
                  baseColor: AppColor.onBackground,
                  highlightColor: Colors.grey.shade800,
                  child: Container(
                    color: AppColor.onBackground,
                    width: double.infinity,
                    height: height,
                  ),
                );
              },
              childBuilder: (context, value) {
                return FadeAnimationSection(
                  child: InkWell(
                    onTap: () {
                      String? currentBranch =
                          context.read<RepoBranchProvider>().currentSHA!;
                      void changeBranch(String branch) {
                        Provider.of<RepoBranchProvider>(context, listen: false)
                            .setBranch(branch);
                      }

                      showScrollableBottomActionsMenu(context,
                          titleText: 'Select Branch',
                          child: (context, scrollController) {
                        return BranchSelectSheet(
                          _repo!.url!,
                          controller: scrollController,
                          currentBranch: currentBranch,
                          defaultBranch: _repo!.defaultBranch,
                          onSelected: (String branch) {
                            changeBranch(branch);
                          },
                        );
                      });
                    },
                    borderRadius: AppThemeBorderRadius.medBorderRadius,
                    child: Container(
                      height: height,
                      decoration: BoxDecoration(
                          borderRadius: AppThemeBorderRadius.medBorderRadius),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                                    value.currentSHA!,
                                    overflow: TextOverflow.ellipsis,
                                  )),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            const Icon(Icons.arrow_drop_down),
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
