import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onehub/common/animations/size_expanded_widget.dart';
import 'package:onehub/common/infinite_scroll_wrapper.dart';
import 'package:onehub/common/loading_indicator.dart';
import 'package:onehub/models/issues/issue_model.dart';
import 'package:onehub/models/issues/issue_timeline_event_model.dart';
import 'package:onehub/services/issues/issues_service.dart';
import 'package:onehub/style/colors.dart';
import 'package:onehub/view/issues/widgets/discussion_comment.dart';

class IssueDiscussion extends StatefulWidget {
  final IssueModel issueModel;
  IssueDiscussion(this.issueModel);

  @override
  _IssueDiscussionState createState() => _IssueDiscussionState();
}

class _IssueDiscussionState extends State<IssueDiscussion>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  bool commentBoxExpanded = false;

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
                widget.issueModel.url, pageSize, pageNumber, refresh);
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
                    createdAt: widget.issueModel.createdAt,
                    event: Event.commented,
                    user: widget.issueModel.user,
                    authorAssociation: AuthorAssociation.NONE,
                    body: widget.issueModel.body)),
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
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  onTap: () {
                    setState(() {
                      commentBoxExpanded = !commentBoxExpanded;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    )),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Add a comment'),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Icon(commentBoxExpanded
                                ? Icons.arrow_drop_down
                                : Icons.arrow_drop_up),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizeExpandedSection(
                expand: commentBoxExpanded,
                child: Container(
                  color: Colors.red,
                  height: 400,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
