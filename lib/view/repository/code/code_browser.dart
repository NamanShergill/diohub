import 'dart:async';

import 'package:diohub/common/animations/size_expanded_widget.dart';
import 'package:diohub/common/bottom_sheet/bottom_sheets.dart';
import 'package:diohub/common/misc/button.dart';
import 'package:diohub/common/misc/loading_indicator.dart';
import 'package:diohub/common/wrappers/provider_loading_progress_wrapper.dart';
import 'package:diohub/providers/base_provider.dart';
import 'package:diohub/providers/repository/branch_provider.dart';
import 'package:diohub/providers/repository/code_provider.dart';
import 'package:diohub/providers/repository/repository_provider.dart';
import 'package:diohub/style/border_radiuses.dart';
import 'package:diohub/utils/utils.dart';
import 'package:diohub/view/repository/code/browser_list_tiles.dart';
import 'package:diohub/view/repository/code/commit_browser.dart';
import 'package:diohub/view/repository/code/commit_info_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';

class CodeBrowser extends StatefulWidget {
  const CodeBrowser({this.showCommitHistory = false, super.key});
  final bool showCommitHistory;
  @override
  CodeBrowserState createState() => CodeBrowserState();
}

class CodeBrowserState extends State<CodeBrowser>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((final Duration timeStamp) {
      if (widget.showCommitHistory) {
        showCommitHistory(
          context,
          context.read<RepoBranchProvider>().currentSHA,
        );
      }
    });
  }

  @override
  Widget build(final BuildContext context) {
    super.build(context);
    return SingleChildScrollView(
      child: Column(
        // physics: const NeverScrollableScrollPhysics(),
        // shrinkWrap: true,
        children: <Widget>[
          const SizedBox(
            height: 16,
          ),
          Consumer<CodeProvider>(
            builder: (
              final BuildContext context,
              final CodeProvider value,
              final _,
            ) =>
                Column(
              children: <Widget>[
                if (context.read<RepoBranchProvider>().isCommit &&
                    value.tree.isNotEmpty)
                  _buildPathWidget(value, context),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Button(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 8,
                    ),
                    color: context.colorScheme.primary,
                    onTap: value.status == Status.loaded
                        ? () {
                            showCommitHistory(
                              context,
                              value.tree.last.commit!.sha,
                            );
                          }
                        : null,
                    child: value.status == Status.loaded
                        ? const CommitInfoButton()
                        : const LoadingIndicator(),
                  ),
                ),
              ],
            ),
          ),
          ProviderLoadingProgressWrapper<CodeProvider>(
            childBuilder:
                (final BuildContext context, final CodeProvider value) =>
                    Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Visibility(
                  visible: value.tree.length > 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: SizedBox(
                          height: 30,
                          child: ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: value.tree.length,
                            separatorBuilder:
                                (final BuildContext context, final int index) =>
                                    const Center(child: Text(' /')),
                            itemBuilder:
                                (final BuildContext context, final int index) =>
                                    Material(
                              // color: transparent,
                              child: InkWell(
                                // borderRadius: smallBorderRadius,
                                onTap: () {
                                  if (index != value.tree.length - 1) {
                                    Provider.of<CodeProvider>(
                                      context,
                                      listen: false,
                                    ).popTreeUntil(value.tree[index]);
                                  }
                                },
                                child: Center(
                                  child: Text(
                                    ' ${index == 0 ? Provider.of<RepositoryProvider>(context).data.name! : value.tree[index - 1].tree![value.pathIndex[index - 1]].path!}',
                                    style: TextStyle(
                                      color: index == value.tree.length - 1
                                          ? context.colorScheme.primary
                                          : null,
                                      fontWeight: index == value.tree.length - 1
                                          ? FontWeight.bold
                                          : FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizeExpandedSection(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: ClipRRect(
                      borderRadius: medBorderRadius,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: medBorderRadius,
                          // color: Provider.of<PaletteSettings>(context)
                          //     .currentSetting
                          //     .secondary,
                          border: Border.all(
                            // color: Provider.of<PaletteSettings>(context)
                            //     .currentSetting
                            //     .faded1,
                            width: 0.5,
                          ),
                        ),
                        child: ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder:
                              (final BuildContext context, final int index) =>
                                  BrowserListTile(
                            value.tree.last.tree![index],
                            Provider.of<RepositoryProvider>(
                              context,
                              listen: false,
                            ).data.url,
                            index,
                          ),
                          separatorBuilder:
                              (final BuildContext context, final int index) =>
                                  const Divider(
                            height: 0,
                          ),
                          itemCount: value.tree.last.tree!.length,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            loadingBuilder: (final BuildContext context) => Container(),
          ),
        ],
      ),
    );
  }

  SizeExpandedSection _buildPathWidget(
    final CodeProvider value,
    final BuildContext context,
  ) =>
      SizeExpandedSection(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: <Widget>[
              Button(
                padding: const EdgeInsets.all(8),
                onTap: value.status == Status.loaded
                    ? () {
                        context.read<RepoBranchProvider>().reloadBranch();
                      }
                    : null,
                child: Column(
                  children: <Widget>[
                    Text(
                      'Currently browsing commit ${Provider.of<RepoBranchProvider>(context).currentSHA.substring(0, 6)}.',
                      textAlign: TextAlign.center,
                      style: context.textTheme.labelSmall?.asBold(),
                    ),
                    Text(
                      'Load the latest code?',
                      textAlign: TextAlign.center,
                      style: context.textTheme.labelMedium?.asBold(),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      );
}

void showCommitHistory(final BuildContext context, final String? currentSHA) {
  final String? repoUrl = context.read<RepositoryProvider>().data.url;

  final String branchName = context.read<RepoBranchProvider>().currentSHA;

  final String path = context.read<CodeProvider>().getPath();

  final bool isLocked = context.read<RepoBranchProvider>().isCommit;
  unawaited(
    showScrollableBottomSheet(
      context,
      headerBuilder: (final BuildContext context, final StateSetter setState) =>
          Column(
        children: <Widget>[
          Text(
            'Commit History',
            style: context.textTheme.titleSmall,
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
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
      scrollableBodyBuilder: (
        final BuildContext context,
        final StateSetter setState,
        final ScrollController scrollController,
      ) =>
          CommitBrowser(
        controller: scrollController,
        currentSHA: currentSHA,
        isLocked: isLocked,
        repoURL: repoUrl,
        path: path,
        branchName: branchName,
        onSelected: (final String sha) {
          Provider.of<RepoBranchProvider>(context, listen: false)
              .setBranch(sha, isCommitSha: true);
        },
      ),
    ),
  );
}
