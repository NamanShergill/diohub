// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart = 2.12
// ignore_for_file: all

import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'graphql.graphql.g.dart';

mixin AddedToProjectMixin {
  late String id;
  late DateTime createdAt;
  AddedToProjectMixin$Actor? actor;
  late String projectColumnName;
  AddedToProjectMixin$Project? project;
}
mixin ActorMixin {
  late Uri avatarUrl;
  late String login;
}
mixin AssignedMixin {
  late String id;
  late DateTime createdAt;
  AssignedMixin$Actor? actor;
  AssignedMixin$Assignee? assignee;
}
mixin ClosedMixin {
  late String id;
  late DateTime createdAt;
  ClosedMixin$Actor? actor;
}
mixin CrossReferenceMixin {
  late String id;
  late DateTime createdAt;
  CrossReferenceMixin$Actor? actor;
  late CrossReferenceMixin$Source source;
  late bool isCrossRepository;
}
mixin IssueMixin {
  late Uri url;
  late String title;
  late int number;
  @JsonKey(unknownEnumValue: IssueState.artemisUnknown)
  late IssueState issueState;
  late IssueMixin$Repository repository;
}
mixin RepoMixin {
  late Uri url;
  late String nameWithOwner;
}
mixin PullRequestMixin {
  late Uri url;
  late String title;
  late int number;
  @JsonKey(unknownEnumValue: PullRequestState.artemisUnknown)
  late PullRequestState pullState;
  late PullRequestMixin$Repository repository;
}
mixin DeMileStonedMixin {
  late String id;
  late DateTime createdAt;
  DeMileStonedMixin$Actor? actor;
  late String milestoneTitle;
}
mixin IssueCommentMixin {
  late String id;
  late DateTime createdAt;
  IssueCommentMixin$Author? author;
  @JsonKey(unknownEnumValue: CommentAuthorAssociation.artemisUnknown)
  late CommentAuthorAssociation authorAssociation;
  late String body;
  late String bodyHTML;
  DateTime? lastEditedAt;
  late bool isMinimized;
  String? minimizedReason;
  List<IssueCommentMixin$ReactionGroups>? reactionGroups;
  late bool viewerCanMinimize;
  late bool viewerCanDelete;
  late bool viewerCanUpdate;
  late bool viewerDidAuthor;
  @JsonKey(unknownEnumValue: CommentCannotUpdateReason.artemisUnknown)
  late List<CommentCannotUpdateReason> viewerCannotUpdateReasons;
  late bool viewerCanReact;
}
mixin LabeledMixin {
  late String id;
  late DateTime createdAt;
  LabeledMixin$Actor? actor;
  late LabeledMixin$Label label;
}
mixin LabelMixin {
  late String color;
  late String name;
}
mixin LockedMixin {
  late String id;
  late DateTime createdAt;
  LockedMixin$Actor? actor;
  @JsonKey(unknownEnumValue: LockReason.artemisUnknown)
  LockReason? lockReason;
}
mixin MarkedAsDuplicateMixin {
  late String id;
  late DateTime createdAt;
  MarkedAsDuplicateMixin$Actor? actor;
  MarkedAsDuplicateMixin$Canonical? canonical;
}
mixin MileStonedMixin {
  late String id;
  late DateTime createdAt;
  MileStonedMixin$Actor? actor;
  late String milestoneTitle;
}
mixin MovedColumnsInProjectMixin {
  late String id;
  late DateTime createdAt;
  MovedColumnsInProjectMixin$Actor? actor;
  late String previousProjectColumnName;
  late String projectColumnName;
  MovedColumnsInProjectMixin$Project? project;
}
mixin PinnedMixin {
  late String id;
  late DateTime createdAt;
  PinnedMixin$Actor? actor;
}
mixin RemovedFromProjectMixin {
  late String id;
  late DateTime createdAt;
  RemovedFromProjectMixin$Actor? actor;
  RemovedFromProjectMixin$Project? project;
  late String projectColumnName;
}
mixin RenamedTitleMixin {
  late String id;
  late DateTime createdAt;
  RenamedTitleMixin$Actor? actor;
  late String previousTitle;
  late String currentTitle;
}
mixin ReopenedMixin {
  late String id;
  late DateTime createdAt;
  ReopenedMixin$Actor? actor;
}
mixin UnassignedMixin {
  late String id;
  late DateTime createdAt;
  UnassignedMixin$Actor? actor;
  UnassignedMixin$Assignee? assignee;
}
mixin UnlabeledMixin {
  late String id;
  late DateTime createdAt;
  UnlabeledMixin$Actor? actor;
  late UnlabeledMixin$Label label;
}
mixin UnlockedMixin {
  late String id;
  late DateTime createdAt;
  UnlockedMixin$Actor? actor;
}
mixin UnmarkedAsDuplicateMixin {
  late String id;
  late DateTime createdAt;
  UnmarkedAsDuplicateMixin$Actor? actor;
}
mixin UnpinnedMixin {
  late String id;
  late DateTime createdAt;
  UnpinnedMixin$Actor? actor;
}
mixin BaseRefChangedMixin {
  late String id;
  late DateTime createdAt;
  BaseRefChangedMixin$Actor? actor;
  late String currentRefName;
  late String previousRefName;
}
mixin BaseRefDeletedMixin {
  late String id;
  late DateTime createdAt;
  BaseRefDeletedMixin$Actor? actor;
  String? baseRefName;
}
mixin BaseRefForcePushedMixin {
  late String id;
  late DateTime createdAt;
  BaseRefForcePushedMixin$Actor? actor;
}
mixin ConvertedToDraftMixin {
  late String id;
  late DateTime createdAt;
  ConvertedToDraftMixin$Actor? actor;
}
mixin HeadRefDeletedMixin {
  late String id;
  late DateTime createdAt;
  HeadRefDeletedMixin$Actor? actor;
  late String headRefName;
}
mixin HeadRefForcePushedMixin {
  late String id;
  late DateTime createdAt;
  HeadRefForcePushedMixin$Actor? actor;
}
mixin HeadRefRestoredMixin {
  late String id;
  late DateTime createdAt;
  HeadRefRestoredMixin$Actor? actor;
}
mixin MergedMixin {
  late String id;
  late DateTime createdAt;
  MergedMixin$Actor? actor;
  late String mergeRefName;
}
mixin PullRequestCommitMixin {
  late String id;
  late PullRequestCommitMixin$Commit commit;
}
mixin PullRequestReviewMixin {
  late String id;
  late DateTime createdAt;
  PullRequestReviewMixin$Author? author;
  @JsonKey(unknownEnumValue: CommentAuthorAssociation.artemisUnknown)
  late CommentAuthorAssociation authorAssociation;
  late String body;
  late String bodyHTML;
  late String bodyText;
}
mixin ReadyForReviewMixin {
  late String id;
  late DateTime createdAt;
  ReadyForReviewMixin$Actor? actor;
}
mixin ReviewDismissedMixin {
  late String id;
  late DateTime createdAt;
  ReviewDismissedMixin$Actor? actor;
  String? dismissalMessage;
  String? dismissalMessageHTML;
  @JsonKey(unknownEnumValue: PullRequestReviewState.artemisUnknown)
  late PullRequestReviewState previousReviewState;
}
mixin ReviewRequestedMixin {
  late String id;
  late DateTime createdAt;
  ReviewRequestedMixin$Actor? actor;
  ReviewRequestedMixin$RequestedReviewer? requestedReviewer;
}

