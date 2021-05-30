import 'package:dio_hub/common/bottom_sheet.dart';
import 'package:dio_hub/common/button.dart';
import 'package:dio_hub/common/loading_indicator.dart';
import 'package:dio_hub/common/wrappers/infinite_scroll_wrapper.dart';
import 'package:dio_hub/graphql/graphql.dart';
import 'package:dio_hub/models/issues/issue_timeline_event_model.dart';
import 'package:dio_hub/providers/issue_pulls/comment_provider.dart';
import 'package:dio_hub/services/issues/issues_service.dart';
import 'package:dio_hub/style/colors.dart';
import 'package:dio_hub/view/issues_pulls/widgets/basic_event_card.dart';
import 'package:dio_hub/view/issues_pulls/widgets/comment_box.dart';
import 'package:dio_hub/view/issues_pulls/widgets/discussion_comment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

class Discussion extends StatefulWidget {
  final ScrollController scrollController;

  /// Show  comments since.
  final DateTime? commentsSince;
  final String repoName;
  final String owner;
  final String issueUrl;
  final int number;
  final bool? isLocked;
  final bool isPull;
  final DateTime? createdAt;
  final TimelineEventModel? initialComment;
  const Discussion(
      {this.commentsSince,
      required this.number,
      required this.owner,
      required this.repoName,
      required this.issueUrl,
      this.isLocked,
      required this.isPull,
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
              // if (widget.initialComment!.createdAt!.isAfter(
              //     commentsSince!
              //         .subtract(const Duration(minutes: 5))))
              //   paddingWrap(
              //     child: BaseComment(
              //         widget.initialComment, widget.isLocked,
              //         repo: widget.repo),
              //   ),
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
              // paddingWrap(
              //   child: BaseComment(
              //       widget.initialComment, widget.isLocked,
              //       repo: widget.repo),
              // ),
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
              child: widget.isPull
                  ? InfiniteScrollWrapper<
                      GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node>(
                      future: (pageNumber, pageSize, refresh, _) {
                        return IssuesService.getIssueComments(
                            '', pageNumber, pageSize, refresh,
                            since: commentsSince!
                                .subtract(const Duration(minutes: 5))
                                .toUtc()
                                .toIso8601String());
                      },
                      isNestedScrollViewChild: true,
                      controller: commentsSinceController,
                      scrollController: widget.scrollController,
                      header: (context) {
                        return header;
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
                            return Container();
                            // return paddingWrap(
                            //     child: DiscussionComment(
                            //   item,
                            //   repo: widget.repo,
                            // ));
                          },
                        );
                      },
                    )
                  : InfiniteScrollWrapper<
                      GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges>(
                      future: (pageNumber, pageSize, refresh, _) {
                        return IssuesService.getIssueTimeline(
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
                        return getTimeLineItem(edge.node);
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

Widget getTimeLineItem(dynamic item) {
  return paddingWrap(
    child: Builder(
      builder: (context) {
        if (item is AddedToProjectMixin) {
        } else if (item is AssignedMixin) {
          return BasicEventAssignedCard(
            actor: item.actor!,
            assignee: item.assignee as ActorMixin,
            createdAt: item.createdAt,
            isAssigned: true,
          );
        } else if (item is BaseRefChangedMixin) {
        } else if (item is BaseRefDeletedMixin) {
        } else if (item is BaseRefForcePushedMixin) {
        } else if (item is ClosedMixin) {
          return BasicEventTextCard(
            textContent: 'Closed this.',
            user: item.actor as ActorMixin,
            leading: Octicons.issue_closed,
            iconColor: AppColor.red,
            date: item.createdAt,
          );
        } else if (item is ConvertedToDraftMixin) {
          return BasicEventTextCard(
            textContent: 'Converted to draft.',
            user: item.actor as ActorMixin,
            leading: LineIcons.alternatePencil,
            date: item.createdAt,
          );
        } else if (item is CrossReferenceMixin) {
        } else if (item is DeMileStonedMixin) {
        } else if (item is HeadRefDeletedMixin) {
        } else if (item is HeadRefForcePushedMixin) {
        } else if (item is HeadRefRestoredMixin) {
        } else if (item is IssueCommentMixin) {
          return BaseComment(item);
        } else if (item is LabeledMixin) {
          return BasicEventLabeledCard(
            actor: item.actor!,
            content: item.label,
            added: true,
            date: item.createdAt,
          );
        } else if (item is LockedMixin) {
          return BasicEventTextCard(
            textContent:
                'Locked this ${item.lockReason != null ? 'as ${item.lockReason} ' : ''}and limited conversation to collaborators',
            user: item.actor as ActorMixin,
            date: item.createdAt,
            leading: LineIcons.lock,
          );
        } else if (item is MarkedAsDuplicateMixin) {
        } else if (item is MergedMixin) {
        } else if (item is MileStonedMixin) {
        } else if (item is MovedColumnsInProjectMixin) {
        } else if (item is PinnedMixin) {
        } else if (item is PullRequestCommitMixin) {
        } else if (item is PullRequestReviewMixin) {
        } else if (item is ReadyForReviewMixin) {
        } else if (item is RemovedFromProjectMixin) {
        } else if (item is RenamedTitleMixin) {
        } else if (item is ReopenedMixin) {
          return BasicEventTextCard(
            textContent: 'Reopened this.',
            user: item.actor as ActorMixin,
            leading: Octicons.issue_reopened,
            iconColor: AppColor.green,
            date: item.createdAt,
          );
        } else if (item is ReviewDismissedMixin) {
        } else if (item is ReviewRequestedMixin) {
        } else if (item is UnassignedMixin) {
        } else if (item is UnlabeledMixin) {
          return BasicEventLabeledCard(
            actor: item.actor!,
            content: item.label,
            added: false,
            date: item.createdAt,
          );
        } else if (item is UnlockedMixin) {
          return BasicEventTextCard(
            textContent: 'Unlocked this.',
            user: item.actor as ActorMixin,
            date: item.createdAt,
            leading: LineIcons.unlock,
          );
        } else if (item is UnmarkedAsDuplicateMixin) {
        } else if (item is UnpinnedMixin) {}
        return Container();
      },
    ),
  );
}

Widget paddingWrap({Widget? child}) {
  return Material(
    elevation: 2,
    color: AppColor.onBackground,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
      child: child,
    ),
  );
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
  __CommentButtonState createState() => __CommentButtonState();
}

class __CommentButtonState extends State<_CommentButton> {
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
                showBottomActionsMenu(context,
                    fullScreen: true,
                    header: Row(
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
                    ), childWidget: (buildContext) {
                  return ListenableProvider.value(
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
                  widget.isLocked! ? Octicons.lock : Icons.comment_rounded,
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
