import 'package:auto_route/auto_route.dart';
import 'package:dio_hub/app/settings/palette.dart';
import 'package:dio_hub/common/issues/issue_list_card.dart';
import 'package:dio_hub/common/misc/button.dart';
import 'package:dio_hub/common/misc/profile_banner.dart';
import 'package:dio_hub/common/pulls/pull_loading_card.dart';
import 'package:dio_hub/graphql/graphql.dart';
import 'package:dio_hub/routes/router.gr.dart';
import 'package:dio_hub/style/text_styles.dart';
import 'package:dio_hub/utils/http_to_api.dart';
import 'package:dio_hub/view/issues_pulls/widgets/basic_event_card.dart';
import 'package:dio_hub/view/issues_pulls/widgets/discussion_comment.dart';
import 'package:dio_hub/view/repository/code/commit_browser_tiles.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

class PaddingWrap extends StatelessWidget {
  const PaddingWrap({required this.child, super.key});
  final Widget child;

  @override
  Widget build(final BuildContext context) => Material(
        elevation: 2,
        color: Provider.of<PaletteSettings>(context).currentSetting.secondary,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          child: child,
        ),
      );
}

class GetTimelineItem extends StatelessWidget {
  const GetTimelineItem(
    this.timelineItem, {
    required this.onQuote,
    super.key,
    this.pullNodeID,
  });
  final dynamic timelineItem;
  final String? pullNodeID;
  final VoidCallback onQuote;

  String getReviewState(final PullRequestReviewState state) {
    switch (state) {
      case PullRequestReviewState.approved:
        return 'Approved this.';
      case PullRequestReviewState.changesRequested:
        return 'Requested Changes.';
      case PullRequestReviewState.commented:
        return 'Reviewed this.';
      case PullRequestReviewState.dismissed:
        return 'Dismissed this.';
      case PullRequestReviewState.pending:
        return 'Review Pending.';
      case PullRequestReviewState.artemisUnknown:
        return 'Unknown';
    }
  }

