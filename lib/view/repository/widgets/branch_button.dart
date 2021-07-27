import 'package:dio_hub/app/settings/palette.dart';
import 'package:dio_hub/common/animations/fade_animation_widget.dart';
import 'package:dio_hub/common/misc/bottom_sheet.dart';
import 'package:dio_hub/common/misc/shimmer_widget.dart';
import 'package:dio_hub/common/wrappers/provider_loading_progress_wrapper.dart';
import 'package:dio_hub/models/repositories/repository_model.dart';
import 'package:dio_hub/providers/repository/branch_provider.dart';
import 'package:dio_hub/style/border_radiuses.dart';
import 'package:dio_hub/view/repository/widgets/branch_select_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';

class BranchButton extends StatelessWidget {
  const BranchButton({RepositoryModel? repo, Key? key})
      : _repo = repo,
        super(key: key);
  final RepositoryModel? _repo;
  double get height => 55;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: Provider.of<PaletteSettings>(context).currentSetting.secondary,
        elevation: 2,
        borderRadius: medBorderRadius,
        child: Container(
            decoration: BoxDecoration(borderRadius: medBorderRadius),
            child: ProviderLoadingProgressWrapper<RepoBranchProvider>(
              loadingBuilder: (context) {
                return ShimmerWidget(
                  borderRadius: medBorderRadius,
                  baseColor: Provider.of<PaletteSettings>(context)
                      .currentSetting
                      .secondary,
                  highlightColor: Colors.grey.shade800,
                  child: Container(
                    color: Provider.of<PaletteSettings>(context)
                        .currentSetting
                        .secondary,
                    width: double.infinity,
                    height: height,
                  ),
                );
              },
              childBuilder: (context, value) {
                return FadeAnimationSection(
                  child: InkWell(
                    onTap: () {
                      final String? currentBranch =
                          context.read<RepoBranchProvider>().currentSHA;
                      void changeBranch(String branch) {
                        Provider.of<RepoBranchProvider>(context, listen: false)
                            .setBranch(branch);
                      }

                      showScrollableBottomActionsMenu(context,
                          titleText: 'Select Branch',
                          child: (context, scrollController, setState) {
                        return BranchSelectSheet(
                          _repo!.url!,
                          controller: scrollController,
                          currentBranch: currentBranch,
                          defaultBranch: _repo!.defaultBranch,
                          onSelected: changeBranch,
                        );
                      });
                    },
                    borderRadius: medBorderRadius,
                    child: Container(
                      height: height,
                      decoration: BoxDecoration(borderRadius: medBorderRadius),
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
                                    value.currentSHA,
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
