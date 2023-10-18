import 'package:diohub/common/misc/app_dialog.dart';
import 'package:diohub/common/misc/button.dart';
import 'package:diohub/common/wrappers/api_wrapper_widget.dart';
import 'package:diohub/models/issues/issue_model.dart';
import 'package:diohub/providers/issue_pulls/issue_provider.dart';
import 'package:diohub/services/issues/issues_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class IssueInformation extends StatelessWidget {
  IssueInformation({super.key});
  final GlobalKey<APIWrapperState<dynamic>> labelController =
      GlobalKey<APIWrapperState<dynamic>>();
  @override
  Widget build(final BuildContext context) {
    // final _editingEnabled = Provider.of<IssueProvider>(context).editingEnabled;
    return Container();
    // SingleChildScrollView(
    //   child: Column(
    //     children: [
    //       const SizedBox(
    //         height: 8,
    //       ),
    //       if (_editingEnabled ||
    //           (Provider.of<CurrentUserProvider>(context).data.login ==
    //                   _issue.user!.login &&
    //               (!(_issue.state == GIssueState.CLOSED) ||
    //                   _issue.closedBy!.login ==
    //                       Provider.of<CurrentUserProvider>(context)
    //                           .data
    //                           .login)))
    //         Padding(
    //           padding: const EdgeInsets.symmetric(horizontal: 16.0),
    //           child: _IssueButton(_issue),
    //         ),
    //       const SizedBox(
    //         height: 8,
    //       ),
    //       InfoCard(
    //         'Title',
    //         child: Row(
    //           children: [
    //             Flexible(child: Text(_issue.title!)),
    //           ],
    //         ),
    //       ),
    //       if (_issue.state == GIssueState.CLOSED)
    //         InfoCard(
    //           'Closed By',
    //           child: Row(
    //             children: [
    //               Flexible(
    //                 child: ProfileTile(
    //                   _issue.closedBy!.avatarUrl,
    //                   padding: const EdgeInsets.all(8),
    //                   userLogin: _issue.closedBy!.login,
    //                   showName: true,
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //       InfoCard(
    //         'Assignees',
    //         headerTrailing: _editingEnabled
    //             ? Text(
    //                 'EDIT',
    //                 style: TextStyle(
    //                     color: Provider.of<PaletteSettings>(context)
    //                         .currentSetting
    //                         .faded3,
    //                      12),
    //               )
    //             : null,
    //         onTap: _editingEnabled
    //             ? () {
    //                 showScrollableBottomActionsMenu(
    //                   context,
    //                   titleText: 'Select Assignees',
    //                   child: (sheetContext, scrollController, setState) {
    //                     return AssigneeSelectSheet(
    //                       controller: scrollController,
    //                       repoURL: _issue.repositoryUrl,
    //                       issueUrl: _issue.url,
    //                       assignees: _issue.assignees,
    //                       newAssignees: (assignees) {
    //                         Provider.of<IssueProvider>(context, listen: false)
    //                             .updateAssignees(assignees);
    //                       },
    //                     );
    //                   },
    //                 );
    //               }
    //             : null,
    //         child: Consumer<IssueProvider>(
    //           builder: (context, value, _) {
    //             return Row(
    //               children: [
    //                 value.data.assignees!.isNotEmpty
    //                     ? Flexible(
    //                         child: Column(
    //                         crossAxisAlignment: CrossAxisAlignment.start,
    //                         children: List.generate(
    //                             value.data.assignees!.length,
    //                             (index) => ProfileTile(
    //                                   value.data.assignees![index].avatarUrl,
    //                                   userLogin:
    //                                       value.data.assignees![index].login,
    //                                   padding: const EdgeInsets.all(8),
    //                                   showName: true,
    //                                 )),
    //                       ))
    //                     : const Text('No assignees.'),
    //               ],
    //             );
    //           },
    //         ),
    //       ),
    //       InfoCard(
    //         'Labels',
    //         headerTrailing: _editingEnabled
    //             ? Text(
    //                 'EDIT',
    //                 style: TextStyle(
    //                     color: Provider.of<PaletteSettings>(context)
    //                         .currentSetting
    //                         .faded3,
    //                      12),
    //               )
    //             : null,
    //         onTap: _editingEnabled
    //             ? () {
    //                 showScrollableBottomActionsMenu(
    //                   context,
    //                   titleText: 'Select Labels',
    //                   child: (sheetContext, scrollController, setState) {
    //                     return LabelSelectSheet(
    //                       controller: scrollController,
    //                       repoURL: _issue.repositoryUrl,
    //                       issueUrl: _issue.url,
    //                       labels: _issue.labels,
    //                       newLabels: (labels) {
    //                         Provider.of<IssueProvider>(context, listen: false)
    //                             .updateLabels(labels);
    //                       },
    //                     );
    //                   },
    //                 );
    //               }
    //             : null,
    //         child: Consumer<IssueProvider>(
    //           builder: (context, issue, _) {
    //             final _issue = issue.data;
    //             return Row(
    //               children: [
    //                 (_issue.labels!.isNotEmpty)
    //                     ? Flexible(
    //                         child: Wrap(
    //                           children: List.generate(
    //                               _issue.labels!.length,
    //                               (index) => Padding(
    //                                     padding: const EdgeInsets.only(
    //                                         right: 4, bottom: 8),
    //                                     child:
    //                                         IssueLabel(_issue.labels![index]),
    //                                   )),
    //                         ),
    //                       )
    //                     : const Text('No labels.'),
    //               ],
    //             );
    //           },
    //         ),
    //       ),
    //       InfoCard(
    //         'Description',
    //         child: Row(
    //           children: [
    //             Flexible(
    //               child: _issue.bodyHtml?.isNotEmpty == true
    //                   ? ExpansionTile(
    //                       title: const Text('Tap to Expand'),
    //                       children: [
    //                         MarkdownBody(
    //                           _issue.bodyHtml!,
    //                         ),
    //                       ],
    //                     )
    //                   : const Text('No description provided.'),
    //             ),
    //           ],
    //         ),
    //       ),
    //       InfoCard(
    //         'Created By',
    //         child: Row(
    //           children: [
    //             Flexible(
    //               child: ProfileTile(
    //                 _issue.user!.avatarUrl,
    //                 padding: const EdgeInsets.all(8),
    //                 userLogin: _issue.user!.login,
    //                 showName: true,
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //       InfoCard(
    //         'Created At',
    //         child: Row(
    //           children: [
    //             Text(getDate(_issue.createdAt.toString(), shorten: false)),
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}