  @override
  Widget build(final BuildContext context) {
    final dynamic item = timelineItem;
    return PaddingWrap(
      child: Builder(
        builder: (final BuildContext context) {
          return switch (item) {
            final AssignedMixin item => _buildBasicEventAssignedCard(item),
            final BaseRefChangedMixin item => _buildBaseRefChangedCard(item),
            final BaseRefDeletedMixin item => _buildRefDeletedCard(item),
            final BaseRefForcePushedMixin item => _buildForcePushedCard(item),
            final ClosedMixin item => _buildClosedCard(item),
            final ConvertedToDraftMixin item =>
              _buildConvertedToDraftCard(item),
            final CrossReferenceMixin item => _buildCrossReferenceCard(item),
            final DeMileStonedMixin item => _buildDemilestonedCard(item),
            final HeadRefDeletedMixin item => _buildHeadRefDeletedCard(item),
            final HeadRefForcePushedMixin item =>
              _buildHeadRefForcePushedCard(item),
            final HeadRefRestoredMixin item => _buildHeadRefRestoredCard(item),
            final IssueCommentMixin item => _buildBaseComment(item),
            _ => const Text('Temp'),
          };
          if (item is AddedToProjectMixin) {
          } else if (item is HeadRefRestoredMixin) {
            return BasicEventTextCard(
              textContent: 'Restored head ref.',
              user: item.actor,
              leading: Icons.delete_rounded,
              date: item.createdAt,
            );
          } else if (item is IssueCommentMixin) {
            return BaseComment(
              isMinimized: item.isMinimized,
              onQuote: onQuote,
              reactions: item.reactionGroups!,
              minimizedReason: item.minimizedReason,
              viewerCanDelete: item.viewerCanDelete,
              viewerCanMinimize: item.viewerCanMinimize,
              viewerCannotUpdateReasons: item.viewerCannotUpdateReasons,
              viewerCanReact: item.viewerCanReact,
              viewerCanUpdate: item.viewerCanUpdate,
              viewerDidAuthor: item.viewerDidAuthor,
              author: item.author,
              authorAssociation: item.authorAssociation,
              body: item.body,
              bodyHTML: item.bodyHTML,
              createdAt: item.createdAt,
              lastEditedAt: item.lastEditedAt,
            );
          } else if (item is LabeledMixin) {
            return BasicEventLabeledCard(
              actor: item.actor,
              content: item.label,
              added: true,
              date: item.createdAt,
            );
          } else if (item is LockedMixin) {
            return BasicEventTextCard(
              textContent:
                  'Locked this ${item.lockReason != null ? 'as ${item.lockReason} ' : ''}and limited conversation to collaborators',
              user: item.actor,
              date: item.createdAt,
              leading: LineIcons.lock,
            );
          } else if (item is MarkedAsDuplicateMixin) {
            return BasicEventTextCard(
              textContent: 'Marked this as a duplicate of',
              footer: Builder(
                builder: (final BuildContext context) {
                  final MarkedAsDuplicateMixin$Canonical? canonical =
                      item.canonical;
                  if (canonical is IssueMixin) {
                    return IssueLoadingCard(
                      toRepoAPIResource(
                        (canonical! as IssueMixin).url.toString(),
                      ),
                      padding: EdgeInsets.zero,
                      compact: true,
                    );
                  } else {
                    return PullLoadingCard(
                      toRepoAPIResource(
                        (canonical! as PullRequestMixin).url.toString(),
                        isPull: true,
                      ),
                      padding: EdgeInsets.zero,
                      compact: true,
                    );
                  }
                },
              ),
              user: item.actor,
              leading: Octicons.link_external,
              date: item.createdAt,
            );
          } else if (item is MergedMixin) {
            return BasicEventTextCard(
              user: item.actor,
              date: item.createdAt,
              leading: Octicons.git_merge,
              iconColor: Colors.deepPurple,
              textContent: 'Merged this.',
            );
          } else if (item is MileStonedMixin) {
            return BasicEventTextCard(
              textContent: 'Added this to milestone ${item.milestoneTitle}.',
              user: item.actor,
              leading: Icons.delete_rounded,
              date: item.createdAt,
            );
          } else if (item is MovedColumnsInProjectMixin) {
          } else if (item is PinnedMixin) {
            return BasicEventTextCard(
              user: item.actor,
              leading: LineIcons.thumbtack,
              date: item.createdAt,
              textContent: 'Pinned this.',
            );
          } else if (item is PullRequestCommitMixin) {
            return BasicEventTextCard(
              user: item.commit.author?.user,
              date: item.commit.authoredDate,
              leading: Octicons.git_commit,
              footer: CommitTilesGQL(
                item: item.commit,
                backgroundColor: Provider.of<PaletteSettings>(context)
                    .currentSetting
                    .primary,
              ),
              textContent: 'Made a commit.',
            );
          }
          // TODO(namanshergill): Missing PULL_REQUEST_COMMIT_COMMENT_THREAD case!
          else if (item is PullRequestReviewMixin) {
            return BaseComment(
              description: getReviewState(item.state),
              onQuote: onQuote,
              leading: Icons.remove_red_eye_rounded,
              isMinimized: false,
              reactions: item.reactionGroups!,
              viewerCanDelete: item.viewerCanDelete,
              viewerCanMinimize: false,
              viewerCannotUpdateReasons: item.viewerCannotUpdateReasons,
              viewerCanReact: item.viewerCanReact,
              viewerCanUpdate: item.viewerCanUpdate,
              viewerDidAuthor: item.viewerDidAuthor,
              author: item.author,
              authorAssociation: item.authorAssociation,
              body: item.body,
              bodyHTML: item.bodyHTML,
              createdAt: item.createdAt,
              lastEditedAt: item.lastEditedAt,
              footer: item.comments.totalCount > 0
                  ? StringButton(
                      onTap: () async {
                        await AutoRouter.of(context).push(
                          PRReviewRoute(
                            nodeID: item.id,
                            pullNodeID: pullNodeID!,
                          ),
                        );
                      },
                      title: '${item.comments.totalCount} Comments',
                      color: Provider.of<PaletteSettings>(context)
                          .currentSetting
                          .primary,
                      trailingIcon: const Icon(Icons.arrow_right_rounded),
                    )
                  : null,
            );
          } else if (item is ReadyForReviewMixin) {
            return BasicEventTextCard(
              user: item.actor,
              date: item.createdAt,
              leading: Icons.mark_chat_read_rounded,
              textContent: 'Marked this as ready for review.',
            );
          } else if (item is RemovedFromProjectMixin) {
          } else if (item is RenamedTitleMixin) {
            return BasicEventCard(
              user: item.actor,
              leading: Octicons.pencil,
              date: item.createdAt,
              content: Text.rich(
                TextSpan(
                  children: <InlineSpan>[
                    const TextSpan(text: 'Renamed this.\n'),
                    TextSpan(
                      text: '${item.previousTitle}\n',
                      style: const TextStyle(
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    TextSpan(text: item.currentTitle),
                  ],
                ),
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .merge(AppThemeTextStyles.basicIssueEventCardText(context)),
              ),
            );
          } else if (item is ReopenedMixin) {
            return BasicEventTextCard(
              textContent: 'Reopened this.',
              user: item.actor,
              leading: Octicons.issue_reopened,
              iconColor:
                  Provider.of<PaletteSettings>(context).currentSetting.green,
              date: item.createdAt,
            );
          } else if (item is ReviewDismissedMixin) {
          } else if (item is ReviewRequestedMixin) {
            return BasicEventCard(
              user: item.actor,
              date: item.createdAt,
              leading: Icons.remove_red_eye_rounded,
              content: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: <Widget>[
                  const Text('Requested a review from'),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: ProfileTile.login(
                      avatarUrl: (item.requestedReviewer as dynamic)
                          ?.avatarUrl
                          .toString(),
                      size: 20,
                      padding: EdgeInsets.zero,
                      textStyle: const TextStyle(fontSize: 12),
                      userLogin: (item.requestedReviewer as dynamic)?.login ??
                          (item.requestedReviewer as dynamic)?.nameKey,
                    ),
                  ),
                ],
              ),
            );
          }
          // TODO(namanshergill): Missing REVIEW_REQUEST_REMOVED_EVENT case!
          else if (item is UnassignedMixin) {
            return BasicEventAssignedCard(
              actor: item.actor,
              assignee: item.assignee! as ActorMixin,
              createdAt: item.createdAt,
              isAssigned: false,
            );
          } else if (item is UnlabeledMixin) {
            return BasicEventLabeledCard(
              actor: item.actor,
              content: item.label,
              added: false,
              date: item.createdAt,
            );
          } else if (item is UnlockedMixin) {
            return BasicEventTextCard(
              textContent: 'Unlocked this.',
              user: item.actor,
              date: item.createdAt,
              leading: LineIcons.unlock,
            );
          } else if (item is UnmarkedAsDuplicateMixin) {
            return BasicEventTextCard(
              textContent: 'Marked this as not a duplicate of',
              footer: Builder(
                builder: (final BuildContext context) {
                  final UnmarkedAsDuplicateMixin$Canonical? canonical =
                      item.canonical;
                  if (canonical is IssueMixin) {
                    return IssueLoadingCard(
                      toRepoAPIResource(
                        (canonical! as IssueMixin).url.toString(),
                      ),
                      padding: EdgeInsets.zero,
                      compact: true,
                    );
                  } else {
                    return PullLoadingCard(
                      toRepoAPIResource(
                        (canonical! as PullRequestMixin).url.toString(),
                        isPull: true,
                      ),
                      padding: EdgeInsets.zero,
                      compact: true,
                    );
                  }
                },
              ),
              user: item.actor,
              leading: Octicons.link_external,
              date: item.createdAt,
            );
          } else if (item is UnpinnedMixin) {
            return BasicEventTextCard(
              user: item.actor,
              leading: LineIcons.thumbtack,
              date: item.createdAt,
              textContent: 'Unpinned this.',
            );
          }
          if (!kReleaseMode) {
            return Text(item.$$typename);
          } else {
            return Container();
          }
        },
      ),
    );
  }

