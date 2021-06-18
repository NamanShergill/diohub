import 'package:dio_hub/app/settings/palette.dart';
import 'package:dio_hub/common/animations/size_expanded_widget.dart';
import 'package:dio_hub/common/misc/bottom_sheet.dart';
import 'package:dio_hub/common/misc/button.dart';
import 'package:dio_hub/common/misc/loading_indicator.dart';
import 'package:dio_hub/common/wrappers/provider_loading_progress_wrapper.dart';
import 'package:dio_hub/providers/base_provider.dart';
import 'package:dio_hub/providers/repository/branch_provider.dart';
import 'package:dio_hub/providers/repository/code_provider.dart';
import 'package:dio_hub/providers/repository/repository_provider.dart';
import 'package:dio_hub/style/border_radiuses.dart';
import 'package:dio_hub/view/repository/code/browser_list_tiles.dart';
import 'package:dio_hub/view/repository/code/commit_browser.dart';
import 'package:dio_hub/view/repository/code/commit_info_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';

class CodeBrowser extends StatefulWidget {
  final bool showCommitHistory;
  const CodeBrowser({this.showCommitHistory = false, Key? key})
      : super(key: key);
  @override
  _CodeBrowserState createState() => _CodeBrowserState();
}

class _CodeBrowserState extends State<CodeBrowser>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      if (widget.showCommitHistory) {
        showCommitHistory(
            context, context.read<RepoBranchProvider>().currentSHA);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        const SizedBox(
          height: 16,
        ),
        Consumer<CodeProvider>(
          builder: (context, value, _) {
            return Column(
              children: [
                context.read<RepoBranchProvider>().isCommit == true &&
                        value.tree.isNotEmpty
                    ? SizeExpandedSection(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            children: [
                              Button(
                                listenToLoadingController: false,
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  children: [
                                    Text(
                                      'Currently browsing commit ${Provider.of<RepoBranchProvider>(context).currentSHA!.substring(0, 6)}.',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const Text(
                                      'Load the latest code?',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                                onTap: value.status == Status.loaded
                                    ? () {
                                        context
                                            .read<RepoBranchProvider>()
                                            .reloadBranch();
                                      }
                                    : null,
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                            ],
                          ),
                        ),
                      )
                    : Container(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Button(
                    padding:
                        const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                    color: Provider.of<PaletteSettings>(context)
                        .currentSetting
                        .primary,
                    listenToLoadingController: false,
                    onTap: value.status == Status.loaded
                        ? () {
                            showCommitHistory(
                                context, value.tree.last.commit!.sha);
                          }
                        : null,
                    child: value.status == Status.loaded
                        ? const CommitInfoButton()
                        : const LoadingIndicator(),
                  ),
                ),
              ],
            );
          },
        ),
        ProviderLoadingProgressWrapper<CodeProvider>(
          childBuilder: (context, value) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Visibility(
                  visible: value.tree.length > 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: SizedBox(
                          height: 30,
                          child: ListView.separated(
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: value.tree.length,
                              separatorBuilder: (context, index) {
                                return const Center(child: Text(' /'));
                              },
                              itemBuilder: (context, index) {
                                return Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    borderRadius:
                                        AppThemeBorderRadius.smallBorderRadius,
                                    onTap: () {
                                      if (index != value.tree.length - 1) {
                                        Provider.of<CodeProvider>(context,
                                                listen: false)
                                            .popTreeUntil(value.tree[index]);
                                      }
                                    },
                                    child: Center(
                                      child: Text(
                                        ' ' +
                                            (index == 0
                                                ? Provider.of<
                                                            RepositoryProvider>(
                                                        context)
                                                    .repositoryModel!
                                                    .name!
                                                : value
                                                    .tree[index - 1]
                                                    .tree![value
                                                        .pathIndex[index - 1]]
                                                    .path!),
                                        style: TextStyle(
                                            color: index ==
                                                    value.tree.length - 1
                                                ? Provider.of<PaletteSettings>(
                                                        context)
                                                    .currentSetting
                                                    .accent
                                                : Provider.of<PaletteSettings>(
                                                        context)
                                                    .currentSetting
                                                    .baseElements,
                                            fontWeight:
                                                index == value.tree.length - 1
                                                    ? FontWeight.bold
                                                    : FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ),
                    ],
                  ),
                ),
                SizeExpandedSection(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ClipRRect(
                      borderRadius: AppThemeBorderRadius.medBorderRadius,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: AppThemeBorderRadius.medBorderRadius,
                            color: Provider.of<PaletteSettings>(context)
                                .currentSetting
                                .secondary,
                            border: Border.all(
                                color: Provider.of<PaletteSettings>(context)
                                    .currentSetting
                                    .faded1,
                                width: 0.5)),
                        child: ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return BrowserListTile(
                                  value.tree.last.tree![index],
                                  Provider.of<RepositoryProvider>(context,
                                          listen: false)
                                      .repositoryModel!
                                      .url,
                                  index);
                            },
                            separatorBuilder: (context, index) {
                              return const Divider(
                                height: 0,
                              );
                            },
                            itemCount: value.tree.last.tree!.length),
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
    );
  }
}

void showCommitHistory(BuildContext context, String? currentSHA) {
  String? repoUrl = context.read<RepositoryProvider>().repositoryModel!.url;

  String branchName = context.read<RepoBranchProvider>().currentSHA!;

  String path = context.read<CodeProvider>().getPath();

  bool isLocked = context.read<RepoBranchProvider>().isCommit;
  showScrollableBottomActionsMenu(
    context,
    titleWidget: (context, setState) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Text(
              'Commit History',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Octicons.git_branch,
                  size: 14,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(branchName),
              ],
            ),
          ],
        ),
      );
    },
    child: (sheetContext, controller, setState) {
      return CommitBrowser(
        controller: controller,
        currentSHA: currentSHA,
        isLocked: isLocked,
        repoURL: repoUrl,
        path: path,
        branchName: branchName,
        onSelected: (String sha) {
          return Provider.of<RepoBranchProvider>(context, listen: false)
              .setBranch(sha, isCommitSha: true);
        },
      );
    },
  );
}
