import 'package:dio_hub/app/settings/palette.dart';
import 'package:dio_hub/common/misc/button.dart';
import 'package:dio_hub/common/misc/loading_indicator.dart';
import 'package:dio_hub/common/wrappers/infinite_scroll_wrapper.dart';
import 'package:dio_hub/providers/issue_pulls/comment_provider.dart';
import 'package:dio_hub/services/issues/issues_service.dart';
import 'package:dio_hub/view/issues_pulls/widgets/comment_box.dart';
import 'package:dio_hub/view/issues_pulls/widgets/discussion_comment.dart';
import 'package:dio_hub/view/issues_pulls/widgets/timeline_item.dart';
import 'package:flutter/material.dart' hide DatePickerTheme;
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Discussion extends StatefulWidget {
  const Discussion(
      {this.commentsSince,
      required this.number,
      required this.owner,
      this.pullNodeID,
      required this.repoName,
      required this.initComment,
      required this.issueUrl,
      this.isLocked,
      required this.isPull,
      // required this.nestedScrollViewController,
      this.createdAt,
      Key? key})
      : super(key: key);
  // final ScrollController nestedScrollViewController;

  /// Show  comments since.
  final DateTime? commentsSince;
  final String repoName;
  final String owner;
  final String? pullNodeID;
  final BaseComment initComment;
  final String issueUrl;
  final int number;
  final bool? isLocked;
  final bool isPull;
  final DateTime? createdAt;

  @override
  _DiscussionState createState() => _DiscussionState();
}

class _DiscussionState extends State<Discussion> {
  DateTime? commentsSince;

  InfiniteScrollWrapperController commentsSinceController =
      InfiniteScrollWrapperController();

  @override
  void initState() {
    commentsSince = widget.commentsSince;
    super.initState();
  }

  void openCommentSheet() {
    showCommentSheet(context,
        onSubmit: () async {
          await IssuesService.addComment(
              widget.issueUrl, context.read<CommentProvider>().data);
          context.read<CommentProvider>().clearData();
          setState(() {
            commentsSince = DateTime.now();
            commentsSinceController.refresh();
          });
          return;
        },
        initialData: context.read<CommentProvider>().data,
        onChanged: (value) {
          Provider.of<CommentProvider>(context, listen: false)
              .updateData(value);
        },
        owner: widget.owner,
        repoName: widget.repoName);
  }