  BasicEventTextCard _buildHeadRefRestoredCard(
          final HeadRefRestoredMixin item) =>
      BasicEventTextCard(
        textContent: 'Restored head ref.',
        user: item.actor,
        leading: Icons.delete_rounded,
        date: item.createdAt,
      );

  BasicEventTextCard _buildHeadRefForcePushedCard(
          final HeadRefForcePushedMixin item) =>
      BasicEventTextCard(
        textContent:
            'Force pushed to head ref ${item.ref?.name}, from ${item.beforeCommit?.abbreviatedOid} to ${item.afterCommit?.abbreviatedOid}.',
        user: item.actor,
        leading: Octicons.repo_push,
        date: item.createdAt,
      );

  BasicEventTextCard _buildHeadRefDeletedCard(final HeadRefDeletedMixin item) =>
      BasicEventTextCard(
        textContent: 'Deleted head ref ${item.headRefName}.',
        user: item.actor,
        leading: Icons.delete_rounded,
        date: item.createdAt,
      );

  BasicEventTextCard _buildDemilestonedCard(final DeMileStonedMixin item) =>
      BasicEventTextCard(
        textContent: 'Removed this from milestone ${item.milestoneTitle}.',
        user: item.actor,
        leading: Icons.delete_rounded,
        date: item.createdAt,
      );