@JsonSerializable(explicitToJson: true)
class GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$AddedToProjectEvent
    extends GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node
    with EquatableMixin, AddedToProjectMixin {
  GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$AddedToProjectEvent();

  factory GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$AddedToProjectEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$AddedToProjectEventFromJson(
          json);

  @override
  List<Object?> get props => [id, createdAt, actor, projectColumnName, project];
  Map<String, dynamic> toJson() =>
      _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$AddedToProjectEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$AssignedEvent
    extends GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node
    with EquatableMixin, AssignedMixin {
  GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$AssignedEvent();

  factory GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$AssignedEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$AssignedEventFromJson(
          json);

  @override
  List<Object?> get props => [id, createdAt, actor, assignee];
  Map<String, dynamic> toJson() =>
      _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$AssignedEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$ClosedEvent
    extends GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node
    with EquatableMixin, ClosedMixin {
  GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$ClosedEvent();

  factory GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$ClosedEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$ClosedEventFromJson(
          json);

  @override
  List<Object?> get props => [id, createdAt, actor];
  Map<String, dynamic> toJson() =>
      _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$ClosedEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$CrossReferencedEvent
    extends GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node
    with EquatableMixin, CrossReferenceMixin {
  GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$CrossReferencedEvent();

  factory GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$CrossReferencedEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$CrossReferencedEventFromJson(
          json);

  @override
  List<Object?> get props => [id, createdAt, actor, source, isCrossRepository];
  Map<String, dynamic> toJson() =>
      _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$CrossReferencedEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$DemilestonedEvent
    extends GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node
    with EquatableMixin, DeMileStonedMixin {
  GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$DemilestonedEvent();

  factory GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$DemilestonedEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$DemilestonedEventFromJson(
          json);

  @override
  List<Object?> get props => [id, createdAt, actor, milestoneTitle];
  Map<String, dynamic> toJson() =>
      _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$DemilestonedEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$IssueComment
    extends GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node
    with EquatableMixin, IssueCommentMixin {
  GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$IssueComment();

  factory GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$IssueComment.fromJson(
          Map<String, dynamic> json) =>
      _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$IssueCommentFromJson(
          json);

  @override
  List<Object?> get props => [
        id,
        createdAt,
        author,
        authorAssociation,
        body,
        bodyHTML,
        lastEditedAt,
        isMinimized,
        minimizedReason,
        reactionGroups,
        viewerCanMinimize,
        viewerCanDelete,
        viewerCanUpdate,
        viewerDidAuthor,
        viewerCannotUpdateReasons,
        viewerCanReact
      ];
  Map<String, dynamic> toJson() =>
      _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$IssueCommentToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$LabeledEvent
    extends GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node
    with EquatableMixin, LabeledMixin {
  GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$LabeledEvent();

  factory GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$LabeledEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$LabeledEventFromJson(
          json);

  @override
  List<Object?> get props => [id, createdAt, actor, label];
  Map<String, dynamic> toJson() =>
      _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$LabeledEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$LockedEvent
    extends GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node
    with EquatableMixin, LockedMixin {
  GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$LockedEvent();

  factory GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$LockedEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$LockedEventFromJson(
          json);

  @override
  List<Object?> get props => [id, createdAt, actor, lockReason];
  Map<String, dynamic> toJson() =>
      _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$LockedEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$MarkedAsDuplicateEvent
    extends GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node
    with EquatableMixin, MarkedAsDuplicateMixin {
  GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$MarkedAsDuplicateEvent();

  factory GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$MarkedAsDuplicateEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$MarkedAsDuplicateEventFromJson(
          json);

  @override
  List<Object?> get props => [id, createdAt, actor, canonical];
  Map<String, dynamic> toJson() =>
      _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$MarkedAsDuplicateEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$MilestonedEvent
    extends GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node
    with EquatableMixin, MileStonedMixin {
  GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$MilestonedEvent();

  factory GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$MilestonedEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$MilestonedEventFromJson(
          json);

  @override
  List<Object?> get props => [id, createdAt, actor, milestoneTitle];
  Map<String, dynamic> toJson() =>
      _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$MilestonedEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$MovedColumnsInProjectEvent
    extends GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node
    with EquatableMixin, MovedColumnsInProjectMixin {
  GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$MovedColumnsInProjectEvent();

  factory GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$MovedColumnsInProjectEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$MovedColumnsInProjectEventFromJson(
          json);

  @override
  List<Object?> get props => [
        id,
        createdAt,
        actor,
        previousProjectColumnName,
        projectColumnName,
        project
      ];
  Map<String, dynamic> toJson() =>
      _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$MovedColumnsInProjectEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$PinnedEvent
    extends GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node
    with EquatableMixin, PinnedMixin {
  GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$PinnedEvent();

  factory GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$PinnedEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$PinnedEventFromJson(
          json);

  @override
  List<Object?> get props => [id, createdAt, actor];
  Map<String, dynamic> toJson() =>
      _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$PinnedEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$RemovedFromProjectEvent
    extends GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node
    with EquatableMixin, RemovedFromProjectMixin {
  GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$RemovedFromProjectEvent();

  factory GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$RemovedFromProjectEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$RemovedFromProjectEventFromJson(
          json);

  @override
  List<Object?> get props => [id, createdAt, actor, project, projectColumnName];
  Map<String, dynamic> toJson() =>
      _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$RemovedFromProjectEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$RenamedTitleEvent
    extends GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node
    with EquatableMixin, RenamedTitleMixin {
  GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$RenamedTitleEvent();

  factory GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$RenamedTitleEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$RenamedTitleEventFromJson(
          json);

  @override
  List<Object?> get props =>
      [id, createdAt, actor, previousTitle, currentTitle];
  Map<String, dynamic> toJson() =>
      _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$RenamedTitleEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$ReopenedEvent
    extends GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node
    with EquatableMixin, ReopenedMixin {
  GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$ReopenedEvent();

  factory GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$ReopenedEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$ReopenedEventFromJson(
          json);

  @override
  List<Object?> get props => [id, createdAt, actor];
  Map<String, dynamic> toJson() =>
      _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$ReopenedEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$UnassignedEvent
    extends GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node
    with EquatableMixin, UnassignedMixin {
  GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$UnassignedEvent();

  factory GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$UnassignedEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$UnassignedEventFromJson(
          json);

  @override
  List<Object?> get props => [id, createdAt, actor, assignee];
  Map<String, dynamic> toJson() =>
      _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$UnassignedEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$UnlabeledEvent
    extends GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node
    with EquatableMixin, UnlabeledMixin {
  GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$UnlabeledEvent();

  factory GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$UnlabeledEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$UnlabeledEventFromJson(
          json);

  @override
  List<Object?> get props => [id, createdAt, actor, label];
  Map<String, dynamic> toJson() =>
      _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$UnlabeledEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$UnlockedEvent
    extends GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node
    with EquatableMixin, UnlockedMixin {
  GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$UnlockedEvent();

  factory GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$UnlockedEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$UnlockedEventFromJson(
          json);

  @override
  List<Object?> get props => [id, createdAt, actor];
  Map<String, dynamic> toJson() =>
      _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$UnlockedEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$UnmarkedAsDuplicateEvent
    extends GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node
    with EquatableMixin, UnmarkedAsDuplicateMixin {
  GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$UnmarkedAsDuplicateEvent();

  factory GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$UnmarkedAsDuplicateEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$UnmarkedAsDuplicateEventFromJson(
          json);

  @override
  List<Object?> get props => [id, createdAt, actor];
  Map<String, dynamic> toJson() =>
      _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$UnmarkedAsDuplicateEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$UnpinnedEvent
    extends GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node
    with EquatableMixin, UnpinnedMixin {
  GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$UnpinnedEvent();

  factory GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$UnpinnedEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$UnpinnedEventFromJson(
          json);

  @override
  List<Object?> get props => [id, createdAt, actor];
  Map<String, dynamic> toJson() =>
      _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$UnpinnedEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node
    extends JsonSerializable with EquatableMixin {
  GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node();

  factory GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node.fromJson(
      Map<String, dynamic> json) {
    switch (json['__typename'].toString()) {
      case r'AddedToProjectEvent':
        return GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$AddedToProjectEvent
            .fromJson(json);
      case r'AssignedEvent':
        return GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$AssignedEvent
            .fromJson(json);
      case r'ClosedEvent':
        return GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$ClosedEvent
            .fromJson(json);
      case r'CrossReferencedEvent':
        return GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$CrossReferencedEvent
            .fromJson(json);
      case r'DemilestonedEvent':
        return GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$DemilestonedEvent
            .fromJson(json);
      case r'IssueComment':
        return GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$IssueComment
            .fromJson(json);
      case r'LabeledEvent':
        return GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$LabeledEvent
            .fromJson(json);
      case r'LockedEvent':
        return GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$LockedEvent
            .fromJson(json);
      case r'MarkedAsDuplicateEvent':
        return GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$MarkedAsDuplicateEvent
            .fromJson(json);
      case r'MilestonedEvent':
        return GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$MilestonedEvent
            .fromJson(json);
      case r'MovedColumnsInProjectEvent':
        return GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$MovedColumnsInProjectEvent
            .fromJson(json);
      case r'PinnedEvent':
        return GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$PinnedEvent
            .fromJson(json);
      case r'RemovedFromProjectEvent':
        return GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$RemovedFromProjectEvent
            .fromJson(json);
      case r'RenamedTitleEvent':
        return GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$RenamedTitleEvent
            .fromJson(json);
      case r'ReopenedEvent':
        return GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$ReopenedEvent
            .fromJson(json);
      case r'UnassignedEvent':
        return GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$UnassignedEvent
            .fromJson(json);
      case r'UnlabeledEvent':
        return GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$UnlabeledEvent
            .fromJson(json);
      case r'UnlockedEvent':
        return GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$UnlockedEvent
            .fromJson(json);
      case r'UnmarkedAsDuplicateEvent':
        return GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$UnmarkedAsDuplicateEvent
            .fromJson(json);
      case r'UnpinnedEvent':
        return GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$UnpinnedEvent
            .fromJson(json);
      default:
    }
    return _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$NodeFromJson(
        json);
  }

  @JsonKey(name: '__typename')
  String? $$typename;

  @override
  List<Object?> get props => [$$typename];
  Map<String, dynamic> toJson() {
    switch ($$typename) {
      case r'AddedToProjectEvent':
        return (this
                as GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$AddedToProjectEvent)
            .toJson();
      case r'AssignedEvent':
        return (this
                as GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$AssignedEvent)
            .toJson();
      case r'ClosedEvent':
        return (this
                as GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$ClosedEvent)
            .toJson();
      case r'CrossReferencedEvent':
        return (this
                as GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$CrossReferencedEvent)
            .toJson();
      case r'DemilestonedEvent':
        return (this
                as GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$DemilestonedEvent)
            .toJson();
      case r'IssueComment':
        return (this
                as GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$IssueComment)
            .toJson();
      case r'LabeledEvent':
        return (this
                as GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$LabeledEvent)
            .toJson();
      case r'LockedEvent':
        return (this
                as GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$LockedEvent)
            .toJson();
      case r'MarkedAsDuplicateEvent':
        return (this
                as GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$MarkedAsDuplicateEvent)
            .toJson();
      case r'MilestonedEvent':
        return (this
                as GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$MilestonedEvent)
            .toJson();
      case r'MovedColumnsInProjectEvent':
        return (this
                as GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$MovedColumnsInProjectEvent)
            .toJson();
      case r'PinnedEvent':
        return (this
                as GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$PinnedEvent)
            .toJson();
      case r'RemovedFromProjectEvent':
        return (this
                as GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$RemovedFromProjectEvent)
            .toJson();
      case r'RenamedTitleEvent':
        return (this
                as GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$RenamedTitleEvent)
            .toJson();
      case r'ReopenedEvent':
        return (this
                as GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$ReopenedEvent)
            .toJson();
      case r'UnassignedEvent':
        return (this
                as GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$UnassignedEvent)
            .toJson();
      case r'UnlabeledEvent':
        return (this
                as GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$UnlabeledEvent)
            .toJson();
      case r'UnlockedEvent':
        return (this
                as GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$UnlockedEvent)
            .toJson();
      case r'UnmarkedAsDuplicateEvent':
        return (this
                as GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$UnmarkedAsDuplicateEvent)
            .toJson();
      case r'UnpinnedEvent':
        return (this
                as GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$UnpinnedEvent)
            .toJson();
      default:
    }
    return _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$NodeToJson(
        this);
  }
}

@JsonSerializable(explicitToJson: true)
class GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges
    extends JsonSerializable with EquatableMixin {
  GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges();

  factory GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges.fromJson(
          Map<String, dynamic> json) =>
      _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$EdgesFromJson(
          json);

  GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node? node;

  late String cursor;

  @override
  List<Object?> get props => [node, cursor];
  Map<String, dynamic> toJson() =>
      _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$EdgesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetIssueTimeline$Query$Repository$Issue$TimelineItems
    extends JsonSerializable with EquatableMixin {
  GetIssueTimeline$Query$Repository$Issue$TimelineItems();

  factory GetIssueTimeline$Query$Repository$Issue$TimelineItems.fromJson(
          Map<String, dynamic> json) =>
      _$GetIssueTimeline$Query$Repository$Issue$TimelineItemsFromJson(json);

  List<GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges?>? edges;

  @override
  List<Object?> get props => [edges];
  Map<String, dynamic> toJson() =>
      _$GetIssueTimeline$Query$Repository$Issue$TimelineItemsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetIssueTimeline$Query$Repository$Issue extends JsonSerializable
    with EquatableMixin {
  GetIssueTimeline$Query$Repository$Issue();

  factory GetIssueTimeline$Query$Repository$Issue.fromJson(
          Map<String, dynamic> json) =>
      _$GetIssueTimeline$Query$Repository$IssueFromJson(json);

  late GetIssueTimeline$Query$Repository$Issue$TimelineItems timelineItems;

  @override
  List<Object?> get props => [timelineItems];
  Map<String, dynamic> toJson() =>
      _$GetIssueTimeline$Query$Repository$IssueToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetIssueTimeline$Query$Repository extends JsonSerializable
    with EquatableMixin {
  GetIssueTimeline$Query$Repository();

  factory GetIssueTimeline$Query$Repository.fromJson(
          Map<String, dynamic> json) =>
      _$GetIssueTimeline$Query$RepositoryFromJson(json);

  GetIssueTimeline$Query$Repository$Issue? issue;

  @override
  List<Object?> get props => [issue];
  Map<String, dynamic> toJson() =>
      _$GetIssueTimeline$Query$RepositoryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetIssueTimeline$Query extends JsonSerializable with EquatableMixin {
  GetIssueTimeline$Query();

  factory GetIssueTimeline$Query.fromJson(Map<String, dynamic> json) =>
      _$GetIssueTimeline$QueryFromJson(json);

  GetIssueTimeline$Query$Repository? repository;

  @override
  List<Object?> get props => [repository];
  Map<String, dynamic> toJson() => _$GetIssueTimeline$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AddedToProjectMixin$Actor extends JsonSerializable
    with EquatableMixin, ActorMixin {
  AddedToProjectMixin$Actor();

  factory AddedToProjectMixin$Actor.fromJson(Map<String, dynamic> json) =>
      _$AddedToProjectMixin$ActorFromJson(json);

  @override
  List<Object?> get props => [avatarUrl, login];
  Map<String, dynamic> toJson() => _$AddedToProjectMixin$ActorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AddedToProjectMixin$Project extends JsonSerializable with EquatableMixin {
  AddedToProjectMixin$Project();

  factory AddedToProjectMixin$Project.fromJson(Map<String, dynamic> json) =>
      _$AddedToProjectMixin$ProjectFromJson(json);

  late String name;

  @override
  List<Object?> get props => [name];
  Map<String, dynamic> toJson() => _$AddedToProjectMixin$ProjectToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AssignedMixin$Actor extends JsonSerializable
    with EquatableMixin, ActorMixin {
  AssignedMixin$Actor();

  factory AssignedMixin$Actor.fromJson(Map<String, dynamic> json) =>
      _$AssignedMixin$ActorFromJson(json);

  @override
  List<Object?> get props => [avatarUrl, login];
  Map<String, dynamic> toJson() => _$AssignedMixin$ActorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AssignedMixin$Assignee$User extends AssignedMixin$Assignee
    with EquatableMixin, ActorMixin {
  AssignedMixin$Assignee$User();

  factory AssignedMixin$Assignee$User.fromJson(Map<String, dynamic> json) =>
      _$AssignedMixin$Assignee$UserFromJson(json);

  @override
  List<Object?> get props => [avatarUrl, login];
  Map<String, dynamic> toJson() => _$AssignedMixin$Assignee$UserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AssignedMixin$Assignee$Bot extends AssignedMixin$Assignee
    with EquatableMixin, ActorMixin {
  AssignedMixin$Assignee$Bot();

  factory AssignedMixin$Assignee$Bot.fromJson(Map<String, dynamic> json) =>
      _$AssignedMixin$Assignee$BotFromJson(json);

  @override
  List<Object?> get props => [avatarUrl, login];
  Map<String, dynamic> toJson() => _$AssignedMixin$Assignee$BotToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AssignedMixin$Assignee$Mannequin extends AssignedMixin$Assignee
    with EquatableMixin, ActorMixin {
  AssignedMixin$Assignee$Mannequin();

  factory AssignedMixin$Assignee$Mannequin.fromJson(
          Map<String, dynamic> json) =>
      _$AssignedMixin$Assignee$MannequinFromJson(json);

  @override
  List<Object?> get props => [avatarUrl, login];
  Map<String, dynamic> toJson() =>
      _$AssignedMixin$Assignee$MannequinToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AssignedMixin$Assignee$Organization extends AssignedMixin$Assignee
    with EquatableMixin, ActorMixin {
  AssignedMixin$Assignee$Organization();

  factory AssignedMixin$Assignee$Organization.fromJson(
          Map<String, dynamic> json) =>
      _$AssignedMixin$Assignee$OrganizationFromJson(json);

  @override
  List<Object?> get props => [avatarUrl, login];
  Map<String, dynamic> toJson() =>
      _$AssignedMixin$Assignee$OrganizationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AssignedMixin$Assignee extends JsonSerializable with EquatableMixin {
  AssignedMixin$Assignee();

  factory AssignedMixin$Assignee.fromJson(Map<String, dynamic> json) {
    switch (json['__typename'].toString()) {
      case r'User':
        return AssignedMixin$Assignee$User.fromJson(json);
      case r'Bot':
        return AssignedMixin$Assignee$Bot.fromJson(json);
      case r'Mannequin':
        return AssignedMixin$Assignee$Mannequin.fromJson(json);
      case r'Organization':
        return AssignedMixin$Assignee$Organization.fromJson(json);
      default:
    }
    return _$AssignedMixin$AssigneeFromJson(json);
  }

  @JsonKey(name: '__typename')
  String? $$typename;

  @override
  List<Object?> get props => [$$typename];
  Map<String, dynamic> toJson() {
    switch ($$typename) {
      case r'User':
        return (this as AssignedMixin$Assignee$User).toJson();
      case r'Bot':
        return (this as AssignedMixin$Assignee$Bot).toJson();
      case r'Mannequin':
        return (this as AssignedMixin$Assignee$Mannequin).toJson();
      case r'Organization':
        return (this as AssignedMixin$Assignee$Organization).toJson();
      default:
    }
    return _$AssignedMixin$AssigneeToJson(this);
  }
}

@JsonSerializable(explicitToJson: true)
class ClosedMixin$Actor extends JsonSerializable
    with EquatableMixin, ActorMixin {
  ClosedMixin$Actor();

  factory ClosedMixin$Actor.fromJson(Map<String, dynamic> json) =>
      _$ClosedMixin$ActorFromJson(json);

  @override
  List<Object?> get props => [avatarUrl, login];
  Map<String, dynamic> toJson() => _$ClosedMixin$ActorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CrossReferenceMixin$Actor extends JsonSerializable
    with EquatableMixin, ActorMixin {
  CrossReferenceMixin$Actor();

  factory CrossReferenceMixin$Actor.fromJson(Map<String, dynamic> json) =>
      _$CrossReferenceMixin$ActorFromJson(json);

  @override
  List<Object?> get props => [avatarUrl, login];
  Map<String, dynamic> toJson() => _$CrossReferenceMixin$ActorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CrossReferenceMixin$Source$Issue extends CrossReferenceMixin$Source
    with EquatableMixin, IssueMixin {
  CrossReferenceMixin$Source$Issue();

  factory CrossReferenceMixin$Source$Issue.fromJson(
          Map<String, dynamic> json) =>
      _$CrossReferenceMixin$Source$IssueFromJson(json);

  @override
  List<Object?> get props => [url, title, number, issueState, repository];
  Map<String, dynamic> toJson() =>
      _$CrossReferenceMixin$Source$IssueToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CrossReferenceMixin$Source$PullRequest extends CrossReferenceMixin$Source
    with EquatableMixin, PullRequestMixin {
  CrossReferenceMixin$Source$PullRequest();

  factory CrossReferenceMixin$Source$PullRequest.fromJson(
          Map<String, dynamic> json) =>
      _$CrossReferenceMixin$Source$PullRequestFromJson(json);

  @override
  List<Object?> get props => [url, title, number, pullState, repository];
  Map<String, dynamic> toJson() =>
      _$CrossReferenceMixin$Source$PullRequestToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CrossReferenceMixin$Source extends JsonSerializable with EquatableMixin {
  CrossReferenceMixin$Source();

  factory CrossReferenceMixin$Source.fromJson(Map<String, dynamic> json) {
    switch (json['__typename'].toString()) {
      case r'Issue':
        return CrossReferenceMixin$Source$Issue.fromJson(json);
      case r'PullRequest':
        return CrossReferenceMixin$Source$PullRequest.fromJson(json);
      default:
    }
    return _$CrossReferenceMixin$SourceFromJson(json);
  }

  @JsonKey(name: '__typename')
  String? $$typename;

  @override
  List<Object?> get props => [$$typename];
  Map<String, dynamic> toJson() {
    switch ($$typename) {
      case r'Issue':
        return (this as CrossReferenceMixin$Source$Issue).toJson();
      case r'PullRequest':
        return (this as CrossReferenceMixin$Source$PullRequest).toJson();
      default:
    }
    return _$CrossReferenceMixin$SourceToJson(this);
  }
}

@JsonSerializable(explicitToJson: true)
class IssueMixin$Repository extends JsonSerializable
    with EquatableMixin, RepoMixin {
  IssueMixin$Repository();

  factory IssueMixin$Repository.fromJson(Map<String, dynamic> json) =>
      _$IssueMixin$RepositoryFromJson(json);

  @override
  List<Object?> get props => [url, nameWithOwner];
  Map<String, dynamic> toJson() => _$IssueMixin$RepositoryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PullRequestMixin$Repository extends JsonSerializable
    with EquatableMixin, RepoMixin {
  PullRequestMixin$Repository();

  factory PullRequestMixin$Repository.fromJson(Map<String, dynamic> json) =>
      _$PullRequestMixin$RepositoryFromJson(json);

  @override
  List<Object?> get props => [url, nameWithOwner];
  Map<String, dynamic> toJson() => _$PullRequestMixin$RepositoryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DeMileStonedMixin$Actor extends JsonSerializable
    with EquatableMixin, ActorMixin {
  DeMileStonedMixin$Actor();

  factory DeMileStonedMixin$Actor.fromJson(Map<String, dynamic> json) =>
      _$DeMileStonedMixin$ActorFromJson(json);

  @override
  List<Object?> get props => [avatarUrl, login];
  Map<String, dynamic> toJson() => _$DeMileStonedMixin$ActorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class IssueCommentMixin$Author extends JsonSerializable with EquatableMixin {
  IssueCommentMixin$Author();

  factory IssueCommentMixin$Author.fromJson(Map<String, dynamic> json) =>
      _$IssueCommentMixin$AuthorFromJson(json);

  late Uri avatarUrl;

  late String login;

  @override
  List<Object?> get props => [avatarUrl, login];
  Map<String, dynamic> toJson() => _$IssueCommentMixin$AuthorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class IssueCommentMixin$ReactionGroups$Users extends JsonSerializable
    with EquatableMixin {
  IssueCommentMixin$ReactionGroups$Users();

  factory IssueCommentMixin$ReactionGroups$Users.fromJson(
          Map<String, dynamic> json) =>
      _$IssueCommentMixin$ReactionGroups$UsersFromJson(json);

  late int totalCount;

  @override
  List<Object?> get props => [totalCount];
  Map<String, dynamic> toJson() =>
      _$IssueCommentMixin$ReactionGroups$UsersToJson(this);
}

@JsonSerializable(explicitToJson: true)
class IssueCommentMixin$ReactionGroups extends JsonSerializable
    with EquatableMixin {
  IssueCommentMixin$ReactionGroups();

  factory IssueCommentMixin$ReactionGroups.fromJson(
          Map<String, dynamic> json) =>
      _$IssueCommentMixin$ReactionGroupsFromJson(json);

  @JsonKey(unknownEnumValue: ReactionContent.artemisUnknown)
  late ReactionContent content;

  late bool viewerHasReacted;

  late IssueCommentMixin$ReactionGroups$Users users;

  @override
  List<Object?> get props => [content, viewerHasReacted, users];
  Map<String, dynamic> toJson() =>
      _$IssueCommentMixin$ReactionGroupsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class LabeledMixin$Actor extends JsonSerializable
    with EquatableMixin, ActorMixin {
  LabeledMixin$Actor();

  factory LabeledMixin$Actor.fromJson(Map<String, dynamic> json) =>
      _$LabeledMixin$ActorFromJson(json);

  @override
  List<Object?> get props => [avatarUrl, login];
  Map<String, dynamic> toJson() => _$LabeledMixin$ActorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class LabeledMixin$Label extends JsonSerializable
    with EquatableMixin, LabelMixin {
  LabeledMixin$Label();

  factory LabeledMixin$Label.fromJson(Map<String, dynamic> json) =>
      _$LabeledMixin$LabelFromJson(json);

  @override
  List<Object?> get props => [color, name];
  Map<String, dynamic> toJson() => _$LabeledMixin$LabelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class LockedMixin$Actor extends JsonSerializable
    with EquatableMixin, ActorMixin {
  LockedMixin$Actor();

  factory LockedMixin$Actor.fromJson(Map<String, dynamic> json) =>
      _$LockedMixin$ActorFromJson(json);

  @override
  List<Object?> get props => [avatarUrl, login];
  Map<String, dynamic> toJson() => _$LockedMixin$ActorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class MarkedAsDuplicateMixin$Actor extends JsonSerializable
    with EquatableMixin, ActorMixin {
  MarkedAsDuplicateMixin$Actor();

  factory MarkedAsDuplicateMixin$Actor.fromJson(Map<String, dynamic> json) =>
      _$MarkedAsDuplicateMixin$ActorFromJson(json);

  @override
  List<Object?> get props => [avatarUrl, login];
  Map<String, dynamic> toJson() => _$MarkedAsDuplicateMixin$ActorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class MarkedAsDuplicateMixin$Canonical$Issue
    extends MarkedAsDuplicateMixin$Canonical with EquatableMixin, IssueMixin {
  MarkedAsDuplicateMixin$Canonical$Issue();

  factory MarkedAsDuplicateMixin$Canonical$Issue.fromJson(
          Map<String, dynamic> json) =>
      _$MarkedAsDuplicateMixin$Canonical$IssueFromJson(json);

  @override
  List<Object?> get props => [url, title, number, issueState, repository];
  Map<String, dynamic> toJson() =>
      _$MarkedAsDuplicateMixin$Canonical$IssueToJson(this);
}

@JsonSerializable(explicitToJson: true)
class MarkedAsDuplicateMixin$Canonical$PullRequest
    extends MarkedAsDuplicateMixin$Canonical
    with EquatableMixin, PullRequestMixin {
  MarkedAsDuplicateMixin$Canonical$PullRequest();

  factory MarkedAsDuplicateMixin$Canonical$PullRequest.fromJson(
          Map<String, dynamic> json) =>
      _$MarkedAsDuplicateMixin$Canonical$PullRequestFromJson(json);

  @override
  List<Object?> get props => [url, title, number, pullState, repository];
  Map<String, dynamic> toJson() =>
      _$MarkedAsDuplicateMixin$Canonical$PullRequestToJson(this);
}

@JsonSerializable(explicitToJson: true)
class MarkedAsDuplicateMixin$Canonical extends JsonSerializable
    with EquatableMixin {
  MarkedAsDuplicateMixin$Canonical();

  factory MarkedAsDuplicateMixin$Canonical.fromJson(Map<String, dynamic> json) {
    switch (json['__typename'].toString()) {
      case r'Issue':
        return MarkedAsDuplicateMixin$Canonical$Issue.fromJson(json);
      case r'PullRequest':
        return MarkedAsDuplicateMixin$Canonical$PullRequest.fromJson(json);
      default:
    }
    return _$MarkedAsDuplicateMixin$CanonicalFromJson(json);
  }

  @JsonKey(name: '__typename')
  String? $$typename;

  @override
  List<Object?> get props => [$$typename];
  Map<String, dynamic> toJson() {
    switch ($$typename) {
      case r'Issue':
        return (this as MarkedAsDuplicateMixin$Canonical$Issue).toJson();
      case r'PullRequest':
        return (this as MarkedAsDuplicateMixin$Canonical$PullRequest).toJson();
      default:
    }
    return _$MarkedAsDuplicateMixin$CanonicalToJson(this);
  }
}

@JsonSerializable(explicitToJson: true)
class MileStonedMixin$Actor extends JsonSerializable
    with EquatableMixin, ActorMixin {
  MileStonedMixin$Actor();

  factory MileStonedMixin$Actor.fromJson(Map<String, dynamic> json) =>
      _$MileStonedMixin$ActorFromJson(json);

  @override
  List<Object?> get props => [avatarUrl, login];
  Map<String, dynamic> toJson() => _$MileStonedMixin$ActorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class MovedColumnsInProjectMixin$Actor extends JsonSerializable
    with EquatableMixin, ActorMixin {
  MovedColumnsInProjectMixin$Actor();

  factory MovedColumnsInProjectMixin$Actor.fromJson(
          Map<String, dynamic> json) =>
      _$MovedColumnsInProjectMixin$ActorFromJson(json);

  @override
  List<Object?> get props => [avatarUrl, login];
  Map<String, dynamic> toJson() =>
      _$MovedColumnsInProjectMixin$ActorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class MovedColumnsInProjectMixin$Project extends JsonSerializable
    with EquatableMixin {
  MovedColumnsInProjectMixin$Project();

  factory MovedColumnsInProjectMixin$Project.fromJson(
          Map<String, dynamic> json) =>
      _$MovedColumnsInProjectMixin$ProjectFromJson(json);

  late String name;

  @override
  List<Object?> get props => [name];
  Map<String, dynamic> toJson() =>
      _$MovedColumnsInProjectMixin$ProjectToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PinnedMixin$Actor extends JsonSerializable
    with EquatableMixin, ActorMixin {
  PinnedMixin$Actor();

  factory PinnedMixin$Actor.fromJson(Map<String, dynamic> json) =>
      _$PinnedMixin$ActorFromJson(json);

  @override
  List<Object?> get props => [avatarUrl, login];
  Map<String, dynamic> toJson() => _$PinnedMixin$ActorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RemovedFromProjectMixin$Actor extends JsonSerializable
    with EquatableMixin, ActorMixin {
  RemovedFromProjectMixin$Actor();

  factory RemovedFromProjectMixin$Actor.fromJson(Map<String, dynamic> json) =>
      _$RemovedFromProjectMixin$ActorFromJson(json);

  @override
  List<Object?> get props => [avatarUrl, login];
  Map<String, dynamic> toJson() => _$RemovedFromProjectMixin$ActorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RemovedFromProjectMixin$Project extends JsonSerializable
    with EquatableMixin {
  RemovedFromProjectMixin$Project();

  factory RemovedFromProjectMixin$Project.fromJson(Map<String, dynamic> json) =>
      _$RemovedFromProjectMixin$ProjectFromJson(json);

  late String name;

  @override
  List<Object?> get props => [name];
  Map<String, dynamic> toJson() =>
      _$RemovedFromProjectMixin$ProjectToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RenamedTitleMixin$Actor extends JsonSerializable
    with EquatableMixin, ActorMixin {
  RenamedTitleMixin$Actor();

  factory RenamedTitleMixin$Actor.fromJson(Map<String, dynamic> json) =>
      _$RenamedTitleMixin$ActorFromJson(json);

  @override
  List<Object?> get props => [avatarUrl, login];
  Map<String, dynamic> toJson() => _$RenamedTitleMixin$ActorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ReopenedMixin$Actor extends JsonSerializable
    with EquatableMixin, ActorMixin {
  ReopenedMixin$Actor();

  factory ReopenedMixin$Actor.fromJson(Map<String, dynamic> json) =>
      _$ReopenedMixin$ActorFromJson(json);

  @override
  List<Object?> get props => [avatarUrl, login];
  Map<String, dynamic> toJson() => _$ReopenedMixin$ActorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UnassignedMixin$Actor extends JsonSerializable
    with EquatableMixin, ActorMixin {
  UnassignedMixin$Actor();

  factory UnassignedMixin$Actor.fromJson(Map<String, dynamic> json) =>
      _$UnassignedMixin$ActorFromJson(json);

  @override
  List<Object?> get props => [avatarUrl, login];
  Map<String, dynamic> toJson() => _$UnassignedMixin$ActorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UnassignedMixin$Assignee$User extends UnassignedMixin$Assignee
    with EquatableMixin, ActorMixin {
  UnassignedMixin$Assignee$User();

  factory UnassignedMixin$Assignee$User.fromJson(Map<String, dynamic> json) =>
      _$UnassignedMixin$Assignee$UserFromJson(json);

  @override
  List<Object?> get props => [avatarUrl, login];
  Map<String, dynamic> toJson() => _$UnassignedMixin$Assignee$UserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UnassignedMixin$Assignee$Bot extends UnassignedMixin$Assignee
    with EquatableMixin, ActorMixin {
  UnassignedMixin$Assignee$Bot();

  factory UnassignedMixin$Assignee$Bot.fromJson(Map<String, dynamic> json) =>
      _$UnassignedMixin$Assignee$BotFromJson(json);

  @override
  List<Object?> get props => [avatarUrl, login];
  Map<String, dynamic> toJson() => _$UnassignedMixin$Assignee$BotToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UnassignedMixin$Assignee$Mannequin extends UnassignedMixin$Assignee
    with EquatableMixin, ActorMixin {
  UnassignedMixin$Assignee$Mannequin();

  factory UnassignedMixin$Assignee$Mannequin.fromJson(
          Map<String, dynamic> json) =>
      _$UnassignedMixin$Assignee$MannequinFromJson(json);

  @override
  List<Object?> get props => [avatarUrl, login];
  Map<String, dynamic> toJson() =>
      _$UnassignedMixin$Assignee$MannequinToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UnassignedMixin$Assignee$Organization extends UnassignedMixin$Assignee
    with EquatableMixin, ActorMixin {
  UnassignedMixin$Assignee$Organization();

  factory UnassignedMixin$Assignee$Organization.fromJson(
          Map<String, dynamic> json) =>
      _$UnassignedMixin$Assignee$OrganizationFromJson(json);

  @override
  List<Object?> get props => [avatarUrl, login];
  Map<String, dynamic> toJson() =>
      _$UnassignedMixin$Assignee$OrganizationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UnassignedMixin$Assignee extends JsonSerializable with EquatableMixin {
  UnassignedMixin$Assignee();

  factory UnassignedMixin$Assignee.fromJson(Map<String, dynamic> json) {
    switch (json['__typename'].toString()) {
      case r'User':
        return UnassignedMixin$Assignee$User.fromJson(json);
      case r'Bot':
        return UnassignedMixin$Assignee$Bot.fromJson(json);
      case r'Mannequin':
        return UnassignedMixin$Assignee$Mannequin.fromJson(json);
      case r'Organization':
        return UnassignedMixin$Assignee$Organization.fromJson(json);
      default:
    }
    return _$UnassignedMixin$AssigneeFromJson(json);
  }

  @JsonKey(name: '__typename')
  String? $$typename;

  @override
  List<Object?> get props => [$$typename];
  Map<String, dynamic> toJson() {
    switch ($$typename) {
      case r'User':
        return (this as UnassignedMixin$Assignee$User).toJson();
      case r'Bot':
        return (this as UnassignedMixin$Assignee$Bot).toJson();
      case r'Mannequin':
        return (this as UnassignedMixin$Assignee$Mannequin).toJson();
      case r'Organization':
        return (this as UnassignedMixin$Assignee$Organization).toJson();
      default:
    }
    return _$UnassignedMixin$AssigneeToJson(this);
  }
}

@JsonSerializable(explicitToJson: true)
class UnlabeledMixin$Actor extends JsonSerializable
    with EquatableMixin, ActorMixin {
  UnlabeledMixin$Actor();

  factory UnlabeledMixin$Actor.fromJson(Map<String, dynamic> json) =>
      _$UnlabeledMixin$ActorFromJson(json);

  @override
  List<Object?> get props => [avatarUrl, login];
  Map<String, dynamic> toJson() => _$UnlabeledMixin$ActorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UnlabeledMixin$Label extends JsonSerializable
    with EquatableMixin, LabelMixin {
  UnlabeledMixin$Label();

  factory UnlabeledMixin$Label.fromJson(Map<String, dynamic> json) =>
      _$UnlabeledMixin$LabelFromJson(json);

  @override
  List<Object?> get props => [color, name];
  Map<String, dynamic> toJson() => _$UnlabeledMixin$LabelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UnlockedMixin$Actor extends JsonSerializable
    with EquatableMixin, ActorMixin {
  UnlockedMixin$Actor();

  factory UnlockedMixin$Actor.fromJson(Map<String, dynamic> json) =>
      _$UnlockedMixin$ActorFromJson(json);

  @override
  List<Object?> get props => [avatarUrl, login];
  Map<String, dynamic> toJson() => _$UnlockedMixin$ActorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UnmarkedAsDuplicateMixin$Actor extends JsonSerializable
    with EquatableMixin, ActorMixin {
  UnmarkedAsDuplicateMixin$Actor();

  factory UnmarkedAsDuplicateMixin$Actor.fromJson(Map<String, dynamic> json) =>
      _$UnmarkedAsDuplicateMixin$ActorFromJson(json);

  @override
  List<Object?> get props => [avatarUrl, login];
  Map<String, dynamic> toJson() => _$UnmarkedAsDuplicateMixin$ActorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UnpinnedMixin$Actor extends JsonSerializable
    with EquatableMixin, ActorMixin {
  UnpinnedMixin$Actor();

  factory UnpinnedMixin$Actor.fromJson(Map<String, dynamic> json) =>
      _$UnpinnedMixin$ActorFromJson(json);

  @override
  List<Object?> get props => [avatarUrl, login];
  Map<String, dynamic> toJson() => _$UnpinnedMixin$ActorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$AddedToProjectEvent
    extends GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node
    with EquatableMixin, AddedToProjectMixin {
  GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$AddedToProjectEvent();

  factory GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$AddedToProjectEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$AddedToProjectEventFromJson(
          json);

  @override
  List<Object?> get props => [id, createdAt, actor, projectColumnName, project];
  Map<String, dynamic> toJson() =>
      _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$AddedToProjectEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$AssignedEvent
    extends GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node
    with EquatableMixin, AssignedMixin {
  GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$AssignedEvent();

  factory GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$AssignedEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$AssignedEventFromJson(
          json);

  @override
  List<Object?> get props => [id, createdAt, actor, assignee];
  Map<String, dynamic> toJson() =>
      _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$AssignedEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$BaseRefChangedEvent
    extends GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node
    with EquatableMixin, BaseRefChangedMixin {
  GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$BaseRefChangedEvent();

  factory GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$BaseRefChangedEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$BaseRefChangedEventFromJson(
          json);

  @override
  List<Object?> get props =>
      [id, createdAt, actor, currentRefName, previousRefName];
  Map<String, dynamic> toJson() =>
      _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$BaseRefChangedEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$BaseRefDeletedEvent
    extends GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node
    with EquatableMixin, BaseRefDeletedMixin {
  GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$BaseRefDeletedEvent();

  factory GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$BaseRefDeletedEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$BaseRefDeletedEventFromJson(
          json);

  @override
  List<Object?> get props => [id, createdAt, actor, baseRefName];
  Map<String, dynamic> toJson() =>
      _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$BaseRefDeletedEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$BaseRefForcePushedEvent
    extends GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node
    with EquatableMixin, BaseRefForcePushedMixin {
  GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$BaseRefForcePushedEvent();

  factory GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$BaseRefForcePushedEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$BaseRefForcePushedEventFromJson(
          json);

  @override
  List<Object?> get props => [id, createdAt, actor];
  Map<String, dynamic> toJson() =>
      _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$BaseRefForcePushedEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$ClosedEvent
    extends GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node
    with EquatableMixin, ClosedMixin {
  GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$ClosedEvent();

  factory GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$ClosedEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$ClosedEventFromJson(
          json);

  @override
  List<Object?> get props => [id, createdAt, actor];
  Map<String, dynamic> toJson() =>
      _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$ClosedEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$ConvertToDraftEvent
    extends GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node
    with EquatableMixin, ConvertedToDraftMixin {
  GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$ConvertToDraftEvent();

  factory GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$ConvertToDraftEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$ConvertToDraftEventFromJson(
          json);

  @override
  List<Object?> get props => [id, createdAt, actor];
  Map<String, dynamic> toJson() =>
      _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$ConvertToDraftEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$CrossReferencedEvent
    extends GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node
    with EquatableMixin, CrossReferenceMixin {
  GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$CrossReferencedEvent();

  factory GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$CrossReferencedEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$CrossReferencedEventFromJson(
          json);

  @override
  List<Object?> get props => [id, createdAt, actor, source, isCrossRepository];
  Map<String, dynamic> toJson() =>
      _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$CrossReferencedEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$DemilestonedEvent
    extends GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node
    with EquatableMixin, DeMileStonedMixin {
  GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$DemilestonedEvent();

  factory GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$DemilestonedEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$DemilestonedEventFromJson(
          json);

  @override
  List<Object?> get props => [id, createdAt, actor, milestoneTitle];
  Map<String, dynamic> toJson() =>
      _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$DemilestonedEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$HeadRefDeletedEvent
    extends GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node
    with EquatableMixin, HeadRefDeletedMixin {
  GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$HeadRefDeletedEvent();

  factory GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$HeadRefDeletedEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$HeadRefDeletedEventFromJson(
          json);

  @override
  List<Object?> get props => [id, createdAt, actor, headRefName];
  Map<String, dynamic> toJson() =>
      _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$HeadRefDeletedEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$HeadRefForcePushedEvent
    extends GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node
    with EquatableMixin, HeadRefForcePushedMixin {
  GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$HeadRefForcePushedEvent();

  factory GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$HeadRefForcePushedEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$HeadRefForcePushedEventFromJson(
          json);

  @override
  List<Object?> get props => [id, createdAt, actor];
  Map<String, dynamic> toJson() =>
      _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$HeadRefForcePushedEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$HeadRefRestoredEvent
    extends GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node
    with EquatableMixin, HeadRefRestoredMixin {
  GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$HeadRefRestoredEvent();

  factory GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$HeadRefRestoredEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$HeadRefRestoredEventFromJson(
          json);

  @override
  List<Object?> get props => [id, createdAt, actor];
  Map<String, dynamic> toJson() =>
      _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$HeadRefRestoredEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$IssueComment
    extends GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node
    with EquatableMixin, IssueCommentMixin {
  GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$IssueComment();

  factory GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$IssueComment.fromJson(
          Map<String, dynamic> json) =>
      _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$IssueCommentFromJson(
          json);

  @override
  List<Object?> get props => [
        id,
        createdAt,
        author,
        authorAssociation,
        body,
        bodyHTML,
        lastEditedAt,
        isMinimized,
        minimizedReason,
        reactionGroups,
        viewerCanMinimize,
        viewerCanDelete,
        viewerCanUpdate,
        viewerDidAuthor,
        viewerCannotUpdateReasons,
        viewerCanReact
      ];
  Map<String, dynamic> toJson() =>
      _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$IssueCommentToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$LabeledEvent
    extends GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node
    with EquatableMixin, LabeledMixin {
  GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$LabeledEvent();

  factory GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$LabeledEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$LabeledEventFromJson(
          json);

  @override
  List<Object?> get props => [id, createdAt, actor, label];
  Map<String, dynamic> toJson() =>
      _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$LabeledEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$LockedEvent
    extends GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node
    with EquatableMixin, LockedMixin {
  GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$LockedEvent();

  factory GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$LockedEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$LockedEventFromJson(
          json);

  @override
  List<Object?> get props => [id, createdAt, actor, lockReason];
  Map<String, dynamic> toJson() =>
      _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$LockedEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$MarkedAsDuplicateEvent
    extends GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node
    with EquatableMixin, MarkedAsDuplicateMixin {
  GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$MarkedAsDuplicateEvent();

  factory GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$MarkedAsDuplicateEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$MarkedAsDuplicateEventFromJson(
          json);

  @override
  List<Object?> get props => [id, createdAt, actor, canonical];
  Map<String, dynamic> toJson() =>
      _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$MarkedAsDuplicateEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$MergedEvent
    extends GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node
    with EquatableMixin, MergedMixin {
  GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$MergedEvent();

  factory GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$MergedEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$MergedEventFromJson(
          json);

  @override
  List<Object?> get props => [id, createdAt, actor, mergeRefName];
  Map<String, dynamic> toJson() =>
      _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$MergedEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$MilestonedEvent
    extends GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node
    with EquatableMixin, MileStonedMixin {
  GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$MilestonedEvent();

  factory GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$MilestonedEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$MilestonedEventFromJson(
          json);

  @override
  List<Object?> get props => [id, createdAt, actor, milestoneTitle];
  Map<String, dynamic> toJson() =>
      _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$MilestonedEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$MovedColumnsInProjectEvent
    extends GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node
    with EquatableMixin, MovedColumnsInProjectMixin {
  GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$MovedColumnsInProjectEvent();

  factory GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$MovedColumnsInProjectEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$MovedColumnsInProjectEventFromJson(
          json);

  @override
  List<Object?> get props => [
        id,
        createdAt,
        actor,
        previousProjectColumnName,
        projectColumnName,
        project
      ];
  Map<String, dynamic> toJson() =>
      _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$MovedColumnsInProjectEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$PinnedEvent
    extends GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node
    with EquatableMixin, PinnedMixin {
  GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$PinnedEvent();

  factory GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$PinnedEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$PinnedEventFromJson(
          json);

  @override
  List<Object?> get props => [id, createdAt, actor];
  Map<String, dynamic> toJson() =>
      _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$PinnedEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$PullRequestCommit
    extends GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node
    with EquatableMixin, PullRequestCommitMixin {
  GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$PullRequestCommit();

  factory GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$PullRequestCommit.fromJson(
          Map<String, dynamic> json) =>
      _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$PullRequestCommitFromJson(
          json);

  @override
  List<Object?> get props => [id, commit];
  Map<String, dynamic> toJson() =>
      _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$PullRequestCommitToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$PullRequestCommitCommentThread
    extends GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node
    with EquatableMixin {
  GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$PullRequestCommitCommentThread();

  factory GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$PullRequestCommitCommentThread.fromJson(
          Map<String, dynamic> json) =>
      _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$PullRequestCommitCommentThreadFromJson(
          json);

  late String id;

  @override
  List<Object?> get props => [id];
  Map<String, dynamic> toJson() =>
      _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$PullRequestCommitCommentThreadToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$PullRequestReview
    extends GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node
    with EquatableMixin, PullRequestReviewMixin {
  GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$PullRequestReview();

  factory GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$PullRequestReview.fromJson(
          Map<String, dynamic> json) =>
      _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$PullRequestReviewFromJson(
          json);

  @override
  List<Object?> get props =>
      [id, createdAt, author, authorAssociation, body, bodyHTML, bodyText];
  Map<String, dynamic> toJson() =>
      _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$PullRequestReviewToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$PullRequestReviewThread
    extends GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node
    with EquatableMixin {
  GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$PullRequestReviewThread();

  factory GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$PullRequestReviewThread.fromJson(
          Map<String, dynamic> json) =>
      _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$PullRequestReviewThreadFromJson(
          json);

  late String id;

  @override
  List<Object?> get props => [id];
  Map<String, dynamic> toJson() =>
      _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$PullRequestReviewThreadToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$ReadyForReviewEvent
    extends GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node
    with EquatableMixin, ReadyForReviewMixin {
  GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$ReadyForReviewEvent();

  factory GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$ReadyForReviewEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$ReadyForReviewEventFromJson(
          json);

  @override
  List<Object?> get props => [id, createdAt, actor];
  Map<String, dynamic> toJson() =>
      _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$ReadyForReviewEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$RemovedFromProjectEvent
    extends GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node
    with EquatableMixin, RemovedFromProjectMixin {
  GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$RemovedFromProjectEvent();

  factory GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$RemovedFromProjectEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$RemovedFromProjectEventFromJson(
          json);

  @override
  List<Object?> get props => [id, createdAt, actor, project, projectColumnName];
  Map<String, dynamic> toJson() =>
      _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$RemovedFromProjectEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$RenamedTitleEvent
    extends GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node
    with EquatableMixin, RenamedTitleMixin {
  GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$RenamedTitleEvent();

  factory GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$RenamedTitleEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$RenamedTitleEventFromJson(
          json);

  @override
  List<Object?> get props =>
      [id, createdAt, actor, previousTitle, currentTitle];
  Map<String, dynamic> toJson() =>
      _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$RenamedTitleEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$ReopenedEvent
    extends GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node
    with EquatableMixin, ReopenedMixin {
  GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$ReopenedEvent();

  factory GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$ReopenedEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$ReopenedEventFromJson(
          json);

  @override
  List<Object?> get props => [id, createdAt, actor];
  Map<String, dynamic> toJson() =>
      _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$ReopenedEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$ReviewDismissedEvent
    extends GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node
    with EquatableMixin, ReviewDismissedMixin {
  GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$ReviewDismissedEvent();

  factory GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$ReviewDismissedEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$ReviewDismissedEventFromJson(
          json);

  @override
  List<Object?> get props => [
        id,
        createdAt,
        actor,
        dismissalMessage,
        dismissalMessageHTML,
        previousReviewState
      ];
  Map<String, dynamic> toJson() =>
      _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$ReviewDismissedEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$ReviewRequestedEvent
    extends GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node
    with EquatableMixin, ReviewRequestedMixin {
  GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$ReviewRequestedEvent();

  factory GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$ReviewRequestedEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$ReviewRequestedEventFromJson(
          json);

  @override
  List<Object?> get props => [id, createdAt, actor, requestedReviewer];
  Map<String, dynamic> toJson() =>
      _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$ReviewRequestedEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$UnassignedEvent
    extends GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node
    with EquatableMixin, UnassignedMixin {
  GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$UnassignedEvent();

  factory GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$UnassignedEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$UnassignedEventFromJson(
          json);

  @override
  List<Object?> get props => [id, createdAt, actor, assignee];
  Map<String, dynamic> toJson() =>
      _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$UnassignedEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$UnlabeledEvent
    extends GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node
    with EquatableMixin, UnlabeledMixin {
  GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$UnlabeledEvent();

  factory GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$UnlabeledEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$UnlabeledEventFromJson(
          json);

  @override
  List<Object?> get props => [id, createdAt, actor, label];
  Map<String, dynamic> toJson() =>
      _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$UnlabeledEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$UnlockedEvent
    extends GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node
    with EquatableMixin, UnlockedMixin {
  GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$UnlockedEvent();

  factory GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$UnlockedEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$UnlockedEventFromJson(
          json);

  @override
  List<Object?> get props => [id, createdAt, actor];
  Map<String, dynamic> toJson() =>
      _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$UnlockedEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$UnmarkedAsDuplicateEvent
    extends GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node
    with EquatableMixin, UnmarkedAsDuplicateMixin {
  GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$UnmarkedAsDuplicateEvent();

  factory GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$UnmarkedAsDuplicateEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$UnmarkedAsDuplicateEventFromJson(
          json);

  @override
  List<Object?> get props => [id, createdAt, actor];
  Map<String, dynamic> toJson() =>
      _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$UnmarkedAsDuplicateEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$UnpinnedEvent
    extends GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node
    with EquatableMixin, UnpinnedMixin {
  GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$UnpinnedEvent();

  factory GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$UnpinnedEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$UnpinnedEventFromJson(
          json);

  @override
  List<Object?> get props => [id, createdAt, actor];
  Map<String, dynamic> toJson() =>
      _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$UnpinnedEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node
    extends JsonSerializable with EquatableMixin {
  GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node();

  factory GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node.fromJson(
      Map<String, dynamic> json) {
    switch (json['__typename'].toString()) {
      case r'AddedToProjectEvent':
        return GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$AddedToProjectEvent
            .fromJson(json);
      case r'AssignedEvent':
        return GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$AssignedEvent
            .fromJson(json);
      case r'BaseRefChangedEvent':
        return GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$BaseRefChangedEvent
            .fromJson(json);
      case r'BaseRefDeletedEvent':
        return GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$BaseRefDeletedEvent
            .fromJson(json);
      case r'BaseRefForcePushedEvent':
        return GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$BaseRefForcePushedEvent
            .fromJson(json);
      case r'ClosedEvent':
        return GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$ClosedEvent
            .fromJson(json);
      case r'ConvertToDraftEvent':
        return GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$ConvertToDraftEvent
            .fromJson(json);
      case r'CrossReferencedEvent':
        return GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$CrossReferencedEvent
            .fromJson(json);
      case r'DemilestonedEvent':
        return GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$DemilestonedEvent
            .fromJson(json);
      case r'HeadRefDeletedEvent':
        return GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$HeadRefDeletedEvent
            .fromJson(json);
      case r'HeadRefForcePushedEvent':
        return GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$HeadRefForcePushedEvent
            .fromJson(json);
      case r'HeadRefRestoredEvent':
        return GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$HeadRefRestoredEvent
            .fromJson(json);
      case r'IssueComment':
        return GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$IssueComment
            .fromJson(json);
      case r'LabeledEvent':
        return GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$LabeledEvent
            .fromJson(json);
      case r'LockedEvent':
        return GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$LockedEvent
            .fromJson(json);
      case r'MarkedAsDuplicateEvent':
        return GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$MarkedAsDuplicateEvent
            .fromJson(json);
      case r'MergedEvent':
        return GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$MergedEvent
            .fromJson(json);
      case r'MilestonedEvent':
        return GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$MilestonedEvent
            .fromJson(json);
      case r'MovedColumnsInProjectEvent':
        return GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$MovedColumnsInProjectEvent
            .fromJson(json);
      case r'PinnedEvent':
        return GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$PinnedEvent
            .fromJson(json);
      case r'PullRequestCommit':
        return GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$PullRequestCommit
            .fromJson(json);
      case r'PullRequestCommitCommentThread':
        return GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$PullRequestCommitCommentThread
            .fromJson(json);
      case r'PullRequestReview':
        return GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$PullRequestReview
            .fromJson(json);
      case r'PullRequestReviewThread':
        return GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$PullRequestReviewThread
            .fromJson(json);
      case r'ReadyForReviewEvent':
        return GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$ReadyForReviewEvent
            .fromJson(json);
      case r'RemovedFromProjectEvent':
        return GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$RemovedFromProjectEvent
            .fromJson(json);
      case r'RenamedTitleEvent':
        return GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$RenamedTitleEvent
            .fromJson(json);
      case r'ReopenedEvent':
        return GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$ReopenedEvent
            .fromJson(json);
      case r'ReviewDismissedEvent':
        return GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$ReviewDismissedEvent
            .fromJson(json);
      case r'ReviewRequestedEvent':
        return GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$ReviewRequestedEvent
            .fromJson(json);
      case r'UnassignedEvent':
        return GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$UnassignedEvent
            .fromJson(json);
      case r'UnlabeledEvent':
        return GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$UnlabeledEvent
            .fromJson(json);
      case r'UnlockedEvent':
        return GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$UnlockedEvent
            .fromJson(json);
      case r'UnmarkedAsDuplicateEvent':
        return GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$UnmarkedAsDuplicateEvent
            .fromJson(json);
      case r'UnpinnedEvent':
        return GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$UnpinnedEvent
            .fromJson(json);
      default:
    }
    return _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$NodeFromJson(
        json);
  }

  @JsonKey(name: '__typename')
  String? $$typename;

  @override
  List<Object?> get props => [$$typename];
  Map<String, dynamic> toJson() {
    switch ($$typename) {
      case r'AddedToProjectEvent':
        return (this
                as GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$AddedToProjectEvent)
            .toJson();
      case r'AssignedEvent':
        return (this
                as GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$AssignedEvent)
            .toJson();
      case r'BaseRefChangedEvent':
        return (this
                as GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$BaseRefChangedEvent)
            .toJson();
      case r'BaseRefDeletedEvent':
        return (this
                as GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$BaseRefDeletedEvent)
            .toJson();
      case r'BaseRefForcePushedEvent':
        return (this
                as GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$BaseRefForcePushedEvent)
            .toJson();
      case r'ClosedEvent':
        return (this
                as GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$ClosedEvent)
            .toJson();
      case r'ConvertToDraftEvent':
        return (this
                as GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$ConvertToDraftEvent)
            .toJson();
      case r'CrossReferencedEvent':
        return (this
                as GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$CrossReferencedEvent)
            .toJson();
      case r'DemilestonedEvent':
        return (this
                as GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$DemilestonedEvent)
            .toJson();
      case r'HeadRefDeletedEvent':
        return (this
                as GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$HeadRefDeletedEvent)
            .toJson();
      case r'HeadRefForcePushedEvent':
        return (this
                as GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$HeadRefForcePushedEvent)
            .toJson();
      case r'HeadRefRestoredEvent':
        return (this
                as GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$HeadRefRestoredEvent)
            .toJson();
      case r'IssueComment':
        return (this
                as GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$IssueComment)
            .toJson();
      case r'LabeledEvent':
        return (this
                as GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$LabeledEvent)
            .toJson();
      case r'LockedEvent':
        return (this
                as GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$LockedEvent)
            .toJson();
      case r'MarkedAsDuplicateEvent':
        return (this
                as GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$MarkedAsDuplicateEvent)
            .toJson();
      case r'MergedEvent':
        return (this
                as GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$MergedEvent)
            .toJson();
      case r'MilestonedEvent':
        return (this
                as GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$MilestonedEvent)
            .toJson();
      case r'MovedColumnsInProjectEvent':
        return (this
                as GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$MovedColumnsInProjectEvent)
            .toJson();
      case r'PinnedEvent':
        return (this
                as GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$PinnedEvent)
            .toJson();
      case r'PullRequestCommit':
        return (this
                as GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$PullRequestCommit)
            .toJson();
      case r'PullRequestCommitCommentThread':
        return (this
                as GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$PullRequestCommitCommentThread)
            .toJson();
      case r'PullRequestReview':
        return (this
                as GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$PullRequestReview)
            .toJson();
      case r'PullRequestReviewThread':
        return (this
                as GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$PullRequestReviewThread)
            .toJson();
      case r'ReadyForReviewEvent':
        return (this
                as GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$ReadyForReviewEvent)
            .toJson();
      case r'RemovedFromProjectEvent':
        return (this
                as GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$RemovedFromProjectEvent)
            .toJson();
      case r'RenamedTitleEvent':
        return (this
                as GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$RenamedTitleEvent)
            .toJson();
      case r'ReopenedEvent':
        return (this
                as GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$ReopenedEvent)
            .toJson();
      case r'ReviewDismissedEvent':
        return (this
                as GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$ReviewDismissedEvent)
            .toJson();
      case r'ReviewRequestedEvent':
        return (this
                as GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$ReviewRequestedEvent)
            .toJson();
      case r'UnassignedEvent':
        return (this
                as GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$UnassignedEvent)
            .toJson();
      case r'UnlabeledEvent':
        return (this
                as GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$UnlabeledEvent)
            .toJson();
      case r'UnlockedEvent':
        return (this
                as GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$UnlockedEvent)
            .toJson();
      case r'UnmarkedAsDuplicateEvent':
        return (this
                as GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$UnmarkedAsDuplicateEvent)
            .toJson();
      case r'UnpinnedEvent':
        return (this
                as GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$UnpinnedEvent)
            .toJson();
      default:
    }
    return _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$NodeToJson(
        this);
  }
}

@JsonSerializable(explicitToJson: true)
class GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges
    extends JsonSerializable with EquatableMixin {
  GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges();

  factory GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges.fromJson(
          Map<String, dynamic> json) =>
      _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$EdgesFromJson(
          json);

  GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node? node;

  late String cursor;

  @override
  List<Object?> get props => [node, cursor];
  Map<String, dynamic> toJson() =>
      _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$EdgesToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetPullTimeline$Query$Repository$PullRequest$TimelineItems
    extends JsonSerializable with EquatableMixin {
  GetPullTimeline$Query$Repository$PullRequest$TimelineItems();

  factory GetPullTimeline$Query$Repository$PullRequest$TimelineItems.fromJson(
          Map<String, dynamic> json) =>
      _$GetPullTimeline$Query$Repository$PullRequest$TimelineItemsFromJson(
          json);

  List<GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges?>?
      edges;

  @override
  List<Object?> get props => [edges];
  Map<String, dynamic> toJson() =>
      _$GetPullTimeline$Query$Repository$PullRequest$TimelineItemsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetPullTimeline$Query$Repository$PullRequest extends JsonSerializable
    with EquatableMixin {
  GetPullTimeline$Query$Repository$PullRequest();

  factory GetPullTimeline$Query$Repository$PullRequest.fromJson(
          Map<String, dynamic> json) =>
      _$GetPullTimeline$Query$Repository$PullRequestFromJson(json);

  late GetPullTimeline$Query$Repository$PullRequest$TimelineItems timelineItems;

  @override
  List<Object?> get props => [timelineItems];
  Map<String, dynamic> toJson() =>
      _$GetPullTimeline$Query$Repository$PullRequestToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetPullTimeline$Query$Repository extends JsonSerializable
    with EquatableMixin {
  GetPullTimeline$Query$Repository();

  factory GetPullTimeline$Query$Repository.fromJson(
          Map<String, dynamic> json) =>
      _$GetPullTimeline$Query$RepositoryFromJson(json);

  GetPullTimeline$Query$Repository$PullRequest? pullRequest;

  @override
  List<Object?> get props => [pullRequest];
  Map<String, dynamic> toJson() =>
      _$GetPullTimeline$Query$RepositoryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetPullTimeline$Query extends JsonSerializable with EquatableMixin {
  GetPullTimeline$Query();

  factory GetPullTimeline$Query.fromJson(Map<String, dynamic> json) =>
      _$GetPullTimeline$QueryFromJson(json);

  GetPullTimeline$Query$Repository? repository;

  @override
  List<Object?> get props => [repository];
  Map<String, dynamic> toJson() => _$GetPullTimeline$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class BaseRefChangedMixin$Actor extends JsonSerializable
    with EquatableMixin, ActorMixin {
  BaseRefChangedMixin$Actor();

  factory BaseRefChangedMixin$Actor.fromJson(Map<String, dynamic> json) =>
      _$BaseRefChangedMixin$ActorFromJson(json);

  @override
  List<Object?> get props => [avatarUrl, login];
  Map<String, dynamic> toJson() => _$BaseRefChangedMixin$ActorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class BaseRefDeletedMixin$Actor extends JsonSerializable
    with EquatableMixin, ActorMixin {
  BaseRefDeletedMixin$Actor();

  factory BaseRefDeletedMixin$Actor.fromJson(Map<String, dynamic> json) =>
      _$BaseRefDeletedMixin$ActorFromJson(json);

  @override
  List<Object?> get props => [avatarUrl, login];
  Map<String, dynamic> toJson() => _$BaseRefDeletedMixin$ActorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class BaseRefForcePushedMixin$Actor extends JsonSerializable
    with EquatableMixin, ActorMixin {
  BaseRefForcePushedMixin$Actor();

  factory BaseRefForcePushedMixin$Actor.fromJson(Map<String, dynamic> json) =>
      _$BaseRefForcePushedMixin$ActorFromJson(json);

  @override
  List<Object?> get props => [avatarUrl, login];
  Map<String, dynamic> toJson() => _$BaseRefForcePushedMixin$ActorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ConvertedToDraftMixin$Actor extends JsonSerializable
    with EquatableMixin, ActorMixin {
  ConvertedToDraftMixin$Actor();

  factory ConvertedToDraftMixin$Actor.fromJson(Map<String, dynamic> json) =>
      _$ConvertedToDraftMixin$ActorFromJson(json);

  @override
  List<Object?> get props => [avatarUrl, login];
  Map<String, dynamic> toJson() => _$ConvertedToDraftMixin$ActorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class HeadRefDeletedMixin$Actor extends JsonSerializable
    with EquatableMixin, ActorMixin {
  HeadRefDeletedMixin$Actor();

  factory HeadRefDeletedMixin$Actor.fromJson(Map<String, dynamic> json) =>
      _$HeadRefDeletedMixin$ActorFromJson(json);

  @override
  List<Object?> get props => [avatarUrl, login];
  Map<String, dynamic> toJson() => _$HeadRefDeletedMixin$ActorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class HeadRefForcePushedMixin$Actor extends JsonSerializable
    with EquatableMixin, ActorMixin {
  HeadRefForcePushedMixin$Actor();

  factory HeadRefForcePushedMixin$Actor.fromJson(Map<String, dynamic> json) =>
      _$HeadRefForcePushedMixin$ActorFromJson(json);

  @override
  List<Object?> get props => [avatarUrl, login];
  Map<String, dynamic> toJson() => _$HeadRefForcePushedMixin$ActorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class HeadRefRestoredMixin$Actor extends JsonSerializable
    with EquatableMixin, ActorMixin {
  HeadRefRestoredMixin$Actor();

  factory HeadRefRestoredMixin$Actor.fromJson(Map<String, dynamic> json) =>
      _$HeadRefRestoredMixin$ActorFromJson(json);

  @override
  List<Object?> get props => [avatarUrl, login];
  Map<String, dynamic> toJson() => _$HeadRefRestoredMixin$ActorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class MergedMixin$Actor extends JsonSerializable
    with EquatableMixin, ActorMixin {
  MergedMixin$Actor();

  factory MergedMixin$Actor.fromJson(Map<String, dynamic> json) =>
      _$MergedMixin$ActorFromJson(json);

  @override
  List<Object?> get props => [avatarUrl, login];
  Map<String, dynamic> toJson() => _$MergedMixin$ActorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PullRequestCommitMixin$Commit$Author$User extends JsonSerializable
    with EquatableMixin {
  PullRequestCommitMixin$Commit$Author$User();

  factory PullRequestCommitMixin$Commit$Author$User.fromJson(
          Map<String, dynamic> json) =>
      _$PullRequestCommitMixin$Commit$Author$UserFromJson(json);

  late Uri avatarUrl;

  late String login;

  @override
  List<Object?> get props => [avatarUrl, login];
  Map<String, dynamic> toJson() =>
      _$PullRequestCommitMixin$Commit$Author$UserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PullRequestCommitMixin$Commit$Author extends JsonSerializable
    with EquatableMixin {
  PullRequestCommitMixin$Commit$Author();

  factory PullRequestCommitMixin$Commit$Author.fromJson(
          Map<String, dynamic> json) =>
      _$PullRequestCommitMixin$Commit$AuthorFromJson(json);

  late Uri avatarUrl;

  String? name;

  PullRequestCommitMixin$Commit$Author$User? user;

  @override
  List<Object?> get props => [avatarUrl, name, user];
  Map<String, dynamic> toJson() =>
      _$PullRequestCommitMixin$Commit$AuthorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PullRequestCommitMixin$Commit extends JsonSerializable
    with EquatableMixin {
  PullRequestCommitMixin$Commit();

  factory PullRequestCommitMixin$Commit.fromJson(Map<String, dynamic> json) =>
      _$PullRequestCommitMixin$CommitFromJson(json);

  late int additions;

  late DateTime authoredDate;

  late String message;

  late String messageHeadline;

  PullRequestCommitMixin$Commit$Author? author;

  @override
  List<Object?> get props =>
      [additions, authoredDate, message, messageHeadline, author];
  Map<String, dynamic> toJson() => _$PullRequestCommitMixin$CommitToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PullRequestReviewMixin$Author extends JsonSerializable
    with EquatableMixin, ActorMixin {
  PullRequestReviewMixin$Author();

  factory PullRequestReviewMixin$Author.fromJson(Map<String, dynamic> json) =>
      _$PullRequestReviewMixin$AuthorFromJson(json);

  @override
  List<Object?> get props => [avatarUrl, login];
  Map<String, dynamic> toJson() => _$PullRequestReviewMixin$AuthorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ReadyForReviewMixin$Actor extends JsonSerializable
    with EquatableMixin, ActorMixin {
  ReadyForReviewMixin$Actor();

  factory ReadyForReviewMixin$Actor.fromJson(Map<String, dynamic> json) =>
      _$ReadyForReviewMixin$ActorFromJson(json);

  @override
  List<Object?> get props => [avatarUrl, login];
  Map<String, dynamic> toJson() => _$ReadyForReviewMixin$ActorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ReviewDismissedMixin$Actor extends JsonSerializable
    with EquatableMixin, ActorMixin {
  ReviewDismissedMixin$Actor();

  factory ReviewDismissedMixin$Actor.fromJson(Map<String, dynamic> json) =>
      _$ReviewDismissedMixin$ActorFromJson(json);

  @override
  List<Object?> get props => [avatarUrl, login];
  Map<String, dynamic> toJson() => _$ReviewDismissedMixin$ActorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ReviewRequestedMixin$Actor extends JsonSerializable
    with EquatableMixin, ActorMixin {
  ReviewRequestedMixin$Actor();

  factory ReviewRequestedMixin$Actor.fromJson(Map<String, dynamic> json) =>
      _$ReviewRequestedMixin$ActorFromJson(json);

  @override
  List<Object?> get props => [avatarUrl, login];
  Map<String, dynamic> toJson() => _$ReviewRequestedMixin$ActorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ReviewRequestedMixin$RequestedReviewer$User
    extends ReviewRequestedMixin$RequestedReviewer with EquatableMixin {
  ReviewRequestedMixin$RequestedReviewer$User();

  factory ReviewRequestedMixin$RequestedReviewer$User.fromJson(
          Map<String, dynamic> json) =>
      _$ReviewRequestedMixin$RequestedReviewer$UserFromJson(json);

  late String login;

  late Uri avatarUrl;

  @override
  List<Object?> get props => [login, avatarUrl];
  Map<String, dynamic> toJson() =>
      _$ReviewRequestedMixin$RequestedReviewer$UserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ReviewRequestedMixin$RequestedReviewer$Team
    extends ReviewRequestedMixin$RequestedReviewer with EquatableMixin {
  ReviewRequestedMixin$RequestedReviewer$Team();

  factory ReviewRequestedMixin$RequestedReviewer$Team.fromJson(
          Map<String, dynamic> json) =>
      _$ReviewRequestedMixin$RequestedReviewer$TeamFromJson(json);

  Uri? avatarUrl;

  late String name;

  @override
  List<Object?> get props => [avatarUrl, name];
  Map<String, dynamic> toJson() =>
      _$ReviewRequestedMixin$RequestedReviewer$TeamToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ReviewRequestedMixin$RequestedReviewer extends JsonSerializable
    with EquatableMixin {
  ReviewRequestedMixin$RequestedReviewer();

  factory ReviewRequestedMixin$RequestedReviewer.fromJson(
      Map<String, dynamic> json) {
    switch (json['__typename'].toString()) {
      case r'User':
        return ReviewRequestedMixin$RequestedReviewer$User.fromJson(json);
      case r'Team':
        return ReviewRequestedMixin$RequestedReviewer$Team.fromJson(json);
      default:
    }
    return _$ReviewRequestedMixin$RequestedReviewerFromJson(json);
  }

  @JsonKey(name: '__typename')
  String? $$typename;

  @override
  List<Object?> get props => [$$typename];
  Map<String, dynamic> toJson() {
    switch ($$typename) {
      case r'User':
        return (this as ReviewRequestedMixin$RequestedReviewer$User).toJson();
      case r'Team':
        return (this as ReviewRequestedMixin$RequestedReviewer$Team).toJson();
      default:
    }
    return _$ReviewRequestedMixin$RequestedReviewerToJson(this);
  }
}

@JsonSerializable(explicitToJson: true)
class IssueTemplates$Query$Repository$IssueTemplates extends JsonSerializable
    with EquatableMixin {
  IssueTemplates$Query$Repository$IssueTemplates();

  factory IssueTemplates$Query$Repository$IssueTemplates.fromJson(
          Map<String, dynamic> json) =>
      _$IssueTemplates$Query$Repository$IssueTemplatesFromJson(json);

  late String name;

  String? title;

  String? body;

  String? about;

  @override
  List<Object?> get props => [name, title, body, about];
  Map<String, dynamic> toJson() =>
      _$IssueTemplates$Query$Repository$IssueTemplatesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class IssueTemplates$Query$Repository extends JsonSerializable
    with EquatableMixin {
  IssueTemplates$Query$Repository();

  factory IssueTemplates$Query$Repository.fromJson(Map<String, dynamic> json) =>
      _$IssueTemplates$Query$RepositoryFromJson(json);

  List<IssueTemplates$Query$Repository$IssueTemplates>? issueTemplates;

  @override
  List<Object?> get props => [issueTemplates];
  Map<String, dynamic> toJson() =>
      _$IssueTemplates$Query$RepositoryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class IssueTemplates$Query extends JsonSerializable with EquatableMixin {
  IssueTemplates$Query();

  factory IssueTemplates$Query.fromJson(Map<String, dynamic> json) =>
      _$IssueTemplates$QueryFromJson(json);

  IssueTemplates$Query$Repository? repository;

  @override
  List<Object?> get props => [repository];
  Map<String, dynamic> toJson() => _$IssueTemplates$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SearchMentionUsers$Query$Search$Edges$Node$User
    extends SearchMentionUsers$Query$Search$Edges$Node with EquatableMixin {
  SearchMentionUsers$Query$Search$Edges$Node$User();

  factory SearchMentionUsers$Query$Search$Edges$Node$User.fromJson(
          Map<String, dynamic> json) =>
      _$SearchMentionUsers$Query$Search$Edges$Node$UserFromJson(json);

  late String login;

  late Uri avatarUrl;

  @override
  List<Object?> get props => [login, avatarUrl];
  Map<String, dynamic> toJson() =>
      _$SearchMentionUsers$Query$Search$Edges$Node$UserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SearchMentionUsers$Query$Search$Edges$Node$Organization
    extends SearchMentionUsers$Query$Search$Edges$Node with EquatableMixin {
  SearchMentionUsers$Query$Search$Edges$Node$Organization();

  factory SearchMentionUsers$Query$Search$Edges$Node$Organization.fromJson(
          Map<String, dynamic> json) =>
      _$SearchMentionUsers$Query$Search$Edges$Node$OrganizationFromJson(json);

  late String login;

  late Uri avatarUrl;

  @override
  List<Object?> get props => [login, avatarUrl];
  Map<String, dynamic> toJson() =>
      _$SearchMentionUsers$Query$Search$Edges$Node$OrganizationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SearchMentionUsers$Query$Search$Edges$Node extends JsonSerializable
    with EquatableMixin {
  SearchMentionUsers$Query$Search$Edges$Node();

  factory SearchMentionUsers$Query$Search$Edges$Node.fromJson(
      Map<String, dynamic> json) {
    switch (json['__typename'].toString()) {
      case r'User':
        return SearchMentionUsers$Query$Search$Edges$Node$User.fromJson(json);
      case r'Organization':
        return SearchMentionUsers$Query$Search$Edges$Node$Organization.fromJson(
            json);
      default:
    }
    return _$SearchMentionUsers$Query$Search$Edges$NodeFromJson(json);
  }

  @JsonKey(name: '__typename')
  String? $$typename;

  @override
  List<Object?> get props => [$$typename];
  Map<String, dynamic> toJson() {
    switch ($$typename) {
      case r'User':
        return (this as SearchMentionUsers$Query$Search$Edges$Node$User)
            .toJson();
      case r'Organization':
        return (this as SearchMentionUsers$Query$Search$Edges$Node$Organization)
            .toJson();
      default:
    }
    return _$SearchMentionUsers$Query$Search$Edges$NodeToJson(this);
  }
}

@JsonSerializable(explicitToJson: true)
class SearchMentionUsers$Query$Search$Edges extends JsonSerializable
    with EquatableMixin {
  SearchMentionUsers$Query$Search$Edges();

  factory SearchMentionUsers$Query$Search$Edges.fromJson(
          Map<String, dynamic> json) =>
      _$SearchMentionUsers$Query$Search$EdgesFromJson(json);

  SearchMentionUsers$Query$Search$Edges$Node? node;

  late String cursor;

  @override
  List<Object?> get props => [node, cursor];
  Map<String, dynamic> toJson() =>
      _$SearchMentionUsers$Query$Search$EdgesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SearchMentionUsers$Query$Search extends JsonSerializable
    with EquatableMixin {
  SearchMentionUsers$Query$Search();

  factory SearchMentionUsers$Query$Search.fromJson(Map<String, dynamic> json) =>
      _$SearchMentionUsers$Query$SearchFromJson(json);

  List<SearchMentionUsers$Query$Search$Edges?>? edges;

  @override
  List<Object?> get props => [edges];
  Map<String, dynamic> toJson() =>
      _$SearchMentionUsers$Query$SearchToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SearchMentionUsers$Query extends JsonSerializable with EquatableMixin {
  SearchMentionUsers$Query();

  factory SearchMentionUsers$Query.fromJson(Map<String, dynamic> json) =>
      _$SearchMentionUsers$QueryFromJson(json);

  late SearchMentionUsers$Query$Search search;

  @override
  List<Object?> get props => [search];
  Map<String, dynamic> toJson() => _$SearchMentionUsers$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$Languages$Edges$Node
    extends JsonSerializable with EquatableMixin {
  GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$Languages$Edges$Node();

  factory GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$Languages$Edges$Node.fromJson(
          Map<String, dynamic> json) =>
      _$GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$Languages$Edges$NodeFromJson(
          json);

  late String name;

  @override
  List<Object?> get props => [name];
  Map<String, dynamic> toJson() =>
      _$GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$Languages$Edges$NodeToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$Languages$Edges
    extends JsonSerializable with EquatableMixin {
  GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$Languages$Edges();

  factory GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$Languages$Edges.fromJson(
          Map<String, dynamic> json) =>
      _$GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$Languages$EdgesFromJson(
          json);

  late GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$Languages$Edges$Node
      node;

  @override
  List<Object?> get props => [node];
  Map<String, dynamic> toJson() =>
      _$GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$Languages$EdgesToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$Languages
    extends JsonSerializable with EquatableMixin {
  GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$Languages();

  factory GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$Languages.fromJson(
          Map<String, dynamic> json) =>
      _$GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$LanguagesFromJson(
          json);

  List<GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$Languages$Edges?>?
      edges;

  @override
  List<Object?> get props => [edges];
  Map<String, dynamic> toJson() =>
      _$GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$LanguagesToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository
    extends GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node
    with EquatableMixin {
  GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository();

  factory GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository.fromJson(
          Map<String, dynamic> json) =>
      _$GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$RepositoryFromJson(
          json);

  late String name;

  String? description;

  late int stargazerCount;

  late DateTime updatedAt;

  late Uri url;

  GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$Languages?
      languages;

  @override
  List<Object?> get props =>
      [name, description, stargazerCount, updatedAt, url, languages];
  Map<String, dynamic> toJson() =>
      _$GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$RepositoryToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node
    extends JsonSerializable with EquatableMixin {
  GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node();

  factory GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node.fromJson(
      Map<String, dynamic> json) {
    switch (json['__typename'].toString()) {
      case r'Repository':
        return GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository
            .fromJson(json);
      default:
    }
    return _$GetUserPinnedRepos$Query$User$PinnedItems$Edges$NodeFromJson(json);
  }

  @JsonKey(name: '__typename')
  String? $$typename;

  @override
  List<Object?> get props => [$$typename];
  Map<String, dynamic> toJson() {
    switch ($$typename) {
      case r'Repository':
        return (this
                as GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository)
            .toJson();
      default:
    }
    return _$GetUserPinnedRepos$Query$User$PinnedItems$Edges$NodeToJson(this);
  }
}

@JsonSerializable(explicitToJson: true)
class GetUserPinnedRepos$Query$User$PinnedItems$Edges extends JsonSerializable
    with EquatableMixin {
  GetUserPinnedRepos$Query$User$PinnedItems$Edges();

  factory GetUserPinnedRepos$Query$User$PinnedItems$Edges.fromJson(
          Map<String, dynamic> json) =>
      _$GetUserPinnedRepos$Query$User$PinnedItems$EdgesFromJson(json);

  GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node? node;

  @override
  List<Object?> get props => [node];
  Map<String, dynamic> toJson() =>
      _$GetUserPinnedRepos$Query$User$PinnedItems$EdgesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetUserPinnedRepos$Query$User$PinnedItems extends JsonSerializable
    with EquatableMixin {
  GetUserPinnedRepos$Query$User$PinnedItems();

  factory GetUserPinnedRepos$Query$User$PinnedItems.fromJson(
          Map<String, dynamic> json) =>
      _$GetUserPinnedRepos$Query$User$PinnedItemsFromJson(json);

  List<GetUserPinnedRepos$Query$User$PinnedItems$Edges?>? edges;

  @override
  List<Object?> get props => [edges];
  Map<String, dynamic> toJson() =>
      _$GetUserPinnedRepos$Query$User$PinnedItemsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetUserPinnedRepos$Query$User extends JsonSerializable
    with EquatableMixin {
  GetUserPinnedRepos$Query$User();

  factory GetUserPinnedRepos$Query$User.fromJson(Map<String, dynamic> json) =>
      _$GetUserPinnedRepos$Query$UserFromJson(json);

  late GetUserPinnedRepos$Query$User$PinnedItems pinnedItems;

  @override
  List<Object?> get props => [pinnedItems];
  Map<String, dynamic> toJson() => _$GetUserPinnedRepos$Query$UserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetUserPinnedRepos$Query extends JsonSerializable with EquatableMixin {
  GetUserPinnedRepos$Query();

  factory GetUserPinnedRepos$Query.fromJson(Map<String, dynamic> json) =>
      _$GetUserPinnedRepos$QueryFromJson(json);

  GetUserPinnedRepos$Query$User? user;

  @override
  List<Object?> get props => [user];
  Map<String, dynamic> toJson() => _$GetUserPinnedRepos$QueryToJson(this);
}

enum CommentAuthorAssociation {
  @JsonValue('COLLABORATOR')
  collaborator,
  @JsonValue('CONTRIBUTOR')
  contributor,
  @JsonValue('FIRST_TIMER')
  firstTimer,
  @JsonValue('FIRST_TIME_CONTRIBUTOR')
  firstTimeContributor,
  @JsonValue('MANNEQUIN')
  mannequin,
  @JsonValue('MEMBER')
  member,
  @JsonValue('NONE')
  none,
  @JsonValue('OWNER')
  owner,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}
enum CommentCannotUpdateReason {
  @JsonValue('ARCHIVED')
  archived,
  @JsonValue('DENIED')
  denied,
  @JsonValue('INSUFFICIENT_ACCESS')
  insufficientAccess,
  @JsonValue('LOCKED')
  locked,
  @JsonValue('LOGIN_REQUIRED')
  loginRequired,
  @JsonValue('MAINTENANCE')
  maintenance,
  @JsonValue('VERIFIED_EMAIL_REQUIRED')
  verifiedEmailRequired,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}
enum IssueState {
  @JsonValue('CLOSED')
  closed,
  @JsonValue('OPEN')
  open,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}
enum LockReason {
  @JsonValue('OFF_TOPIC')
  offTopic,
  @JsonValue('RESOLVED')
  resolved,
  @JsonValue('SPAM')
  spam,
  @JsonValue('TOO_HEATED')
  tooHeated,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}
enum PullRequestState {
  @JsonValue('CLOSED')
  closed,
  @JsonValue('MERGED')
  merged,
  @JsonValue('OPEN')
  open,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}
enum ReactionContent {
  @JsonValue('CONFUSED')
  confused,
  @JsonValue('EYES')
  eyes,
  @JsonValue('HEART')
  heart,
  @JsonValue('HOORAY')
  hooray,
  @JsonValue('LAUGH')
  laugh,
  @JsonValue('ROCKET')
  rocket,
  @JsonValue('THUMBS_DOWN')
  thumbsDown,
  @JsonValue('THUMBS_UP')
  thumbsUp,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}
enum PullRequestReviewState {
  @JsonValue('APPROVED')
  approved,
  @JsonValue('CHANGES_REQUESTED')
  changesRequested,
  @JsonValue('COMMENTED')
  commented,
  @JsonValue('DISMISSED')
  dismissed,
  @JsonValue('PENDING')
  pending,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}

@JsonSerializable(explicitToJson: true)
class GetIssueTimelineArguments extends JsonSerializable with EquatableMixin {
  GetIssueTimelineArguments(
      {required this.repoName,
      required this.owner,
      required this.number,
      this.after,
      this.since});

  @override
  factory GetIssueTimelineArguments.fromJson(Map<String, dynamic> json) =>
      _$GetIssueTimelineArgumentsFromJson(json);

  late String repoName;

  late String owner;

  late int number;

  final String? after;

  final DateTime? since;

  @override
  List<Object?> get props => [repoName, owner, number, after, since];
  @override
  Map<String, dynamic> toJson() => _$GetIssueTimelineArgumentsToJson(this);
}

final GET_ISSUE_TIMELINE_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'getIssueTimeline'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'repoName')),
            type:
                NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: []),
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'owner')),
            type:
                NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: []),
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'number')),
            type: NamedTypeNode(name: NameNode(value: 'Int'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: []),
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'after')),
            type: NamedTypeNode(
                name: NameNode(value: 'String'), isNonNull: false),
            defaultValue: DefaultValueNode(value: null),
            directives: []),
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'since')),
            type: NamedTypeNode(
                name: NameNode(value: 'DateTime'), isNonNull: false),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'repository'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'name'),
                  value: VariableNode(name: NameNode(value: 'repoName'))),
              ArgumentNode(
                  name: NameNode(value: 'owner'),
                  value: VariableNode(name: NameNode(value: 'owner')))
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'issue'),
                  alias: null,
                  arguments: [
                    ArgumentNode(
                        name: NameNode(value: 'number'),
                        value: VariableNode(name: NameNode(value: 'number')))
                  ],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FieldNode(
                        name: NameNode(value: 'timelineItems'),
                        alias: null,
                        arguments: [
                          ArgumentNode(
                              name: NameNode(value: 'first'),
                              value: IntValueNode(value: '20')),
                          ArgumentNode(
                              name: NameNode(value: 'after'),
                              value:
                                  VariableNode(name: NameNode(value: 'after'))),
                          ArgumentNode(
                              name: NameNode(value: 'since'),
                              value:
                                  VariableNode(name: NameNode(value: 'since'))),
                          ArgumentNode(
                              name: NameNode(value: 'itemTypes'),
                              value: ListValueNode(values: [
                                EnumValueNode(
                                    name: NameNode(
                                        value: 'ADDED_TO_PROJECT_EVENT')),
                                EnumValueNode(
                                    name: NameNode(value: 'ASSIGNED_EVENT')),
                                EnumValueNode(
                                    name: NameNode(value: 'CLOSED_EVENT')),
                                EnumValueNode(
                                    name: NameNode(
                                        value: 'CROSS_REFERENCED_EVENT')),
                                EnumValueNode(
                                    name:
                                        NameNode(value: 'DEMILESTONED_EVENT')),
                                EnumValueNode(
                                    name: NameNode(value: 'ISSUE_COMMENT')),
                                EnumValueNode(
                                    name: NameNode(value: 'LABELED_EVENT')),
                                EnumValueNode(
                                    name: NameNode(value: 'LOCKED_EVENT')),
                                EnumValueNode(
                                    name: NameNode(
                                        value: 'MARKED_AS_DUPLICATE_EVENT')),
                                EnumValueNode(
                                    name: NameNode(value: 'MILESTONED_EVENT')),
                                EnumValueNode(
                                    name: NameNode(
                                        value:
                                            'MOVED_COLUMNS_IN_PROJECT_EVENT')),
                                EnumValueNode(
                                    name: NameNode(value: 'PINNED_EVENT')),
                                EnumValueNode(
                                    name: NameNode(
                                        value: 'REMOVED_FROM_PROJECT_EVENT')),
                                EnumValueNode(
                                    name:
                                        NameNode(value: 'RENAMED_TITLE_EVENT')),
                                EnumValueNode(
                                    name: NameNode(value: 'REOPENED_EVENT')),
                                EnumValueNode(
                                    name: NameNode(value: 'UNASSIGNED_EVENT')),
                                EnumValueNode(
                                    name: NameNode(value: 'UNLABELED_EVENT')),
                                EnumValueNode(
                                    name: NameNode(value: 'UNLOCKED_EVENT')),
                                EnumValueNode(
                                    name: NameNode(
                                        value: 'UNMARKED_AS_DUPLICATE_EVENT')),
                                EnumValueNode(
                                    name: NameNode(value: 'UNPINNED_EVENT'))
                              ]))
                        ],
                        directives: [],
                        selectionSet: SelectionSetNode(selections: [
                          FieldNode(
                              name: NameNode(value: 'edges'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: SelectionSetNode(selections: [
                                FieldNode(
                                    name: NameNode(value: 'node'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: SelectionSetNode(selections: [
                                      FieldNode(
                                          name: NameNode(value: '__typename'),
                                          alias: null,
                                          arguments: [],
                                          directives: [],
                                          selectionSet: null),
                                      InlineFragmentNode(
                                          typeCondition: TypeConditionNode(
                                              on: NamedTypeNode(
                                                  name: NameNode(
                                                      value:
                                                          'AddedToProjectEvent'),
                                                  isNonNull: false)),
                                          directives: [],
                                          selectionSet:
                                              SelectionSetNode(selections: [
                                            FragmentSpreadNode(
                                                name: NameNode(
                                                    value: 'addedToProject'),
                                                directives: [])
                                          ])),
                                      InlineFragmentNode(
                                          typeCondition: TypeConditionNode(
                                              on: NamedTypeNode(
                                                  name: NameNode(
                                                      value: 'AssignedEvent'),
                                                  isNonNull: false)),
                                          directives: [],
                                          selectionSet:
                                              SelectionSetNode(selections: [
                                            FragmentSpreadNode(
                                                name:
                                                    NameNode(value: 'assigned'),
                                                directives: [])
                                          ])),
                                      InlineFragmentNode(
                                          typeCondition: TypeConditionNode(
                                              on: NamedTypeNode(
                                                  name: NameNode(
                                                      value: 'ClosedEvent'),
                                                  isNonNull: false)),
                                          directives: [],
                                          selectionSet:
                                              SelectionSetNode(selections: [
                                            FragmentSpreadNode(
                                                name: NameNode(value: 'closed'),
                                                directives: [])
                                          ])),
                                      InlineFragmentNode(
                                          typeCondition: TypeConditionNode(
                                              on: NamedTypeNode(
                                                  name: NameNode(
                                                      value:
                                                          'CrossReferencedEvent'),
                                                  isNonNull: false)),
                                          directives: [],
                                          selectionSet:
                                              SelectionSetNode(selections: [
                                            FragmentSpreadNode(
                                                name: NameNode(
                                                    value: 'crossReference'),
                                                directives: [])
                                          ])),
                                      InlineFragmentNode(
                                          typeCondition: TypeConditionNode(
                                              on: NamedTypeNode(
                                                  name: NameNode(
                                                      value:
                                                          'DemilestonedEvent'),
                                                  isNonNull: false)),
                                          directives: [],
                                          selectionSet: SelectionSetNode(
                                              selections: [
                                                FragmentSpreadNode(
                                                    name: NameNode(
                                                        value: 'deMileStoned'),
                                                    directives: [])
                                              ])),
                                      InlineFragmentNode(
                                          typeCondition: TypeConditionNode(
                                              on: NamedTypeNode(
                                                  name: NameNode(
                                                      value: 'IssueComment'),
                                                  isNonNull: false)),
                                          directives: [],
                                          selectionSet: SelectionSetNode(
                                              selections: [
                                                FragmentSpreadNode(
                                                    name: NameNode(
                                                        value: 'issueComment'),
                                                    directives: [])
                                              ])),
                                      InlineFragmentNode(
                                          typeCondition: TypeConditionNode(
                                              on: NamedTypeNode(
                                                  name: NameNode(
                                                      value: 'LabeledEvent'),
                                                  isNonNull: false)),
                                          directives: [],
                                          selectionSet:
                                              SelectionSetNode(selections: [
                                            FragmentSpreadNode(
                                                name:
                                                    NameNode(value: 'labeled'),
                                                directives: [])
                                          ])),
                                      InlineFragmentNode(
                                          typeCondition: TypeConditionNode(
                                              on: NamedTypeNode(
                                                  name: NameNode(
                                                      value: 'LockedEvent'),
                                                  isNonNull: false)),
                                          directives: [],
                                          selectionSet:
                                              SelectionSetNode(selections: [
                                            FragmentSpreadNode(
                                                name: NameNode(value: 'locked'),
                                                directives: [])
                                          ])),
                                      InlineFragmentNode(
                                          typeCondition: TypeConditionNode(
                                              on: NamedTypeNode(
                                                  name: NameNode(
                                                      value:
                                                          'MarkedAsDuplicateEvent'),
                                                  isNonNull: false)),
                                          directives: [],
                                          selectionSet:
                                              SelectionSetNode(selections: [
                                            FragmentSpreadNode(
                                                name: NameNode(
                                                    value: 'markedAsDuplicate'),
                                                directives: [])
                                          ])),
                                      InlineFragmentNode(
                                          typeCondition: TypeConditionNode(
                                              on: NamedTypeNode(
                                                  name: NameNode(
                                                      value: 'MilestonedEvent'),
                                                  isNonNull: false)),
                                          directives: [],
                                          selectionSet: SelectionSetNode(
                                              selections: [
                                                FragmentSpreadNode(
                                                    name: NameNode(
                                                        value: 'mileStoned'),
                                                    directives: [])
                                              ])),
                                      InlineFragmentNode(
                                          typeCondition: TypeConditionNode(
                                              on: NamedTypeNode(
                                                  name: NameNode(
                                                      value:
                                                          'MovedColumnsInProjectEvent'),
                                                  isNonNull: false)),
                                          directives: [],
                                          selectionSet:
                                              SelectionSetNode(selections: [
                                            FragmentSpreadNode(
                                                name: NameNode(
                                                    value:
                                                        'movedColumnsInProject'),
                                                directives: [])
                                          ])),
                                      InlineFragmentNode(
                                          typeCondition: TypeConditionNode(
                                              on: NamedTypeNode(
                                                  name: NameNode(
                                                      value: 'PinnedEvent'),
                                                  isNonNull: false)),
                                          directives: [],
                                          selectionSet:
                                              SelectionSetNode(selections: [
                                            FragmentSpreadNode(
                                                name: NameNode(value: 'pinned'),
                                                directives: [])
                                          ])),
                                      InlineFragmentNode(
                                          typeCondition: TypeConditionNode(
                                              on: NamedTypeNode(
                                                  name: NameNode(
                                                      value:
                                                          'RemovedFromProjectEvent'),
                                                  isNonNull: false)),
                                          directives: [],
                                          selectionSet: SelectionSetNode(
                                              selections: [
                                                FragmentSpreadNode(
                                                    name: NameNode(
                                                        value:
                                                            'removedFromProject'),
                                                    directives: [])
                                              ])),
                                      InlineFragmentNode(
                                          typeCondition: TypeConditionNode(
                                              on: NamedTypeNode(
                                                  name: NameNode(
                                                      value:
                                                          'RenamedTitleEvent'),
                                                  isNonNull: false)),
                                          directives: [],
                                          selectionSet: SelectionSetNode(
                                              selections: [
                                                FragmentSpreadNode(
                                                    name: NameNode(
                                                        value: 'renamedTitle'),
                                                    directives: [])
                                              ])),
                                      InlineFragmentNode(
                                          typeCondition: TypeConditionNode(
                                              on: NamedTypeNode(
                                                  name: NameNode(
                                                      value: 'ReopenedEvent'),
                                                  isNonNull: false)),
                                          directives: [],
                                          selectionSet:
                                              SelectionSetNode(selections: [
                                            FragmentSpreadNode(
                                                name:
                                                    NameNode(value: 'reopened'),
                                                directives: [])
                                          ])),
                                      InlineFragmentNode(
                                          typeCondition: TypeConditionNode(
                                              on: NamedTypeNode(
                                                  name: NameNode(
                                                      value: 'UnassignedEvent'),
                                                  isNonNull: false)),
                                          directives: [],
                                          selectionSet: SelectionSetNode(
                                              selections: [
                                                FragmentSpreadNode(
                                                    name: NameNode(
                                                        value: 'unassigned'),
                                                    directives: [])
                                              ])),
                                      InlineFragmentNode(
                                          typeCondition: TypeConditionNode(
                                              on: NamedTypeNode(
                                                  name: NameNode(
                                                      value: 'UnlabeledEvent'),
                                                  isNonNull: false)),
                                          directives: [],
                                          selectionSet: SelectionSetNode(
                                              selections: [
                                                FragmentSpreadNode(
                                                    name: NameNode(
                                                        value: 'unlabeled'),
                                                    directives: [])
                                              ])),
                                      InlineFragmentNode(
                                          typeCondition: TypeConditionNode(
                                              on: NamedTypeNode(
                                                  name: NameNode(
                                                      value: 'UnlockedEvent'),
                                                  isNonNull: false)),
                                          directives: [],
                                          selectionSet:
                                              SelectionSetNode(selections: [
                                            FragmentSpreadNode(
                                                name:
                                                    NameNode(value: 'unlocked'),
                                                directives: [])
                                          ])),
                                      InlineFragmentNode(
                                          typeCondition: TypeConditionNode(
                                              on: NamedTypeNode(
                                                  name: NameNode(
                                                      value:
                                                          'UnmarkedAsDuplicateEvent'),
                                                  isNonNull: false)),
                                          directives: [],
                                          selectionSet: SelectionSetNode(
                                              selections: [
                                                FragmentSpreadNode(
                                                    name: NameNode(
                                                        value:
                                                            'unmarkedAsDuplicate'),
                                                    directives: [])
                                              ])),
                                      InlineFragmentNode(
                                          typeCondition: TypeConditionNode(
                                              on: NamedTypeNode(
                                                  name: NameNode(
                                                      value: 'UnpinnedEvent'),
                                                  isNonNull: false)),
                                          directives: [],
                                          selectionSet:
                                              SelectionSetNode(selections: [
                                            FragmentSpreadNode(
                                                name:
                                                    NameNode(value: 'unpinned'),
                                                directives: [])
                                          ]))
                                    ])),
                                FieldNode(
                                    name: NameNode(value: 'cursor'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null)
                              ]))
                        ]))
                  ]))
            ]))
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'addedToProject'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(
              name: NameNode(value: 'AddedToProjectEvent'), isNonNull: false)),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'createdAt'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'actor'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(name: NameNode(value: 'actor'), directives: [])
            ])),
        FieldNode(
            name: NameNode(value: 'projectColumnName'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'project'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'name'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null)
            ]))
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'actor'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(name: NameNode(value: 'Actor'), isNonNull: false)),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'avatarUrl'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'login'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null)
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'assigned'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(
              name: NameNode(value: 'AssignedEvent'), isNonNull: false)),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'createdAt'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'actor'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(name: NameNode(value: 'actor'), directives: [])
            ])),
        FieldNode(
            name: NameNode(value: 'assignee'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: '__typename'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              InlineFragmentNode(
                  typeCondition: TypeConditionNode(
                      on: NamedTypeNode(
                          name: NameNode(value: 'User'), isNonNull: false)),
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FragmentSpreadNode(
                        name: NameNode(value: 'actor'), directives: [])
                  ])),
              InlineFragmentNode(
                  typeCondition: TypeConditionNode(
                      on: NamedTypeNode(
                          name: NameNode(value: 'Bot'), isNonNull: false)),
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FragmentSpreadNode(
                        name: NameNode(value: 'actor'), directives: [])
                  ])),
              InlineFragmentNode(
                  typeCondition: TypeConditionNode(
                      on: NamedTypeNode(
                          name: NameNode(value: 'Mannequin'),
                          isNonNull: false)),
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FragmentSpreadNode(
                        name: NameNode(value: 'actor'), directives: [])
                  ])),
              InlineFragmentNode(
                  typeCondition: TypeConditionNode(
                      on: NamedTypeNode(
                          name: NameNode(value: 'Organization'),
                          isNonNull: false)),
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FragmentSpreadNode(
                        name: NameNode(value: 'actor'), directives: [])
                  ]))
            ]))
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'closed'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(
              name: NameNode(value: 'ClosedEvent'), isNonNull: false)),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'createdAt'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'actor'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(name: NameNode(value: 'actor'), directives: [])
            ]))
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'crossReference'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(
              name: NameNode(value: 'CrossReferencedEvent'), isNonNull: false)),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'createdAt'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'actor'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(name: NameNode(value: 'actor'), directives: [])
            ])),
        FieldNode(
            name: NameNode(value: 'source'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: '__typename'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              InlineFragmentNode(
                  typeCondition: TypeConditionNode(
                      on: NamedTypeNode(
                          name: NameNode(value: 'Issue'), isNonNull: false)),
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FragmentSpreadNode(
                        name: NameNode(value: 'issue'), directives: [])
                  ])),
              InlineFragmentNode(
                  typeCondition: TypeConditionNode(
                      on: NamedTypeNode(
                          name: NameNode(value: 'PullRequest'),
                          isNonNull: false)),
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FragmentSpreadNode(
                        name: NameNode(value: 'pullRequest'), directives: [])
                  ]))
            ])),
        FieldNode(
            name: NameNode(value: 'isCrossRepository'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null)
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'issue'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(name: NameNode(value: 'Issue'), isNonNull: false)),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'url'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'title'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'number'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'state'),
            alias: NameNode(value: 'issueState'),
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'repository'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(name: NameNode(value: 'repo'), directives: [])
            ]))
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'repo'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(
              name: NameNode(value: 'Repository'), isNonNull: false)),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'url'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'nameWithOwner'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null)
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'pullRequest'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(
              name: NameNode(value: 'PullRequest'), isNonNull: false)),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'url'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'title'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'number'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'state'),
            alias: NameNode(value: 'pullState'),
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'repository'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(name: NameNode(value: 'repo'), directives: [])
            ]))
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'deMileStoned'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(
              name: NameNode(value: 'DemilestonedEvent'), isNonNull: false)),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'createdAt'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'actor'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(name: NameNode(value: 'actor'), directives: [])
            ])),
        FieldNode(
            name: NameNode(value: 'milestoneTitle'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null)
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'issueComment'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(
              name: NameNode(value: 'IssueComment'), isNonNull: false)),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'createdAt'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'author'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'avatarUrl'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'login'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null)
            ])),
        FieldNode(
            name: NameNode(value: 'authorAssociation'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'body'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'bodyHTML'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'lastEditedAt'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'isMinimized'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'minimizedReason'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'reactionGroups'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'content'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'viewerHasReacted'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'users'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FieldNode(
                        name: NameNode(value: 'totalCount'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null)
                  ]))
            ])),
        FieldNode(
            name: NameNode(value: 'viewerCanMinimize'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'viewerCanDelete'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'viewerCanUpdate'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'viewerDidAuthor'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'viewerCannotUpdateReasons'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'viewerCanReact'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null)
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'labeled'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(
              name: NameNode(value: 'LabeledEvent'), isNonNull: false)),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'createdAt'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'actor'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(name: NameNode(value: 'actor'), directives: [])
            ])),
        FieldNode(
            name: NameNode(value: 'label'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(name: NameNode(value: 'label'), directives: [])
            ]))
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'label'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(name: NameNode(value: 'Label'), isNonNull: false)),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'color'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'name'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null)
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'locked'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(
              name: NameNode(value: 'LockedEvent'), isNonNull: false)),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'createdAt'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'actor'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(name: NameNode(value: 'actor'), directives: [])
            ])),
        FieldNode(
            name: NameNode(value: 'lockReason'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null)
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'markedAsDuplicate'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(
              name: NameNode(value: 'MarkedAsDuplicateEvent'),
              isNonNull: false)),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'createdAt'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'actor'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(name: NameNode(value: 'actor'), directives: [])
            ])),
        FieldNode(
            name: NameNode(value: 'canonical'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: '__typename'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              InlineFragmentNode(
                  typeCondition: TypeConditionNode(
                      on: NamedTypeNode(
                          name: NameNode(value: 'Issue'), isNonNull: false)),
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FragmentSpreadNode(
                        name: NameNode(value: 'issue'), directives: [])
                  ])),
              InlineFragmentNode(
                  typeCondition: TypeConditionNode(
                      on: NamedTypeNode(
                          name: NameNode(value: 'PullRequest'),
                          isNonNull: false)),
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FragmentSpreadNode(
                        name: NameNode(value: 'pullRequest'), directives: [])
                  ]))
            ]))
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'mileStoned'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(
              name: NameNode(value: 'MilestonedEvent'), isNonNull: false)),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'createdAt'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'actor'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(name: NameNode(value: 'actor'), directives: [])
            ])),
        FieldNode(
            name: NameNode(value: 'milestoneTitle'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null)
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'movedColumnsInProject'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(
              name: NameNode(value: 'MovedColumnsInProjectEvent'),
              isNonNull: false)),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'createdAt'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'actor'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(name: NameNode(value: 'actor'), directives: [])
            ])),
        FieldNode(
            name: NameNode(value: 'previousProjectColumnName'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'projectColumnName'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'project'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'name'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null)
            ]))
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'pinned'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(
              name: NameNode(value: 'PinnedEvent'), isNonNull: false)),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'createdAt'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'actor'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(name: NameNode(value: 'actor'), directives: [])
            ]))
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'removedFromProject'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(
              name: NameNode(value: 'RemovedFromProjectEvent'),
              isNonNull: false)),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'createdAt'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'actor'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(name: NameNode(value: 'actor'), directives: [])
            ])),
        FieldNode(
            name: NameNode(value: 'project'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'name'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null)
            ])),
        FieldNode(
            name: NameNode(value: 'projectColumnName'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null)
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'renamedTitle'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(
              name: NameNode(value: 'RenamedTitleEvent'), isNonNull: false)),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'createdAt'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'actor'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(name: NameNode(value: 'actor'), directives: [])
            ])),
        FieldNode(
            name: NameNode(value: 'previousTitle'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'currentTitle'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null)
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'reopened'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(
              name: NameNode(value: 'ReopenedEvent'), isNonNull: false)),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'createdAt'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'actor'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(name: NameNode(value: 'actor'), directives: [])
            ]))
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'unassigned'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(
              name: NameNode(value: 'UnassignedEvent'), isNonNull: false)),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'createdAt'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'actor'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(name: NameNode(value: 'actor'), directives: [])
            ])),
        FieldNode(
            name: NameNode(value: 'assignee'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: '__typename'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              InlineFragmentNode(
                  typeCondition: TypeConditionNode(
                      on: NamedTypeNode(
                          name: NameNode(value: 'User'), isNonNull: false)),
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FragmentSpreadNode(
                        name: NameNode(value: 'actor'), directives: [])
                  ])),
              InlineFragmentNode(
                  typeCondition: TypeConditionNode(
                      on: NamedTypeNode(
                          name: NameNode(value: 'Bot'), isNonNull: false)),
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FragmentSpreadNode(
                        name: NameNode(value: 'actor'), directives: [])
                  ])),
              InlineFragmentNode(
                  typeCondition: TypeConditionNode(
                      on: NamedTypeNode(
                          name: NameNode(value: 'Mannequin'),
                          isNonNull: false)),
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FragmentSpreadNode(
                        name: NameNode(value: 'actor'), directives: [])
                  ])),
              InlineFragmentNode(
                  typeCondition: TypeConditionNode(
                      on: NamedTypeNode(
                          name: NameNode(value: 'Organization'),
                          isNonNull: false)),
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FragmentSpreadNode(
                        name: NameNode(value: 'actor'), directives: [])
                  ]))
            ]))
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'unlabeled'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(
              name: NameNode(value: 'UnlabeledEvent'), isNonNull: false)),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'createdAt'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'actor'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(name: NameNode(value: 'actor'), directives: [])
            ])),
        FieldNode(
            name: NameNode(value: 'label'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(name: NameNode(value: 'label'), directives: [])
            ]))
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'unlocked'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(
              name: NameNode(value: 'UnlockedEvent'), isNonNull: false)),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'createdAt'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'actor'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(name: NameNode(value: 'actor'), directives: [])
            ]))
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'unmarkedAsDuplicate'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(
              name: NameNode(value: 'UnmarkedAsDuplicateEvent'),
              isNonNull: false)),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'createdAt'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'actor'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(name: NameNode(value: 'actor'), directives: [])
            ]))
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'unpinned'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(
              name: NameNode(value: 'UnpinnedEvent'), isNonNull: false)),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'createdAt'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'actor'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(name: NameNode(value: 'actor'), directives: [])
            ]))
      ]))
]);

