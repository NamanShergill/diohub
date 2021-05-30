import 'package:auto_route/auto_route.dart';
import 'package:dio_hub/common/bottom_sheet.dart';
import 'package:dio_hub/common/info_card.dart';
import 'package:dio_hub/common/issues/issue_label.dart';
import 'package:dio_hub/common/markdown_body.dart';
import 'package:dio_hub/common/profile_banner.dart';
import 'package:dio_hub/models/pull_requests/pull_request_model.dart';
import 'package:dio_hub/providers/issue_pulls/pull_provider.dart';
import 'package:dio_hub/routes/router.gr.dart';
import 'package:dio_hub/style/border_radiuses.dart';
import 'package:dio_hub/style/colors.dart';
import 'package:dio_hub/utils/get_date.dart';
import 'package:dio_hub/view/issues_pulls/widgets/assignee_select_sheet.dart';
import 'package:dio_hub/view/issues_pulls/widgets/label_select_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';

class PullInformation extends StatelessWidget {
  const PullInformation({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _pull = Provider.of<PullProvider>(context).pullModel!;
    final _editingEnabled = Provider.of<PullProvider>(context).editingEnabled;
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          InfoCard(
            'Merges',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _BranchButton(_pull.head!),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(width: 8),
                    const Icon(
                      Icons.arrow_downward_rounded,
                      size: 14,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      _pull.commits.toString() + ' commits',
                      style: const TextStyle(
                          fontWeight: FontWeight.w300, fontSize: 12),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                _BranchButton(_pull.base!),
              ],
            ),
          ),
          InfoCard(
            'Requested Reviewers',
            headerTrailing: _editingEnabled
                ? const Text(
                    'EDIT',
                    style: TextStyle(color: AppColor.grey3, fontSize: 12),
                  )
                : null,
            onTap: _editingEnabled
                ? () {
                    // showScrollableBottomActionsMenu(
                    //   context,
                    //   titleText: 'Select Reviewers',
                    //   child: (sheetContext, scrollController) {
                    //     return AssigneeSelectSheet(
                    //       controller: scrollController,
                    //       repoURL:
                    //           Provider.of<PullProvider>(context, listen: false)
                    //               .repoURL,
                    //       issueUrl: _pull.issueUrl,
                    //       assignees: _pull.assignees,
                    //       newAssignees: (assignees) {
                    //         Provider.of<PullProvider>(context, listen: false)
                    //             .updateAssignees(assignees!);
                    //       },
                    //     );
                    //   },
                    // );
                  }
                : null,
            child: Consumer<PullProvider>(
              builder: (context, pull, _) {
                return Row(
                  children: [
                    pull.pullModel!.requestedReviewers!.isNotEmpty
                        ? Flexible(
                            child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List.generate(
                                pull.pullModel!.requestedReviewers!.length,
                                (index) => ProfileTile(
                                      pull.pullModel!.requestedReviewers![index]
                                          .avatarUrl,
                                      userLogin: pull.pullModel!
                                          .requestedReviewers![index].login,
                                      padding: const EdgeInsets.all(8),
                                      showName: true,
                                    )),
                          ))
                        : const Text('No reviewers.'),
                  ],
                );
              },
            ),
          ),
          InfoCard(
            'Assignees',
            headerTrailing: _editingEnabled
                ? const Text(
                    'EDIT',
                    style: TextStyle(color: AppColor.grey3, fontSize: 12),
                  )
                : null,
            onTap: _editingEnabled
                ? () {
                    showScrollableBottomActionsMenu(
                      context,
                      titleText: 'Select Assignees',
                      child: (sheetContext, scrollController) {
                        return AssigneeSelectSheet(
                          controller: scrollController,
                          repoURL:
                              Provider.of<PullProvider>(context, listen: false)
                                  .repoURL,
                          issueUrl: _pull.issueUrl,
                          assignees: _pull.assignees,
                          newAssignees: (assignees) {
                            Provider.of<PullProvider>(context, listen: false)
                                .updateAssignees(assignees!);
                          },
                        );
                      },
                    );
                  }
                : null,
            child: Consumer<PullProvider>(
              builder: (context, pull, _) {
                return Row(
                  children: [
                    pull.pullModel!.assignees!.isNotEmpty
                        ? Flexible(
                            child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List.generate(
                                pull.pullModel!.assignees!.length,
                                (index) => ProfileTile(
                                      pull.pullModel!.assignees![index]
                                          .avatarUrl,
                                      userLogin: pull
                                          .pullModel!.assignees![index].login,
                                      padding: const EdgeInsets.all(8),
                                      showName: true,
                                    )),
                          ))
                        : const Text('No assignees.'),
                  ],
                );
              },
            ),
          ),
          InfoCard(
            'Labels',
            headerTrailing: _editingEnabled
                ? const Text(
                    'EDIT',
                    style: TextStyle(color: AppColor.grey3, fontSize: 12),
                  )
                : null,
            onTap: _editingEnabled
                ? () {
                    showScrollableBottomActionsMenu(
                      context,
                      titleText: 'Select Labels',
                      child: (sheetContext, scrollController) {
                        return LabelSelectSheet(
                          controller: scrollController,
                          repoURL:
                              Provider.of<PullProvider>(context, listen: false)
                                  .repoURL,
                          issueUrl: _pull.issueUrl,
                          labels: _pull.labels,
                          newLabels: (labels) {
                            Provider.of<PullProvider>(context, listen: false)
                                .updateLabels(labels);
                          },
                        );
                      },
                    );
                  }
                : null,
            child: Consumer<PullProvider>(
              builder: (context, pull, _) {
                var _issue = pull.pullModel!;
                return Row(
                  children: [
                    (_issue.labels!.isNotEmpty)
                        ? Flexible(
                            child: Wrap(
                              children: List.generate(
                                  _issue.labels!.length,
                                  (index) => Padding(
                                        padding: const EdgeInsets.only(
                                            right: 4, bottom: 8),
                                        child:
                                            IssueLabel(_issue.labels![index]),
                                      )),
                            ),
                          )
                        : const Text("No labels."),
                  ],
                );
              },
            ),
          ),
          InfoCard(
            'Description',
            child: Row(
              children: [
                Flexible(
                  child: _pull.body!.isEmpty
                      ? const Text('No description provided.')
                      : ExpansionTile(
                          title: const Text('Tap to Expand'),
                          children: [
                            MarkdownRenderAPI(_pull.body!),
                          ],
                        ),
                ),
              ],
            ),
          ),
          InfoCard(
            'Created By',
            child: Row(
              children: [
                Flexible(
                  child: ProfileTile(
                    _pull.user!.avatarUrl,
                    padding: const EdgeInsets.all(8),
                    userLogin: _pull.user!.login,
                    showName: true,
                  ),
                ),
              ],
            ),
          ),
          InfoCard(
            'Created At',
            child: Row(
              children: [
                Text(getDate(_pull.createdAt.toString(), shorten: false)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BranchButton extends StatelessWidget {
  final Base base;
  const _BranchButton(this.base);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Material(
        color: AppColor.background,
        elevation: 2,
        borderRadius: AppThemeBorderRadius.medBorderRadius,
        child: Container(
          decoration:
              BoxDecoration(borderRadius: AppThemeBorderRadius.medBorderRadius),
          child: InkWell(
            onTap: () {
              AutoRouter.of(context).push(RepositoryScreenRoute(
                  branch: base.label!.split(':').last,
                  repositoryURL: base.repo!.url));
            },
            borderRadius: AppThemeBorderRadius.medBorderRadius,
            child: Container(
              height: 55,
              decoration: BoxDecoration(
                  borderRadius: AppThemeBorderRadius.medBorderRadius),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    const Icon(Octicons.git_branch),
                    const SizedBox(
                      width: 8,
                    ),
                    Flexible(child: Text(base.label!)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