  BasicEventTextCard _buildConvertedToDraftCard(
          final ConvertedToDraftMixin item) =>
      BasicEventTextCard(
        textContent: 'Marked this as draft.',
        user: item.actor,
        leading: LineIcons.alternatePencil,
        date: item.createdAt,
      );

  BasicEventTextCard _buildClosedCard(final ClosedMixin item) =>
      BasicEventTextCard(
        textContent: 'Closed this.',
        user: item.actor,
        leading: Octicons.issue_closed,
        iconColor: Colors.red,
        date: item.createdAt,
      );

  BasicEventTextCard _buildForcePushedCard(
          final BaseRefForcePushedMixin item) =>
      BasicEventTextCard(
        textContent:
            'Force pushed to base ref ${item.ref?.name}, from ${item.beforeCommit?.abbreviatedOid} to ${item.afterCommit?.abbreviatedOid}.',
        user: item.actor,
        leading: Octicons.repo_push,
        date: item.createdAt,
      );

  BasicEventTextCard _buildRefDeletedCard(final BaseRefDeletedMixin item) =>
      BasicEventTextCard(
        textContent: 'Deleted base ref ${item.baseRefName}.',
        user: item.actor,
        leading: Octicons.repo_push,
        date: item.createdAt,
      );

  BasicEventTextCard _buildBaseRefChangedCard(final BaseRefChangedMixin item) =>
      BasicEventTextCard(
        textContent:
            'Changed base ref from ${item.previousRefName} to ${item.currentRefName}.',
        user: item.actor,
        leading: Octicons.repo_push,
        date: item.createdAt,
      );

  BasicEventAssignedCard _buildBasicEventAssignedCard(
          final AssignedMixin item) =>
      BasicEventAssignedCard(
        actor: item.actor,
        assignee: item.assignee! as ActorMixin,
        createdAt: item.createdAt,
        isAssigned: true,
      );

  BaseComment _buildBaseComment(final IssueCommentMixin item) => BaseComment(
        isMinimized: item.isMinimized,
        onQuote: onQuote,
        reactions: item.reactionGroups!,
        minimizedReason: item.minimizedReason,
        viewerCanDelete: item.viewerCanDelete,
        viewerCanMinimize: item.viewerCanMinimize,
        viewerCannotUpdateReasons: item.viewerCannotUpdateReasons,
        viewerCanReact: item.viewerCanReact,
        viewerCanUpdate: item.viewerCanUpdate,
        viewerDidAuthor: item.viewerDidAuthor,
        author: item.author,
        authorAssociation: item.authorAssociation,
        body: item.body,
        bodyHTML: item.bodyHTML,
        createdAt: item.createdAt,
        lastEditedAt: item.lastEditedAt,
      );

  BasicEventTextCard _buildCrossReferenceCard(final CrossReferenceMixin item) {
    {
      String str;
      str = item.isCrossRepository
          ? 'Referenced this in ${(item.source as dynamic).repository.nameWithOwner}.'
          : 'Referenced this.';

      return BasicEventTextCard(
        textContent: str,
        footer: Builder(
          builder: (final BuildContext context) {
            final CrossReferenceMixin$Source source = item.source;
            if (source is IssueMixin) {
              return IssueLoadingCard(
                toRepoAPIResource((source as IssueMixin).url.toString()),
                padding: EdgeInsets.zero,
                compact: true,
              );
            } else {
              return PullLoadingCard(
                toRepoAPIResource(
                  (source as PullRequestMixin).url.toString(),
                  isPull: true,
                ),
                padding: EdgeInsets.zero,
                compact: true,
              );
            }
          },
        ),
        user: item.actor,
        leading: Octicons.link_external,
        date: item.createdAt,
      );
    }
  }
}
