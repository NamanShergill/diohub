import 'package:dio_hub/common/misc/bottom_sheet.dart';
import 'package:dio_hub/common/misc/button.dart';
import 'package:dio_hub/common/misc/loading_indicator.dart';
import 'package:dio_hub/common/wrappers/infinite_scroll_wrapper.dart';
import 'package:dio_hub/providers/issue_pulls/comment_provider.dart';
import 'package:dio_hub/services/issues/issues_service.dart';
import 'package:dio_hub/style/border_radiuses.dart';
import 'package:dio_hub/style/colors.dart';
import 'package:dio_hub/view/issues_pulls/widgets/comment_box.dart';
import 'package:dio_hub/view/issues_pulls/widgets/discussion_comment.dart';
import 'package:dio_hub/view/issues_pulls/widgets/timeline_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Discussion extends StatefulWidget {
  final ScrollController scrollController;

  /// Show  comments since.
  final DateTime? commentsSince;
  final String repoName;
  final String owner;
  final BaseComment initComment;
  final String issueUrl;
  final int number;
  final bool? isLocked;
  final bool isPull;
  final DateTime? createdAt;
  const Discussion(
      {this.commentsSince,
      required this.number,
      required this.owner,
      required this.repoName,
      required this.initComment,
      required this.issueUrl,
      this.isLocked,
      required this.isPull,
      required this.scrollController,
      this.createdAt,
      Key? key})
      : super(key: key);

  @override
  _DiscussionState createState() => _DiscussionState();
}

class _DiscussionState extends State<Discussion>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  DateTime? commentsSince;

  InfiniteScrollWrapperController commentsSinceController =
      InfiniteScrollWrapperController();

  @override
  void initState() {
    commentsSince = widget.commentsSince;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    Widget header = commentsSince != null
        ? Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Button(
                  listenToLoadingController: false,
                  color: AppColor.onBackground,
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Text(
                        'Showing timeline since ${DateFormat('d MMM yyyy').format(commentsSince!)}.',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Text(
                        'Load the whole timeline?',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      commentsSince = null;
                    });
                    commentsSinceController.refresh();
                  },
                ),
              ),
              if (widget.initComment.createdAt
                  .isAfter(commentsSince!.subtract(const Duration(minutes: 5))))
                paddingWrap(
                  child: widget.initComment,
                ),
            ],
          )
        : Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Button(
                  listenToLoadingController: false,
                  color: AppColor.onBackground,
                  padding: const EdgeInsets.all(16),
                  child: const Text(
                    'Show timeline from a specific time?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                  ),
                  onTap: () async {
                    DatePicker.showDateTimePicker(context,
                        showTitleActions: true,
                        theme: const DatePickerTheme(
                            cancelStyle: TextStyle(
                              color: Colors.white,
                            ),
                            doneStyle: TextStyle(color: AppColor.accent),
                            itemStyle: TextStyle(color: Colors.white),
                            backgroundColor: AppColor.background),
                        maxTime: DateTime.now(), onConfirm: (date) {
                      setState(() {
                        commentsSince = date;
                      });
                      commentsSinceController.refresh();
                    }, currentTime: widget.createdAt!);
                  },
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              paddingWrap(
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
              decoration: const BoxDecoration(
                border:
                    Border(left: BorderSide(color: AppColor.grey3, width: 0.2)),
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
                      since: commentsSince);
                },
                controller: commentsSinceController,
                firstPageLoadingBuilder: (context) {
                  return Container(
                    color: AppColor.background,
                    child: const LoadingIndicator(),
                  );
                },
                isNestedScrollViewChild: true,
                scrollController: widget.scrollController,
                header: (context) {
                  return header;
                },
                divider: false,
                builder: (context, edge, index) {
                  return GetTimelineItem(edge.node);
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
                  //         iconColor: AppColor.red,
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
                  //         iconColor: AppColor.green,
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
              issueUrl: widget.issueUrl,
              onSubmit: () {
                setState(() {
                  commentsSince = DateTime.now();
                  commentsSinceController.refresh();
                });
              },
              owner: widget.owner,
              repoName: widget.repoName,
              isLocked: widget.isLocked!,
            )
          ],
        ),
      ],
    );
  }
}

class _CommentButton extends StatefulWidget {
  final bool isLocked;
  final String issueUrl;
  final String owner;
  final String repoName;
  final VoidCallback onSubmit;
  const _CommentButton(
      {Key? key,
      this.isLocked = false,
      required this.issueUrl,
      required this.onSubmit,
      required this.owner,
      required this.repoName})
      : super(key: key);

  @override
  _CommentButtonState createState() => _CommentButtonState();
}

class _CommentButtonState extends State<_CommentButton> {
  bool markdownView = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      color: widget.isLocked ? AppColor.grey3 : AppColor.accent,
      child: InkWell(
        onTap: widget.isLocked
            ? null
            : () {
                showBottomActionsMenu(context, fullScreen: true,
                    header: (context, setState) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            markdownView = !markdownView;
                          });
                        },
                        icon: const Icon(Icons.remove_red_eye_rounded),
                        color: markdownView ? Colors.white : AppColor.grey3,
                      ),
                      Expanded(
                        child: InkWell(
                          borderRadius: AppThemeBorderRadius.medBorderRadius,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Comment',
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                  const Icon(Icons.arrow_drop_down),
                                ],
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          disabledColor: AppColor.grey3.withOpacity(0.5),
                          icon: const Icon(
                            Icons.add,
                          )),
                    ],
                  );
                }, childWidget: (buildContext, setState) {
                  return Expanded(
                    child: ListenableProvider.value(
                      value: Provider.of<CommentProvider>(
                        context,
                      ),
                      child: CommentBox(
                        issueURL: widget.issueUrl,
                        repoName: widget.owner + '/' + widget.repoName,
                        onSubmit: (status) {
                          if (status) {
                            widget.onSubmit();
                          }
                        },
                        markdownView: markdownView,
                      ),
                    ),
                  );
                });
              },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Add a comment',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 8,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Icon(
                  widget.isLocked ? Octicons.lock : Icons.comment_rounded,
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
