import 'package:auto_route/auto_route.dart';
import 'package:dio_hub/common/issues/issue_list_card.dart';
import 'package:dio_hub/common/misc/button.dart';
import 'package:dio_hub/common/misc/profile_banner.dart';
import 'package:dio_hub/common/pulls/pull_loading_card.dart';
import 'package:dio_hub/graphql/graphql.dart';
import 'package:dio_hub/routes/router.gr.dart';
import 'package:dio_hub/utils/http_to_api.dart';
import 'package:dio_hub/view/issues_pulls/widgets/basic_event_card.dart';
import 'package:dio_hub/view/issues_pulls/widgets/discussion_comment.dart';
import 'package:dio_hub/view/repository/code/commit_browser_tiles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class PaddingWrap extends StatelessWidget {
  const PaddingWrap({
    required this.child,
    super.key,
  });
  final Widget child;
  // final double? elevation;
  @override
  Widget build(final BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: child,
      );
}

class TimelineItem extends StatelessWidget {
  const TimelineItem(
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
    final Widget child = switch (item) {
      final AssignedMixin item => _buildBasicEventAssignedCard(item),
      final BaseRefChangedMixin item => _buildBaseRefChangedCard(item),
      final BaseRefDeletedMixin item => _buildRefDeletedCard(item),
      final BaseRefForcePushedMixin item => _buildForcePushedCard(item),
      final ClosedMixin item => _buildClosedCard(item),
      final ConvertedToDraftMixin item => _buildConvertedToDraftCard(item),
      final CrossReferenceMixin item => _buildCrossReferenceCard(item),
      final DeMileStonedMixin item => _buildDemilestonedCard(item),
      final HeadRefDeletedMixin item => _buildHeadRefDeletedCard(item),
      final HeadRefForcePushedMixin item => _buildHeadRefForcePushedCard(item),
      final HeadRefRestoredMixin item => _buildHeadRefRestoredCard(item),
      final IssueCommentMixin item => _buildBaseComment(item),
      final LabeledMixin item => _buildLabeledMixinItem(item),
      final LockedMixin item => _buildLockedCard(item),
      final MarkedAsDuplicateMixin item => _buildMarkedAsDuplicateCard(item),
      final MergedMixin item => _buildMergedCard(item),
      final MileStonedMixin item => _buildMilestonedCard(item),
      final PinnedMixin item => _buildPinnedMixin(item),
      final PullRequestCommitMixin item => _buildPullRequestCommitCard(item),
      final PullRequestReviewMixin item =>
        _buildPullRequestReviewCard(item, context),
      final ReadyForReviewMixin item => _buildReadForReviewCard(item),
      final RenamedTitleMixin item => _buildRenamedTitleCard(item, context),
      final ReopenedMixin item => _buildReopenedCard(item),
      final ReviewRequestedMixin item => _buldReviewRequestedCard(item),
      final UnassignedMixin item => _buildUnassignedCard(item),
      final UnlabeledMixin item => _buildUnlabeledCard(item),
      final UnlockedMixin item => _buildUnlockedCard(item),
      final UnmarkedAsDuplicateMixin item =>
        _buildUnmarkedAsDuplicateCard(item),
      final UnpinnedMixin item => _buildUnpinnedCard(item),
      _ => const Text('Unimplemented.'),
    };
    if (item is IssueCommentMixin) {
      return PaddingWrap(
        // padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: child,
      );
    }

    return Column(
      children: <Widget>[
        PaddingWrap(child: child),
        const Divider(
            // height: 0,
            ),
      ],
    );
  }

  BasicEventTextCard _buildUnpinnedCard(final UnpinnedMixin item) =>
      BasicEventTextCard(
        user: item.actor,
        leading: const Icon(MdiIcons.pinOff),
        date: item.createdAt,
        textContent: 'Unpinned this.',
      );

  BasicEventTextCard _buildUnmarkedAsDuplicateCard(
          final UnmarkedAsDuplicateMixin item,) =>
      BasicEventTextCard(
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
        leading: const Icon(Octicons.link_external),
        date: item.createdAt,
      );

