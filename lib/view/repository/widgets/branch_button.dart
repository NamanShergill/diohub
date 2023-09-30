import 'package:dio_hub/app/settings/palette.dart';
import 'package:dio_hub/common/animations/fade_animation_widget.dart';
import 'package:dio_hub/common/bottom_sheet/bottom_sheets.dart';
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
  const BranchButton({final RepositoryModel? repo, super.key}) : _repo = repo;
  final RepositoryModel? _repo;
  double get height => 55;
  @override
  Widget build(final BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Material(
          color: Provider.of<PaletteSettings>(context).currentSetting.secondary,
          elevation: 2,
          borderRadius: medBorderRadius,
          child: DecoratedBox(
            decoration: BoxDecoration(borderRadius: medBorderRadius),
            child: ProviderLoadingProgressWrapper<RepoBranchProvider>(
              loadingBuilder: (final BuildContext context) => ShimmerWidget(
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
              ),
              childBuilder: (
                final BuildContext context,
                final RepoBranchProvider value,
              ) =>
                  FadeAnimationSection(
                child: InkWell(
                  onTap: () async {
                    final String currentBranch =
                        context.read<RepoBranchProvider>().currentSHA;
                    Future<void> changeBranch(final String branch) async {
                      await Provider.of<RepoBranchProvider>(
                        context,
                        listen: false,
                      ).setBranch(branch);
                    }

                    await showScrollableBottomSheet(
                      context,
                      headerBuilder: (
                        final BuildContext context,
                        final StateSetter setState,
                      ) =>
                          const BottomSheetHeaderText(
                        headerText: 'Select Branch',
                      ),
                      scrollableBodyBuilder: (
                        final BuildContext context,
                        final StateSetter setState,
                        final ScrollController scrollController,
                      ) =>
                          BranchSelectSheet(
                        _repo!.url!,
                        controller: scrollController,
                        currentBranch: currentBranch,
                        defaultBranch: _repo!.defaultBranch,
                        onSelected: changeBranch,
                      ),
                    );
                  },
                  borderRadius: medBorderRadius,
                  child: Container(
                    height: height,
                    decoration: BoxDecoration(borderRadius: medBorderRadius),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
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
                                    value.currentSHA,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
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
              ),
            ),
          ),
        ),
      );
}
