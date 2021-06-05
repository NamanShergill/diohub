import 'package:dio_hub/common/misc/button.dart';
import 'package:dio_hub/common/misc/patch_viewer.dart';
import 'package:dio_hub/common/wrappers/api_wrapper_widget.dart';
import 'package:dio_hub/common/wrappers/infinite_scroll_wrapper.dart';
import 'package:dio_hub/graphql/graphql.dart';
import 'package:dio_hub/services/pulls/pulls_service.dart';
import 'package:dio_hub/style/colors.dart';
import 'package:dio_hub/view/issues_pulls/widgets/discussion_comment.dart';
import 'package:dio_hub/view/issues_pulls/widgets/timeline_item.dart';
import 'package:flutter/material.dart';

class PRReviewScreen extends StatelessWidget {
  final String nodeID;
  const PRReviewScreen(this.nodeID, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Review'),
      ),
      body: InfiniteScrollWrapper<PRReviewCommentsMixin$Comments$Edges>(
        future: (pageNumber, pageSize, refresh, lastItem) {
          return PullsService.getPRReview(nodeID,
              refresh: refresh, cursor: lastItem?.cursor);
        },
        spacing: 32,
        builder: (context, item, index) {
          final comment = item.node!;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Material(
                color: AppColor.accent,
                // shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.vertical(
                //         top: AppThemeBorderRadius.medBorderRadius.topLeft)),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          comment.path,
                          style: const TextStyle(
                              fontFamily: 'monospace', fontSize: 12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                height: 0,
              ),
              const SizedBox(
                height: 8,
              ),
              PatchViewer(
                patch: comment.diffHunk,
                isWidget: true,
              ),
              paddingWrap(
                child: BaseComment(
                  isMinimized: comment.isMinimized,
                  reactions: comment.reactionGroups,
                  viewerCanDelete: comment.viewerCanDelete,
                  viewerCanMinimize: comment.viewerCanMinimize,
                  viewerCannotUpdateReasons: comment.viewerCannotUpdateReasons,
                  viewerCanReact: comment.viewerCanReact,
                  viewerCanUpdate: comment.viewerCanUpdate,
                  viewerDidAuthor: comment.viewerDidAuthor,
                  createdAt: comment.createdAt,
                  author: comment.author,
                  body: comment.body,
                  lastEditedAt: comment.lastEditedAt,
                  bodyHTML: comment.bodyHTML,
                  authorAssociation: comment.authorAssociation,
                  footerPadding: const EdgeInsets.only(left: 8, right: 8),
                  footer: APIWrapper<
                      ReviewThreadFirstCommentQuery$Query$Repository$PullRequest$ReviewThreads$Edges>(
                    apiCall: PullsService.getPRReviewThreadID(comment.id,
                        name: comment.repository.name,
                        owner: comment.repository.owner.login,
                        number: comment.pullRequest.number,
                        cursor: null),
                    fadeIntoView: false,
                    loadingBuilder: (context) {
                      return const StringButton(
                        onTap: null,
                        loading: true,
                        listenToLoadingController: false,
                        color: AppColor.background,
                        title: 'Replies',
                        trailingIcon: Icon(Icons.arrow_right_rounded),
                      );
                    },
                    responseBuilder: (context, data) {
                      return StringButton(
                        key: const ValueKey('loaded'),
                        onTap: () {},
                        listenToLoadingController: false,
                        color: AppColor.background,
                        title: (data.node!.comments.totalCount > 1
                                ? (data.node!.comments.totalCount - 1)
                                    .toString()
                                : 'No') +
                            ' Replies',
                        trailingIcon: data.node!.comments.totalCount > 1
                            ? const Icon(Icons.arrow_right_rounded)
                            : null,
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    ));
  }
}