  BasicEventTextCard _buildUnlockedCard(final UnlockedMixin item) =>
      BasicEventTextCard(
        textContent: 'Unlocked this.',
        user: item.actor,
        date: item.createdAt,
        leading: const Icon(MdiIcons.lockOff),
      );

  BasicEventLabeledCard _buildUnlabeledCard(final UnlabeledMixin item) =>
      BasicEventLabeledCard(
        actor: item.actor,
        content: item.label,
        added: false,
        date: item.createdAt,
      );

  BasicEventAssignedCard _buildUnassignedCard(final UnassignedMixin item) =>
      BasicEventAssignedCard(
        actor: item.actor,
        assignee: item.assignee! as ActorMixin,
        createdAt: item.createdAt,
        isAssigned: false,
      );

  BasicEventCard _buldReviewRequestedCard(final ReviewRequestedMixin item) =>
      BasicEventCard(
        user: item.actor,
        date: item.createdAt,
        leading: const Icon(Icons.remove_red_eye_rounded),
        content: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: <Widget>[
            const Text('Requested a review from'),
            Padding(
              padding: const EdgeInsets.all(8),
              child: ProfileTile.login(
                avatarUrl:
                    (item.requestedReviewer as dynamic)?.avatarUrl.toString(),
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

  BasicEventTextCard _buildReopenedCard(final ReopenedMixin item) =>
      BasicEventTextCard(
        textContent: 'Reopened this.',
        user: item.actor,
        leading: const Icon(Octicons.issue_reopened, color: Colors.green),
        date: item.createdAt,
      );

  BasicEventCard _buildRenamedTitleCard(
          final RenamedTitleMixin item, final BuildContext context,) =>
      BasicEventCard(
        user: item.actor,
        leading: const Icon(Octicons.pencil),
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
          // style: Theme.of(context).textTheme.b,
        ),
      );

  BasicEventTextCard _buildReadForReviewCard(final ReadyForReviewMixin item) =>
      BasicEventTextCard(
        user: item.actor,
        date: item.createdAt,
        leading: const Icon(Icons.mark_chat_read_rounded),
        textContent: 'Marked this as ready for review.',
      );

  BaseComment _buildPullRequestReviewCard(
          final PullRequestReviewMixin item, final BuildContext context,) =>
      BaseComment(
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
                // color: Provider.of<PaletteSettings>(context)
                //     .currentSetting
                //     .primary,
                trailingIcon: const Icon(Icons.arrow_right_rounded),
              )
            : null,
      );

  BasicEventTextCard _buildPullRequestCommitCard(
          final PullRequestCommitMixin item,) =>
      BasicEventTextCard(
        user: item.commit.author?.user,
        date: item.commit.authoredDate,
        leading: const Icon(Octicons.git_commit),
        footer: CommitTilesGQL(
          item: item.commit,
          // backgroundColor: Provider.of<PaletteSettings>(context)
          //     .currentSetting
          //     .primary,
        ),
        textContent: 'Made a commit.',
      );

  BasicEventTextCard _buildPinnedMixin(final PinnedMixin item) =>
      BasicEventTextCard(
        user: item.actor,
        leading: const Icon(MdiIcons.pin),
        date: item.createdAt,
        textContent: 'Pinned this.',
      );

  BasicEventTextCard _buildMilestonedCard(final MileStonedMixin item) =>
      BasicEventTextCard(
        textContent: 'Added this to milestone ${item.milestoneTitle}.',
        user: item.actor,
        leading: const Icon(Icons.delete_rounded),
        date: item.createdAt,
      );

  BasicEventTextCard _buildMergedCard(final MergedMixin item) =>
      BasicEventTextCard(
        user: item.actor,
        date: item.createdAt,

        leading: const Icon(Octicons.git_merge, color: Colors.green),
        // iconColor: deepPurple,
        textContent: 'Merged this.',
      );

  BasicEventTextCard _buildMarkedAsDuplicateCard(
          final MarkedAsDuplicateMixin item,) =>
      BasicEventTextCard(
        textContent: 'Marked this as a duplicate of',
        footer: Builder(
          builder: (final BuildContext context) {
            final MarkedAsDuplicateMixin$Canonical? canonical = item.canonical;
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
        leading: const Icon(Octicons.link_external),
        date: item.createdAt,
      );

  BasicEventTextCard _buildLockedCard(final LockedMixin item) =>
      BasicEventTextCard(
        textContent:
            'Locked this ${item.lockReason != null ? 'as ${item.lockReason} ' : ''}and limited conversation to collaborators',
        user: item.actor,
        date: item.createdAt,
        leading: const Icon(MdiIcons.lock),
      );

  BasicEventLabeledCard _buildLabeledMixinItem(final LabeledMixin item) =>
      BasicEventLabeledCard(
        actor: item.actor,
        content: item.label,
        added: true,
        date: item.createdAt,
      );

  BasicEventTextCard _buildHeadRefRestoredCard(
    final HeadRefRestoredMixin item,
  ) =>
      BasicEventTextCard(
        textContent: 'Restored head ref.',
        user: item.actor,
        leading: const Icon(Icons.delete_rounded),
        date: item.createdAt,
      );

  BasicEventTextCard _buildHeadRefForcePushedCard(
    final HeadRefForcePushedMixin item,
  ) =>
      BasicEventTextCard(
        textContent:
            'Force pushed to head ref ${item.ref?.name}, from ${item.beforeCommit?.abbreviatedOid} to ${item.afterCommit?.abbreviatedOid}.',
        user: item.actor,
        leading: const Icon(Octicons.repo_push),
        date: item.createdAt,
      );

  BasicEventTextCard _buildHeadRefDeletedCard(final HeadRefDeletedMixin item) =>
      BasicEventTextCard(
        textContent: 'Deleted head ref ${item.headRefName}.',
        user: item.actor,
        leading: const Icon(Icons.delete_rounded),
        date: item.createdAt,
      );

  BasicEventTextCard _buildDemilestonedCard(final DeMileStonedMixin item) =>
      BasicEventTextCard(
        textContent: 'Removed this from milestone ${item.milestoneTitle}.',
        user: item.actor,
        leading: const Icon(Icons.delete_rounded),
        date: item.createdAt,
      );

  BasicEventTextCard _buildConvertedToDraftCard(
    final ConvertedToDraftMixin item,
  ) =>
      BasicEventTextCard(
        textContent: 'Marked this as draft.',
        user: item.actor,
        leading: const Icon(MdiIcons.pencilCircle),
        date: item.createdAt,
      );

  BasicEventTextCard _buildClosedCard(final ClosedMixin item) =>
      BasicEventTextCard(
        textContent: 'Closed this.',
        user: item.actor,
        leading: const Icon(
          Octicons.issue_closed,
          color: Colors.red,
        ),
        date: item.createdAt,
      );

  BasicEventTextCard _buildForcePushedCard(
          final BaseRefForcePushedMixin item,) =>
      BasicEventTextCard(
        textContent:
            'Force pushed to base ref ${item.ref?.name}, from ${item.beforeCommit?.abbreviatedOid} to ${item.afterCommit?.abbreviatedOid}.',
        user: item.actor,
        leading: const Icon(Octicons.repo_push),
        date: item.createdAt,
      );

  BasicEventTextCard _buildRefDeletedCard(final BaseRefDeletedMixin item) =>
      BasicEventTextCard(
        textContent: 'Deleted base ref ${item.baseRefName}.',
        user: item.actor,
        leading: const Icon(Octicons.repo_push),
        date: item.createdAt,
      );

  BasicEventTextCard _buildBaseRefChangedCard(final BaseRefChangedMixin item) =>
      BasicEventTextCard(
        textContent:
            'Changed base ref from ${item.previousRefName} to ${item.currentRefName}.',
        user: item.actor,
        leading: const Icon(Octicons.repo_push),
        date: item.createdAt,
      );

  BasicEventAssignedCard _buildBasicEventAssignedCard(
    final AssignedMixin item,
  ) =>
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
        leading: const Icon(Octicons.link_external),
        date: item.createdAt,
      );
    }
  }
}
