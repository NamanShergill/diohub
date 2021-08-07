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
  const PaddingWrap({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      color: Provider.of<PaletteSettings>(context).currentSetting.secondary,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
        child: child,
      ),
    );
  }
}

class GetTimelineItem extends StatelessWidget {
  const GetTimelineItem(this.timelineItem,
      {Key? key, this.pullNodeID, required this.onQuote})
      : super(key: key);
  final dynamic timelineItem;
  final String? pullNodeID;
  final VoidCallback onQuote;

  String getReviewState(PullRequestReviewState state) {
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
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final item = timelineItem;
    return PaddingWrap(
      child: Builder(
        builder: (context) {
          if (item is AddedToProjectMixin) {
          } else if (item is AssignedMixin) {
            return BasicEventAssignedCard(
              actor: item.actor,
              assignee: item.assignee as ActorMixin,
              createdAt: item.createdAt,
              isAssigned: true,
            );
          } else if (item is BaseRefChangedMixin) {
            return BasicEventTextCard(
              textContent:
                  'Changed base ref from ${item.previousRefName} to ${item.currentRefName}.',
              user: item.actor,
              leading: Octicons.repo_force_push,
              date: item.createdAt,
            );
          } else if (item is BaseRefDeletedMixin) {
            return BasicEventTextCard(
              textContent: 'Deleted base ref ${item.baseRefName}.',
              user: item.actor,
              leading: Octicons.repo_force_push,
              date: item.createdAt,
            );
          } else if (item is BaseRefForcePushedMixin) {
            return BasicEventTextCard(
              textContent:
                  'Force pushed to base ref ${item.ref?.name}, from ${item.beforeCommit?.abbreviatedOid} to ${item.afterCommit?.abbreviatedOid}.',
              user: item.actor,
              leading: Octicons.repo_force_push,
              date: item.createdAt,
            );
          } else if (item is ClosedMixin) {
            return BasicEventTextCard(
              textContent: 'Closed this.',
              user: item.actor,
              leading: Octicons.issue_closed,
              iconColor:
                  Provider.of<PaletteSettings>(context).currentSetting.red,
              date: item.createdAt,
            );
          } else if (item is ConvertedToDraftMixin) {
            return BasicEventTextCard(
              textContent: 'Marked this as draft.',
              user: item.actor,
              leading: LineIcons.alternatePencil,
              date: item.createdAt,
            );
          } else if (item is CrossReferenceMixin) {
            String str;
            if (item.isCrossRepository) {
              str =
                  'Referenced this in ${(item.source as dynamic).repository.nameWithOwner}.';
            } else {
              str = 'Referenced this.';
            }
            return BasicEventTextCard(
              textContent: str,
              footer: Builder(
                builder: (context) {
                  final source = item.source;
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
                          isPull: true),
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
          } else if (item is DeMileStonedMixin) {
            return BasicEventTextCard(
              textContent:
                  'Removed this from milestone ${item.milestoneTitle}.',
              user: item.actor,
              leading: Icons.delete_rounded,
              date: item.createdAt,
            );
          } else if (item is HeadRefDeletedMixin) {
            return BasicEventTextCard(
              textContent: 'Deleted head ref ${item.headRefName}.',
              user: item.actor,
              leading: Icons.delete_rounded,
              date: item.createdAt,
            );
          } else if (item is HeadRefForcePushedMixin) {
            return BasicEventTextCard(
              textContent:
                  'Force pushed to head ref ${item.ref?.name}, from ${item.beforeCommit?.abbreviatedOid} to ${item.afterCommit?.abbreviatedOid}.',
              user: item.actor,
              leading: Octicons.repo_force_push,
              date: item.createdAt,
            );
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
              reactions: item.reactionGroups as List<ReactionsMixin>,
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
              actor: item.actor!,
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
                builder: (context) {
                  final canonical = item.canonical;
                  if (canonical is IssueMixin) {
                    return IssueLoadingCard(
                      toRepoAPIResource(
                          (canonical as IssueMixin).url.toString()),
                      padding: EdgeInsets.zero,
                      compact: true,
                    );
                  } else {
                    return PullLoadingCard(
                      toRepoAPIResource(
                          (canonical as PullRequestMixin).url.toString(),
                          isPull: true),
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
                compact: true,
              ),
              textContent: 'Made a commit.',
            );
          }
          // Todo: Missing PULL_REQUEST_COMMIT_COMMENT_THREAD case!
          else if (item is PullRequestReviewMixin) {
            return BaseComment(
              description: getReviewState(item.state),
              onQuote: onQuote,
              leading: Icons.remove_red_eye_rounded,
              isMinimized: false,
              reactions: item.reactionGroups as List<ReactionsMixin>,
              minimizedReason: null,
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
                      onTap: () {
                        AutoRouter.of(context).push(PRReviewScreenRoute(
                            nodeID: item.id, pullNodeID: pullNodeID!));
                      },
                      title: '${item.comments.totalCount} Comments',
                      color: Provider.of<PaletteSettings>(context)
                          .currentSetting
                          .primary,
                      listenToLoadingController: false,
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
                  children: [
                    const TextSpan(text: 'Renamed this.\n'),
                    TextSpan(
                        text: '${item.previousTitle}\n',
                        style: const TextStyle(
                            decoration: TextDecoration.lineThrough)),
                    TextSpan(text: item.currentTitle),
                  ],
                ),
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
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
                children: [
                  const Text('Requested a review from'),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ProfileTile(
                      (item.requestedReviewer as dynamic)?.avatarUrl.toString(),
                      showName: true,
                      size: 20,
                      textStyle: const TextStyle(fontSize: 12),
                      userLogin: (item.requestedReviewer as dynamic)?.login ??
                          (item.requestedReviewer as dynamic)?.nameKey,
                    ),
                  )
                ],
              ),
            );
          }
          // Todo: Missing REVIEW_REQUEST_REMOVED_EVENT case!
          else if (item is UnassignedMixin) {
            return BasicEventAssignedCard(
              actor: item.actor,
              assignee: item.assignee as ActorMixin,
              createdAt: item.createdAt,
              isAssigned: false,
            );
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
              user: item.actor,
              date: item.createdAt,
              leading: LineIcons.unlock,
            );
          } else if (item is UnmarkedAsDuplicateMixin) {
            return BasicEventTextCard(
              textContent: 'Marked this as not a duplicate of',
              footer: Builder(
                builder: (context) {
                  final canonical = item.canonical;
                  if (canonical is IssueMixin) {
                    return IssueLoadingCard(
                      toRepoAPIResource(
                          (canonical as IssueMixin).url.toString()),
                      padding: EdgeInsets.zero,
                      compact: true,
                    );
                  } else {
                    return PullLoadingCard(
                      toRepoAPIResource(
                          (canonical as PullRequestMixin).url.toString(),
                          isPull: true),
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
}