class GetIssueTimelineQuery
    extends GraphQLQuery<GetIssueTimeline$Query, GetIssueTimelineArguments> {
  GetIssueTimelineQuery({required this.variables});

  @override
  final DocumentNode document = GET_ISSUE_TIMELINE_QUERY_DOCUMENT;

  @override
  final String operationName = 'getIssueTimeline';

  @override
  final GetIssueTimelineArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  GetIssueTimeline$Query parse(Map<String, dynamic> json) =>
      GetIssueTimeline$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class GetPullTimelineArguments extends JsonSerializable with EquatableMixin {
  GetPullTimelineArguments(
      {required this.repoName,
      required this.owner,
      required this.number,
      this.after,
      this.since});

  @override
  factory GetPullTimelineArguments.fromJson(Map<String, dynamic> json) =>
      _$GetPullTimelineArgumentsFromJson(json);

  late String repoName;

  late String owner;

  late int number;

  final String? after;

  final DateTime? since;

  @override
  List<Object?> get props => [repoName, owner, number, after, since];
  @override
  Map<String, dynamic> toJson() => _$GetPullTimelineArgumentsToJson(this);
}

final GET_PULL_TIMELINE_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'getPullTimeline'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'repoName')),
            type:
                NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: []),
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'owner')),
            type:
                NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: []),
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'number')),
            type: NamedTypeNode(name: NameNode(value: 'Int'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: []),
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'after')),
            type: NamedTypeNode(
                name: NameNode(value: 'String'), isNonNull: false),
            defaultValue: DefaultValueNode(value: null),
            directives: []),
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'since')),
            type: NamedTypeNode(
                name: NameNode(value: 'DateTime'), isNonNull: false),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'repository'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'name'),
                  value: VariableNode(name: NameNode(value: 'repoName'))),
              ArgumentNode(
                  name: NameNode(value: 'owner'),
                  value: VariableNode(name: NameNode(value: 'owner')))
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'pullRequest'),
                  alias: null,
                  arguments: [
                    ArgumentNode(
                        name: NameNode(value: 'number'),
                        value: VariableNode(name: NameNode(value: 'number')))
                  ],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FieldNode(
                        name: NameNode(value: 'timelineItems'),
                        alias: null,
                        arguments: [
                          ArgumentNode(
                              name: NameNode(value: 'first'),
                              value: IntValueNode(value: '20')),
                          ArgumentNode(
                              name: NameNode(value: 'after'),
                              value:
                                  VariableNode(name: NameNode(value: 'after'))),
                          ArgumentNode(
                              name: NameNode(value: 'since'),
                              value:
                                  VariableNode(name: NameNode(value: 'since'))),
                          ArgumentNode(
                              name: NameNode(value: 'itemTypes'),
                              value: ListValueNode(values: [
                                EnumValueNode(
                                    name: NameNode(
                                        value: 'ADDED_TO_PROJECT_EVENT')),
                                EnumValueNode(
                                    name: NameNode(value: 'ASSIGNED_EVENT')),
                                EnumValueNode(
                                    name: NameNode(
                                        value: 'BASE_REF_CHANGED_EVENT')),
                                EnumValueNode(
                                    name: NameNode(
                                        value: 'BASE_REF_DELETED_EVENT')),
                                EnumValueNode(
                                    name: NameNode(
                                        value: 'BASE_REF_FORCE_PUSHED_EVENT')),
                                EnumValueNode(
                                    name: NameNode(value: 'CLOSED_EVENT')),
                                EnumValueNode(
                                    name: NameNode(
                                        value: 'CONVERT_TO_DRAFT_EVENT')),
                                EnumValueNode(
                                    name: NameNode(
                                        value: 'CROSS_REFERENCED_EVENT')),
                                EnumValueNode(
                                    name:
                                        NameNode(value: 'DEMILESTONED_EVENT')),
                                EnumValueNode(
                                    name: NameNode(
                                        value: 'HEAD_REF_DELETED_EVENT')),
                                EnumValueNode(
                                    name: NameNode(
                                        value: 'HEAD_REF_FORCE_PUSHED_EVENT')),
                                EnumValueNode(
                                    name: NameNode(
                                        value: 'HEAD_REF_RESTORED_EVENT')),
                                EnumValueNode(
                                    name: NameNode(value: 'ISSUE_COMMENT')),
                                EnumValueNode(
                                    name: NameNode(value: 'LABELED_EVENT')),
                                EnumValueNode(
                                    name: NameNode(value: 'LOCKED_EVENT')),
                                EnumValueNode(
                                    name: NameNode(
                                        value: 'MARKED_AS_DUPLICATE_EVENT')),
                                EnumValueNode(
                                    name: NameNode(value: 'MERGED_EVENT')),
                                EnumValueNode(
                                    name: NameNode(value: 'MILESTONED_EVENT')),
                                EnumValueNode(
                                    name: NameNode(
                                        value:
                                            'MOVED_COLUMNS_IN_PROJECT_EVENT')),
                                EnumValueNode(
                                    name: NameNode(value: 'PINNED_EVENT')),
                                EnumValueNode(
                                    name:
                                        NameNode(value: 'PULL_REQUEST_COMMIT')),
                                EnumValueNode(
                                    name: NameNode(
                                        value:
                                            'PULL_REQUEST_COMMIT_COMMENT_THREAD')),
                                EnumValueNode(
                                    name:
                                        NameNode(value: 'PULL_REQUEST_REVIEW')),
                                EnumValueNode(
                                    name: NameNode(
                                        value: 'PULL_REQUEST_REVIEW_THREAD')),
                                EnumValueNode(
                                    name: NameNode(
                                        value: 'READY_FOR_REVIEW_EVENT')),
                                EnumValueNode(
                                    name: NameNode(
                                        value: 'REMOVED_FROM_PROJECT_EVENT')),
                                EnumValueNode(
                                    name:
                                        NameNode(value: 'RENAMED_TITLE_EVENT')),
                                EnumValueNode(
                                    name: NameNode(value: 'REOPENED_EVENT')),
                                EnumValueNode(
                                    name: NameNode(
                                        value: 'REVIEW_DISMISSED_EVENT')),
                                EnumValueNode(
                                    name: NameNode(
                                        value: 'REVIEW_REQUESTED_EVENT')),
                                EnumValueNode(
                                    name: NameNode(
                                        value: 'REVIEW_REQUEST_REMOVED_EVENT')),
                                EnumValueNode(
                                    name: NameNode(value: 'UNASSIGNED_EVENT')),
                                EnumValueNode(
                                    name: NameNode(value: 'UNLABELED_EVENT')),
                                EnumValueNode(
                                    name: NameNode(value: 'UNLOCKED_EVENT')),
                                EnumValueNode(
                                    name: NameNode(
                                        value: 'UNMARKED_AS_DUPLICATE_EVENT')),
                                EnumValueNode(
                                    name: NameNode(value: 'UNPINNED_EVENT'))
                              ]))
                        ],
                        directives: [],
                        selectionSet: SelectionSetNode(selections: [
                          FieldNode(
                              name: NameNode(value: 'edges'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: SelectionSetNode(selections: [
                                FieldNode(
                                    name: NameNode(value: 'node'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: SelectionSetNode(selections: [
                                      FieldNode(
                                          name: NameNode(value: '__typename'),
                                          alias: null,
                                          arguments: [],
                                          directives: [],
                                          selectionSet: null),
                                      InlineFragmentNode(
                                          typeCondition: TypeConditionNode(
                                              on: NamedTypeNode(
                                                  name: NameNode(
                                                      value:
                                                          'AddedToProjectEvent'),
                                                  isNonNull: false)),
                                          directives: [],
                                          selectionSet:
                                              SelectionSetNode(selections: [
                                            FragmentSpreadNode(
                                                name: NameNode(
                                                    value: 'addedToProject'),
                                                directives: [])
                                          ])),
                                      InlineFragmentNode(
                                          typeCondition: TypeConditionNode(
                                              on: NamedTypeNode(
                                                  name: NameNode(
                                                      value: 'AssignedEvent'),
                                                  isNonNull: false)),
                                          directives: [],
                                          selectionSet:
                                              SelectionSetNode(selections: [
                                            FragmentSpreadNode(
                                                name:
                                                    NameNode(value: 'assigned'),
                                                directives: [])
                                          ])),
                                      InlineFragmentNode(
                                          typeCondition: TypeConditionNode(
                                              on: NamedTypeNode(
                                                  name: NameNode(
                                                      value:
                                                          'BaseRefChangedEvent'),
                                                  isNonNull: false)),
                                          directives: [],
                                          selectionSet:
                                              SelectionSetNode(selections: [
                                            FragmentSpreadNode(
                                                name: NameNode(
                                                    value: 'baseRefChanged'),
                                                directives: [])
                                          ])),
                                      InlineFragmentNode(
                                          typeCondition: TypeConditionNode(
                                              on: NamedTypeNode(
                                                  name: NameNode(
                                                      value:
                                                          'BaseRefDeletedEvent'),
                                                  isNonNull: false)),
                                          directives: [],
                                          selectionSet:
                                              SelectionSetNode(selections: [
                                            FragmentSpreadNode(
                                                name: NameNode(
                                                    value: 'baseRefDeleted'),
                                                directives: [])
                                          ])),
                                      InlineFragmentNode(
                                          typeCondition: TypeConditionNode(
                                              on: NamedTypeNode(
                                                  name: NameNode(
                                                      value:
                                                          'BaseRefForcePushedEvent'),
                                                  isNonNull: false)),
                                          directives: [],
                                          selectionSet: SelectionSetNode(
                                              selections: [
                                                FragmentSpreadNode(
                                                    name: NameNode(
                                                        value:
                                                            'baseRefForcePushed'),
                                                    directives: [])
                                              ])),
                                      InlineFragmentNode(
                                          typeCondition: TypeConditionNode(
                                              on: NamedTypeNode(
                                                  name: NameNode(
                                                      value: 'ClosedEvent'),
                                                  isNonNull: false)),
                                          directives: [],
                                          selectionSet:
                                              SelectionSetNode(selections: [
                                            FragmentSpreadNode(
                                                name: NameNode(value: 'closed'),
                                                directives: [])
                                          ])),
                                      InlineFragmentNode(
                                          typeCondition: TypeConditionNode(
                                              on: NamedTypeNode(
                                                  name: NameNode(
                                                      value:
                                                          'ConvertToDraftEvent'),
                                                  isNonNull: false)),
                                          directives: [],
                                          selectionSet:
                                              SelectionSetNode(selections: [
                                            FragmentSpreadNode(
                                                name: NameNode(
                                                    value: 'convertedToDraft'),
                                                directives: [])
                                          ])),
                                      InlineFragmentNode(
                                          typeCondition: TypeConditionNode(
                                              on: NamedTypeNode(
                                                  name: NameNode(
                                                      value:
                                                          'CrossReferencedEvent'),
                                                  isNonNull: false)),
                                          directives: [],
                                          selectionSet:
                                              SelectionSetNode(selections: [
                                            FragmentSpreadNode(
                                                name: NameNode(
                                                    value: 'crossReference'),
                                                directives: [])
                                          ])),
                                      InlineFragmentNode(
                                          typeCondition: TypeConditionNode(
                                              on: NamedTypeNode(
                                                  name: NameNode(
                                                      value:
                                                          'DemilestonedEvent'),
                                                  isNonNull: false)),
                                          directives: [],
                                          selectionSet: SelectionSetNode(
                                              selections: [
                                                FragmentSpreadNode(
                                                    name: NameNode(
                                                        value: 'deMileStoned'),
                                                    directives: [])
                                              ])),
                                      InlineFragmentNode(
                                          typeCondition: TypeConditionNode(
                                              on: NamedTypeNode(
                                                  name: NameNode(
                                                      value:
                                                          'HeadRefDeletedEvent'),
                                                  isNonNull: false)),
                                          directives: [],
                                          selectionSet:
                                              SelectionSetNode(selections: [
                                            FragmentSpreadNode(
                                                name: NameNode(
                                                    value: 'headRefDeleted'),
                                                directives: [])
                                          ])),
                                      InlineFragmentNode(
                                          typeCondition: TypeConditionNode(
                                              on: NamedTypeNode(
                                                  name: NameNode(
                                                      value:
                                                          'HeadRefForcePushedEvent'),
                                                  isNonNull: false)),
                                          directives: [],
                                          selectionSet: SelectionSetNode(
                                              selections: [
                                                FragmentSpreadNode(
                                                    name: NameNode(
                                                        value:
                                                            'headRefForcePushed'),
                                                    directives: [])
                                              ])),
                                      InlineFragmentNode(
                                          typeCondition: TypeConditionNode(
                                              on: NamedTypeNode(
                                                  name: NameNode(
                                                      value:
                                                          'HeadRefRestoredEvent'),
                                                  isNonNull: false)),
                                          directives: [],
                                          selectionSet:
                                              SelectionSetNode(selections: [
                                            FragmentSpreadNode(
                                                name: NameNode(
                                                    value: 'headRefRestored'),
                                                directives: [])
                                          ])),
                                      InlineFragmentNode(
                                          typeCondition: TypeConditionNode(
                                              on: NamedTypeNode(
                                                  name: NameNode(
                                                      value: 'IssueComment'),
                                                  isNonNull: false)),
                                          directives: [],
                                          selectionSet: SelectionSetNode(
                                              selections: [
                                                FragmentSpreadNode(
                                                    name: NameNode(
                                                        value: 'issueComment'),
                                                    directives: [])
                                              ])),
                                      InlineFragmentNode(
                                          typeCondition: TypeConditionNode(
                                              on: NamedTypeNode(
                                                  name: NameNode(
                                                      value: 'LabeledEvent'),
                                                  isNonNull: false)),
                                          directives: [],
                                          selectionSet:
                                              SelectionSetNode(selections: [
                                            FragmentSpreadNode(
                                                name:
                                                    NameNode(value: 'labeled'),
                                                directives: [])
                                          ])),
                                      InlineFragmentNode(
                                          typeCondition: TypeConditionNode(
                                              on: NamedTypeNode(
                                                  name: NameNode(
                                                      value: 'LockedEvent'),
                                                  isNonNull: false)),
                                          directives: [],
                                          selectionSet:
                                              SelectionSetNode(selections: [
                                            FragmentSpreadNode(
                                                name: NameNode(value: 'locked'),
                                                directives: [])
                                          ])),
                                      InlineFragmentNode(
                                          typeCondition: TypeConditionNode(
                                              on: NamedTypeNode(
                                                  name: NameNode(
                                                      value:
                                                          'MarkedAsDuplicateEvent'),
                                                  isNonNull: false)),
                                          directives: [],
                                          selectionSet:
                                              SelectionSetNode(selections: [
                                            FragmentSpreadNode(
                                                name: NameNode(
                                                    value: 'markedAsDuplicate'),
                                                directives: [])
                                          ])),
                                      InlineFragmentNode(
                                          typeCondition: TypeConditionNode(
                                              on: NamedTypeNode(
                                                  name: NameNode(
                                                      value: 'MergedEvent'),
                                                  isNonNull: false)),
                                          directives: [],
                                          selectionSet:
                                              SelectionSetNode(selections: [
                                            FragmentSpreadNode(
                                                name: NameNode(value: 'merged'),
                                                directives: [])
                                          ])),
                                      InlineFragmentNode(
                                          typeCondition: TypeConditionNode(
                                              on: NamedTypeNode(
                                                  name: NameNode(
                                                      value: 'MilestonedEvent'),
                                                  isNonNull: false)),
                                          directives: [],
                                          selectionSet: SelectionSetNode(
                                              selections: [
                                                FragmentSpreadNode(
                                                    name: NameNode(
                                                        value: 'mileStoned'),
                                                    directives: [])
                                              ])),
                                      InlineFragmentNode(
                                          typeCondition: TypeConditionNode(
                                              on: NamedTypeNode(
                                                  name: NameNode(
                                                      value:
                                                          'MovedColumnsInProjectEvent'),
                                                  isNonNull: false)),
                                          directives: [],
                                          selectionSet:
                                              SelectionSetNode(selections: [
                                            FragmentSpreadNode(
                                                name: NameNode(
                                                    value:
                                                        'movedColumnsInProject'),
                                                directives: [])
                                          ])),
                                      InlineFragmentNode(
                                          typeCondition: TypeConditionNode(
                                              on: NamedTypeNode(
                                                  name: NameNode(
                                                      value: 'PinnedEvent'),
                                                  isNonNull: false)),
                                          directives: [],
                                          selectionSet:
                                              SelectionSetNode(selections: [
                                            FragmentSpreadNode(
                                                name: NameNode(value: 'pinned'),
                                                directives: [])
                                          ])),
                                      InlineFragmentNode(
                                          typeCondition: TypeConditionNode(
                                              on: NamedTypeNode(
                                                  name: NameNode(
                                                      value:
                                                          'PullRequestCommit'),
                                                  isNonNull: false)),
                                          directives: [],
                                          selectionSet:
                                              SelectionSetNode(selections: [
                                            FragmentSpreadNode(
                                                name: NameNode(
                                                    value: 'pullRequestCommit'),
                                                directives: [])
                                          ])),
                                      InlineFragmentNode(
                                          typeCondition: TypeConditionNode(
                                              on: NamedTypeNode(
                                                  name: NameNode(
                                                      value:
                                                          'PullRequestCommitCommentThread'),
                                                  isNonNull: false)),
                                          directives: [],
                                          selectionSet:
                                              SelectionSetNode(selections: [
                                            FieldNode(
                                                name: NameNode(value: 'id'),
                                                alias: null,
                                                arguments: [],
                                                directives: [],
                                                selectionSet: null)
                                          ])),
                                      InlineFragmentNode(
                                          typeCondition: TypeConditionNode(
                                              on: NamedTypeNode(
                                                  name: NameNode(
                                                      value:
                                                          'PullRequestReview'),
                                                  isNonNull: false)),
                                          directives: [],
                                          selectionSet:
                                              SelectionSetNode(selections: [
                                            FragmentSpreadNode(
                                                name: NameNode(
                                                    value: 'pullRequestReview'),
                                                directives: [])
                                          ])),
                                      InlineFragmentNode(
                                          typeCondition: TypeConditionNode(
                                              on: NamedTypeNode(
                                                  name: NameNode(
                                                      value:
                                                          'PullRequestReviewThread'),
                                                  isNonNull: false)),
                                          directives: [],
                                          selectionSet:
                                              SelectionSetNode(selections: [
                                            FieldNode(
                                                name: NameNode(value: 'id'),
                                                alias: null,
                                                arguments: [],
                                                directives: [],
                                                selectionSet: null)
                                          ])),
                                      InlineFragmentNode(
                                          typeCondition: TypeConditionNode(
                                              on: NamedTypeNode(
                                                  name: NameNode(
                                                      value:
                                                          'ReadyForReviewEvent'),
                                                  isNonNull: false)),
                                          directives: [],
                                          selectionSet:
                                              SelectionSetNode(selections: [
                                            FragmentSpreadNode(
                                                name: NameNode(
                                                    value: 'readyForReview'),
                                                directives: [])
                                          ])),
                                      InlineFragmentNode(
                                          typeCondition: TypeConditionNode(
                                              on: NamedTypeNode(
                                                  name: NameNode(
                                                      value:
                                                          'RemovedFromProjectEvent'),
                                                  isNonNull: false)),
                                          directives: [],
                                          selectionSet: SelectionSetNode(
                                              selections: [
                                                FragmentSpreadNode(
                                                    name: NameNode(
                                                        value:
                                                            'removedFromProject'),
                                                    directives: [])
                                              ])),
                                      InlineFragmentNode(
                                          typeCondition: TypeConditionNode(
                                              on: NamedTypeNode(
                                                  name: NameNode(
                                                      value:
                                                          'RenamedTitleEvent'),
                                                  isNonNull: false)),
                                          directives: [],
                                          selectionSet: SelectionSetNode(
                                              selections: [
                                                FragmentSpreadNode(
                                                    name: NameNode(
                                                        value: 'renamedTitle'),
                                                    directives: [])
                                              ])),
                                      InlineFragmentNode(
                                          typeCondition: TypeConditionNode(
                                              on: NamedTypeNode(
                                                  name: NameNode(
                                                      value: 'ReopenedEvent'),
                                                  isNonNull: false)),
                                          directives: [],
                                          selectionSet:
                                              SelectionSetNode(selections: [
                                            FragmentSpreadNode(
                                                name:
                                                    NameNode(value: 'reopened'),
                                                directives: [])
                                          ])),
                                      InlineFragmentNode(
                                          typeCondition: TypeConditionNode(
                                              on: NamedTypeNode(
                                                  name: NameNode(
                                                      value:
                                                          'ReviewDismissedEvent'),
                                                  isNonNull: false)),
                                          directives: [],
                                          selectionSet:
                                              SelectionSetNode(selections: [
                                            FragmentSpreadNode(
                                                name: NameNode(
                                                    value: 'reviewDismissed'),
                                                directives: [])
                                          ])),
                                      InlineFragmentNode(
                                          typeCondition: TypeConditionNode(
                                              on: NamedTypeNode(
                                                  name: NameNode(
                                                      value:
                                                          'ReviewRequestedEvent'),
                                                  isNonNull: false)),
                                          directives: [],
                                          selectionSet:
                                              SelectionSetNode(selections: [
                                            FragmentSpreadNode(
                                                name: NameNode(
                                                    value: 'reviewRequested'),
                                                directives: [])
                                          ])),
                                      InlineFragmentNode(
                                          typeCondition: TypeConditionNode(
                                              on: NamedTypeNode(
                                                  name: NameNode(
                                                      value: 'UnassignedEvent'),
                                                  isNonNull: false)),
                                          directives: [],
                                          selectionSet: SelectionSetNode(
                                              selections: [
                                                FragmentSpreadNode(
                                                    name: NameNode(
                                                        value: 'unassigned'),
                                                    directives: [])
                                              ])),
                                      InlineFragmentNode(
                                          typeCondition: TypeConditionNode(
                                              on: NamedTypeNode(
                                                  name: NameNode(
                                                      value: 'UnlabeledEvent'),
                                                  isNonNull: false)),
                                          directives: [],
                                          selectionSet: SelectionSetNode(
                                              selections: [
                                                FragmentSpreadNode(
                                                    name: NameNode(
                                                        value: 'unlabeled'),
                                                    directives: [])
                                              ])),
                                      InlineFragmentNode(
                                          typeCondition: TypeConditionNode(
                                              on: NamedTypeNode(
                                                  name: NameNode(
                                                      value: 'UnlockedEvent'),
                                                  isNonNull: false)),
                                          directives: [],
                                          selectionSet:
                                              SelectionSetNode(selections: [
                                            FragmentSpreadNode(
                                                name:
                                                    NameNode(value: 'unlocked'),
                                                directives: [])
                                          ])),
                                      InlineFragmentNode(
                                          typeCondition: TypeConditionNode(
                                              on: NamedTypeNode(
                                                  name: NameNode(
                                                      value:
                                                          'UnmarkedAsDuplicateEvent'),
                                                  isNonNull: false)),
                                          directives: [],
                                          selectionSet: SelectionSetNode(
                                              selections: [
                                                FragmentSpreadNode(
                                                    name: NameNode(
                                                        value:
                                                            'unmarkedAsDuplicate'),
                                                    directives: [])
                                              ])),
                                      InlineFragmentNode(
                                          typeCondition: TypeConditionNode(
                                              on: NamedTypeNode(
                                                  name: NameNode(
                                                      value: 'UnpinnedEvent'),
                                                  isNonNull: false)),
                                          directives: [],
                                          selectionSet:
                                              SelectionSetNode(selections: [
                                            FragmentSpreadNode(
                                                name:
                                                    NameNode(value: 'unpinned'),
                                                directives: [])
                                          ]))
                                    ])),
                                FieldNode(
                                    name: NameNode(value: 'cursor'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null)
                              ]))
                        ]))
                  ]))
            ]))
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'addedToProject'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(
              name: NameNode(value: 'AddedToProjectEvent'), isNonNull: false)),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'createdAt'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'actor'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(name: NameNode(value: 'actor'), directives: [])
            ])),
        FieldNode(
            name: NameNode(value: 'projectColumnName'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'project'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'name'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null)
            ]))
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'actor'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(name: NameNode(value: 'Actor'), isNonNull: false)),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'avatarUrl'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'login'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null)
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'assigned'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(
              name: NameNode(value: 'AssignedEvent'), isNonNull: false)),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'createdAt'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'actor'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(name: NameNode(value: 'actor'), directives: [])
            ])),
        FieldNode(
            name: NameNode(value: 'assignee'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: '__typename'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              InlineFragmentNode(
                  typeCondition: TypeConditionNode(
                      on: NamedTypeNode(
                          name: NameNode(value: 'User'), isNonNull: false)),
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FragmentSpreadNode(
                        name: NameNode(value: 'actor'), directives: [])
                  ])),
              InlineFragmentNode(
                  typeCondition: TypeConditionNode(
                      on: NamedTypeNode(
                          name: NameNode(value: 'Bot'), isNonNull: false)),
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FragmentSpreadNode(
                        name: NameNode(value: 'actor'), directives: [])
                  ])),
              InlineFragmentNode(
                  typeCondition: TypeConditionNode(
                      on: NamedTypeNode(
                          name: NameNode(value: 'Mannequin'),
                          isNonNull: false)),
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FragmentSpreadNode(
                        name: NameNode(value: 'actor'), directives: [])
                  ])),
              InlineFragmentNode(
                  typeCondition: TypeConditionNode(
                      on: NamedTypeNode(
                          name: NameNode(value: 'Organization'),
                          isNonNull: false)),
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FragmentSpreadNode(
                        name: NameNode(value: 'actor'), directives: [])
                  ]))
            ]))
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'baseRefChanged'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(
              name: NameNode(value: 'BaseRefChangedEvent'), isNonNull: false)),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'createdAt'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'actor'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(name: NameNode(value: 'actor'), directives: [])
            ])),
        FieldNode(
            name: NameNode(value: 'currentRefName'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'previousRefName'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null)
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'baseRefDeleted'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(
              name: NameNode(value: 'BaseRefDeletedEvent'), isNonNull: false)),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'createdAt'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'actor'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(name: NameNode(value: 'actor'), directives: [])
            ])),
        FieldNode(
            name: NameNode(value: 'baseRefName'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null)
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'baseRefForcePushed'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(
              name: NameNode(value: 'BaseRefForcePushedEvent'),
              isNonNull: false)),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'createdAt'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'actor'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(name: NameNode(value: 'actor'), directives: [])
            ]))
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'closed'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(
              name: NameNode(value: 'ClosedEvent'), isNonNull: false)),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'createdAt'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'actor'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(name: NameNode(value: 'actor'), directives: [])
            ]))
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'convertedToDraft'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(
              name: NameNode(value: 'ConvertToDraftEvent'), isNonNull: false)),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'createdAt'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'actor'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(name: NameNode(value: 'actor'), directives: [])
            ]))
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'crossReference'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(
              name: NameNode(value: 'CrossReferencedEvent'), isNonNull: false)),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'createdAt'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'actor'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(name: NameNode(value: 'actor'), directives: [])
            ])),
        FieldNode(
            name: NameNode(value: 'source'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: '__typename'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              InlineFragmentNode(
                  typeCondition: TypeConditionNode(
                      on: NamedTypeNode(
                          name: NameNode(value: 'Issue'), isNonNull: false)),
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FragmentSpreadNode(
                        name: NameNode(value: 'issue'), directives: [])
                  ])),
              InlineFragmentNode(
                  typeCondition: TypeConditionNode(
                      on: NamedTypeNode(
                          name: NameNode(value: 'PullRequest'),
                          isNonNull: false)),
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FragmentSpreadNode(
                        name: NameNode(value: 'pullRequest'), directives: [])
                  ]))
            ])),
        FieldNode(
            name: NameNode(value: 'isCrossRepository'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null)
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'issue'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(name: NameNode(value: 'Issue'), isNonNull: false)),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'url'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'title'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'number'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'state'),
            alias: NameNode(value: 'issueState'),
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'repository'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(name: NameNode(value: 'repo'), directives: [])
            ]))
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'repo'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(
              name: NameNode(value: 'Repository'), isNonNull: false)),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'url'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'nameWithOwner'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null)
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'pullRequest'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(
              name: NameNode(value: 'PullRequest'), isNonNull: false)),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'url'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'title'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'number'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'state'),
            alias: NameNode(value: 'pullState'),
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'repository'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(name: NameNode(value: 'repo'), directives: [])
            ]))
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'deMileStoned'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(
              name: NameNode(value: 'DemilestonedEvent'), isNonNull: false)),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'createdAt'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'actor'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(name: NameNode(value: 'actor'), directives: [])
            ])),
        FieldNode(
            name: NameNode(value: 'milestoneTitle'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null)
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'headRefDeleted'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(
              name: NameNode(value: 'HeadRefDeletedEvent'), isNonNull: false)),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'createdAt'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'actor'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(name: NameNode(value: 'actor'), directives: [])
            ])),
        FieldNode(
            name: NameNode(value: 'headRefName'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null)
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'headRefForcePushed'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(
              name: NameNode(value: 'HeadRefForcePushedEvent'),
              isNonNull: false)),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'createdAt'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'actor'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(name: NameNode(value: 'actor'), directives: [])
            ]))
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'headRefRestored'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(
              name: NameNode(value: 'HeadRefRestoredEvent'), isNonNull: false)),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'createdAt'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'actor'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(name: NameNode(value: 'actor'), directives: [])
            ]))
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'issueComment'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(
              name: NameNode(value: 'IssueComment'), isNonNull: false)),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'createdAt'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'author'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'avatarUrl'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'login'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null)
            ])),
        FieldNode(
            name: NameNode(value: 'authorAssociation'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'body'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'bodyHTML'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'lastEditedAt'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'isMinimized'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'minimizedReason'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'reactionGroups'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'content'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'viewerHasReacted'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'users'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FieldNode(
                        name: NameNode(value: 'totalCount'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null)
                  ]))
            ])),
        FieldNode(
            name: NameNode(value: 'viewerCanMinimize'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'viewerCanDelete'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'viewerCanUpdate'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'viewerDidAuthor'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'viewerCannotUpdateReasons'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'viewerCanReact'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null)
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'labeled'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(
              name: NameNode(value: 'LabeledEvent'), isNonNull: false)),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'createdAt'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'actor'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(name: NameNode(value: 'actor'), directives: [])
            ])),
        FieldNode(
            name: NameNode(value: 'label'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(name: NameNode(value: 'label'), directives: [])
            ]))
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'label'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(name: NameNode(value: 'Label'), isNonNull: false)),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'color'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'name'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null)
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'locked'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(
              name: NameNode(value: 'LockedEvent'), isNonNull: false)),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'createdAt'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'actor'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(name: NameNode(value: 'actor'), directives: [])
            ])),
        FieldNode(
            name: NameNode(value: 'lockReason'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null)
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'markedAsDuplicate'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(
              name: NameNode(value: 'MarkedAsDuplicateEvent'),
              isNonNull: false)),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'createdAt'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'actor'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(name: NameNode(value: 'actor'), directives: [])
            ])),
        FieldNode(
            name: NameNode(value: 'canonical'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: '__typename'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              InlineFragmentNode(
                  typeCondition: TypeConditionNode(
                      on: NamedTypeNode(
                          name: NameNode(value: 'Issue'), isNonNull: false)),
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FragmentSpreadNode(
                        name: NameNode(value: 'issue'), directives: [])
                  ])),
              InlineFragmentNode(
                  typeCondition: TypeConditionNode(
                      on: NamedTypeNode(
                          name: NameNode(value: 'PullRequest'),
                          isNonNull: false)),
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FragmentSpreadNode(
                        name: NameNode(value: 'pullRequest'), directives: [])
                  ]))
            ]))
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'merged'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(
              name: NameNode(value: 'MergedEvent'), isNonNull: false)),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'createdAt'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'actor'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(name: NameNode(value: 'actor'), directives: [])
            ])),
        FieldNode(
            name: NameNode(value: 'mergeRefName'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null)
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'mileStoned'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(
              name: NameNode(value: 'MilestonedEvent'), isNonNull: false)),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'createdAt'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'actor'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(name: NameNode(value: 'actor'), directives: [])
            ])),
        FieldNode(
            name: NameNode(value: 'milestoneTitle'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null)
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'movedColumnsInProject'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(
              name: NameNode(value: 'MovedColumnsInProjectEvent'),
              isNonNull: false)),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'createdAt'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'actor'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(name: NameNode(value: 'actor'), directives: [])
            ])),
        FieldNode(
            name: NameNode(value: 'previousProjectColumnName'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'projectColumnName'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'project'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'name'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null)
            ]))
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'pinned'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(
              name: NameNode(value: 'PinnedEvent'), isNonNull: false)),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'createdAt'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'actor'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(name: NameNode(value: 'actor'), directives: [])
            ]))
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'pullRequestCommit'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(
              name: NameNode(value: 'PullRequestCommit'), isNonNull: false)),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'commit'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'additions'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'authoredDate'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'message'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'messageHeadline'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'author'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FieldNode(
                        name: NameNode(value: 'avatarUrl'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: 'name'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: 'user'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: SelectionSetNode(selections: [
                          FieldNode(
                              name: NameNode(value: 'avatarUrl'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null),
                          FieldNode(
                              name: NameNode(value: 'login'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null)
                        ]))
                  ]))
            ]))
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'pullRequestReview'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(
              name: NameNode(value: 'PullRequestReview'), isNonNull: false)),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'createdAt'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'author'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(name: NameNode(value: 'actor'), directives: [])
            ])),
        FieldNode(
            name: NameNode(value: 'authorAssociation'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'body'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'bodyHTML'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'bodyText'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null)
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'readyForReview'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(
              name: NameNode(value: 'ReadyForReviewEvent'), isNonNull: false)),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'createdAt'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'actor'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(name: NameNode(value: 'actor'), directives: [])
            ]))
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'removedFromProject'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(
              name: NameNode(value: 'RemovedFromProjectEvent'),
              isNonNull: false)),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'createdAt'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'actor'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(name: NameNode(value: 'actor'), directives: [])
            ])),
        FieldNode(
            name: NameNode(value: 'project'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'name'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null)
            ])),
        FieldNode(
            name: NameNode(value: 'projectColumnName'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null)
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'renamedTitle'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(
              name: NameNode(value: 'RenamedTitleEvent'), isNonNull: false)),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'createdAt'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'actor'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(name: NameNode(value: 'actor'), directives: [])
            ])),
        FieldNode(
            name: NameNode(value: 'previousTitle'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'currentTitle'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null)
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'reopened'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(
              name: NameNode(value: 'ReopenedEvent'), isNonNull: false)),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'createdAt'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'actor'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(name: NameNode(value: 'actor'), directives: [])
            ]))
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'reviewDismissed'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(
              name: NameNode(value: 'ReviewDismissedEvent'), isNonNull: false)),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'createdAt'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'actor'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(name: NameNode(value: 'actor'), directives: [])
            ])),
        FieldNode(
            name: NameNode(value: 'dismissalMessage'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'dismissalMessageHTML'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'previousReviewState'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null)
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'reviewRequested'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(
              name: NameNode(value: 'ReviewRequestedEvent'), isNonNull: false)),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'createdAt'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'actor'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(name: NameNode(value: 'actor'), directives: [])
            ])),
        FieldNode(
            name: NameNode(value: 'requestedReviewer'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: '__typename'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              InlineFragmentNode(
                  typeCondition: TypeConditionNode(
                      on: NamedTypeNode(
                          name: NameNode(value: 'User'), isNonNull: false)),
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FieldNode(
                        name: NameNode(value: 'login'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: 'avatarUrl'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null)
                  ])),
              InlineFragmentNode(
                  typeCondition: TypeConditionNode(
                      on: NamedTypeNode(
                          name: NameNode(value: 'Team'), isNonNull: false)),
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FieldNode(
                        name: NameNode(value: 'avatarUrl'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: 'name'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null)
                  ]))
            ]))
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'unassigned'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(
              name: NameNode(value: 'UnassignedEvent'), isNonNull: false)),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'createdAt'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'actor'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(name: NameNode(value: 'actor'), directives: [])
            ])),
        FieldNode(
            name: NameNode(value: 'assignee'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: '__typename'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              InlineFragmentNode(
                  typeCondition: TypeConditionNode(
                      on: NamedTypeNode(
                          name: NameNode(value: 'User'), isNonNull: false)),
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FragmentSpreadNode(
                        name: NameNode(value: 'actor'), directives: [])
                  ])),
              InlineFragmentNode(
                  typeCondition: TypeConditionNode(
                      on: NamedTypeNode(
                          name: NameNode(value: 'Bot'), isNonNull: false)),
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FragmentSpreadNode(
                        name: NameNode(value: 'actor'), directives: [])
                  ])),
              InlineFragmentNode(
                  typeCondition: TypeConditionNode(
                      on: NamedTypeNode(
                          name: NameNode(value: 'Mannequin'),
                          isNonNull: false)),
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FragmentSpreadNode(
                        name: NameNode(value: 'actor'), directives: [])
                  ])),
              InlineFragmentNode(
                  typeCondition: TypeConditionNode(
                      on: NamedTypeNode(
                          name: NameNode(value: 'Organization'),
                          isNonNull: false)),
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FragmentSpreadNode(
                        name: NameNode(value: 'actor'), directives: [])
                  ]))
            ]))
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'unlabeled'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(
              name: NameNode(value: 'UnlabeledEvent'), isNonNull: false)),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'createdAt'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'actor'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(name: NameNode(value: 'actor'), directives: [])
            ])),
        FieldNode(
            name: NameNode(value: 'label'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(name: NameNode(value: 'label'), directives: [])
            ]))
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'unlocked'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(
              name: NameNode(value: 'UnlockedEvent'), isNonNull: false)),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'createdAt'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'actor'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(name: NameNode(value: 'actor'), directives: [])
            ]))
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'unmarkedAsDuplicate'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(
              name: NameNode(value: 'UnmarkedAsDuplicateEvent'),
              isNonNull: false)),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'createdAt'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'actor'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(name: NameNode(value: 'actor'), directives: [])
            ]))
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'unpinned'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(
              name: NameNode(value: 'UnpinnedEvent'), isNonNull: false)),
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'createdAt'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'actor'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(name: NameNode(value: 'actor'), directives: [])
            ]))
      ]))
]);