  @override
  Widget build(BuildContext context) {
    // final theme = Provider.of<PaletteSettings>(context).currentSetting;

    final Widget header = commentsSince != null
        ? Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Button(
                  color: Provider.of<PaletteSettings>(context)
                      .currentSetting
                      .secondary,
                  padding: const EdgeInsets.all(12),
                  onTap: () {
                    setState(() {
                      commentsSince = null;
                    });
                    commentsSinceController.refresh();
                  },
                  child: Column(
                    children: [
                      Text(
                        'Showing timeline since ${DateFormat('d MMM yyyy').format(commentsSince!)}.',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Text(
                        'Load the whole timeline?',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
              if (widget.initComment.createdAt.isAfter(
                  commentsSince!.subtract(const Duration(seconds: 30))))
                PaddingWrap(
                  child: widget.initComment,
                ),
            ],
          )
        : Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Button(
                  color: Provider.of<PaletteSettings>(context)
                      .currentSetting
                      .secondary,
                  padding: const EdgeInsets.all(16),
                  onTap: () async {
                    DatePicker.showDateTimePicker(context,
                        showTitleActions: true,
                        theme: DatePickerTheme(
                            cancelStyle: TextStyle(
                              color: Provider.of<PaletteSettings>(context)
                                  .currentSetting
                                  .baseElements,
                            ),
                            doneStyle: TextStyle(
                                color: Provider.of<PaletteSettings>(context)
                                    .currentSetting
                                    .accent),
                            itemStyle: TextStyle(
                                color: Provider.of<PaletteSettings>(context)
                                    .currentSetting
                                    .baseElements),
                            backgroundColor:
                                Provider.of<PaletteSettings>(context)
                                    .currentSetting
                                    .primary),
                        maxTime: DateTime.now(), onConfirm: (date) {
                      setState(() {
                        commentsSince = date;
                      });
                      commentsSinceController.refresh();
                    }, currentTime: widget.createdAt!);
                  },
                  child: const Text(
                    'Show timeline from a specific time?',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              // const SizedBox(
              //   height: 16,
              // ),
              PaddingWrap(
                child: widget.initComment,
              ),
            ],
          );
    return Stack(
      children: [
        Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.1,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                    left: BorderSide(
                        color: Provider.of<PaletteSettings>(context)
                            .currentSetting
                            .faded3,
                        width: 0.2)),
              ),
            ),
          ],
        ),
        Column(
          children: [
            Expanded(
              child: InfiniteScrollWrapper<dynamic>(
                future: (pageNumber, pageSize, refresh, _) {
                  return IssuesService.getTimeline(
                      repo: widget.repoName,
                      after: _?.cursor,
                      number: widget.number,
                      owner: widget.owner,
                      refresh: refresh,
                      since: commentsSince
                          ?.toUtc()
                          .subtract(const Duration(seconds: 30)));
                },
                // scrollController: widget.nestedScrollViewController,
                controller: commentsSinceController,
                firstPageLoadingBuilder: (context) {
                  return Container(
                    color: Provider.of<PaletteSettings>(context)
                        .currentSetting
                        .primary,
                    child: const LoadingIndicator(),
                  );
                },
                // scrollController: widget.nestedScrollViewController,
                header: (context) {
                  return header;
                },
                topSpacing: 8,
                separatorBuilder: (context, index) => const SizedBox(
                  height: 8,
                ),
                builder: (context, edge, index, refresh) {
                  return GetTimelineItem(
                    edge.node,
                    pullNodeID: widget.pullNodeID,
                    onQuote: openCommentSheet,
                  );
                  // return Builder(
                  //   builder: (context) {
                  //     final item = node;
                  //     if (item is IssueCommentMixin) {
                  //       return paddingWrap(child: BaseComment(item));
                  //     } else if (item.event == Event.closed) {
                  //       return paddingWrap(
                  //           child: BasicEventTextCard(
                  //         user: item.actor,
                  //         leading: Octicons.issue_closed,
                  //         iconColor: Provider.of<PaletteSettings>(context).currentSetting.red,
                  //         date: item.createdAt.toString(),
                  //         textContent: 'Closed this.',
                  //       ));
                  //     } else if (item.event == Event.renamed) {
                  //       return paddingWrap(
                  //           child: BasicEventTextCard(
                  //         user: item.actor,
                  //         leading: Octicons.pencil,
                  //         date: item.createdAt.toString(),
                  //         content: RichText(
                  //           text: TextSpan(
                  //               style: Theme.of(context)
                  //                   .textTheme
                  //                   .subtitle1!
                  //                   .merge(AppThemeTextStyles
                  //                       .basicIssueEventCardText),
                  //               children: [
                  //                 const TextSpan(text: 'Renamed this.\n'),
                  //                 TextSpan(
                  //                     text: '${item.rename!.from}\n',
                  //                     style: const TextStyle(
                  //                         decoration: TextDecoration
                  //                             .lineThrough)),
                  //                 TextSpan(text: item.rename!.to),
                  //               ]),
                  //         ),
                  //       ));
                  //     } else if (item.event == Event.pinned) {
                  //       return paddingWrap(
                  //           child: BasicEventTextCard(
                  //         user: item.actor,
                  //         leading: LineIcons.thumbtack,
                  //         date: item.createdAt.toString(),
                  //         textContent: 'Pinned this.',
                  //       ));
                  //     } else if (item.event == Event.reopened) {
                  //       return paddingWrap(
                  //           child: BasicEventTextCard(
                  //         user: item.actor,
                  //         leading: Octicons.issue_reopened,
                  //         iconColor: Provider.of<PaletteSettings>(context).currentSetting.green,
                  //         date: item.createdAt.toString(),
                  //         textContent: 'Reopened this.',
                  //       ));
                  //     } else if (item.event == Event.assigned ||
                  //         item.event == Event.unassigned) {
                  //       return paddingWrap(
                  //           child: BasicEventAssignedCard(
                  //         user: item.actor,
                  //         leading: LineIcons.user,
                  //         isAssigned: item.event == Event.assigned,
                  //         date: item.createdAt.toString(),
                  //         content: item.assignee,
                  //       ));
                  //     } else if (item.event == Event.cross_referenced) {
                  //       return paddingWrap(
                  //           child: BasicIssueCrossReferencedCard(
                  //         user: item.actor,
                  //         leading: LineIcons.alternateComment,
                  //         date: item.createdAt.toString(),
                  //         content: item.source,
                  //       ));
                  //     } else if (item.event == Event.labeled ||
                  //         item.event == Event.unlabeled) {
                  //       return paddingWrap(
                  //           child: BasicEventLabeledCard(
                  //         user: item.actor,
                  //         leading: LineIcons.alternateComment,
                  //         date: item.createdAt.toString(),
                  //         content: item.label,
                  //         added: item.event == Event.labeled,
                  //       ));
                  //     } else if (item.event == Event.committed) {
                  //       return paddingWrap(
                  //           child: BasicEventCommitCard(
                  //         user: item.author,
                  //         leading: LineIcons.alternateComment,
                  //         date: item.author!.date.toString(),
                  //         message: item.message,
                  //         sha: item.sha,
                  //         // Don't need a direct reference to the git database.
                  //         commitURL: item.url!.split('/git').join(''),
                  //       ));
                  //     }
                  //     return Text(eventValues.reverse![item.event!]!);
                  //   },
                  // );
                },
              ),
            ),
            _CommentButton(
              onTap: openCommentSheet,
              isLocked: widget.isLocked!,
            )
          ],
        ),
      ],
    );
  }
}

class _CommentButton extends StatelessWidget {
  const _CommentButton({
    Key? key,
    this.isLocked = false,
    required this.onTap,
  }) : super(key: key);
  final bool isLocked;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<PaletteSettings>(context).currentSetting;

    return Material(
      elevation: 2,
      color: isLocked
          ? Provider.of<PaletteSettings>(context).currentSetting.faded3
          : Provider.of<PaletteSettings>(context).currentSetting.accent,
      child: InkWell(
        onTap: isLocked ? null : onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Add a comment',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: theme.elementsOnColors),
              ),
              const SizedBox(
                width: 8,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Icon(
                  isLocked ? Octicons.lock : Icons.comment_rounded,
                  color: theme.elementsOnColors,
                  size: 16,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