class _IssueButton extends StatefulWidget {
  const _IssueButton(this.issue);
  final IssueModel issue;

  @override
  __IssueButtonState createState() => __IssueButtonState();
}

class __IssueButtonState extends State<_IssueButton> {
  bool loading = false;
  @override
  Widget build(final BuildContext context) => Button(
        loading: loading,
        onTap: () async {
          await showDialog(
            context: context,
            builder: (final _) => AppDialog(
              title: widget.issue.state != IssueState.CLOSED
                  ? 'Close Issue?'
                  : 'Reopen Issue?',
              actions: <Widget>[
                MaterialButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
                MaterialButton(
                  onPressed: () async {
                    Navigator.pop(context);

                    setState(() {
                      loading = true;
                    });
                    // ignore: omit_local_variable_types
                    final Map<String, dynamic> data = <String, dynamic>{};
                    if (widget.issue.state != IssueState.CLOSED) {
                      data['state'] = 'closed';
                    } else {
                      data['state'] = 'open';
                    }
                    final IssueModel issue = await IssuesService.updateIssue(
                      widget.issue.url!,
                      data,
                    );
                    if (context.mounted) {
                      context.issueProvider(listen: false).updateIssue(issue);
                    }
                    setState(() {
                      loading = false;
                    });
                  },
                  child: const Text('Confirm'),
                ),
              ],
            ),
          );
        },
        color:
            widget.issue.state != IssueState.CLOSED ? Colors.red : Colors.green,
        child: widget.issue.state != IssueState.CLOSED
            ? const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Close issue'),
                  SizedBox(
                    width: 8,
                  ),
                  Icon(Octicons.issue_closed),
                ],
              )
            : const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Reopen issue'),
                  SizedBox(
                    width: 8,
                  ),
                  Icon(Octicons.issue_reopened),
                ],
              ),
      );
}