class GetPullTimelineQuery
    extends GraphQLQuery<GetPullTimeline$Query, GetPullTimelineArguments> {
  GetPullTimelineQuery({required this.variables});

  @override
  final DocumentNode document = GET_PULL_TIMELINE_QUERY_DOCUMENT;

  @override
  final String operationName = 'getPullTimeline';

  @override
  final GetPullTimelineArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  GetPullTimeline$Query parse(Map<String, dynamic> json) =>
      GetPullTimeline$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class IssueTemplatesArguments extends JsonSerializable with EquatableMixin {
  IssueTemplatesArguments({required this.name, required this.owner});

  @override
  factory IssueTemplatesArguments.fromJson(Map<String, dynamic> json) =>
      _$IssueTemplatesArgumentsFromJson(json);

  late String name;

  late String owner;

  @override
  List<Object?> get props => [name, owner];
  @override
  Map<String, dynamic> toJson() => _$IssueTemplatesArgumentsToJson(this);
}

final ISSUE_TEMPLATES_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'issueTemplates'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'name')),
            type:
                NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: []),
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'owner')),
            type:
                NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'repository'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'name'),
                  value: VariableNode(name: NameNode(value: 'name'))),
              ArgumentNode(
                  name: NameNode(value: 'owner'),
                  value: VariableNode(name: NameNode(value: 'owner')))
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'issueTemplates'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FieldNode(
                        name: NameNode(value: 'name'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: 'title'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: 'body'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: 'about'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null)
                  ]))
            ]))
      ]))
]);

