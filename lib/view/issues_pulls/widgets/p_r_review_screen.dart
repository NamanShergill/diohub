import 'package:dio_hub/app/settings/palette.dart';
import 'package:dio_hub/common/misc/bottom_sheet.dart';
import 'package:dio_hub/common/misc/button.dart';
import 'package:dio_hub/common/misc/link_text.dart';
import 'package:dio_hub/common/misc/patch_viewer.dart';
import 'package:dio_hub/common/wrappers/api_wrapper_widget.dart';
import 'package:dio_hub/common/wrappers/infinite_scroll_wrapper.dart';
import 'package:dio_hub/graphql/graphql.dart';
import 'package:dio_hub/providers/issue_pulls/comment_provider.dart';
import 'package:dio_hub/providers/users/current_user_provider.dart';
import 'package:dio_hub/services/pulls/pulls_service.dart';
import 'package:dio_hub/view/issues_pulls/widgets/comment_box.dart';
import 'package:dio_hub/view/issues_pulls/widgets/discussion_comment.dart';
import 'package:dio_hub/view/issues_pulls/widgets/timeline_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PRReviewScreen extends StatelessWidget {
  final String nodeID;
  final String pullNodeID;
  const PRReviewScreen(this.nodeID, {Key? key, required this.pullNodeID})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Review'),
      ),
      // Check if user has pending reviews to disable reply button accordingly.
      // See https://github.com/NamanShergill/diohub/issues/18 for info.
      body: APIWrapper<bool>(
        apiCall: PullsService.hasPendingReviews(pullNodeID,
            context.read<CurrentUserProvider>().currentUserInfo!.login!),
        responseBuilder: (context, repliesEnabled) {
          return InfiniteScrollWrapper<PRReviewCommentsMixin$Comments$Edges>(
            future: (pageNumber, pageSize, refresh, lastItem) {
              return PullsService.getPRReview(nodeID,
                  refresh: refresh, cursor: lastItem?.cursor);
            },
            spacing: 32,
            builder: (context, item, index, refresh) {
              final comment = item.node!;
              return ChangeNotifierProvider(
                create: (_) => CommentProvider(),
                builder: (context, child) {
                  void openCommentSheet() {
                    showCommentSheet(context,
                        onSubmit: () async {
                          await PullsService.replyToReviewComment(
                              context.read<CommentProvider>().data,
                              id: comment.databaseId!,
                              owner: comment.repository.owner.login,
                              repo: comment.repository.name,
                              pullNumber: comment.pullRequest.number);
                          context.read<CommentProvider>().clearData();
                          return;
                        },
                        type: 'Reply',
                        initialData: context.read<CommentProvider>().data,
                        onChanged: (value) {
                          Provider.of<CommentProvider>(context, listen: false)
                              .updateData(value);
                        },
                        owner: comment.repository.owner.login,
                        repoName: comment.repository.name);
                  }

                  Widget replyButton(data) => Row(
                        children: [
                          Button(
                            onTap: () {
                              if (data) {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text(
                                        'Cannot reply.',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6,
                                      ),
                                      content: DefaultTextStyle(
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2!,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            Text(
                                                'Cannot add a reply to other review comments when you have a pending review on the PR.'),
                                            LinkText(
                                              'https://github.com/NamanShergill/diohub/issues/18',
                                              text:
                                                  'See this for more information.',
                                            ),
                                          ],
                                        ),
                                      ),
                                      actions: [
                                        MaterialButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: const Text('Okay'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              } else {
                                openCommentSheet();
                              }
                            },
                            child: const Icon(Icons.reply),
                            color: Provider.of<PaletteSettings>(context)
                                .currentSetting
                                .background,
                            listenToLoadingController: false,
                            stretch: false,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                        ],
                      );

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Material(
                        color: Provider.of<PaletteSettings>(context)
                            .currentSetting
                            .accent,
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
                        limitLines: 4,
                        initLoading: false,
                        fileType: comment.path.split('.').last,
                        waitBeforeLoad: false,
                      ),
                      PaddingWrap(
                        child: BaseComment(
                          isMinimized: comment.isMinimized,
                          reactions: comment.reactionGroups,
                          viewerCanDelete: comment.viewerCanDelete,
                          viewerCanMinimize: comment.viewerCanMinimize,
                          onQuote: () {
                            openCommentSheet();
                          },
                          viewerCannotUpdateReasons:
                              comment.viewerCannotUpdateReasons,
                          viewerCanReact: comment.viewerCanReact,
                          viewerCanUpdate: comment.viewerCanUpdate,
                          viewerDidAuthor: comment.viewerDidAuthor,
                          createdAt: comment.createdAt,
                          author: comment.author,
                          body: comment.body,
                          lastEditedAt: comment.lastEditedAt,
                          bodyHTML: comment.bodyHTML,
                          authorAssociation: comment.authorAssociation,
                          footerPadding:
                              const EdgeInsets.only(left: 8, right: 8),
                          footer: APIWrapper<
                              ReviewThreadFirstCommentQuery$Query$Repository$PullRequest$ReviewThreads$Edges?>(
                            apiCall: PullsService.getPRReviewThreadID(
                                comment.id,
                                name: comment.repository.name,
                                owner: comment.repository.owner.login,
                                number: comment.pullRequest.number,
                                refresh: refresh,
                                cursor: null),
                            fadeIntoView: false,
                            loadingBuilder: (context) {
                              return Row(
                                children: [
                                  replyButton(repliesEnabled),
                                  Expanded(
                                    child: StringButton(
                                      onTap: null,
                                      loading: true,
                                      listenToLoadingController: false,
                                      color:
                                          Provider.of<PaletteSettings>(context)
                                              .currentSetting
                                              .background,
                                      title: 'Replies',
                                      trailingIcon:
                                          const Icon(Icons.arrow_right_rounded),
                                    ),
                                  ),
                                ],
                              );
                            },
                            responseBuilder: (context, data) {
                              if (data != null) {
                                return Row(
                                  children: [
                                    replyButton(repliesEnabled),
                                    Expanded(
                                      child: StringButton(
                                        key: const ValueKey('loaded'),
                                        onTap: () {
                                          showScrollableBottomActionsMenu(
                                            context,
                                            titleText: 'Replies',
                                            child: (sheetContext,
                                                scrollController, setState) {
                                              return ListenableProvider.value(
                                                value: Provider.of<
                                                    CommentProvider>(context),
                                                builder: (context, child) {
                                                  return InfiniteScrollWrapper<
                                                      ReviewThreadCommentsQuery$Query$Node$PullRequestReviewThread$Comments$Edges>(
                                                    scrollController:
                                                        scrollController,
                                                    divider: false,
                                                    future: (pageNumber,
                                                        pageSize,
                                                        refresh,
                                                        lastItem) {
                                                      return PullsService
                                                          .getReviewThreadReplies(
                                                              data.node!.id,
                                                              lastItem?.cursor,
                                                              refresh: refresh);
                                                    },
                                                    filterFn: (items) {
                                                      List<ReviewThreadCommentsQuery$Query$Node$PullRequestReviewThread$Comments$Edges>
                                                          temp = [];
                                                      for (ReviewThreadCommentsQuery$Query$Node$PullRequestReviewThread$Comments$Edges item
                                                          in items) {
                                                        if (item.node!.id !=
                                                            comment.id) {
                                                          temp.add(item);
                                                        }
                                                      }
                                                      return temp;
                                                    },
                                                    builder: (cxt, item, index,
                                                        refresh) {
                                                      final reply = item.node!;
                                                      return PaddingWrap(
                                                        child: BaseComment(
                                                            isMinimized: reply
                                                                .isMinimized,
                                                            onQuote: () {
                                                              Navigator.pop(
                                                                  context);
                                                              openCommentSheet();
                                                            },
                                                            reactions: reply
                                                                .reactionGroups,
                                                            viewerCanDelete: reply
                                                                .viewerCanDelete,
                                                            viewerCanMinimize: reply
                                                                .viewerCanMinimize,
                                                            viewerCannotUpdateReasons:
                                                                reply
                                                                    .viewerCannotUpdateReasons,
                                                            viewerCanReact: reply
                                                                .viewerCanReact,
                                                            viewerCanUpdate: reply
                                                                .viewerCanUpdate,
                                                            viewerDidAuthor: reply
                                                                .viewerDidAuthor,
                                                            createdAt:
                                                                reply.createdAt,
                                                            author:
                                                                reply.author,
                                                            body: reply.body,
                                                            lastEditedAt: reply
                                                                .lastEditedAt,
                                                            bodyHTML:
                                                                reply.bodyHTML,
                                                            authorAssociation: reply
                                                                .authorAssociation),
                                                      );
                                                    },
                                                  );
                                                },
                                              );
                                            },
                                          );
                                        },
                                        listenToLoadingController: false,
                                        color: Provider.of<PaletteSettings>(
                                                context)
                                            .currentSetting
                                            .background,
                                        title:
                                            (data.node!.comments.totalCount > 1
                                                    ? (data.node!.comments
                                                                .totalCount -
                                                            1)
                                                        .toString()
                                                    : 'No') +
                                                ' Replies',
                                        trailingIcon:
                                            data.node!.comments.totalCount > 1
                                                ? const Icon(
                                                    Icons.arrow_right_rounded)
                                                : null,
                                      ),
                                    ),
                                  ],
                                );
                              } else {
                                return Container();
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          );
        },
      ),
    ));
  }
}
