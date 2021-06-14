import 'package:dio_hub/app/settings/palette.dart';
import 'package:dio_hub/common/issues/issue_label.dart';
import 'package:dio_hub/common/misc/bottom_sheet.dart';
import 'package:dio_hub/common/misc/button.dart';
import 'package:dio_hub/common/misc/info_card.dart';
import 'package:dio_hub/common/misc/markdown_body.dart';
import 'package:dio_hub/common/misc/profile_banner.dart';
import 'package:dio_hub/common/wrappers/api_wrapper_widget.dart';
import 'package:dio_hub/models/issues/issue_model.dart';
import 'package:dio_hub/providers/issue_pulls/issue_provider.dart';
import 'package:dio_hub/providers/users/current_user_provider.dart';
import 'package:dio_hub/services/issues/issues_service.dart';
import 'package:dio_hub/utils/get_date.dart';
import 'package:dio_hub/view/issues_pulls/widgets/assignee_select_sheet.dart';
import 'package:dio_hub/view/issues_pulls/widgets/label_select_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';

class IssueInformation extends StatelessWidget {
  final APIWrapperController labelController = APIWrapperController();
  IssueInformation({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _issue = Provider.of<IssueProvider>(context).issueModel!;
    final _editingEnabled = Provider.of<IssueProvider>(context).editingEnabled;
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          if (_editingEnabled ||
              (Provider.of<CurrentUserProvider>(context)
                          .currentUserInfo
                          ?.login ==
                      _issue.user!.login &&
                  (_issue.state == IssueState.CLOSED
                      ? _issue.closedBy!.login ==
                          Provider.of<CurrentUserProvider>(context)
                              .currentUserInfo
                              ?.login
                      : true)))
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Button(
                child: _issue.state != IssueState.CLOSED
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text('Close issue'),
                          SizedBox(
                            width: 8,
                          ),
                          Icon(Octicons.issue_closed),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text('Reopen issue'),
                          SizedBox(
                            width: 8,
                          ),
                          Icon(Octicons.issue_reopened),
                        ],
                      ),
                onTap: () async {
                  Map data = {};
                  if (_issue.state != IssueState.CLOSED) {
                    data['state'] = 'closed';
                  } else {
                    data['state'] = 'open';
                  }
                  IssueModel issue =
                      await IssuesService.updateIssue(_issue.url!, data);
                  Provider.of<IssueProvider>(context, listen: false)
                      .updateIssue(issue);
                },
                color: _issue.state != IssueState.CLOSED
                    ? Provider.of<PaletteSettings>(context).currentSetting.red
                    : Provider.of<PaletteSettings>(context)
                        .currentSetting
                        .green,
              ),
            ),
          const SizedBox(
            height: 8,
          ),
          InfoCard(
            'Title',
            child: Row(
              children: [
                Flexible(child: Text(_issue.title!)),
              ],
            ),
          ),
          if (_issue.state == IssueState.CLOSED)
            InfoCard(
              'Closed By',
              child: Row(
                children: [
                  Flexible(
                    child: ProfileTile(
                      _issue.closedBy!.avatarUrl,
                      padding: const EdgeInsets.all(8),
                      userLogin: _issue.closedBy!.login,
                      showName: true,
                    ),
                  ),
                ],
              ),
            ),
          InfoCard(
            'Assignees',
            headerTrailing: _editingEnabled
                ? Text(
                    'EDIT',
                    style: TextStyle(
                        color: Provider.of<PaletteSettings>(context)
                            .currentSetting
                            .faded3,
                        fontSize: 12),
                  )
                : null,
            onTap: _editingEnabled
                ? () {
                    showScrollableBottomActionsMenu(
                      context,
                      titleText: 'Select Assignees',
                      child: (sheetContext, scrollController, setState) {
                        return AssigneeSelectSheet(
                          controller: scrollController,
                          repoURL: _issue.repositoryUrl,
                          issueUrl: _issue.url,
                          assignees: _issue.assignees,
                          newAssignees: (assignees) {
                            Provider.of<IssueProvider>(context, listen: false)
                                .updateAssignees(assignees);
                          },
                        );
                      },
                    );
                  }
                : null,
            child: Consumer<IssueProvider>(
              builder: (context, value, _) {
                return Row(
                  children: [
                    value.issueModel!.assignees!.isNotEmpty
                        ? Flexible(
                            child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List.generate(
                                value.issueModel!.assignees!.length,
                                (index) => ProfileTile(
                                      value.issueModel!.assignees![index]
                                          .avatarUrl,
                                      userLogin: value
                                          .issueModel!.assignees![index].login,
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
                ? Text(
                    'EDIT',
                    style: TextStyle(
                        color: Provider.of<PaletteSettings>(context)
                            .currentSetting
                            .faded3,
                        fontSize: 12),
                  )
                : null,
            onTap: _editingEnabled
                ? () {
                    showScrollableBottomActionsMenu(
                      context,
                      titleText: 'Select Labels',
                      child: (sheetContext, scrollController, setState) {
                        return LabelSelectSheet(
                          controller: scrollController,
                          repoURL: _issue.repositoryUrl,
                          issueUrl: _issue.url,
                          labels: _issue.labels,
                          newLabels: (labels) {
                            Provider.of<IssueProvider>(context, listen: false)
                                .updateLabels(labels);
                          },
                        );
                      },
                    );
                  }
                : null,
            child: Consumer<IssueProvider>(
              builder: (context, issue, _) {
                var _issue = issue.issueModel!;
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
                  child: _issue.bodyHtml == null || _issue.bodyHtml!.isEmpty
                      ? const Text('No description provided.')
                      : ExpansionTile(
                          title: const Text('Tap to Expand'),
                          children: [
                            MarkdownBody(
                              _issue.bodyHtml!,
                            ),
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
                    _issue.user!.avatarUrl,
                    padding: const EdgeInsets.all(8),
                    userLogin: _issue.user!.login,
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
                Text(getDate(_issue.createdAt.toString(), shorten: false)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
