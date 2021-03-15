import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';
import 'package:onehub/common/bottom_sheet.dart';
import 'package:onehub/common/button.dart';
import 'package:onehub/common/infinite_scroll_wrapper.dart';
import 'package:onehub/common/loading_indicator.dart';
import 'package:onehub/models/issues/issue_comments_model.dart';
import 'package:onehub/models/issues/issue_timeline_event_model.dart';
import 'package:onehub/providers/issue/issue_provider.dart';
import 'package:onehub/services/issues/issues_service.dart';
import 'package:onehub/style/colors.dart';
import 'package:onehub/view/issues_pulls/widgets/basic_event_card.dart';
import 'package:onehub/view/issues_pulls/widgets/comment_box.dart';
import 'package:onehub/view/issues_pulls/widgets/discussion_comment.dart';
import 'package:provider/provider.dart';

class Discussion extends StatefulWidget {
  /// Show  comments since.
  final DateTime commentsSince;
  Discussion({this.commentsSince});

  @override
  _DiscussionState createState() => _DiscussionState();
}

class _DiscussionState extends State<Discussion>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  DateTime commentsSince;

  @override
  void initState() {
    commentsSince = widget.commentsSince;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _issue = Provider.of<IssueProvider>(context);
    super.build(context);
    return Stack(
      children: [
        Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.1,
            ),
            Container(
              decoration: BoxDecoration(
                border:
                    Border(left: BorderSide(color: AppColor.grey3, width: 0.2)),
              ),
            ),
          ],
        ),
        commentsSince != null
            ? InfiniteScrollWrapper<IssueCommentsModel>(
                future: (pageNumber, pageSize, refresh, _) {
                  return IssuesService.getIssueComments(
                      _issue.issueModel.url, pageSize, pageNumber, refresh,
                      since: commentsSince
                          .subtract(Duration(minutes: 5))
                          .toIso8601String());
                },
                header: (context) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Button(
                      listenToLoadingController: false,
                      color: AppColor.onBackground,
                      padding: EdgeInsets.all(12),
                      child: Column(
                        children: [
                          Text(
                            'Showing comments since ${DateFormat('d MMM yyyy').format(commentsSince)}.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
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
                      },
                    ),
                  );
                },
                firstPageLoadingBuilder: (context) {
                  return Container(
                    color: AppColor.background,
                    child: LoadingIndicator(),
                  );
                },
                divider: false,
                builder: (context, item, index) {
                  return Builder(
                    builder: (context) {
                      return paddingWrap(child: DiscussionComment(item));
                    },
                  );
                },
              )
            : InfiniteScrollWrapper<TimelineEventModel>(
                future: (pageNumber, pageSize, refresh, _) {
                  return IssuesService.getIssueTimeline(
                      _issue.issueModel.url, pageSize, pageNumber, refresh);
                },
                firstPageLoadingBuilder: (context) {
                  return Container(
                    color: AppColor.background,
                    child: LoadingIndicator(),
                  );
                },
                filterFn: (List<TimelineEventModel> list) {
                  List<Event> allowedEvents = [
                    Event.commented,
                    Event.cross_referenced,
                    Event.assigned,
                    Event.labeled,
                    Event.closed,
                    Event.reopened,
                    Event.convert_to_draft,
                    Event.locked,
                    Event.unassigned,
                    Event.unlabeled,
                    Event.pinned,
                    Event.unpinned,
                    Event.renamed,
                    Event.referenced
                  ];
                  List<TimelineEventModel> filtered = [];
                  list.forEach((element) {
                    if (allowedEvents.contains(element.event))
                      filtered.add(element);
                  });
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
                          padding: EdgeInsets.all(16),
                          child: Text(
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
                                theme: DatePickerTheme(
                                    cancelStyle: TextStyle(
                                      color: Colors.white,
                                    ),
                                    doneStyle:
                                        TextStyle(color: AppColor.accent),
                                    itemStyle: TextStyle(color: Colors.white),
                                    backgroundColor: AppColor.background),
                                maxTime: DateTime.now(), onConfirm: (date) {
                              setState(() {
                                commentsSince = date;
                              });
                            }, currentTime: _issue.issueModel.createdAt);
                          },
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      paddingWrap(
                        child: TimelineDiscussionComment(TimelineEventModel(
                            createdAt: _issue.issueModel.createdAt,
                            event: Event.commented,
                            user: _issue.issueModel.user,
                            authorAssociation: AuthorAssociation.NONE,
                            body: _issue.issueModel.body.isNotEmpty
                                ? _issue.issueModel.body
                                : "No description provided.")),
                      ),
                    ],
                  );
                },
                divider: false,
                builder: (context, item, index) {
                  return Builder(
                    builder: (context) {
                      if (item?.event == Event.commented)
                        return paddingWrap(
                            child: TimelineDiscussionComment(item));
                      else if (item.event == Event.closed)
                        return paddingWrap(
                            child: BasicEventTextCard(
                          user: item.actor,
                          leading: Octicons.issue_closed,
                          iconColor: AppColor.error,
                          date: item.createdAt.toString(),
                          content: 'Closed issue.',
                        ));
                      else if (item.event == Event.renamed)
                        return paddingWrap(
                            child: BasicEventTextCard(
                          user: item.actor,
                          leading: Octicons.pencil,
                          date: item.createdAt.toString(),
                          content:
                              'Renamed issue from ${item.rename.from} to ${item.rename.to}.',
                        ));
                      else if (item.event == Event.pinned)
                        return paddingWrap(
                            child: BasicEventTextCard(
                          user: item.actor,
                          leading: LineIcons.thumbtack,
                          date: item.createdAt.toString(),
                          content: 'Pinned this issue.',
                        ));
                      else if (item.event == Event.reopened)
                        return paddingWrap(
                            child: BasicEventTextCard(
                          user: item.actor,
                          leading: Octicons.issue_reopened,
                          iconColor: AppColor.success,
                          date: item.createdAt.toString(),
                          content: 'Reopened issue.',
                        ));
                      else if (item.event == Event.assigned ||
                          item.event == Event.unassigned)
                        return paddingWrap(
                            child: BasicEventAssignedCard(
                          user: item.actor,
                          leading: LineIcons.user,
                          isAssigned: item.event == Event.assigned,
                          date: item.createdAt.toString(),
                          content: item.assignee,
                        ));
                      else if (item.event == Event.cross_referenced) {
                        if (item.source.issue.pullRequest != null)
                          return Text('Pull request card unimplemented');
                        else
                          return paddingWrap(
                              child: BasicEventCrossReferencedCard(
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
                      }
                      return Text(eventValues.reverse[item.event]);
                    },
                  );
                },
              ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Material(
                elevation: 2,
                color: AppColor.accent,
                child: InkWell(
                  onTap: () {
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
                                        Icon(Icons.arrow_drop_down),
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
                      return CommentBox();
                    });
                  },
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Add a comment',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Icon(
                              Icons.comment_rounded,
                              size: 16,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

Widget paddingWrap({Widget child}) {
  return Material(
      elevation: 2,
      color: AppColor.onBackground,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
        child: child,
      ));
}