class IssueTemplatesQuery
    extends GraphQLQuery<IssueTemplates$Query, IssueTemplatesArguments> {
  IssueTemplatesQuery({required this.variables});

  @override
  final DocumentNode document = ISSUE_TEMPLATES_QUERY_DOCUMENT;

  @override
  final String operationName = 'issueTemplates';

  @override
  final IssueTemplatesArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  IssueTemplates$Query parse(Map<String, dynamic> json) =>
      IssueTemplates$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class SearchMentionUsersArguments extends JsonSerializable with EquatableMixin {
  SearchMentionUsersArguments({required this.query, this.after});

  @override
  factory SearchMentionUsersArguments.fromJson(Map<String, dynamic> json) =>
      _$SearchMentionUsersArgumentsFromJson(json);

  late String query;

  final String? after;

  @override
  List<Object?> get props => [query, after];
  @override
  Map<String, dynamic> toJson() => _$SearchMentionUsersArgumentsToJson(this);
}

final SEARCH_MENTION_USERS_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'searchMentionUsers'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'query')),
            type:
                NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: []),
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'after')),
            type: NamedTypeNode(
                name: NameNode(value: 'String'), isNonNull: false),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'search'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'query'),
                  value: VariableNode(name: NameNode(value: 'query'))),
              ArgumentNode(
                  name: NameNode(value: 'type'),
                  value: EnumValueNode(name: NameNode(value: 'USER'))),
              ArgumentNode(
                  name: NameNode(value: 'first'),
                  value: IntValueNode(value: '20')),
              ArgumentNode(
                  name: NameNode(value: 'after'),
                  value: VariableNode(name: NameNode(value: 'after')))
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'edges'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FieldNode(
                        name: NameNode(value: 'node'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: SelectionSetNode(selections: [
                          FieldNode(
                              name: NameNode(value: '__typename'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null),
                          InlineFragmentNode(
                              typeCondition: TypeConditionNode(
                                  on: NamedTypeNode(
                                      name: NameNode(value: 'User'),
                                      isNonNull: false)),
                              directives: [],
                              selectionSet: SelectionSetNode(selections: [
                                FieldNode(
                                    name: NameNode(value: 'login'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null),
                                FieldNode(
                                    name: NameNode(value: 'avatarUrl'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null)
                              ])),
                          InlineFragmentNode(
                              typeCondition: TypeConditionNode(
                                  on: NamedTypeNode(
                                      name: NameNode(value: 'Organization'),
                                      isNonNull: false)),
                              directives: [],
                              selectionSet: SelectionSetNode(selections: [
                                FieldNode(
                                    name: NameNode(value: 'login'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null),
                                FieldNode(
                                    name: NameNode(value: 'avatarUrl'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null)
                              ]))
                        ])),
                    FieldNode(
                        name: NameNode(value: 'cursor'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null)
                  ]))
            ]))
      ]))
]);

