// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.12

part of 'graphql.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$AddedToProjectEvent
    _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$AddedToProjectEventFromJson(
        Map<String, dynamic> json) {
  return GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$AddedToProjectEvent()
    ..id = json['id'] as String
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..actor = json['actor'] == null
        ? null
        : AddedToProjectMixin$Actor.fromJson(
            json['actor'] as Map<String, dynamic>)
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$AddedToProjectEventToJson(
            GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$AddedToProjectEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          '__typename': instance.$$typename,
        };

GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$AssignedEvent
    _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$AssignedEventFromJson(
        Map<String, dynamic> json) {
  return GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$AssignedEvent()
    ..id = json['id'] as String
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..actor = json['actor'] == null
        ? null
        : AssignedMixin$Actor.fromJson(json['actor'] as Map<String, dynamic>)
    ..assignee = json['assignee'] == null
        ? null
        : AssignedMixin$Assignee.fromJson(
            json['assignee'] as Map<String, dynamic>)
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$AssignedEventToJson(
            GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$AssignedEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          'assignee': instance.assignee?.toJson(),
          '__typename': instance.$$typename,
        };

GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$ClosedEvent
    _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$ClosedEventFromJson(
        Map<String, dynamic> json) {
  return GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$ClosedEvent()
    ..id = json['id'] as String
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..actor = json['actor'] == null
        ? null
        : ClosedMixin$Actor.fromJson(json['actor'] as Map<String, dynamic>)
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$ClosedEventToJson(
            GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$ClosedEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          '__typename': instance.$$typename,
        };

GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$CrossReferencedEvent
    _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$CrossReferencedEventFromJson(
        Map<String, dynamic> json) {
  return GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$CrossReferencedEvent()
    ..id = json['id'] as String
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..actor = json['actor'] == null
        ? null
        : CrossReferenceMixin$Actor.fromJson(
            json['actor'] as Map<String, dynamic>)
    ..source = CrossReferenceMixin$Source.fromJson(
        json['source'] as Map<String, dynamic>)
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$CrossReferencedEventToJson(
            GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$CrossReferencedEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          'source': instance.source.toJson(),
          '__typename': instance.$$typename,
        };

GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$DemilestonedEvent
    _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$DemilestonedEventFromJson(
        Map<String, dynamic> json) {
  return GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$DemilestonedEvent()
    ..id = json['id'] as String
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..actor = json['actor'] == null
        ? null
        : DeMileStonedMixin$Actor.fromJson(
            json['actor'] as Map<String, dynamic>)
    ..milestoneTitle = json['milestoneTitle'] as String
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$DemilestonedEventToJson(
            GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$DemilestonedEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          'milestoneTitle': instance.milestoneTitle,
          '__typename': instance.$$typename,
        };

GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$IssueComment
    _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$IssueCommentFromJson(
        Map<String, dynamic> json) {
  return GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$IssueComment()
    ..id = json['id'] as String
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..author = json['author'] == null
        ? null
        : IssueCommentMixin$Author.fromJson(
            json['author'] as Map<String, dynamic>)
    ..authorAssociation = _$enumDecode(
        _$CommentAuthorAssociationEnumMap, json['authorAssociation'],
        unknownValue: CommentAuthorAssociation.artemisUnknown)
    ..body = json['body'] as String
    ..bodyHTML = json['bodyHTML'] as String
    ..lastEditedAt = json['lastEditedAt'] == null
        ? null
        : DateTime.parse(json['lastEditedAt'] as String)
    ..isMinimized = json['isMinimized'] as bool
    ..minimizedReason = json['minimizedReason'] as String?
    ..reactionGroups = (json['reactionGroups'] as List<dynamic>?)
        ?.map((e) => IssueCommentMixin$ReactionGroups.fromJson(
            e as Map<String, dynamic>))
        .toList()
    ..viewerCanMinimize = json['viewerCanMinimize'] as bool
    ..viewerCanDelete = json['viewerCanDelete'] as bool
    ..viewerCanUpdate = json['viewerCanUpdate'] as bool
    ..viewerDidAuthor = json['viewerDidAuthor'] as bool
    ..viewerCannotUpdateReasons =
        (json['viewerCannotUpdateReasons'] as List<dynamic>)
            .map((e) => _$enumDecode(_$CommentCannotUpdateReasonEnumMap, e,
                unknownValue: CommentCannotUpdateReason.artemisUnknown))
            .toList()
    ..viewerCanReact = json['viewerCanReact'] as bool
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$IssueCommentToJson(
            GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$IssueComment
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'author': instance.author?.toJson(),
          'authorAssociation':
              _$CommentAuthorAssociationEnumMap[instance.authorAssociation],
          'body': instance.body,
          'bodyHTML': instance.bodyHTML,
          'lastEditedAt': instance.lastEditedAt?.toIso8601String(),
          'isMinimized': instance.isMinimized,
          'minimizedReason': instance.minimizedReason,
          'reactionGroups':
              instance.reactionGroups?.map((e) => e.toJson()).toList(),
          'viewerCanMinimize': instance.viewerCanMinimize,
          'viewerCanDelete': instance.viewerCanDelete,
          'viewerCanUpdate': instance.viewerCanUpdate,
          'viewerDidAuthor': instance.viewerDidAuthor,
          'viewerCannotUpdateReasons': instance.viewerCannotUpdateReasons
              .map((e) => _$CommentCannotUpdateReasonEnumMap[e])
              .toList(),
          'viewerCanReact': instance.viewerCanReact,
          '__typename': instance.$$typename,
        };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$CommentAuthorAssociationEnumMap = {
  CommentAuthorAssociation.collaborator: 'COLLABORATOR',
  CommentAuthorAssociation.contributor: 'CONTRIBUTOR',
  CommentAuthorAssociation.firstTimer: 'FIRST_TIMER',
  CommentAuthorAssociation.firstTimeContributor: 'FIRST_TIME_CONTRIBUTOR',
  CommentAuthorAssociation.mannequin: 'MANNEQUIN',
  CommentAuthorAssociation.member: 'MEMBER',
  CommentAuthorAssociation.none: 'NONE',
  CommentAuthorAssociation.owner: 'OWNER',
  CommentAuthorAssociation.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

const _$CommentCannotUpdateReasonEnumMap = {
  CommentCannotUpdateReason.archived: 'ARCHIVED',
  CommentCannotUpdateReason.denied: 'DENIED',
  CommentCannotUpdateReason.insufficientAccess: 'INSUFFICIENT_ACCESS',
  CommentCannotUpdateReason.locked: 'LOCKED',
  CommentCannotUpdateReason.loginRequired: 'LOGIN_REQUIRED',
  CommentCannotUpdateReason.maintenance: 'MAINTENANCE',
  CommentCannotUpdateReason.verifiedEmailRequired: 'VERIFIED_EMAIL_REQUIRED',
  CommentCannotUpdateReason.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$LabeledEvent
    _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$LabeledEventFromJson(
        Map<String, dynamic> json) {
  return GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$LabeledEvent()
    ..id = json['id'] as String
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..actor = json['actor'] == null
        ? null
        : LabeledMixin$Actor.fromJson(json['actor'] as Map<String, dynamic>)
    ..label = LabeledMixin$Label.fromJson(json['label'] as Map<String, dynamic>)
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$LabeledEventToJson(
            GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$LabeledEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          'label': instance.label.toJson(),
          '__typename': instance.$$typename,
        };

GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$LockedEvent
    _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$LockedEventFromJson(
        Map<String, dynamic> json) {
  return GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$LockedEvent()
    ..id = json['id'] as String
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..actor = json['actor'] == null
        ? null
        : LockedMixin$Actor.fromJson(json['actor'] as Map<String, dynamic>)
    ..lockReason = _$enumDecodeNullable(_$LockReasonEnumMap, json['lockReason'],
        unknownValue: LockReason.artemisUnknown)
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$LockedEventToJson(
            GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$LockedEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          'lockReason': _$LockReasonEnumMap[instance.lockReason],
          '__typename': instance.$$typename,
        };

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$LockReasonEnumMap = {
  LockReason.offTopic: 'OFF_TOPIC',
  LockReason.resolved: 'RESOLVED',
  LockReason.spam: 'SPAM',
  LockReason.tooHeated: 'TOO_HEATED',
  LockReason.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$MarkedAsDuplicateEvent
    _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$MarkedAsDuplicateEventFromJson(
        Map<String, dynamic> json) {
  return GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$MarkedAsDuplicateEvent()
    ..id = json['id'] as String
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..actor = json['actor'] == null
        ? null
        : MarkedAsDuplicateMixin$Actor.fromJson(
            json['actor'] as Map<String, dynamic>)
    ..canonical = json['canonical'] == null
        ? null
        : MarkedAsDuplicateMixin$Canonical.fromJson(
            json['canonical'] as Map<String, dynamic>)
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$MarkedAsDuplicateEventToJson(
            GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$MarkedAsDuplicateEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          'canonical': instance.canonical?.toJson(),
          '__typename': instance.$$typename,
        };

GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$MilestonedEvent
    _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$MilestonedEventFromJson(
        Map<String, dynamic> json) {
  return GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$MilestonedEvent()
    ..id = json['id'] as String
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..actor = json['actor'] == null
        ? null
        : MileStonedMixin$Actor.fromJson(json['actor'] as Map<String, dynamic>)
    ..milestoneTitle = json['milestoneTitle'] as String
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$MilestonedEventToJson(
            GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$MilestonedEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          'milestoneTitle': instance.milestoneTitle,
          '__typename': instance.$$typename,
        };

GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$MovedColumnsInProjectEvent
    _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$MovedColumnsInProjectEventFromJson(
        Map<String, dynamic> json) {
  return GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$MovedColumnsInProjectEvent()
    ..id = json['id'] as String
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..actor = json['actor'] == null
        ? null
        : MovedColumnsInProjectMixin$Actor.fromJson(
            json['actor'] as Map<String, dynamic>)
    ..previousProjectColumnName = json['previousProjectColumnName'] as String
    ..projectColumnName = json['projectColumnName'] as String
    ..project = json['project'] == null
        ? null
        : MovedColumnsInProjectMixin$Project.fromJson(
            json['project'] as Map<String, dynamic>)
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$MovedColumnsInProjectEventToJson(
            GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$MovedColumnsInProjectEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          'previousProjectColumnName': instance.previousProjectColumnName,
          'projectColumnName': instance.projectColumnName,
          'project': instance.project?.toJson(),
          '__typename': instance.$$typename,
        };

GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$PinnedEvent
    _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$PinnedEventFromJson(
        Map<String, dynamic> json) {
  return GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$PinnedEvent()
    ..id = json['id'] as String
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..actor = json['actor'] == null
        ? null
        : PinnedMixin$Actor.fromJson(json['actor'] as Map<String, dynamic>)
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$PinnedEventToJson(
            GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$PinnedEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          '__typename': instance.$$typename,
        };

GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$ReferencedEvent
    _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$ReferencedEventFromJson(
        Map<String, dynamic> json) {
  return GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$ReferencedEvent()
    ..id = json['id'] as String
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..actor = json['actor'] == null
        ? null
        : ReferencedMixin$Actor.fromJson(json['actor'] as Map<String, dynamic>)
    ..subject = ReferencedMixin$Subject.fromJson(
        json['subject'] as Map<String, dynamic>)
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$ReferencedEventToJson(
            GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$ReferencedEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          'subject': instance.subject.toJson(),
          '__typename': instance.$$typename,
        };

GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$RemovedFromProjectEvent
    _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$RemovedFromProjectEventFromJson(
        Map<String, dynamic> json) {
  return GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$RemovedFromProjectEvent()
    ..id = json['id'] as String
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..actor = json['actor'] == null
        ? null
        : RemovedFromProjectMixin$Actor.fromJson(
            json['actor'] as Map<String, dynamic>)
    ..project = json['project'] == null
        ? null
        : RemovedFromProjectMixin$Project.fromJson(
            json['project'] as Map<String, dynamic>)
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$RemovedFromProjectEventToJson(
            GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$RemovedFromProjectEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          'project': instance.project?.toJson(),
          '__typename': instance.$$typename,
        };

GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$RenamedTitleEvent
    _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$RenamedTitleEventFromJson(
        Map<String, dynamic> json) {
  return GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$RenamedTitleEvent()
    ..id = json['id'] as String
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..actor = json['actor'] == null
        ? null
        : RenamedTitleMixin$Actor.fromJson(
            json['actor'] as Map<String, dynamic>)
    ..previousTitle = json['previousTitle'] as String
    ..currentTitle = json['currentTitle'] as String
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$RenamedTitleEventToJson(
            GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$RenamedTitleEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          'previousTitle': instance.previousTitle,
          'currentTitle': instance.currentTitle,
          '__typename': instance.$$typename,
        };

GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$ReopenedEvent
    _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$ReopenedEventFromJson(
        Map<String, dynamic> json) {
  return GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$ReopenedEvent()
    ..id = json['id'] as String
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..actor = json['actor'] == null
        ? null
        : ReopenedMixin$Actor.fromJson(json['actor'] as Map<String, dynamic>)
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$ReopenedEventToJson(
            GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$ReopenedEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          '__typename': instance.$$typename,
        };

GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$UnassignedEvent
    _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$UnassignedEventFromJson(
        Map<String, dynamic> json) {
  return GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$UnassignedEvent()
    ..id = json['id'] as String
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..actor = json['actor'] == null
        ? null
        : UnassignedMixin$Actor.fromJson(json['actor'] as Map<String, dynamic>)
    ..assignee = json['assignee'] == null
        ? null
        : UnassignedMixin$Assignee.fromJson(
            json['assignee'] as Map<String, dynamic>)
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$UnassignedEventToJson(
            GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$UnassignedEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          'assignee': instance.assignee?.toJson(),
          '__typename': instance.$$typename,
        };

GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$UnlabeledEvent
    _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$UnlabeledEventFromJson(
        Map<String, dynamic> json) {
  return GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$UnlabeledEvent()
    ..id = json['id'] as String
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..actor = json['actor'] == null
        ? null
        : UnlabeledMixin$Actor.fromJson(json['actor'] as Map<String, dynamic>)
    ..label =
        UnlabeledMixin$Label.fromJson(json['label'] as Map<String, dynamic>)
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$UnlabeledEventToJson(
            GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$UnlabeledEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          'label': instance.label.toJson(),
          '__typename': instance.$$typename,
        };

GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$UnlockedEvent
    _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$UnlockedEventFromJson(
        Map<String, dynamic> json) {
  return GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$UnlockedEvent()
    ..id = json['id'] as String
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..actor = json['actor'] == null
        ? null
        : UnlockedMixin$Actor.fromJson(json['actor'] as Map<String, dynamic>)
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$UnlockedEventToJson(
            GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$UnlockedEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          '__typename': instance.$$typename,
        };

GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$UnmarkedAsDuplicateEvent
    _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$UnmarkedAsDuplicateEventFromJson(
        Map<String, dynamic> json) {
  return GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$UnmarkedAsDuplicateEvent()
    ..id = json['id'] as String
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..actor = json['actor'] == null
        ? null
        : UnmarkedAsDuplicateMixin$Actor.fromJson(
            json['actor'] as Map<String, dynamic>)
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$UnmarkedAsDuplicateEventToJson(
            GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$UnmarkedAsDuplicateEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          '__typename': instance.$$typename,
        };

GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$UnpinnedEvent
    _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$UnpinnedEventFromJson(
        Map<String, dynamic> json) {
  return GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$UnpinnedEvent()
    ..id = json['id'] as String
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..actor = json['actor'] == null
        ? null
        : UnpinnedMixin$Actor.fromJson(json['actor'] as Map<String, dynamic>)
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$UnpinnedEventToJson(
            GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node$UnpinnedEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          '__typename': instance.$$typename,
        };

GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node
    _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$NodeFromJson(
        Map<String, dynamic> json) {
  return GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node()
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$NodeToJson(
            GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node
                instance) =>
        <String, dynamic>{
          '__typename': instance.$$typename,
        };

GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges
    _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$EdgesFromJson(
        Map<String, dynamic> json) {
  return GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges()
    ..node = json['node'] == null
        ? null
        : GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges$Node
            .fromJson(json['node'] as Map<String, dynamic>)
    ..cursor = json['cursor'] as String;
}

Map<String, dynamic>
    _$GetIssueTimeline$Query$Repository$Issue$TimelineItems$EdgesToJson(
            GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges
                instance) =>
        <String, dynamic>{
          'node': instance.node?.toJson(),
          'cursor': instance.cursor,
        };

GetIssueTimeline$Query$Repository$Issue$TimelineItems
    _$GetIssueTimeline$Query$Repository$Issue$TimelineItemsFromJson(
        Map<String, dynamic> json) {
  return GetIssueTimeline$Query$Repository$Issue$TimelineItems()
    ..edges = (json['edges'] as List<dynamic>?)
        ?.map((e) => e == null
            ? null
            : GetIssueTimeline$Query$Repository$Issue$TimelineItems$Edges
                .fromJson(e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic>
    _$GetIssueTimeline$Query$Repository$Issue$TimelineItemsToJson(
            GetIssueTimeline$Query$Repository$Issue$TimelineItems instance) =>
        <String, dynamic>{
          'edges': instance.edges?.map((e) => e?.toJson()).toList(),
        };

GetIssueTimeline$Query$Repository$Issue
    _$GetIssueTimeline$Query$Repository$IssueFromJson(
        Map<String, dynamic> json) {
  return GetIssueTimeline$Query$Repository$Issue()
    ..timelineItems =
        GetIssueTimeline$Query$Repository$Issue$TimelineItems.fromJson(
            json['timelineItems'] as Map<String, dynamic>);
}

Map<String, dynamic> _$GetIssueTimeline$Query$Repository$IssueToJson(
        GetIssueTimeline$Query$Repository$Issue instance) =>
    <String, dynamic>{
      'timelineItems': instance.timelineItems.toJson(),
    };

GetIssueTimeline$Query$Repository _$GetIssueTimeline$Query$RepositoryFromJson(
    Map<String, dynamic> json) {
  return GetIssueTimeline$Query$Repository()
    ..issue = json['issue'] == null
        ? null
        : GetIssueTimeline$Query$Repository$Issue.fromJson(
            json['issue'] as Map<String, dynamic>);
}

Map<String, dynamic> _$GetIssueTimeline$Query$RepositoryToJson(
        GetIssueTimeline$Query$Repository instance) =>
    <String, dynamic>{
      'issue': instance.issue?.toJson(),
    };

GetIssueTimeline$Query _$GetIssueTimeline$QueryFromJson(
    Map<String, dynamic> json) {
  return GetIssueTimeline$Query()
    ..repository = json['repository'] == null
        ? null
        : GetIssueTimeline$Query$Repository.fromJson(
            json['repository'] as Map<String, dynamic>);
}

Map<String, dynamic> _$GetIssueTimeline$QueryToJson(
        GetIssueTimeline$Query instance) =>
    <String, dynamic>{
      'repository': instance.repository?.toJson(),
    };

AddedToProjectMixin$Actor _$AddedToProjectMixin$ActorFromJson(
    Map<String, dynamic> json) {
  return AddedToProjectMixin$Actor()
    ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
    ..login = json['login'] as String;
}

Map<String, dynamic> _$AddedToProjectMixin$ActorToJson(
        AddedToProjectMixin$Actor instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
    };

AssignedMixin$Actor _$AssignedMixin$ActorFromJson(Map<String, dynamic> json) {
  return AssignedMixin$Actor()
    ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
    ..login = json['login'] as String;
}

Map<String, dynamic> _$AssignedMixin$ActorToJson(
        AssignedMixin$Actor instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
    };

AssignedMixin$Assignee _$AssignedMixin$AssigneeFromJson(
    Map<String, dynamic> json) {
  return AssignedMixin$Assignee()..$$typename = json['__typename'] as String?;
}

Map<String, dynamic> _$AssignedMixin$AssigneeToJson(
        AssignedMixin$Assignee instance) =>
    <String, dynamic>{
      '__typename': instance.$$typename,
    };

BaseRefChangedMixin$Actor _$BaseRefChangedMixin$ActorFromJson(
    Map<String, dynamic> json) {
  return BaseRefChangedMixin$Actor()
    ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
    ..login = json['login'] as String;
}

Map<String, dynamic> _$BaseRefChangedMixin$ActorToJson(
        BaseRefChangedMixin$Actor instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
    };

BaseRefDeletedMixin$Actor _$BaseRefDeletedMixin$ActorFromJson(
    Map<String, dynamic> json) {
  return BaseRefDeletedMixin$Actor()
    ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
    ..login = json['login'] as String;
}

Map<String, dynamic> _$BaseRefDeletedMixin$ActorToJson(
        BaseRefDeletedMixin$Actor instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
    };

BaseRefForcePushedMixin$Actor _$BaseRefForcePushedMixin$ActorFromJson(
    Map<String, dynamic> json) {
  return BaseRefForcePushedMixin$Actor()
    ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
    ..login = json['login'] as String;
}

Map<String, dynamic> _$BaseRefForcePushedMixin$ActorToJson(
        BaseRefForcePushedMixin$Actor instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
    };

ClosedMixin$Actor _$ClosedMixin$ActorFromJson(Map<String, dynamic> json) {
  return ClosedMixin$Actor()
    ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
    ..login = json['login'] as String;
}

Map<String, dynamic> _$ClosedMixin$ActorToJson(ClosedMixin$Actor instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
    };

ConvertedToDraftMixin$Actor _$ConvertedToDraftMixin$ActorFromJson(
    Map<String, dynamic> json) {
  return ConvertedToDraftMixin$Actor()
    ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
    ..login = json['login'] as String;
}

Map<String, dynamic> _$ConvertedToDraftMixin$ActorToJson(
        ConvertedToDraftMixin$Actor instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
    };

CrossReferenceMixin$Actor _$CrossReferenceMixin$ActorFromJson(
    Map<String, dynamic> json) {
  return CrossReferenceMixin$Actor()
    ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
    ..login = json['login'] as String;
}

Map<String, dynamic> _$CrossReferenceMixin$ActorToJson(
        CrossReferenceMixin$Actor instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
    };

CrossReferenceMixin$Source _$CrossReferenceMixin$SourceFromJson(
    Map<String, dynamic> json) {
  return CrossReferenceMixin$Source()
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic> _$CrossReferenceMixin$SourceToJson(
        CrossReferenceMixin$Source instance) =>
    <String, dynamic>{
      '__typename': instance.$$typename,
    };

DeMileStonedMixin$Actor _$DeMileStonedMixin$ActorFromJson(
    Map<String, dynamic> json) {
  return DeMileStonedMixin$Actor()
    ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
    ..login = json['login'] as String;
}

Map<String, dynamic> _$DeMileStonedMixin$ActorToJson(
        DeMileStonedMixin$Actor instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
    };

HeadRefDeletedMixin$Actor _$HeadRefDeletedMixin$ActorFromJson(
    Map<String, dynamic> json) {
  return HeadRefDeletedMixin$Actor()
    ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
    ..login = json['login'] as String;
}

Map<String, dynamic> _$HeadRefDeletedMixin$ActorToJson(
        HeadRefDeletedMixin$Actor instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
    };

HeadRefForcePushedMixin$Actor _$HeadRefForcePushedMixin$ActorFromJson(
    Map<String, dynamic> json) {
  return HeadRefForcePushedMixin$Actor()
    ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
    ..login = json['login'] as String;
}

Map<String, dynamic> _$HeadRefForcePushedMixin$ActorToJson(
        HeadRefForcePushedMixin$Actor instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
    };

HeadRefRestoredMixin$Actor _$HeadRefRestoredMixin$ActorFromJson(
    Map<String, dynamic> json) {
  return HeadRefRestoredMixin$Actor()
    ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
    ..login = json['login'] as String;
}

Map<String, dynamic> _$HeadRefRestoredMixin$ActorToJson(
        HeadRefRestoredMixin$Actor instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
    };

IssueCommentMixin$Author _$IssueCommentMixin$AuthorFromJson(
    Map<String, dynamic> json) {
  return IssueCommentMixin$Author()
    ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
    ..login = json['login'] as String;
}

Map<String, dynamic> _$IssueCommentMixin$AuthorToJson(
        IssueCommentMixin$Author instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
    };

IssueCommentMixin$ReactionGroups$Users
    _$IssueCommentMixin$ReactionGroups$UsersFromJson(
        Map<String, dynamic> json) {
  return IssueCommentMixin$ReactionGroups$Users()
    ..totalCount = json['totalCount'] as int;
}

Map<String, dynamic> _$IssueCommentMixin$ReactionGroups$UsersToJson(
        IssueCommentMixin$ReactionGroups$Users instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
    };

IssueCommentMixin$ReactionGroups _$IssueCommentMixin$ReactionGroupsFromJson(
    Map<String, dynamic> json) {
  return IssueCommentMixin$ReactionGroups()
    ..content = _$enumDecode(_$ReactionContentEnumMap, json['content'],
        unknownValue: ReactionContent.artemisUnknown)
    ..viewerHasReacted = json['viewerHasReacted'] as bool
    ..users = IssueCommentMixin$ReactionGroups$Users.fromJson(
        json['users'] as Map<String, dynamic>);
}

Map<String, dynamic> _$IssueCommentMixin$ReactionGroupsToJson(
        IssueCommentMixin$ReactionGroups instance) =>
    <String, dynamic>{
      'content': _$ReactionContentEnumMap[instance.content],
      'viewerHasReacted': instance.viewerHasReacted,
      'users': instance.users.toJson(),
    };

const _$ReactionContentEnumMap = {
  ReactionContent.confused: 'CONFUSED',
  ReactionContent.eyes: 'EYES',
  ReactionContent.heart: 'HEART',
  ReactionContent.hooray: 'HOORAY',
  ReactionContent.laugh: 'LAUGH',
  ReactionContent.rocket: 'ROCKET',
  ReactionContent.thumbsDown: 'THUMBS_DOWN',
  ReactionContent.thumbsUp: 'THUMBS_UP',
  ReactionContent.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

LabeledMixin$Actor _$LabeledMixin$ActorFromJson(Map<String, dynamic> json) {
  return LabeledMixin$Actor()
    ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
    ..login = json['login'] as String;
}

Map<String, dynamic> _$LabeledMixin$ActorToJson(LabeledMixin$Actor instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
    };

LabeledMixin$Label _$LabeledMixin$LabelFromJson(Map<String, dynamic> json) {
  return LabeledMixin$Label()
    ..color = json['color'] as String
    ..name = json['name'] as String;
}

Map<String, dynamic> _$LabeledMixin$LabelToJson(LabeledMixin$Label instance) =>
    <String, dynamic>{
      'color': instance.color,
      'name': instance.name,
    };

LockedMixin$Actor _$LockedMixin$ActorFromJson(Map<String, dynamic> json) {
  return LockedMixin$Actor()
    ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
    ..login = json['login'] as String;
}

Map<String, dynamic> _$LockedMixin$ActorToJson(LockedMixin$Actor instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
    };

MarkedAsDuplicateMixin$Actor _$MarkedAsDuplicateMixin$ActorFromJson(
    Map<String, dynamic> json) {
  return MarkedAsDuplicateMixin$Actor()
    ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
    ..login = json['login'] as String;
}

Map<String, dynamic> _$MarkedAsDuplicateMixin$ActorToJson(
        MarkedAsDuplicateMixin$Actor instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
    };

MarkedAsDuplicateMixin$Canonical _$MarkedAsDuplicateMixin$CanonicalFromJson(
    Map<String, dynamic> json) {
  return MarkedAsDuplicateMixin$Canonical()
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic> _$MarkedAsDuplicateMixin$CanonicalToJson(
        MarkedAsDuplicateMixin$Canonical instance) =>
    <String, dynamic>{
      '__typename': instance.$$typename,
    };

MergedMixin$Actor _$MergedMixin$ActorFromJson(Map<String, dynamic> json) {
  return MergedMixin$Actor()
    ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
    ..login = json['login'] as String;
}

Map<String, dynamic> _$MergedMixin$ActorToJson(MergedMixin$Actor instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
    };

MileStonedMixin$Actor _$MileStonedMixin$ActorFromJson(
    Map<String, dynamic> json) {
  return MileStonedMixin$Actor()
    ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
    ..login = json['login'] as String;
}

Map<String, dynamic> _$MileStonedMixin$ActorToJson(
        MileStonedMixin$Actor instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
    };

MovedColumnsInProjectMixin$Actor _$MovedColumnsInProjectMixin$ActorFromJson(
    Map<String, dynamic> json) {
  return MovedColumnsInProjectMixin$Actor()
    ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
    ..login = json['login'] as String;
}

Map<String, dynamic> _$MovedColumnsInProjectMixin$ActorToJson(
        MovedColumnsInProjectMixin$Actor instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
    };

MovedColumnsInProjectMixin$Project _$MovedColumnsInProjectMixin$ProjectFromJson(
    Map<String, dynamic> json) {
  return MovedColumnsInProjectMixin$Project()..name = json['name'] as String;
}

Map<String, dynamic> _$MovedColumnsInProjectMixin$ProjectToJson(
        MovedColumnsInProjectMixin$Project instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

PinnedMixin$Actor _$PinnedMixin$ActorFromJson(Map<String, dynamic> json) {
  return PinnedMixin$Actor()
    ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
    ..login = json['login'] as String;
}

Map<String, dynamic> _$PinnedMixin$ActorToJson(PinnedMixin$Actor instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
    };

PullRequestCommitMixin$Commit$Author$User
    _$PullRequestCommitMixin$Commit$Author$UserFromJson(
        Map<String, dynamic> json) {
  return PullRequestCommitMixin$Commit$Author$User()
    ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
    ..login = json['login'] as String;
}

Map<String, dynamic> _$PullRequestCommitMixin$Commit$Author$UserToJson(
        PullRequestCommitMixin$Commit$Author$User instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
    };

PullRequestCommitMixin$Commit$Author
    _$PullRequestCommitMixin$Commit$AuthorFromJson(Map<String, dynamic> json) {
  return PullRequestCommitMixin$Commit$Author()
    ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
    ..name = json['name'] as String?
    ..user = json['user'] == null
        ? null
        : PullRequestCommitMixin$Commit$Author$User.fromJson(
            json['user'] as Map<String, dynamic>);
}

Map<String, dynamic> _$PullRequestCommitMixin$Commit$AuthorToJson(
        PullRequestCommitMixin$Commit$Author instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'name': instance.name,
      'user': instance.user?.toJson(),
    };

PullRequestCommitMixin$Commit _$PullRequestCommitMixin$CommitFromJson(
    Map<String, dynamic> json) {
  return PullRequestCommitMixin$Commit()
    ..additions = json['additions'] as int
    ..authoredDate = DateTime.parse(json['authoredDate'] as String)
    ..message = json['message'] as String
    ..messageHeadline = json['messageHeadline'] as String
    ..author = json['author'] == null
        ? null
        : PullRequestCommitMixin$Commit$Author.fromJson(
            json['author'] as Map<String, dynamic>);
}

Map<String, dynamic> _$PullRequestCommitMixin$CommitToJson(
        PullRequestCommitMixin$Commit instance) =>
    <String, dynamic>{
      'additions': instance.additions,
      'authoredDate': instance.authoredDate.toIso8601String(),
      'message': instance.message,
      'messageHeadline': instance.messageHeadline,
      'author': instance.author?.toJson(),
    };

ReadyForReviewMixin$Actor _$ReadyForReviewMixin$ActorFromJson(
    Map<String, dynamic> json) {
  return ReadyForReviewMixin$Actor()
    ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
    ..login = json['login'] as String;
}

Map<String, dynamic> _$ReadyForReviewMixin$ActorToJson(
        ReadyForReviewMixin$Actor instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
    };

ReferencedMixin$Actor _$ReferencedMixin$ActorFromJson(
    Map<String, dynamic> json) {
  return ReferencedMixin$Actor()
    ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
    ..login = json['login'] as String;
}

Map<String, dynamic> _$ReferencedMixin$ActorToJson(
        ReferencedMixin$Actor instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
    };

ReferencedMixin$Subject _$ReferencedMixin$SubjectFromJson(
    Map<String, dynamic> json) {
  return ReferencedMixin$Subject()..$$typename = json['__typename'] as String?;
}

Map<String, dynamic> _$ReferencedMixin$SubjectToJson(
        ReferencedMixin$Subject instance) =>
    <String, dynamic>{
      '__typename': instance.$$typename,
    };

RemovedFromProjectMixin$Actor _$RemovedFromProjectMixin$ActorFromJson(
    Map<String, dynamic> json) {
  return RemovedFromProjectMixin$Actor()
    ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
    ..login = json['login'] as String;
}

Map<String, dynamic> _$RemovedFromProjectMixin$ActorToJson(
        RemovedFromProjectMixin$Actor instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
    };

RemovedFromProjectMixin$Project _$RemovedFromProjectMixin$ProjectFromJson(
    Map<String, dynamic> json) {
  return RemovedFromProjectMixin$Project()..name = json['name'] as String;
}

Map<String, dynamic> _$RemovedFromProjectMixin$ProjectToJson(
        RemovedFromProjectMixin$Project instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

RenamedTitleMixin$Actor _$RenamedTitleMixin$ActorFromJson(
    Map<String, dynamic> json) {
  return RenamedTitleMixin$Actor()
    ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
    ..login = json['login'] as String;
}

Map<String, dynamic> _$RenamedTitleMixin$ActorToJson(
        RenamedTitleMixin$Actor instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
    };

ReopenedMixin$Actor _$ReopenedMixin$ActorFromJson(Map<String, dynamic> json) {
  return ReopenedMixin$Actor()
    ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
    ..login = json['login'] as String;
}

Map<String, dynamic> _$ReopenedMixin$ActorToJson(
        ReopenedMixin$Actor instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
    };

ReviewDismissedMixin$Actor _$ReviewDismissedMixin$ActorFromJson(
    Map<String, dynamic> json) {
  return ReviewDismissedMixin$Actor()
    ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
    ..login = json['login'] as String;
}

Map<String, dynamic> _$ReviewDismissedMixin$ActorToJson(
        ReviewDismissedMixin$Actor instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
    };

ReviewRequestedMixin$Actor _$ReviewRequestedMixin$ActorFromJson(
    Map<String, dynamic> json) {
  return ReviewRequestedMixin$Actor()
    ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
    ..login = json['login'] as String;
}

Map<String, dynamic> _$ReviewRequestedMixin$ActorToJson(
        ReviewRequestedMixin$Actor instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
    };

ReviewRequestedMixin$RequestedReviewer
    _$ReviewRequestedMixin$RequestedReviewerFromJson(
        Map<String, dynamic> json) {
  return ReviewRequestedMixin$RequestedReviewer()
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic> _$ReviewRequestedMixin$RequestedReviewerToJson(
        ReviewRequestedMixin$RequestedReviewer instance) =>
    <String, dynamic>{
      '__typename': instance.$$typename,
    };

UnassignedMixin$Actor _$UnassignedMixin$ActorFromJson(
    Map<String, dynamic> json) {
  return UnassignedMixin$Actor()
    ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
    ..login = json['login'] as String;
}

Map<String, dynamic> _$UnassignedMixin$ActorToJson(
        UnassignedMixin$Actor instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
    };

UnassignedMixin$Assignee _$UnassignedMixin$AssigneeFromJson(
    Map<String, dynamic> json) {
  return UnassignedMixin$Assignee()..$$typename = json['__typename'] as String?;
}

Map<String, dynamic> _$UnassignedMixin$AssigneeToJson(
        UnassignedMixin$Assignee instance) =>
    <String, dynamic>{
      '__typename': instance.$$typename,
    };

UnlabeledMixin$Actor _$UnlabeledMixin$ActorFromJson(Map<String, dynamic> json) {
  return UnlabeledMixin$Actor()
    ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
    ..login = json['login'] as String;
}

Map<String, dynamic> _$UnlabeledMixin$ActorToJson(
        UnlabeledMixin$Actor instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
    };

UnlabeledMixin$Label _$UnlabeledMixin$LabelFromJson(Map<String, dynamic> json) {
  return UnlabeledMixin$Label()
    ..color = json['color'] as String
    ..name = json['name'] as String;
}

Map<String, dynamic> _$UnlabeledMixin$LabelToJson(
        UnlabeledMixin$Label instance) =>
    <String, dynamic>{
      'color': instance.color,
      'name': instance.name,
    };

UnlockedMixin$Actor _$UnlockedMixin$ActorFromJson(Map<String, dynamic> json) {
  return UnlockedMixin$Actor()
    ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
    ..login = json['login'] as String;
}

Map<String, dynamic> _$UnlockedMixin$ActorToJson(
        UnlockedMixin$Actor instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
    };

UnmarkedAsDuplicateMixin$Actor _$UnmarkedAsDuplicateMixin$ActorFromJson(
    Map<String, dynamic> json) {
  return UnmarkedAsDuplicateMixin$Actor()
    ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
    ..login = json['login'] as String;
}

Map<String, dynamic> _$UnmarkedAsDuplicateMixin$ActorToJson(
        UnmarkedAsDuplicateMixin$Actor instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
    };

UnpinnedMixin$Actor _$UnpinnedMixin$ActorFromJson(Map<String, dynamic> json) {
  return UnpinnedMixin$Actor()
    ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
    ..login = json['login'] as String;
}

Map<String, dynamic> _$UnpinnedMixin$ActorToJson(
        UnpinnedMixin$Actor instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
    };

AssigneeMixin$User _$AssigneeMixin$UserFromJson(Map<String, dynamic> json) {
  return AssigneeMixin$User()
    ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
    ..login = json['login'] as String;
}

Map<String, dynamic> _$AssigneeMixin$UserToJson(AssigneeMixin$User instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
    };

AssigneeMixin$Bot _$AssigneeMixin$BotFromJson(Map<String, dynamic> json) {
  return AssigneeMixin$Bot()
    ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
    ..login = json['login'] as String;
}

Map<String, dynamic> _$AssigneeMixin$BotToJson(AssigneeMixin$Bot instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
    };

AssigneeMixin$Mannequin _$AssigneeMixin$MannequinFromJson(
    Map<String, dynamic> json) {
  return AssigneeMixin$Mannequin()
    ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
    ..login = json['login'] as String;
}

Map<String, dynamic> _$AssigneeMixin$MannequinToJson(
        AssigneeMixin$Mannequin instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
    };

AssigneeMixin$Organization _$AssigneeMixin$OrganizationFromJson(
    Map<String, dynamic> json) {
  return AssigneeMixin$Organization()
    ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
    ..login = json['login'] as String;
}

Map<String, dynamic> _$AssigneeMixin$OrganizationToJson(
        AssigneeMixin$Organization instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
    };

SourceMixin$Issue _$SourceMixin$IssueFromJson(Map<String, dynamic> json) {
  return SourceMixin$Issue()
    ..url = Uri.parse(json['url'] as String)
    ..title = json['title'] as String
    ..number = json['number'] as int
    ..issueState = _$enumDecode(_$IssueStateEnumMap, json['issueState'],
        unknownValue: IssueState.artemisUnknown);
}

Map<String, dynamic> _$SourceMixin$IssueToJson(SourceMixin$Issue instance) =>
    <String, dynamic>{
      'url': instance.url.toString(),
      'title': instance.title,
      'number': instance.number,
      'issueState': _$IssueStateEnumMap[instance.issueState],
    };

const _$IssueStateEnumMap = {
  IssueState.closed: 'CLOSED',
  IssueState.open: 'OPEN',
  IssueState.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

SourceMixin$PullRequest _$SourceMixin$PullRequestFromJson(
    Map<String, dynamic> json) {
  return SourceMixin$PullRequest()
    ..url = Uri.parse(json['url'] as String)
    ..title = json['title'] as String
    ..number = json['number'] as int
    ..pullState = _$enumDecode(_$PullRequestStateEnumMap, json['pullState'],
        unknownValue: PullRequestState.artemisUnknown);
}

Map<String, dynamic> _$SourceMixin$PullRequestToJson(
        SourceMixin$PullRequest instance) =>
    <String, dynamic>{
      'url': instance.url.toString(),
      'title': instance.title,
      'number': instance.number,
      'pullState': _$PullRequestStateEnumMap[instance.pullState],
    };

const _$PullRequestStateEnumMap = {
  PullRequestState.closed: 'CLOSED',
  PullRequestState.merged: 'MERGED',
  PullRequestState.open: 'OPEN',
  PullRequestState.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$AddedToProjectEvent
    _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$AddedToProjectEventFromJson(
        Map<String, dynamic> json) {
  return GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$AddedToProjectEvent()
    ..id = json['id'] as String
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..actor = json['actor'] == null
        ? null
        : AddedToProjectMixin$Actor.fromJson(
            json['actor'] as Map<String, dynamic>)
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$AddedToProjectEventToJson(
            GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$AddedToProjectEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          '__typename': instance.$$typename,
        };

GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$AssignedEvent
    _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$AssignedEventFromJson(
        Map<String, dynamic> json) {
  return GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$AssignedEvent()
    ..id = json['id'] as String
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..actor = json['actor'] == null
        ? null
        : AssignedMixin$Actor.fromJson(json['actor'] as Map<String, dynamic>)
    ..assignee = json['assignee'] == null
        ? null
        : AssignedMixin$Assignee.fromJson(
            json['assignee'] as Map<String, dynamic>)
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$AssignedEventToJson(
            GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$AssignedEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          'assignee': instance.assignee?.toJson(),
          '__typename': instance.$$typename,
        };

GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$BaseRefChangedEvent
    _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$BaseRefChangedEventFromJson(
        Map<String, dynamic> json) {
  return GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$BaseRefChangedEvent()
    ..id = json['id'] as String
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..actor = json['actor'] == null
        ? null
        : BaseRefChangedMixin$Actor.fromJson(
            json['actor'] as Map<String, dynamic>)
    ..currentRefName = json['currentRefName'] as String
    ..previousRefName = json['previousRefName'] as String
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$BaseRefChangedEventToJson(
            GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$BaseRefChangedEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          'currentRefName': instance.currentRefName,
          'previousRefName': instance.previousRefName,
          '__typename': instance.$$typename,
        };

GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$BaseRefDeletedEvent
    _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$BaseRefDeletedEventFromJson(
        Map<String, dynamic> json) {
  return GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$BaseRefDeletedEvent()
    ..id = json['id'] as String
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..actor = json['actor'] == null
        ? null
        : BaseRefDeletedMixin$Actor.fromJson(
            json['actor'] as Map<String, dynamic>)
    ..baseRefName = json['baseRefName'] as String?
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$BaseRefDeletedEventToJson(
            GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$BaseRefDeletedEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          'baseRefName': instance.baseRefName,
          '__typename': instance.$$typename,
        };

GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$BaseRefForcePushedEvent
    _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$BaseRefForcePushedEventFromJson(
        Map<String, dynamic> json) {
  return GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$BaseRefForcePushedEvent()
    ..id = json['id'] as String
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..actor = json['actor'] == null
        ? null
        : BaseRefForcePushedMixin$Actor.fromJson(
            json['actor'] as Map<String, dynamic>)
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$BaseRefForcePushedEventToJson(
            GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$BaseRefForcePushedEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          '__typename': instance.$$typename,
        };

GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$ClosedEvent
    _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$ClosedEventFromJson(
        Map<String, dynamic> json) {
  return GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$ClosedEvent()
    ..id = json['id'] as String
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..actor = json['actor'] == null
        ? null
        : ClosedMixin$Actor.fromJson(json['actor'] as Map<String, dynamic>)
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$ClosedEventToJson(
            GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$ClosedEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          '__typename': instance.$$typename,
        };

GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$ConvertToDraftEvent
    _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$ConvertToDraftEventFromJson(
        Map<String, dynamic> json) {
  return GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$ConvertToDraftEvent()
    ..id = json['id'] as String
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..actor = json['actor'] == null
        ? null
        : ConvertedToDraftMixin$Actor.fromJson(
            json['actor'] as Map<String, dynamic>)
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$ConvertToDraftEventToJson(
            GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$ConvertToDraftEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          '__typename': instance.$$typename,
        };

GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$CrossReferencedEvent
    _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$CrossReferencedEventFromJson(
        Map<String, dynamic> json) {
  return GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$CrossReferencedEvent()
    ..id = json['id'] as String
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..actor = json['actor'] == null
        ? null
        : CrossReferenceMixin$Actor.fromJson(
            json['actor'] as Map<String, dynamic>)
    ..source = CrossReferenceMixin$Source.fromJson(
        json['source'] as Map<String, dynamic>)
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$CrossReferencedEventToJson(
            GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$CrossReferencedEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          'source': instance.source.toJson(),
          '__typename': instance.$$typename,
        };

GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$DemilestonedEvent
    _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$DemilestonedEventFromJson(
        Map<String, dynamic> json) {
  return GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$DemilestonedEvent()
    ..id = json['id'] as String
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..actor = json['actor'] == null
        ? null
        : DeMileStonedMixin$Actor.fromJson(
            json['actor'] as Map<String, dynamic>)
    ..milestoneTitle = json['milestoneTitle'] as String
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$DemilestonedEventToJson(
            GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$DemilestonedEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          'milestoneTitle': instance.milestoneTitle,
          '__typename': instance.$$typename,
        };

GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$HeadRefDeletedEvent
    _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$HeadRefDeletedEventFromJson(
        Map<String, dynamic> json) {
  return GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$HeadRefDeletedEvent()
    ..id = json['id'] as String
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..actor = json['actor'] == null
        ? null
        : HeadRefDeletedMixin$Actor.fromJson(
            json['actor'] as Map<String, dynamic>)
    ..headRefName = json['headRefName'] as String
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$HeadRefDeletedEventToJson(
            GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$HeadRefDeletedEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          'headRefName': instance.headRefName,
          '__typename': instance.$$typename,
        };

GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$HeadRefForcePushedEvent
    _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$HeadRefForcePushedEventFromJson(
        Map<String, dynamic> json) {
  return GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$HeadRefForcePushedEvent()
    ..id = json['id'] as String
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..actor = json['actor'] == null
        ? null
        : HeadRefForcePushedMixin$Actor.fromJson(
            json['actor'] as Map<String, dynamic>)
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$HeadRefForcePushedEventToJson(
            GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$HeadRefForcePushedEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          '__typename': instance.$$typename,
        };

GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$HeadRefRestoredEvent
    _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$HeadRefRestoredEventFromJson(
        Map<String, dynamic> json) {
  return GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$HeadRefRestoredEvent()
    ..id = json['id'] as String
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..actor = json['actor'] == null
        ? null
        : HeadRefRestoredMixin$Actor.fromJson(
            json['actor'] as Map<String, dynamic>)
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$HeadRefRestoredEventToJson(
            GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$HeadRefRestoredEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          '__typename': instance.$$typename,
        };

GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$IssueComment
    _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$IssueCommentFromJson(
        Map<String, dynamic> json) {
  return GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$IssueComment()
    ..id = json['id'] as String
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..author = json['author'] == null
        ? null
        : IssueCommentMixin$Author.fromJson(
            json['author'] as Map<String, dynamic>)
    ..authorAssociation = _$enumDecode(
        _$CommentAuthorAssociationEnumMap, json['authorAssociation'],
        unknownValue: CommentAuthorAssociation.artemisUnknown)
    ..body = json['body'] as String
    ..bodyHTML = json['bodyHTML'] as String
    ..lastEditedAt = json['lastEditedAt'] == null
        ? null
        : DateTime.parse(json['lastEditedAt'] as String)
    ..isMinimized = json['isMinimized'] as bool
    ..minimizedReason = json['minimizedReason'] as String?
    ..reactionGroups = (json['reactionGroups'] as List<dynamic>?)
        ?.map((e) => IssueCommentMixin$ReactionGroups.fromJson(
            e as Map<String, dynamic>))
        .toList()
    ..viewerCanMinimize = json['viewerCanMinimize'] as bool
    ..viewerCanDelete = json['viewerCanDelete'] as bool
    ..viewerCanUpdate = json['viewerCanUpdate'] as bool
    ..viewerDidAuthor = json['viewerDidAuthor'] as bool
    ..viewerCannotUpdateReasons =
        (json['viewerCannotUpdateReasons'] as List<dynamic>)
            .map((e) => _$enumDecode(_$CommentCannotUpdateReasonEnumMap, e,
                unknownValue: CommentCannotUpdateReason.artemisUnknown))
            .toList()
    ..viewerCanReact = json['viewerCanReact'] as bool
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$IssueCommentToJson(
            GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$IssueComment
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'author': instance.author?.toJson(),
          'authorAssociation':
              _$CommentAuthorAssociationEnumMap[instance.authorAssociation],
          'body': instance.body,
          'bodyHTML': instance.bodyHTML,
          'lastEditedAt': instance.lastEditedAt?.toIso8601String(),
          'isMinimized': instance.isMinimized,
          'minimizedReason': instance.minimizedReason,
          'reactionGroups':
              instance.reactionGroups?.map((e) => e.toJson()).toList(),
          'viewerCanMinimize': instance.viewerCanMinimize,
          'viewerCanDelete': instance.viewerCanDelete,
          'viewerCanUpdate': instance.viewerCanUpdate,
          'viewerDidAuthor': instance.viewerDidAuthor,
          'viewerCannotUpdateReasons': instance.viewerCannotUpdateReasons
              .map((e) => _$CommentCannotUpdateReasonEnumMap[e])
              .toList(),
          'viewerCanReact': instance.viewerCanReact,
          '__typename': instance.$$typename,
        };

GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$LabeledEvent
    _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$LabeledEventFromJson(
        Map<String, dynamic> json) {
  return GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$LabeledEvent()
    ..id = json['id'] as String
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..actor = json['actor'] == null
        ? null
        : LabeledMixin$Actor.fromJson(json['actor'] as Map<String, dynamic>)
    ..label = LabeledMixin$Label.fromJson(json['label'] as Map<String, dynamic>)
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$LabeledEventToJson(
            GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$LabeledEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          'label': instance.label.toJson(),
          '__typename': instance.$$typename,
        };

GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$LockedEvent
    _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$LockedEventFromJson(
        Map<String, dynamic> json) {
  return GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$LockedEvent()
    ..id = json['id'] as String
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..actor = json['actor'] == null
        ? null
        : LockedMixin$Actor.fromJson(json['actor'] as Map<String, dynamic>)
    ..lockReason = _$enumDecodeNullable(_$LockReasonEnumMap, json['lockReason'],
        unknownValue: LockReason.artemisUnknown)
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$LockedEventToJson(
            GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$LockedEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          'lockReason': _$LockReasonEnumMap[instance.lockReason],
          '__typename': instance.$$typename,
        };

GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$MarkedAsDuplicateEvent
    _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$MarkedAsDuplicateEventFromJson(
        Map<String, dynamic> json) {
  return GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$MarkedAsDuplicateEvent()
    ..id = json['id'] as String
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..actor = json['actor'] == null
        ? null
        : MarkedAsDuplicateMixin$Actor.fromJson(
            json['actor'] as Map<String, dynamic>)
    ..canonical = json['canonical'] == null
        ? null
        : MarkedAsDuplicateMixin$Canonical.fromJson(
            json['canonical'] as Map<String, dynamic>)
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$MarkedAsDuplicateEventToJson(
            GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$MarkedAsDuplicateEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          'canonical': instance.canonical?.toJson(),
          '__typename': instance.$$typename,
        };

GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$MergedEvent
    _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$MergedEventFromJson(
        Map<String, dynamic> json) {
  return GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$MergedEvent()
    ..id = json['id'] as String
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..actor = json['actor'] == null
        ? null
        : MergedMixin$Actor.fromJson(json['actor'] as Map<String, dynamic>)
    ..mergeRefName = json['mergeRefName'] as String
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$MergedEventToJson(
            GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$MergedEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          'mergeRefName': instance.mergeRefName,
          '__typename': instance.$$typename,
        };

GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$MilestonedEvent
    _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$MilestonedEventFromJson(
        Map<String, dynamic> json) {
  return GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$MilestonedEvent()
    ..id = json['id'] as String
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..actor = json['actor'] == null
        ? null
        : MileStonedMixin$Actor.fromJson(json['actor'] as Map<String, dynamic>)
    ..milestoneTitle = json['milestoneTitle'] as String
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$MilestonedEventToJson(
            GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$MilestonedEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          'milestoneTitle': instance.milestoneTitle,
          '__typename': instance.$$typename,
        };

GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$MovedColumnsInProjectEvent
    _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$MovedColumnsInProjectEventFromJson(
        Map<String, dynamic> json) {
  return GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$MovedColumnsInProjectEvent()
    ..id = json['id'] as String
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..actor = json['actor'] == null
        ? null
        : MovedColumnsInProjectMixin$Actor.fromJson(
            json['actor'] as Map<String, dynamic>)
    ..previousProjectColumnName = json['previousProjectColumnName'] as String
    ..projectColumnName = json['projectColumnName'] as String
    ..project = json['project'] == null
        ? null
        : MovedColumnsInProjectMixin$Project.fromJson(
            json['project'] as Map<String, dynamic>)
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$MovedColumnsInProjectEventToJson(
            GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$MovedColumnsInProjectEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          'previousProjectColumnName': instance.previousProjectColumnName,
          'projectColumnName': instance.projectColumnName,
          'project': instance.project?.toJson(),
          '__typename': instance.$$typename,
        };

GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$PinnedEvent
    _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$PinnedEventFromJson(
        Map<String, dynamic> json) {
  return GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$PinnedEvent()
    ..id = json['id'] as String
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..actor = json['actor'] == null
        ? null
        : PinnedMixin$Actor.fromJson(json['actor'] as Map<String, dynamic>)
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$PinnedEventToJson(
            GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$PinnedEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          '__typename': instance.$$typename,
        };

GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$PullRequestCommit
    _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$PullRequestCommitFromJson(
        Map<String, dynamic> json) {
  return GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$PullRequestCommit()
    ..id = json['id'] as String
    ..commit = PullRequestCommitMixin$Commit.fromJson(
        json['commit'] as Map<String, dynamic>)
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$PullRequestCommitToJson(
            GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$PullRequestCommit
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'commit': instance.commit.toJson(),
          '__typename': instance.$$typename,
        };

GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$PullRequestCommitCommentThread
    _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$PullRequestCommitCommentThreadFromJson(
        Map<String, dynamic> json) {
  return GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$PullRequestCommitCommentThread()
    ..$$typename = json['__typename'] as String?
    ..id = json['id'] as String;
}

Map<String, dynamic>
    _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$PullRequestCommitCommentThreadToJson(
            GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$PullRequestCommitCommentThread
                instance) =>
        <String, dynamic>{
          '__typename': instance.$$typename,
          'id': instance.id,
        };

GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$PullRequestReview$Author
    _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$PullRequestReview$AuthorFromJson(
        Map<String, dynamic> json) {
  return GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$PullRequestReview$Author()
    ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
    ..login = json['login'] as String;
}

Map<String, dynamic>
    _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$PullRequestReview$AuthorToJson(
            GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$PullRequestReview$Author
                instance) =>
        <String, dynamic>{
          'avatarUrl': instance.avatarUrl.toString(),
          'login': instance.login,
        };

GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$PullRequestReview
    _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$PullRequestReviewFromJson(
        Map<String, dynamic> json) {
  return GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$PullRequestReview()
    ..$$typename = json['__typename'] as String?
    ..id = json['id'] as String
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..author = json['author'] == null
        ? null
        : GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$PullRequestReview$Author
            .fromJson(json['author'] as Map<String, dynamic>)
    ..authorAssociation = _$enumDecode(
        _$CommentAuthorAssociationEnumMap, json['authorAssociation'],
        unknownValue: CommentAuthorAssociation.artemisUnknown)
    ..body = json['body'] as String
    ..bodyHTML = json['bodyHTML'] as String
    ..bodyText = json['bodyText'] as String;
}

Map<String, dynamic>
    _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$PullRequestReviewToJson(
            GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$PullRequestReview
                instance) =>
        <String, dynamic>{
          '__typename': instance.$$typename,
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'author': instance.author?.toJson(),
          'authorAssociation':
              _$CommentAuthorAssociationEnumMap[instance.authorAssociation],
          'body': instance.body,
          'bodyHTML': instance.bodyHTML,
          'bodyText': instance.bodyText,
        };

GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$PullRequestReviewThread
    _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$PullRequestReviewThreadFromJson(
        Map<String, dynamic> json) {
  return GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$PullRequestReviewThread()
    ..$$typename = json['__typename'] as String?
    ..id = json['id'] as String;
}

Map<String, dynamic>
    _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$PullRequestReviewThreadToJson(
            GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$PullRequestReviewThread
                instance) =>
        <String, dynamic>{
          '__typename': instance.$$typename,
          'id': instance.id,
        };

GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$ReadyForReviewEvent
    _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$ReadyForReviewEventFromJson(
        Map<String, dynamic> json) {
  return GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$ReadyForReviewEvent()
    ..id = json['id'] as String
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..actor = json['actor'] == null
        ? null
        : ReadyForReviewMixin$Actor.fromJson(
            json['actor'] as Map<String, dynamic>)
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$ReadyForReviewEventToJson(
            GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$ReadyForReviewEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          '__typename': instance.$$typename,
        };

GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$ReferencedEvent
    _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$ReferencedEventFromJson(
        Map<String, dynamic> json) {
  return GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$ReferencedEvent()
    ..id = json['id'] as String
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..actor = json['actor'] == null
        ? null
        : ReferencedMixin$Actor.fromJson(json['actor'] as Map<String, dynamic>)
    ..subject = ReferencedMixin$Subject.fromJson(
        json['subject'] as Map<String, dynamic>)
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$ReferencedEventToJson(
            GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$ReferencedEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          'subject': instance.subject.toJson(),
          '__typename': instance.$$typename,
        };

GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$RemovedFromProjectEvent
    _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$RemovedFromProjectEventFromJson(
        Map<String, dynamic> json) {
  return GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$RemovedFromProjectEvent()
    ..id = json['id'] as String
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..actor = json['actor'] == null
        ? null
        : RemovedFromProjectMixin$Actor.fromJson(
            json['actor'] as Map<String, dynamic>)
    ..project = json['project'] == null
        ? null
        : RemovedFromProjectMixin$Project.fromJson(
            json['project'] as Map<String, dynamic>)
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$RemovedFromProjectEventToJson(
            GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$RemovedFromProjectEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          'project': instance.project?.toJson(),
          '__typename': instance.$$typename,
        };

GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$RenamedTitleEvent
    _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$RenamedTitleEventFromJson(
        Map<String, dynamic> json) {
  return GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$RenamedTitleEvent()
    ..id = json['id'] as String
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..actor = json['actor'] == null
        ? null
        : RenamedTitleMixin$Actor.fromJson(
            json['actor'] as Map<String, dynamic>)
    ..previousTitle = json['previousTitle'] as String
    ..currentTitle = json['currentTitle'] as String
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$RenamedTitleEventToJson(
            GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$RenamedTitleEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          'previousTitle': instance.previousTitle,
          'currentTitle': instance.currentTitle,
          '__typename': instance.$$typename,
        };

GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$ReopenedEvent
    _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$ReopenedEventFromJson(
        Map<String, dynamic> json) {
  return GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$ReopenedEvent()
    ..id = json['id'] as String
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..actor = json['actor'] == null
        ? null
        : ReopenedMixin$Actor.fromJson(json['actor'] as Map<String, dynamic>)
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$ReopenedEventToJson(
            GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$ReopenedEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          '__typename': instance.$$typename,
        };

GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$ReviewDismissedEvent
    _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$ReviewDismissedEventFromJson(
        Map<String, dynamic> json) {
  return GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$ReviewDismissedEvent()
    ..id = json['id'] as String
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..actor = json['actor'] == null
        ? null
        : ReviewDismissedMixin$Actor.fromJson(
            json['actor'] as Map<String, dynamic>)
    ..dismissalMessage = json['dismissalMessage'] as String?
    ..dismissalMessageHTML = json['dismissalMessageHTML'] as String?
    ..previousReviewState = _$enumDecode(
        _$PullRequestReviewStateEnumMap, json['previousReviewState'],
        unknownValue: PullRequestReviewState.artemisUnknown)
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$ReviewDismissedEventToJson(
            GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$ReviewDismissedEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          'dismissalMessage': instance.dismissalMessage,
          'dismissalMessageHTML': instance.dismissalMessageHTML,
          'previousReviewState':
              _$PullRequestReviewStateEnumMap[instance.previousReviewState],
          '__typename': instance.$$typename,
        };

const _$PullRequestReviewStateEnumMap = {
  PullRequestReviewState.approved: 'APPROVED',
  PullRequestReviewState.changesRequested: 'CHANGES_REQUESTED',
  PullRequestReviewState.commented: 'COMMENTED',
  PullRequestReviewState.dismissed: 'DISMISSED',
  PullRequestReviewState.pending: 'PENDING',
  PullRequestReviewState.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$ReviewRequestedEvent
    _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$ReviewRequestedEventFromJson(
        Map<String, dynamic> json) {
  return GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$ReviewRequestedEvent()
    ..id = json['id'] as String
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..actor = json['actor'] == null
        ? null
        : ReviewRequestedMixin$Actor.fromJson(
            json['actor'] as Map<String, dynamic>)
    ..requestedReviewer = json['requestedReviewer'] == null
        ? null
        : ReviewRequestedMixin$RequestedReviewer.fromJson(
            json['requestedReviewer'] as Map<String, dynamic>)
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$ReviewRequestedEventToJson(
            GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$ReviewRequestedEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          'requestedReviewer': instance.requestedReviewer?.toJson(),
          '__typename': instance.$$typename,
        };

GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$UnassignedEvent
    _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$UnassignedEventFromJson(
        Map<String, dynamic> json) {
  return GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$UnassignedEvent()
    ..id = json['id'] as String
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..actor = json['actor'] == null
        ? null
        : UnassignedMixin$Actor.fromJson(json['actor'] as Map<String, dynamic>)
    ..assignee = json['assignee'] == null
        ? null
        : UnassignedMixin$Assignee.fromJson(
            json['assignee'] as Map<String, dynamic>)
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$UnassignedEventToJson(
            GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$UnassignedEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          'assignee': instance.assignee?.toJson(),
          '__typename': instance.$$typename,
        };

GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$UnlabeledEvent
    _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$UnlabeledEventFromJson(
        Map<String, dynamic> json) {
  return GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$UnlabeledEvent()
    ..id = json['id'] as String
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..actor = json['actor'] == null
        ? null
        : UnlabeledMixin$Actor.fromJson(json['actor'] as Map<String, dynamic>)
    ..label =
        UnlabeledMixin$Label.fromJson(json['label'] as Map<String, dynamic>)
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$UnlabeledEventToJson(
            GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$UnlabeledEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          'label': instance.label.toJson(),
          '__typename': instance.$$typename,
        };

GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$UnlockedEvent
    _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$UnlockedEventFromJson(
        Map<String, dynamic> json) {
  return GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$UnlockedEvent()
    ..id = json['id'] as String
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..actor = json['actor'] == null
        ? null
        : UnlockedMixin$Actor.fromJson(json['actor'] as Map<String, dynamic>)
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$UnlockedEventToJson(
            GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$UnlockedEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          '__typename': instance.$$typename,
        };

GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$UnmarkedAsDuplicateEvent
    _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$UnmarkedAsDuplicateEventFromJson(
        Map<String, dynamic> json) {
  return GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$UnmarkedAsDuplicateEvent()
    ..id = json['id'] as String
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..actor = json['actor'] == null
        ? null
        : UnmarkedAsDuplicateMixin$Actor.fromJson(
            json['actor'] as Map<String, dynamic>)
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$UnmarkedAsDuplicateEventToJson(
            GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$UnmarkedAsDuplicateEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          '__typename': instance.$$typename,
        };

GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$UnpinnedEvent
    _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$UnpinnedEventFromJson(
        Map<String, dynamic> json) {
  return GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$UnpinnedEvent()
    ..id = json['id'] as String
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..actor = json['actor'] == null
        ? null
        : UnpinnedMixin$Actor.fromJson(json['actor'] as Map<String, dynamic>)
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$UnpinnedEventToJson(
            GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node$UnpinnedEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          '__typename': instance.$$typename,
        };

GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node
    _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$NodeFromJson(
        Map<String, dynamic> json) {
  return GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node()
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$NodeToJson(
            GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node
                instance) =>
        <String, dynamic>{
          '__typename': instance.$$typename,
        };

GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges
    _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$EdgesFromJson(
        Map<String, dynamic> json) {
  return GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges()
    ..node = json['node'] == null
        ? null
        : GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges$Node
            .fromJson(json['node'] as Map<String, dynamic>)
    ..cursor = json['cursor'] as String;
}

Map<String, dynamic>
    _$GetPullTimeline$Query$Repository$PullRequest$TimelineItems$EdgesToJson(
            GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges
                instance) =>
        <String, dynamic>{
          'node': instance.node?.toJson(),
          'cursor': instance.cursor,
        };

GetPullTimeline$Query$Repository$PullRequest$TimelineItems
    _$GetPullTimeline$Query$Repository$PullRequest$TimelineItemsFromJson(
        Map<String, dynamic> json) {
  return GetPullTimeline$Query$Repository$PullRequest$TimelineItems()
    ..edges = (json['edges'] as List<dynamic>?)
        ?.map((e) => e == null
            ? null
            : GetPullTimeline$Query$Repository$PullRequest$TimelineItems$Edges
                .fromJson(e as Map<String, dynamic>))
        .toList();
}

Map<String,
    dynamic> _$GetPullTimeline$Query$Repository$PullRequest$TimelineItemsToJson(
        GetPullTimeline$Query$Repository$PullRequest$TimelineItems instance) =>
    <String, dynamic>{
      'edges': instance.edges?.map((e) => e?.toJson()).toList(),
    };

GetPullTimeline$Query$Repository$PullRequest
    _$GetPullTimeline$Query$Repository$PullRequestFromJson(
        Map<String, dynamic> json) {
  return GetPullTimeline$Query$Repository$PullRequest()
    ..timelineItems =
        GetPullTimeline$Query$Repository$PullRequest$TimelineItems.fromJson(
            json['timelineItems'] as Map<String, dynamic>);
}

Map<String, dynamic> _$GetPullTimeline$Query$Repository$PullRequestToJson(
        GetPullTimeline$Query$Repository$PullRequest instance) =>
    <String, dynamic>{
      'timelineItems': instance.timelineItems.toJson(),
    };

GetPullTimeline$Query$Repository _$GetPullTimeline$Query$RepositoryFromJson(
    Map<String, dynamic> json) {
  return GetPullTimeline$Query$Repository()
    ..pullRequest = json['pullRequest'] == null
        ? null
        : GetPullTimeline$Query$Repository$PullRequest.fromJson(
            json['pullRequest'] as Map<String, dynamic>);
}

Map<String, dynamic> _$GetPullTimeline$Query$RepositoryToJson(
        GetPullTimeline$Query$Repository instance) =>
    <String, dynamic>{
      'pullRequest': instance.pullRequest?.toJson(),
    };

GetPullTimeline$Query _$GetPullTimeline$QueryFromJson(
    Map<String, dynamic> json) {
  return GetPullTimeline$Query()
    ..repository = json['repository'] == null
        ? null
        : GetPullTimeline$Query$Repository.fromJson(
            json['repository'] as Map<String, dynamic>);
}

Map<String, dynamic> _$GetPullTimeline$QueryToJson(
        GetPullTimeline$Query instance) =>
    <String, dynamic>{
      'repository': instance.repository?.toJson(),
    };

IssueTemplates$Query$Repository$IssueTemplates
    _$IssueTemplates$Query$Repository$IssueTemplatesFromJson(
        Map<String, dynamic> json) {
  return IssueTemplates$Query$Repository$IssueTemplates()
    ..name = json['name'] as String
    ..title = json['title'] as String?
    ..body = json['body'] as String?
    ..about = json['about'] as String?;
}

Map<String, dynamic> _$IssueTemplates$Query$Repository$IssueTemplatesToJson(
        IssueTemplates$Query$Repository$IssueTemplates instance) =>
    <String, dynamic>{
      'name': instance.name,
      'title': instance.title,
      'body': instance.body,
      'about': instance.about,
    };

IssueTemplates$Query$Repository _$IssueTemplates$Query$RepositoryFromJson(
    Map<String, dynamic> json) {
  return IssueTemplates$Query$Repository()
    ..issueTemplates = (json['issueTemplates'] as List<dynamic>?)
        ?.map((e) => IssueTemplates$Query$Repository$IssueTemplates.fromJson(
            e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$IssueTemplates$Query$RepositoryToJson(
        IssueTemplates$Query$Repository instance) =>
    <String, dynamic>{
      'issueTemplates':
          instance.issueTemplates?.map((e) => e.toJson()).toList(),
    };

IssueTemplates$Query _$IssueTemplates$QueryFromJson(Map<String, dynamic> json) {
  return IssueTemplates$Query()
    ..repository = json['repository'] == null
        ? null
        : IssueTemplates$Query$Repository.fromJson(
            json['repository'] as Map<String, dynamic>);
}

Map<String, dynamic> _$IssueTemplates$QueryToJson(
        IssueTemplates$Query instance) =>
    <String, dynamic>{
      'repository': instance.repository?.toJson(),
    };

SearchMentionUsers$Query$Search$Edges$Node$User
    _$SearchMentionUsers$Query$Search$Edges$Node$UserFromJson(
        Map<String, dynamic> json) {
  return SearchMentionUsers$Query$Search$Edges$Node$User()
    ..$$typename = json['__typename'] as String?
    ..login = json['login'] as String
    ..avatarUrl = Uri.parse(json['avatarUrl'] as String);
}

Map<String, dynamic> _$SearchMentionUsers$Query$Search$Edges$Node$UserToJson(
        SearchMentionUsers$Query$Search$Edges$Node$User instance) =>
    <String, dynamic>{
      '__typename': instance.$$typename,
      'login': instance.login,
      'avatarUrl': instance.avatarUrl.toString(),
    };

SearchMentionUsers$Query$Search$Edges$Node$Organization
    _$SearchMentionUsers$Query$Search$Edges$Node$OrganizationFromJson(
        Map<String, dynamic> json) {
  return SearchMentionUsers$Query$Search$Edges$Node$Organization()
    ..$$typename = json['__typename'] as String?
    ..login = json['login'] as String
    ..avatarUrl = Uri.parse(json['avatarUrl'] as String);
}

Map<String, dynamic>
    _$SearchMentionUsers$Query$Search$Edges$Node$OrganizationToJson(
            SearchMentionUsers$Query$Search$Edges$Node$Organization instance) =>
        <String, dynamic>{
          '__typename': instance.$$typename,
          'login': instance.login,
          'avatarUrl': instance.avatarUrl.toString(),
        };

SearchMentionUsers$Query$Search$Edges$Node
    _$SearchMentionUsers$Query$Search$Edges$NodeFromJson(
        Map<String, dynamic> json) {
  return SearchMentionUsers$Query$Search$Edges$Node()
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic> _$SearchMentionUsers$Query$Search$Edges$NodeToJson(
        SearchMentionUsers$Query$Search$Edges$Node instance) =>
    <String, dynamic>{
      '__typename': instance.$$typename,
    };

SearchMentionUsers$Query$Search$Edges
    _$SearchMentionUsers$Query$Search$EdgesFromJson(Map<String, dynamic> json) {
  return SearchMentionUsers$Query$Search$Edges()
    ..node = json['node'] == null
        ? null
        : SearchMentionUsers$Query$Search$Edges$Node.fromJson(
            json['node'] as Map<String, dynamic>)
    ..cursor = json['cursor'] as String;
}

Map<String, dynamic> _$SearchMentionUsers$Query$Search$EdgesToJson(
        SearchMentionUsers$Query$Search$Edges instance) =>
    <String, dynamic>{
      'node': instance.node?.toJson(),
      'cursor': instance.cursor,
    };

SearchMentionUsers$Query$Search _$SearchMentionUsers$Query$SearchFromJson(
    Map<String, dynamic> json) {
  return SearchMentionUsers$Query$Search()
    ..edges = (json['edges'] as List<dynamic>?)
        ?.map((e) => e == null
            ? null
            : SearchMentionUsers$Query$Search$Edges.fromJson(
                e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$SearchMentionUsers$Query$SearchToJson(
        SearchMentionUsers$Query$Search instance) =>
    <String, dynamic>{
      'edges': instance.edges?.map((e) => e?.toJson()).toList(),
    };

SearchMentionUsers$Query _$SearchMentionUsers$QueryFromJson(
    Map<String, dynamic> json) {
  return SearchMentionUsers$Query()
    ..search = SearchMentionUsers$Query$Search.fromJson(
        json['search'] as Map<String, dynamic>);
}

Map<String, dynamic> _$SearchMentionUsers$QueryToJson(
        SearchMentionUsers$Query instance) =>
    <String, dynamic>{
      'search': instance.search.toJson(),
    };

GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$Languages$Edges$Node
    _$GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$Languages$Edges$NodeFromJson(
        Map<String, dynamic> json) {
  return GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$Languages$Edges$Node()
    ..name = json['name'] as String;
}

Map<String, dynamic>
    _$GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$Languages$Edges$NodeToJson(
            GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$Languages$Edges$Node
                instance) =>
        <String, dynamic>{
          'name': instance.name,
        };

GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$Languages$Edges
    _$GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$Languages$EdgesFromJson(
        Map<String, dynamic> json) {
  return GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$Languages$Edges()
    ..node =
        GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$Languages$Edges$Node
            .fromJson(json['node'] as Map<String, dynamic>);
}

Map<String, dynamic>
    _$GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$Languages$EdgesToJson(
            GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$Languages$Edges
                instance) =>
        <String, dynamic>{
          'node': instance.node.toJson(),
        };

GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$Languages
    _$GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$LanguagesFromJson(
        Map<String, dynamic> json) {
  return GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$Languages()
    ..edges = (json['edges'] as List<dynamic>?)
        ?.map((e) => e == null
            ? null
            : GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$Languages$Edges
                .fromJson(e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic>
    _$GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$LanguagesToJson(
            GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$Languages
                instance) =>
        <String, dynamic>{
          'edges': instance.edges?.map((e) => e?.toJson()).toList(),
        };

GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository
    _$GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$RepositoryFromJson(
        Map<String, dynamic> json) {
  return GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository()
    ..$$typename = json['__typename'] as String?
    ..name = json['name'] as String
    ..description = json['description'] as String?
    ..stargazerCount = json['stargazerCount'] as int
    ..updatedAt = DateTime.parse(json['updatedAt'] as String)
    ..url = Uri.parse(json['url'] as String)
    ..languages = json['languages'] == null
        ? null
        : GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$Languages
            .fromJson(json['languages'] as Map<String, dynamic>);
}

Map<String, dynamic>
    _$GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$RepositoryToJson(
            GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository
                instance) =>
        <String, dynamic>{
          '__typename': instance.$$typename,
          'name': instance.name,
          'description': instance.description,
          'stargazerCount': instance.stargazerCount,
          'updatedAt': instance.updatedAt.toIso8601String(),
          'url': instance.url.toString(),
          'languages': instance.languages?.toJson(),
        };

GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node
    _$GetUserPinnedRepos$Query$User$PinnedItems$Edges$NodeFromJson(
        Map<String, dynamic> json) {
  return GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node()
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetUserPinnedRepos$Query$User$PinnedItems$Edges$NodeToJson(
            GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node instance) =>
        <String, dynamic>{
          '__typename': instance.$$typename,
        };

GetUserPinnedRepos$Query$User$PinnedItems$Edges
    _$GetUserPinnedRepos$Query$User$PinnedItems$EdgesFromJson(
        Map<String, dynamic> json) {
  return GetUserPinnedRepos$Query$User$PinnedItems$Edges()
    ..node = json['node'] == null
        ? null
        : GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node.fromJson(
            json['node'] as Map<String, dynamic>);
}

Map<String, dynamic> _$GetUserPinnedRepos$Query$User$PinnedItems$EdgesToJson(
        GetUserPinnedRepos$Query$User$PinnedItems$Edges instance) =>
    <String, dynamic>{
      'node': instance.node?.toJson(),
    };

GetUserPinnedRepos$Query$User$PinnedItems
    _$GetUserPinnedRepos$Query$User$PinnedItemsFromJson(
        Map<String, dynamic> json) {
  return GetUserPinnedRepos$Query$User$PinnedItems()
    ..edges = (json['edges'] as List<dynamic>?)
        ?.map((e) => e == null
            ? null
            : GetUserPinnedRepos$Query$User$PinnedItems$Edges.fromJson(
                e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$GetUserPinnedRepos$Query$User$PinnedItemsToJson(
        GetUserPinnedRepos$Query$User$PinnedItems instance) =>
    <String, dynamic>{
      'edges': instance.edges?.map((e) => e?.toJson()).toList(),
    };

GetUserPinnedRepos$Query$User _$GetUserPinnedRepos$Query$UserFromJson(
    Map<String, dynamic> json) {
  return GetUserPinnedRepos$Query$User()
    ..pinnedItems = GetUserPinnedRepos$Query$User$PinnedItems.fromJson(
        json['pinnedItems'] as Map<String, dynamic>);
}

Map<String, dynamic> _$GetUserPinnedRepos$Query$UserToJson(
        GetUserPinnedRepos$Query$User instance) =>
    <String, dynamic>{
      'pinnedItems': instance.pinnedItems.toJson(),
    };

GetUserPinnedRepos$Query _$GetUserPinnedRepos$QueryFromJson(
    Map<String, dynamic> json) {
  return GetUserPinnedRepos$Query()
    ..user = json['user'] == null
        ? null
        : GetUserPinnedRepos$Query$User.fromJson(
            json['user'] as Map<String, dynamic>);
}

Map<String, dynamic> _$GetUserPinnedRepos$QueryToJson(
        GetUserPinnedRepos$Query instance) =>
    <String, dynamic>{
      'user': instance.user?.toJson(),
    };

GetIssueTimelineArguments _$GetIssueTimelineArgumentsFromJson(
    Map<String, dynamic> json) {
  return GetIssueTimelineArguments(
    repoName: json['repoName'] as String,
    owner: json['owner'] as String,
    number: json['number'] as int,
    after: json['after'] as String?,
    since:
        json['since'] == null ? null : DateTime.parse(json['since'] as String),
  );
}

Map<String, dynamic> _$GetIssueTimelineArgumentsToJson(
        GetIssueTimelineArguments instance) =>
    <String, dynamic>{
      'repoName': instance.repoName,
      'owner': instance.owner,
      'number': instance.number,
      'after': instance.after,
      'since': instance.since?.toIso8601String(),
    };

GetPullTimelineArguments _$GetPullTimelineArgumentsFromJson(
    Map<String, dynamic> json) {
  return GetPullTimelineArguments(
    repoName: json['repoName'] as String,
    owner: json['owner'] as String,
    number: json['number'] as int,
    after: json['after'] as String?,
    since:
        json['since'] == null ? null : DateTime.parse(json['since'] as String),
  );
}

Map<String, dynamic> _$GetPullTimelineArgumentsToJson(
        GetPullTimelineArguments instance) =>
    <String, dynamic>{
      'repoName': instance.repoName,
      'owner': instance.owner,
      'number': instance.number,
      'after': instance.after,
      'since': instance.since?.toIso8601String(),
    };

IssueTemplatesArguments _$IssueTemplatesArgumentsFromJson(
    Map<String, dynamic> json) {
  return IssueTemplatesArguments(
    name: json['name'] as String,
    owner: json['owner'] as String,
  );
}

Map<String, dynamic> _$IssueTemplatesArgumentsToJson(
        IssueTemplatesArguments instance) =>
    <String, dynamic>{
      'name': instance.name,
      'owner': instance.owner,
    };

SearchMentionUsersArguments _$SearchMentionUsersArgumentsFromJson(
    Map<String, dynamic> json) {
  return SearchMentionUsersArguments(
    query: json['query'] as String,
    after: json['after'] as String?,
  );
}

Map<String, dynamic> _$SearchMentionUsersArgumentsToJson(
        SearchMentionUsersArguments instance) =>
    <String, dynamic>{
      'query': instance.query,
      'after': instance.after,
    };

GetUserPinnedReposArguments _$GetUserPinnedReposArgumentsFromJson(
    Map<String, dynamic> json) {
  return GetUserPinnedReposArguments(
    user: json['user'] as String,
  );
}

Map<String, dynamic> _$GetUserPinnedReposArgumentsToJson(
        GetUserPinnedReposArguments instance) =>
    <String, dynamic>{
      'user': instance.user,
    };
