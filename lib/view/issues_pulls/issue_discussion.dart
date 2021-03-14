import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onehub/common/bottom_sheet.dart';
import 'package:onehub/common/infinite_scroll_wrapper.dart';
import 'package:onehub/common/loading_indicator.dart';
import 'package:onehub/models/issues/issue_timeline_event_model.dart';
import 'package:onehub/providers/issue/issue_provider.dart';
import 'package:onehub/services/issues/issues_service.dart';
import 'package:onehub/style/colors.dart';
import 'package:onehub/view/issues_pulls/widgets/comment_box.dart';
import 'package:onehub/view/issues_pulls/widgets/discussion_comment.dart';
import 'package:provider/provider.dart';

class IssueDiscussion extends StatefulWidget {
  IssueDiscussion();

  @override
  _IssueDiscussionState createState() => _IssueDiscussionState();
}

class _IssueDiscussionState extends State<IssueDiscussion>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
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
        InfiniteScrollWrapper<IssuesTimelineEventModel>(
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
          filterFn: (List<IssuesTimelineEventModel> list) {
            List<Event> allowedEvents = [
              Event.commented,
              Event.cross_referenced,
              Event.assigned,
              Event.labeled,
              Event.closed,
              Event.reopened,
              Event.convert_to_draft,
              Event.locked,
              Event.pinned,
              Event.unpinned,
              Event.renamed,
              Event.referenced
            ];
            List<IssuesTimelineEventModel> filtered = [];
            list.forEach((element) {
              if (allowedEvents.contains(element.event)) filtered.add(element);
            });
            return filtered;
          },
          header: (context) {
            return Column(
              children: [
                SizedBox(
                  height: 16,
                ),
                DiscussionComment(IssuesTimelineEventModel(
                    createdAt: _issue.issueModel.createdAt,
                    event: Event.commented,
                    user: _issue.issueModel.user,
                    authorAssociation: AuthorAssociation.NONE,
                    body: _issue.issueModel.body.isNotEmpty
                        ? _issue.issueModel.body
                        : "No description provided.")),
              ],
            );
          },
          divider: false,
          builder: (context, item, index) {
            return Builder(
              builder: (context) {
                if (item?.event == Event.commented)
                  return DiscussionComment(item);
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