class SearchMentionUsersQuery extends GraphQLQuery<SearchMentionUsers$Query,
    SearchMentionUsersArguments> {
  SearchMentionUsersQuery({required this.variables});

  @override
  final DocumentNode document = SEARCH_MENTION_USERS_QUERY_DOCUMENT;

  @override
  final String operationName = 'searchMentionUsers';

  @override
  final SearchMentionUsersArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  SearchMentionUsers$Query parse(Map<String, dynamic> json) =>
      SearchMentionUsers$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class GetUserPinnedReposArguments extends JsonSerializable with EquatableMixin {
  GetUserPinnedReposArguments({required this.user});

  @override
  factory GetUserPinnedReposArguments.fromJson(Map<String, dynamic> json) =>
      _$GetUserPinnedReposArgumentsFromJson(json);

  late String user;

  @override
  List<Object?> get props => [user];
  @override
  Map<String, dynamic> toJson() => _$GetUserPinnedReposArgumentsToJson(this);
}

final GET_USER_PINNED_REPOS_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'getUserPinnedRepos'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'user')),
            type:
                NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'user'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'login'),
                  value: VariableNode(name: NameNode(value: 'user')))
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'pinnedItems'),
                  alias: null,
                  arguments: [
                    ArgumentNode(
                        name: NameNode(value: 'first'),
                        value: IntValueNode(value: '6')),
                    ArgumentNode(
                        name: NameNode(value: 'types'),
                        value: ListValueNode(values: [
                          EnumValueNode(name: NameNode(value: 'REPOSITORY'))
                        ]))
                  ],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FieldNode(
                        name: NameNode(value: 'edges'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: SelectionSetNode(selections: [
                          FieldNode(
                              name: NameNode(value: 'node'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: SelectionSetNode(selections: [
                                FieldNode(
                                    name: NameNode(value: '__typename'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null),
                                InlineFragmentNode(
                                    typeCondition: TypeConditionNode(
                                        on: NamedTypeNode(
                                            name: NameNode(value: 'Repository'),
                                            isNonNull: false)),
                                    directives: [],
                                    selectionSet: SelectionSetNode(selections: [
                                      FieldNode(
                                          name: NameNode(value: 'name'),
                                          alias: null,
                                          arguments: [],
                                          directives: [],
                                          selectionSet: null),
                                      FieldNode(
                                          name: NameNode(value: 'description'),
                                          alias: null,
                                          arguments: [],
                                          directives: [],
                                          selectionSet: null),
                                      FieldNode(
                                          name:
                                              NameNode(value: 'stargazerCount'),
                                          alias: null,
                                          arguments: [],
                                          directives: [],
                                          selectionSet: null),
                                      FieldNode(
                                          name: NameNode(value: 'updatedAt'),
                                          alias: null,
                                          arguments: [],
                                          directives: [],
                                          selectionSet: null),
                                      FieldNode(
                                          name: NameNode(value: 'url'),
                                          alias: null,
                                          arguments: [],
                                          directives: [],
                                          selectionSet: null),
                                      FieldNode(
                                          name: NameNode(value: 'languages'),
                                          alias: null,
                                          arguments: [
                                            ArgumentNode(
                                                name:
                                                    NameNode(value: 'orderBy'),
                                                value: ObjectValueNode(fields: [
                                                  ObjectFieldNode(
                                                      name: NameNode(
                                                          value: 'direction'),
                                                      value: EnumValueNode(
                                                          name: NameNode(
                                                              value: 'DESC'))),
                                                  ObjectFieldNode(
                                                      name: NameNode(
                                                          value: 'field'),
                                                      value: EnumValueNode(
                                                          name: NameNode(
                                                              value: 'SIZE')))
                                                ])),
                                            ArgumentNode(
                                                name: NameNode(value: 'first'),
                                                value: IntValueNode(value: '1'))
                                          ],
                                          directives: [],
                                          selectionSet:
                                              SelectionSetNode(selections: [
                                            FieldNode(
                                                name: NameNode(value: 'edges'),
                                                alias: null,
                                                arguments: [],
                                                directives: [],
                                                selectionSet: SelectionSetNode(
                                                    selections: [
                                                      FieldNode(
                                                          name: NameNode(
                                                              value: 'node'),
                                                          alias: null,
                                                          arguments: [],
                                                          directives: [],
                                                          selectionSet:
                                                              SelectionSetNode(
                                                                  selections: [
                                                                FieldNode(
                                                                    name: NameNode(
                                                                        value:
                                                                            'name'),
                                                                    alias: null,
                                                                    arguments: [],
                                                                    directives: [],
                                                                    selectionSet:
                                                                        null)
                                                              ]))
                                                    ]))
                                          ]))
                                    ]))
                              ]))
                        ]))
                  ]))
            ]))
      ]))
]);

class GetUserPinnedReposQuery extends GraphQLQuery<GetUserPinnedRepos$Query,
    GetUserPinnedReposArguments> {
  GetUserPinnedReposQuery({required this.variables});

  @override
  final DocumentNode document = GET_USER_PINNED_REPOS_QUERY_DOCUMENT;

  @override
  final String operationName = 'getUserPinnedRepos';

  @override
  final GetUserPinnedReposArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  GetUserPinnedRepos$Query parse(Map<String, dynamic> json) =>
      GetUserPinnedRepos$Query.fromJson(json);
}
