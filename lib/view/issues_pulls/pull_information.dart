import 'package:diohub/graphql/queries/issues_pulls/__generated__/issue_pull_info.data.gql.dart';
import 'package:diohub/providers/issue_pulls/pull_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PullInformation extends StatelessWidget {
  const PullInformation({super.key});

  @override
  Widget build(final BuildContext context) {
    final GpullInfo pull = Provider.of<PullProvider>(context).data;
    // final _editingEnabled = Provider.of<PullProvider>(context).editingEnabled;
    return Container();
    // SingleChildScrollView(
    //   child: Column(
    //     children: [
    //       const SizedBox(
    //         height: 8,
    //       ),
    //       InfoCard(
    //         'Merges',
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             _BranchButton(_pull.head!),
    //             const SizedBox(height: 4),
    //             Row(
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               children: [
    //                 const SizedBox(width: 8),
    //                 const Icon(
    //                   Icons.arrow_downward_rounded,
    //                   size: 14,
    //                 ),
    //                 const SizedBox(width: 4),
    //                 Text(
    //                   '${_pull.commits} commits',
    //                   style: const TextStyle(
    //                       fontWeight: FontWeight.w300,  12),
    //                 ),
    //               ],
    //             ),
    //             const SizedBox(height: 4),
    //             _BranchButton(_pull.base!),
    //           ],
    //         ),
    //       ),
    //       InfoCard(
    //         'Requested Reviewers',
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
    //                 // showScrollableBottomActionsMenu(
    //                 //   context,
    //                 //   titleText: 'Select Reviewers',
    //                 //   child: (sheetContext, scrollController) {
    //                 //     return AssigneeSelectSheet(
    //                 //       controller: scrollController,
    //                 //       repoURL:
    //                 //           Provider.of<PullProvider>(context, listen: false)
    //                 //               .repoURL,
    //                 //       issueUrl: _pull.issueUrl,
    //                 //       assignees: _pull.assignees,
    //                 //       newAssignees: (assignees) {
    //                 //         Provider.of<PullProvider>(context, listen: false)
    //                 //             .updateAssignees(assignees!);
    //                 //       },
    //                 //     );
    //                 //   },
    //                 // );
    //               }
    //             : null,
    //         child: Consumer<PullProvider>(
    //           builder: (context, pull, _) {
    //             return Row(
    //               children: [
    //                 pull.data.requestedReviewers!.isNotEmpty
    //                     ? Flexible(
    //                         child: Column(
    //                         crossAxisAlignment: CrossAxisAlignment.start,
    //                         children: List.generate(
    //                             pull.data.requestedReviewers!.length,
    //                             (index) => ProfileTile(
    //                                   pull.data.requestedReviewers![index]
    //                                       .avatarUrl,
    //                                   userLogin: pull.data
    //                                       .requestedReviewers![index].login,
    //                                   padding: const EdgeInsets.all(8),
    //                                   showName: true,
    //                                 )),
    //                       ))
    //                     : const Text('No reviewers.'),
    //               ],
    //             );
    //           },
    //         ),
    //       ),
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
    //                       repoURL:
    //                           Provider.of<PullProvider>(context, listen: false)
    //                               .repoURL,
    //                       issueUrl: _pull.issueUrl,
    //                       assignees: _pull.assignees,
    //                       newAssignees: (assignees) {
    //                         Provider.of<PullProvider>(context, listen: false)
    //                             .updateAssignees(assignees!);
    //                       },
    //                     );
    //                   },
    //                 );
    //               }
    //             : null,
    //         child: Consumer<PullProvider>(
    //           builder: (context, pull, _) {
    //             return Row(
    //               children: [
    //                 pull.data.assignees!.isNotEmpty
    //                     ? Flexible(
    //                         child: Column(
    //                         crossAxisAlignment: CrossAxisAlignment.start,
    //                         children: List.generate(
    //                             pull.data.assignees!.length,
    //                             (index) => ProfileTile(
    //                                   pull.data.assignees![index].avatarUrl,
    //                                   userLogin:
    //                                       pull.data.assignees![index].login,
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
    //                       repoURL:
    //                           Provider.of<PullProvider>(context, listen: false)
    //                               .repoURL,
    //                       issueUrl: _pull.issueUrl,
    //                       labels: _pull.labels,
    //                       newLabels: (labels) {
    //                         Provider.of<PullProvider>(context, listen: false)
    //                             .updateLabels(labels);
    //                       },
    //                     );
    //                   },
    //                 );
    //               }
    //             : null,
    //         child: Consumer<PullProvider>(
    //           builder: (context, pull, _) {
    //             final _issue = pull.data;
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
    //               child: _pull.bodyHtml?.isNotEmpty == true
    //                   ? ExpansionTile(
    //                       title: const Text('Tap to Expand'),
    //                       children: [
    //                         MarkdownBody(_pull.bodyHtml!),
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
    //                 _pull.user!.avatarUrl,
    //                 padding: const EdgeInsets.all(8),
    //                 userLogin: _pull.user!.login,
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
    //             Text(getDate(_pull.createdAt.toString(), shorten: false)),
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}

// class _BranchButton extends StatelessWidget {
//   const _BranchButton(this.base);
//   final Base base;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8),
//       child: Material(
//         color: Provider.of<PaletteSettings>(context).currentSetting.primary,
//         elevation: 2,
//         borderRadius: medBorderRadius,
//         child: Container(
//           decoration: BoxDecoration(borderRadius: medBorderRadius),
//           child: InkPot(
//             onTap: () {
//               AutoRouter.of(context).push(RepositoryRoute(
//                   branch: base.label!.split(':').last,
//                   repositoryURL: base.repo!.url!));
//             },
//             borderRadius: medBorderRadius,
//             child: Container(
//               height: 55,
//               decoration: BoxDecoration(borderRadius: medBorderRadius),
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                 child: Row(
//                   children: [
//                     const Icon(Octicons.git_branch),
//                     const SizedBox(
//                       width: 8,
//                     ),
//                     Flexible(child: Text(base.label!)),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
