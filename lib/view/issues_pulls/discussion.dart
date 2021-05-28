import 'package:dio_hub/common/bottom_sheet.dart';
import 'package:dio_hub/common/button.dart';
import 'package:dio_hub/common/loading_indicator.dart';
import 'package:dio_hub/common/wrappers/infinite_scroll_wrapper.dart';
import 'package:dio_hub/models/issues/issue_comments_model.dart';
import 'package:dio_hub/models/issues/issue_timeline_event_model.dart';
import 'package:dio_hub/services/issues/issues_service.dart';
import 'package:dio_hub/style/colors.dart';
import 'package:dio_hub/style/text_styles.dart';
import 'package:dio_hub/view/issues_pulls/widgets/basic_event_card.dart';
import 'package:dio_hub/view/issues_pulls/widgets/comment_box.dart';
import 'package:dio_hub/view/issues_pulls/widgets/discussion_comment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';

class Discussion extends StatefulWidget {
  final ScrollController scrollController;

  /// Show  comments since.
  final DateTime? commentsSince;
  final String issueUrl;
  final bool? isLocked;
  final String repo;
  final DateTime? createdAt;
  final TimelineEventModel? initialComment;
  const Discussion(
      {this.commentsSince,
      required this.issueUrl,
      this.isLocked,
      required this.repo,
      required this.scrollController,
      this.createdAt,
      this.initialComment,
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
              child: commentsSince != null
                  ? InfiniteScrollWrapper<IssueCommentsModel>(
                      future: (pageNumber, pageSize, refresh, _) {
                        return IssuesService.getIssueComments(
                            widget.issueUrl, pageNumber, pageSize, refresh,
                            since: commentsSince!
                                .subtract(const Duration(minutes: 5))
                                .toUtc()
                                .toIso8601String());
                      },
                      isNestedScrollViewChild: true,
                      controller: commentsSinceController,
                      scrollController: widget.scrollController,
                      header: (context) {
                        return Column(
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
                                      'Showing comments since ${DateFormat('d MMM yyyy').format(commentsSince!)}.',
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
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  setState(() {
                                    commentsSince = null;
                                  });
                                },
                              ),
                            ),
                            if (widget.initialComment!.createdAt!.isAfter(
                                commentsSince!
                                    .subtract(const Duration(minutes: 5))))
                              paddingWrap(
                                child: TimelineDiscussionComment(
                                    widget.initialComment, widget.isLocked,
                                    repo: widget.repo),
                              ),
                          ],
                        );
                      },
                      firstPageLoadingBuilder: (context) {
                        return Container(
                          color: AppColor.background,
                          child: const LoadingIndicator(),
                        );
                      },
                      divider: false,
                      builder: (context, item, index) {
                        return Builder(
                          builder: (context) {
                            return paddingWrap(
                                child: DiscussionComment(
                              item,
                              repo: widget.repo,
                            ));
                          },
                        );
                      },
                    )
                  : InfiniteScrollWrapper<TimelineEventModel>(
                      future: (pageNumber, pageSize, refresh, _) {
                        return IssuesService.getIssueTimeline(
                            widget.issueUrl, pageSize, pageNumber, refresh);
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
                      filterFn: (List<TimelineEventModel> list) {
                        List<Event> allowedEvents = [
                          Event.assigned,
                          Event.closed,
                          Event.commented,
                          Event.committed,
                          Event.commit_commented,
                          Event.convert_to_draft,
                          Event.cross_referenced,
                          Event.labeled,
                          Event.locked,
                          Event.merged,
                          Event.pinned,
                          Event.ready_for_review,
                          Event.referenced,
                          Event.renamed,
                          Event.reopened,
                          Event.reviewed,
                          Event.review_requested,
                          Event.review_request_removed,
                          Event.unassigned,
                          Event.unlabeled,
                          Event.unlocked,
                          Event.unpinned,
                        ];
                        List<TimelineEventModel> filtered = [];
                        for (TimelineEventModel element in list) {
                          if (allowedEvents.contains(element.event)) {
                            filtered.add(element);
                          }
                        }
                        return filtered;
                      },
                      header: (context) {
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Button(
                                listenToLoadingController: false,
                                color: AppColor.onBackground,
                                padding: const EdgeInsets.all(16),
                                child: const Text(
                                  'Show comments made after a specific time?',
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
                                          doneStyle:
                                              TextStyle(color: AppColor.accent),
                                          itemStyle:
                                              TextStyle(color: Colors.white),
                                          backgroundColor: AppColor.background),
                                      maxTime: DateTime.now(),
                                      onConfirm: (date) {
                                    setState(() {
                                      commentsSince = date;
                                    });
                                  }, currentTime: widget.createdAt!);
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            paddingWrap(
                              child: TimelineDiscussionComment(
                                  widget.initialComment, widget.isLocked,
                                  repo: widget.repo),
                            ),
                          ],
                        );
                      },
                      divider: false,
                      builder: (context, item, index) {
                        return Builder(
                          builder: (context) {
                            if (item.event == Event.commented) {
                              return paddingWrap(
                                  child: TimelineDiscussionComment(
                                      item, widget.isLocked,
                                      repo: widget.repo));
                            } else if (item.event == Event.closed) {
                              return paddingWrap(
                                  child: BasicEventTextCard(
                                user: item.actor,
                                leading: Octicons.issue_closed,
                                iconColor: AppColor.red,
                                date: item.createdAt.toString(),
                                textContent: 'Closed this.',
                              ));
                            } else if (item.event == Event.renamed) {
                              return paddingWrap(
                                  child: BasicEventTextCard(
                                user: item.actor,
                                leading: Octicons.pencil,
                                date: item.createdAt.toString(),
                                content: RichText(
                                  text: TextSpan(
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1!
                                          .merge(AppThemeTextStyles
                                              .basicIssueEventCardText),
                                      children: [
                                        const TextSpan(text: 'Renamed this.\n'),
                                        TextSpan(
                                            text: '${item.rename!.from}\n',
                                            style: const TextStyle(
                                                decoration: TextDecoration
                                                    .lineThrough)),
                                        TextSpan(text: item.rename!.to),
                                      ]),
                                ),
                              ));
                            } else if (item.event == Event.pinned) {
                              return paddingWrap(
                                  child: BasicEventTextCard(
                                user: item.actor,
                                leading: LineIcons.thumbtack,
                                date: item.createdAt.toString(),
                                textContent: 'Pinned this.',
                              ));
                            } else if (item.event == Event.reopened) {
                              return paddingWrap(
                                  child: BasicEventTextCard(
                                user: item.actor,
                                leading: Octicons.issue_reopened,
                                iconColor: AppColor.green,
                                date: item.createdAt.toString(),
                                textContent: 'Reopened this.',
                              ));
                            } else if (item.event == Event.assigned ||
                                item.event == Event.unassigned) {
                              return paddingWrap(
                                  child: BasicEventAssignedCard(
                                user: item.actor,
                                leading: LineIcons.user,
                                isAssigned: item.event == Event.assigned,
                                date: item.createdAt.toString(),
                                content: item.assignee,
                              ));
                            } else if (item.event == Event.cross_referenced) {
                              return paddingWrap(
                                  child: BasicIssueCrossReferencedCard(
                                user: item.actor,
                                leading: LineIcons.alternateComment,
                                date: item.createdAt.toString(),
                                content: item.source,
                              ));
                            } else if (item.event == Event.labeled ||
                                item.event == Event.unlabeled) {
                              return paddingWrap(
                                  child: BasicEventLabeledCard(
                                user: item.actor,
                                leading: LineIcons.alternateComment,
                                date: item.createdAt.toString(),
                                content: item.label,
                                added: item.event == Event.labeled,
                              ));
                            } else if (item.event == Event.committed) {
                              return paddingWrap(
                                  child: BasicEventCommitCard(
                                user: item.author,
                                leading: LineIcons.alternateComment,
                                date: item.author!.date.toString(),
                                message: item.message,
                                sha: item.sha,
                                // Don't need a direct reference to the git database.
                                commitURL: item.url!.split('/git').join(''),
                              ));
                            }
                            return Text(eventValues.reverse![item.event!]!);
                          },
                        );
                      },
                    ),
            ),
            Material(
              elevation: 2,
              color: widget.isLocked! ? AppColor.grey3 : AppColor.accent,
              child: InkWell(
                onTap: widget.isLocked!
                    ? null
                    : () {
                        showBottomActionsMenu(context,
                            fullScreen: true,
                            header: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: InkWell(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Center(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              'Comment',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline6,
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
                              ],
                            ), childWidget: (context) {
                          return CommentBox(
                            issueURL: widget.issueUrl,
                            onSubmit: (status) {
                              if (status) {
                                setState(() {
                                  commentsSince = DateTime.now();
                                  commentsSinceController.refresh();
                                });
                              }
                            },
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
                          widget.isLocked!
                              ? Octicons.lock
                              : Icons.comment_rounded,
                          size: 16,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}

Widget paddingWrap({Widget? child}) {
  return Material(
    elevation: 2,
    color: AppColor.onBackground,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
      child: child,
    ),
  );
}
