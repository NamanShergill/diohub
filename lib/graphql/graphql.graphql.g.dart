// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.12

part of 'graphql.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FetchReview$Query$Node$PullRequestReviewComment$Author
    _$FetchReview$Query$Node$PullRequestReviewComment$AuthorFromJson(
        Map<String, dynamic> json) {
  return FetchReview$Query$Node$PullRequestReviewComment$Author()
    ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
    ..login = json['login'] as String;
}

Map<String, dynamic>
    _$FetchReview$Query$Node$PullRequestReviewComment$AuthorToJson(
            FetchReview$Query$Node$PullRequestReviewComment$Author instance) =>
        <String, dynamic>{
          'avatarUrl': instance.avatarUrl.toString(),
          'login': instance.login,
        };

FetchReview$Query$Node$PullRequestReviewComment
    _$FetchReview$Query$Node$PullRequestReviewCommentFromJson(
        Map<String, dynamic> json) {
  return FetchReview$Query$Node$PullRequestReviewComment()
    ..$$typename = json['__typename'] as String?
    ..bodyHTML = json['bodyHTML'] as String
    ..author = json['author'] == null
        ? null
        : FetchReview$Query$Node$PullRequestReviewComment$Author.fromJson(
            json['author'] as Map<String, dynamic>)
    ..diffHunk = json['diffHunk'] as String
    ..path = json['path'] as String;
}

Map<String, dynamic> _$FetchReview$Query$Node$PullRequestReviewCommentToJson(
        FetchReview$Query$Node$PullRequestReviewComment instance) =>
    <String, dynamic>{
      '__typename': instance.$$typename,
      'bodyHTML': instance.bodyHTML,
      'author': instance.author?.toJson(),
      'diffHunk': instance.diffHunk,
      'path': instance.path,
    };

FetchReview$Query$Node _$FetchReview$Query$NodeFromJson(
    Map<String, dynamic> json) {
  return FetchReview$Query$Node()..$$typename = json['__typename'] as String?;
}

Map<String, dynamic> _$FetchReview$Query$NodeToJson(
        FetchReview$Query$Node instance) =>
    <String, dynamic>{
      '__typename': instance.$$typename,
    };

FetchReview$Query _$FetchReview$QueryFromJson(Map<String, dynamic> json) {
  return FetchReview$Query()
    ..node = json['node'] == null
        ? null
        : FetchReview$Query$Node.fromJson(json['node'] as Map<String, dynamic>);
}

Map<String, dynamic> _$FetchReview$QueryToJson(FetchReview$Query instance) =>
    <String, dynamic>{
      'node': instance.node?.toJson(),
    };

GetPRReviewComments$Query$Node$PullRequestReview
    _$GetPRReviewComments$Query$Node$PullRequestReviewFromJson(
        Map<String, dynamic> json) {
  return GetPRReviewComments$Query$Node$PullRequestReview()
    ..comments = PRReviewCommentsMixin$Comments.fromJson(
        json['comments'] as Map<String, dynamic>)
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic> _$GetPRReviewComments$Query$Node$PullRequestReviewToJson(
        GetPRReviewComments$Query$Node$PullRequestReview instance) =>
    <String, dynamic>{
      'comments': instance.comments.toJson(),
      '__typename': instance.$$typename,
    };

GetPRReviewComments$Query$Node _$GetPRReviewComments$Query$NodeFromJson(
    Map<String, dynamic> json) {
  return GetPRReviewComments$Query$Node()
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic> _$GetPRReviewComments$Query$NodeToJson(
        GetPRReviewComments$Query$Node instance) =>
    <String, dynamic>{
      '__typename': instance.$$typename,
    };

GetPRReviewComments$Query _$GetPRReviewComments$QueryFromJson(
    Map<String, dynamic> json) {
  return GetPRReviewComments$Query()
    ..node = json['node'] == null
        ? null
        : GetPRReviewComments$Query$Node.fromJson(
            json['node'] as Map<String, dynamic>);
}

Map<String, dynamic> _$GetPRReviewComments$QueryToJson(
        GetPRReviewComments$Query instance) =>
    <String, dynamic>{
      'node': instance.node?.toJson(),
    };

PRReviewCommentsMixin$Comments$Edges$Node
    _$PRReviewCommentsMixin$Comments$Edges$NodeFromJson(
        Map<String, dynamic> json) {
  return PRReviewCommentsMixin$Comments$Edges$Node()
    ..id = json['id'] as String
    ..databaseId = json['databaseId'] as int?
    ..author = json['author'] == null
        ? null
        : PullRequestReviewCommentMixin$Author.fromJson(
            json['author'] as Map<String, dynamic>)
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..authorAssociation = _$enumDecode(
        _$CommentAuthorAssociationEnumMap, json['authorAssociation'],
        unknownValue: CommentAuthorAssociation.artemisUnknown)
    ..body = json['body'] as String
    ..bodyHTML = json['bodyHTML'] as String
    ..lastEditedAt = json['lastEditedAt'] == null
        ? null
        : DateTime.parse(json['lastEditedAt'] as String)
    ..state = _$enumDecode(_$PullRequestReviewCommentStateEnumMap, json['state'],
        unknownValue: PullRequestReviewCommentState.artemisUnknown)
    ..diffHunk = json['diffHunk'] as String
    ..outdated = json['outdated'] as bool
    ..isMinimized = json['isMinimized'] as bool
    ..replyTo = json['replyTo'] == null
        ? null
        : PullRequestReviewCommentMixin$ReplyTo.fromJson(
            json['replyTo'] as Map<String, dynamic>)
    ..path = json['path'] as String
    ..reactionGroups = (json['reactionGroups'] as List<dynamic>?)
        ?.map((e) => PullRequestReviewCommentMixin$ReactionGroups.fromJson(
            e as Map<String, dynamic>))
        .toList()
    ..viewerCanDelete = json['viewerCanDelete'] as bool
    ..viewerCanUpdate = json['viewerCanUpdate'] as bool
    ..viewerDidAuthor = json['viewerDidAuthor'] as bool
    ..viewerCannotUpdateReasons =
        (json['viewerCannotUpdateReasons'] as List<dynamic>)
            .map((e) => _$enumDecode(_$CommentCannotUpdateReasonEnumMap, e, unknownValue: CommentCannotUpdateReason.artemisUnknown))
            .toList()
    ..viewerCanReact = json['viewerCanReact'] as bool
    ..viewerCanMinimize = json['viewerCanMinimize'] as bool
    ..pullRequest = PullRequestReviewCommentMixin$PullRequest.fromJson(json['pullRequest'] as Map<String, dynamic>)
    ..repository = PullRequestReviewCommentMixin$Repository.fromJson(json['repository'] as Map<String, dynamic>);
}

Map<String, dynamic> _$PRReviewCommentsMixin$Comments$Edges$NodeToJson(
        PRReviewCommentsMixin$Comments$Edges$Node instance) =>
    <String, dynamic>{
      'id': instance.id,
      'databaseId': instance.databaseId,
      'author': instance.author?.toJson(),
      'createdAt': instance.createdAt.toIso8601String(),
      'authorAssociation':
          _$CommentAuthorAssociationEnumMap[instance.authorAssociation],
      'body': instance.body,
      'bodyHTML': instance.bodyHTML,
      'lastEditedAt': instance.lastEditedAt?.toIso8601String(),
      'state': _$PullRequestReviewCommentStateEnumMap[instance.state],
      'diffHunk': instance.diffHunk,
      'outdated': instance.outdated,
      'isMinimized': instance.isMinimized,
      'replyTo': instance.replyTo?.toJson(),
      'path': instance.path,
      'reactionGroups':
          instance.reactionGroups?.map((e) => e.toJson()).toList(),
      'viewerCanDelete': instance.viewerCanDelete,
      'viewerCanUpdate': instance.viewerCanUpdate,
      'viewerDidAuthor': instance.viewerDidAuthor,
      'viewerCannotUpdateReasons': instance.viewerCannotUpdateReasons
          .map((e) => _$CommentCannotUpdateReasonEnumMap[e])
          .toList(),
      'viewerCanReact': instance.viewerCanReact,
      'viewerCanMinimize': instance.viewerCanMinimize,
      'pullRequest': instance.pullRequest.toJson(),
      'repository': instance.repository.toJson(),
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

const _$PullRequestReviewCommentStateEnumMap = {
  PullRequestReviewCommentState.pending: 'PENDING',
  PullRequestReviewCommentState.submitted: 'SUBMITTED',
  PullRequestReviewCommentState.artemisUnknown: 'ARTEMIS_UNKNOWN',
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

PRReviewCommentsMixin$Comments$Edges
    _$PRReviewCommentsMixin$Comments$EdgesFromJson(Map<String, dynamic> json) {
  return PRReviewCommentsMixin$Comments$Edges()
    ..$$typename = json['__typename'] as String?
    ..cursor = json['cursor'] as String
    ..node = json['node'] == null
        ? null
        : PRReviewCommentsMixin$Comments$Edges$Node.fromJson(
            json['node'] as Map<String, dynamic>);
}

Map<String, dynamic> _$PRReviewCommentsMixin$Comments$EdgesToJson(
        PRReviewCommentsMixin$Comments$Edges instance) =>
    <String, dynamic>{
      '__typename': instance.$$typename,
      'cursor': instance.cursor,
      'node': instance.node?.toJson(),
    };

PRReviewCommentsMixin$Comments _$PRReviewCommentsMixin$CommentsFromJson(
    Map<String, dynamic> json) {
  return PRReviewCommentsMixin$Comments()
    ..edges = (json['edges'] as List<dynamic>?)
        ?.map((e) => e == null
            ? null
            : PRReviewCommentsMixin$Comments$Edges.fromJson(
                e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$PRReviewCommentsMixin$CommentsToJson(
        PRReviewCommentsMixin$Comments instance) =>
    <String, dynamic>{
      'edges': instance.edges?.map((e) => e?.toJson()).toList(),
    };

PullRequestReviewCommentMixin$Author
    _$PullRequestReviewCommentMixin$AuthorFromJson(Map<String, dynamic> json) {
  return PullRequestReviewCommentMixin$Author()
    ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
    ..login = json['login'] as String;
}

Map<String, dynamic> _$PullRequestReviewCommentMixin$AuthorToJson(
        PullRequestReviewCommentMixin$Author instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
    };

PullRequestReviewCommentMixin$ReplyTo
    _$PullRequestReviewCommentMixin$ReplyToFromJson(Map<String, dynamic> json) {
  return PullRequestReviewCommentMixin$ReplyTo()..id = json['id'] as String;
}

Map<String, dynamic> _$PullRequestReviewCommentMixin$ReplyToToJson(
        PullRequestReviewCommentMixin$ReplyTo instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

PullRequestReviewCommentMixin$ReactionGroups
    _$PullRequestReviewCommentMixin$ReactionGroupsFromJson(
        Map<String, dynamic> json) {
  return PullRequestReviewCommentMixin$ReactionGroups()
    ..content = _$enumDecode(_$ReactionContentEnumMap, json['content'],
        unknownValue: ReactionContent.artemisUnknown)
    ..viewerHasReacted = json['viewerHasReacted'] as bool
    ..users =
        ReactionsMixin$Users.fromJson(json['users'] as Map<String, dynamic>);
}

Map<String, dynamic> _$PullRequestReviewCommentMixin$ReactionGroupsToJson(
        PullRequestReviewCommentMixin$ReactionGroups instance) =>
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

PullRequestReviewCommentMixin$PullRequest
    _$PullRequestReviewCommentMixin$PullRequestFromJson(
        Map<String, dynamic> json) {
  return PullRequestReviewCommentMixin$PullRequest()
    ..number = json['number'] as int;
}

Map<String, dynamic> _$PullRequestReviewCommentMixin$PullRequestToJson(
        PullRequestReviewCommentMixin$PullRequest instance) =>
    <String, dynamic>{
      'number': instance.number,
    };

PullRequestReviewCommentMixin$Repository$Owner
    _$PullRequestReviewCommentMixin$Repository$OwnerFromJson(
        Map<String, dynamic> json) {
  return PullRequestReviewCommentMixin$Repository$Owner()
    ..login = json['login'] as String;
}

Map<String, dynamic> _$PullRequestReviewCommentMixin$Repository$OwnerToJson(
        PullRequestReviewCommentMixin$Repository$Owner instance) =>
    <String, dynamic>{
      'login': instance.login,
    };

PullRequestReviewCommentMixin$Repository
    _$PullRequestReviewCommentMixin$RepositoryFromJson(
        Map<String, dynamic> json) {
  return PullRequestReviewCommentMixin$Repository()
    ..name = json['name'] as String
    ..owner = PullRequestReviewCommentMixin$Repository$Owner.fromJson(
        json['owner'] as Map<String, dynamic>);
}

Map<String, dynamic> _$PullRequestReviewCommentMixin$RepositoryToJson(
        PullRequestReviewCommentMixin$Repository instance) =>
    <String, dynamic>{
      'name': instance.name,
      'owner': instance.owner.toJson(),
    };

ReactionsMixin$Users _$ReactionsMixin$UsersFromJson(Map<String, dynamic> json) {
  return ReactionsMixin$Users()..totalCount = json['totalCount'] as int;
}

Map<String, dynamic> _$ReactionsMixin$UsersToJson(
        ReactionsMixin$Users instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
    };

ReviewThreadFirstCommentQuery$Query$Repository$PullRequest$ReviewThreads$Edges$Node$Comments$Nodes
    _$ReviewThreadFirstCommentQuery$Query$Repository$PullRequest$ReviewThreads$Edges$Node$Comments$NodesFromJson(
        Map<String, dynamic> json) {
  return ReviewThreadFirstCommentQuery$Query$Repository$PullRequest$ReviewThreads$Edges$Node$Comments$Nodes()
    ..id = json['id'] as String;
}

Map<String, dynamic>
    _$ReviewThreadFirstCommentQuery$Query$Repository$PullRequest$ReviewThreads$Edges$Node$Comments$NodesToJson(
            ReviewThreadFirstCommentQuery$Query$Repository$PullRequest$ReviewThreads$Edges$Node$Comments$Nodes
                instance) =>
        <String, dynamic>{
          'id': instance.id,
        };

ReviewThreadFirstCommentQuery$Query$Repository$PullRequest$ReviewThreads$Edges$Node$Comments
    _$ReviewThreadFirstCommentQuery$Query$Repository$PullRequest$ReviewThreads$Edges$Node$CommentsFromJson(
        Map<String, dynamic> json) {
  return ReviewThreadFirstCommentQuery$Query$Repository$PullRequest$ReviewThreads$Edges$Node$Comments()
    ..totalCount = json['totalCount'] as int
    ..nodes = (json['nodes'] as List<dynamic>?)
        ?.map((e) => e == null
            ? null
            : ReviewThreadFirstCommentQuery$Query$Repository$PullRequest$ReviewThreads$Edges$Node$Comments$Nodes
                .fromJson(e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic>
    _$ReviewThreadFirstCommentQuery$Query$Repository$PullRequest$ReviewThreads$Edges$Node$CommentsToJson(
            ReviewThreadFirstCommentQuery$Query$Repository$PullRequest$ReviewThreads$Edges$Node$Comments
                instance) =>
        <String, dynamic>{
          'totalCount': instance.totalCount,
          'nodes': instance.nodes?.map((e) => e?.toJson()).toList(),
        };

ReviewThreadFirstCommentQuery$Query$Repository$PullRequest$ReviewThreads$Edges$Node
    _$ReviewThreadFirstCommentQuery$Query$Repository$PullRequest$ReviewThreads$Edges$NodeFromJson(
        Map<String, dynamic> json) {
  return ReviewThreadFirstCommentQuery$Query$Repository$PullRequest$ReviewThreads$Edges$Node()
    ..id = json['id'] as String
    ..viewerCanResolve = json['viewerCanResolve'] as bool
    ..viewerCanUnresolve = json['viewerCanUnresolve'] as bool
    ..viewerCanReply = json['viewerCanReply'] as bool
    ..isOutdated = json['isOutdated'] as bool
    ..isCollapsed = json['isCollapsed'] as bool
    ..isResolved = json['isResolved'] as bool
    ..comments =
        ReviewThreadFirstCommentQuery$Query$Repository$PullRequest$ReviewThreads$Edges$Node$Comments
            .fromJson(json['comments'] as Map<String, dynamic>);
}

Map<String, dynamic>
    _$ReviewThreadFirstCommentQuery$Query$Repository$PullRequest$ReviewThreads$Edges$NodeToJson(
            ReviewThreadFirstCommentQuery$Query$Repository$PullRequest$ReviewThreads$Edges$Node
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'viewerCanResolve': instance.viewerCanResolve,
          'viewerCanUnresolve': instance.viewerCanUnresolve,
          'viewerCanReply': instance.viewerCanReply,
          'isOutdated': instance.isOutdated,
          'isCollapsed': instance.isCollapsed,
          'isResolved': instance.isResolved,
          'comments': instance.comments.toJson(),
        };

ReviewThreadFirstCommentQuery$Query$Repository$PullRequest$ReviewThreads$Edges
    _$ReviewThreadFirstCommentQuery$Query$Repository$PullRequest$ReviewThreads$EdgesFromJson(
        Map<String, dynamic> json) {
  return ReviewThreadFirstCommentQuery$Query$Repository$PullRequest$ReviewThreads$Edges()
    ..cursor = json['cursor'] as String
    ..node = json['node'] == null
        ? null
        : ReviewThreadFirstCommentQuery$Query$Repository$PullRequest$ReviewThreads$Edges$Node
            .fromJson(json['node'] as Map<String, dynamic>);
}

Map<String, dynamic>
    _$ReviewThreadFirstCommentQuery$Query$Repository$PullRequest$ReviewThreads$EdgesToJson(
            ReviewThreadFirstCommentQuery$Query$Repository$PullRequest$ReviewThreads$Edges
                instance) =>
        <String, dynamic>{
          'cursor': instance.cursor,
          'node': instance.node?.toJson(),
        };

ReviewThreadFirstCommentQuery$Query$Repository$PullRequest$ReviewThreads
    _$ReviewThreadFirstCommentQuery$Query$Repository$PullRequest$ReviewThreadsFromJson(
        Map<String, dynamic> json) {
  return ReviewThreadFirstCommentQuery$Query$Repository$PullRequest$ReviewThreads()
    ..edges = (json['edges'] as List<dynamic>?)
        ?.map((e) => e == null
            ? null
            : ReviewThreadFirstCommentQuery$Query$Repository$PullRequest$ReviewThreads$Edges
                .fromJson(e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic>
    _$ReviewThreadFirstCommentQuery$Query$Repository$PullRequest$ReviewThreadsToJson(
            ReviewThreadFirstCommentQuery$Query$Repository$PullRequest$ReviewThreads
                instance) =>
        <String, dynamic>{
          'edges': instance.edges?.map((e) => e?.toJson()).toList(),
        };

ReviewThreadFirstCommentQuery$Query$Repository$PullRequest
    _$ReviewThreadFirstCommentQuery$Query$Repository$PullRequestFromJson(
        Map<String, dynamic> json) {
  return ReviewThreadFirstCommentQuery$Query$Repository$PullRequest()
    ..id = json['id'] as String
    ..reviewThreads =
        ReviewThreadFirstCommentQuery$Query$Repository$PullRequest$ReviewThreads
            .fromJson(json['reviewThreads'] as Map<String, dynamic>);
}

Map<String,
    dynamic> _$ReviewThreadFirstCommentQuery$Query$Repository$PullRequestToJson(
        ReviewThreadFirstCommentQuery$Query$Repository$PullRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'reviewThreads': instance.reviewThreads.toJson(),
    };

ReviewThreadFirstCommentQuery$Query$Repository
    _$ReviewThreadFirstCommentQuery$Query$RepositoryFromJson(
        Map<String, dynamic> json) {
  return ReviewThreadFirstCommentQuery$Query$Repository()
    ..pullRequest = json['pullRequest'] == null
        ? null
        : ReviewThreadFirstCommentQuery$Query$Repository$PullRequest.fromJson(
            json['pullRequest'] as Map<String, dynamic>);
}

Map<String, dynamic> _$ReviewThreadFirstCommentQuery$Query$RepositoryToJson(
        ReviewThreadFirstCommentQuery$Query$Repository instance) =>
    <String, dynamic>{
      'pullRequest': instance.pullRequest?.toJson(),
    };

ReviewThreadFirstCommentQuery$Query
    _$ReviewThreadFirstCommentQuery$QueryFromJson(Map<String, dynamic> json) {
  return ReviewThreadFirstCommentQuery$Query()
    ..repository = json['repository'] == null
        ? null
        : ReviewThreadFirstCommentQuery$Query$Repository.fromJson(
            json['repository'] as Map<String, dynamic>);
}

Map<String, dynamic> _$ReviewThreadFirstCommentQuery$QueryToJson(
        ReviewThreadFirstCommentQuery$Query instance) =>
    <String, dynamic>{
      'repository': instance.repository?.toJson(),
    };

ReviewThreadCommentsQuery$Query$Node$PullRequestReviewThread$Comments$Edges$Node
    _$ReviewThreadCommentsQuery$Query$Node$PullRequestReviewThread$Comments$Edges$NodeFromJson(
        Map<String, dynamic> json) {
  return ReviewThreadCommentsQuery$Query$Node$PullRequestReviewThread$Comments$Edges$Node()
    ..id = json['id'] as String
    ..databaseId = json['databaseId'] as int?
    ..author = json['author'] == null
        ? null
        : PullRequestReviewCommentMixin$Author.fromJson(
            json['author'] as Map<String, dynamic>)
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..authorAssociation = _$enumDecode(
        _$CommentAuthorAssociationEnumMap, json['authorAssociation'],
        unknownValue: CommentAuthorAssociation.artemisUnknown)
    ..body = json['body'] as String
    ..bodyHTML = json['bodyHTML'] as String
    ..lastEditedAt = json['lastEditedAt'] == null
        ? null
        : DateTime.parse(json['lastEditedAt'] as String)
    ..state = _$enumDecode(_$PullRequestReviewCommentStateEnumMap, json['state'],
        unknownValue: PullRequestReviewCommentState.artemisUnknown)
    ..diffHunk = json['diffHunk'] as String
    ..outdated = json['outdated'] as bool
    ..isMinimized = json['isMinimized'] as bool
    ..replyTo = json['replyTo'] == null
        ? null
        : PullRequestReviewCommentMixin$ReplyTo.fromJson(
            json['replyTo'] as Map<String, dynamic>)
    ..path = json['path'] as String
    ..reactionGroups = (json['reactionGroups'] as List<dynamic>?)
        ?.map((e) => PullRequestReviewCommentMixin$ReactionGroups.fromJson(
            e as Map<String, dynamic>))
        .toList()
    ..viewerCanDelete = json['viewerCanDelete'] as bool
    ..viewerCanUpdate = json['viewerCanUpdate'] as bool
    ..viewerDidAuthor = json['viewerDidAuthor'] as bool
    ..viewerCannotUpdateReasons =
        (json['viewerCannotUpdateReasons'] as List<dynamic>)
            .map((e) => _$enumDecode(_$CommentCannotUpdateReasonEnumMap, e, unknownValue: CommentCannotUpdateReason.artemisUnknown))
            .toList()
    ..viewerCanReact = json['viewerCanReact'] as bool
    ..viewerCanMinimize = json['viewerCanMinimize'] as bool
    ..pullRequest = PullRequestReviewCommentMixin$PullRequest.fromJson(json['pullRequest'] as Map<String, dynamic>)
    ..repository = PullRequestReviewCommentMixin$Repository.fromJson(json['repository'] as Map<String, dynamic>);
}

Map<String, dynamic>
    _$ReviewThreadCommentsQuery$Query$Node$PullRequestReviewThread$Comments$Edges$NodeToJson(
            ReviewThreadCommentsQuery$Query$Node$PullRequestReviewThread$Comments$Edges$Node
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'databaseId': instance.databaseId,
          'author': instance.author?.toJson(),
          'createdAt': instance.createdAt.toIso8601String(),
          'authorAssociation':
              _$CommentAuthorAssociationEnumMap[instance.authorAssociation],
          'body': instance.body,
          'bodyHTML': instance.bodyHTML,
          'lastEditedAt': instance.lastEditedAt?.toIso8601String(),
          'state': _$PullRequestReviewCommentStateEnumMap[instance.state],
          'diffHunk': instance.diffHunk,
          'outdated': instance.outdated,
          'isMinimized': instance.isMinimized,
          'replyTo': instance.replyTo?.toJson(),
          'path': instance.path,
          'reactionGroups':
              instance.reactionGroups?.map((e) => e.toJson()).toList(),
          'viewerCanDelete': instance.viewerCanDelete,
          'viewerCanUpdate': instance.viewerCanUpdate,
          'viewerDidAuthor': instance.viewerDidAuthor,
          'viewerCannotUpdateReasons': instance.viewerCannotUpdateReasons
              .map((e) => _$CommentCannotUpdateReasonEnumMap[e])
              .toList(),
          'viewerCanReact': instance.viewerCanReact,
          'viewerCanMinimize': instance.viewerCanMinimize,
          'pullRequest': instance.pullRequest.toJson(),
          'repository': instance.repository.toJson(),
        };

ReviewThreadCommentsQuery$Query$Node$PullRequestReviewThread$Comments$Edges
    _$ReviewThreadCommentsQuery$Query$Node$PullRequestReviewThread$Comments$EdgesFromJson(
        Map<String, dynamic> json) {
  return ReviewThreadCommentsQuery$Query$Node$PullRequestReviewThread$Comments$Edges()
    ..cursor = json['cursor'] as String
    ..node = json['node'] == null
        ? null
        : ReviewThreadCommentsQuery$Query$Node$PullRequestReviewThread$Comments$Edges$Node
            .fromJson(json['node'] as Map<String, dynamic>);
}

Map<String, dynamic>
    _$ReviewThreadCommentsQuery$Query$Node$PullRequestReviewThread$Comments$EdgesToJson(
            ReviewThreadCommentsQuery$Query$Node$PullRequestReviewThread$Comments$Edges
                instance) =>
        <String, dynamic>{
          'cursor': instance.cursor,
          'node': instance.node?.toJson(),
        };

ReviewThreadCommentsQuery$Query$Node$PullRequestReviewThread$Comments
    _$ReviewThreadCommentsQuery$Query$Node$PullRequestReviewThread$CommentsFromJson(
        Map<String, dynamic> json) {
  return ReviewThreadCommentsQuery$Query$Node$PullRequestReviewThread$Comments()
    ..edges = (json['edges'] as List<dynamic>?)
        ?.map((e) => e == null
            ? null
            : ReviewThreadCommentsQuery$Query$Node$PullRequestReviewThread$Comments$Edges
                .fromJson(e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic>
    _$ReviewThreadCommentsQuery$Query$Node$PullRequestReviewThread$CommentsToJson(
            ReviewThreadCommentsQuery$Query$Node$PullRequestReviewThread$Comments
                instance) =>
        <String, dynamic>{
          'edges': instance.edges?.map((e) => e?.toJson()).toList(),
        };

ReviewThreadCommentsQuery$Query$Node$PullRequestReviewThread
    _$ReviewThreadCommentsQuery$Query$Node$PullRequestReviewThreadFromJson(
        Map<String, dynamic> json) {
  return ReviewThreadCommentsQuery$Query$Node$PullRequestReviewThread()
    ..$$typename = json['__typename'] as String?
    ..comments =
        ReviewThreadCommentsQuery$Query$Node$PullRequestReviewThread$Comments
            .fromJson(json['comments'] as Map<String, dynamic>);
}

Map<String, dynamic>
    _$ReviewThreadCommentsQuery$Query$Node$PullRequestReviewThreadToJson(
            ReviewThreadCommentsQuery$Query$Node$PullRequestReviewThread
                instance) =>
        <String, dynamic>{
          '__typename': instance.$$typename,
          'comments': instance.comments.toJson(),
        };

ReviewThreadCommentsQuery$Query$Node
    _$ReviewThreadCommentsQuery$Query$NodeFromJson(Map<String, dynamic> json) {
  return ReviewThreadCommentsQuery$Query$Node()
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic> _$ReviewThreadCommentsQuery$Query$NodeToJson(
        ReviewThreadCommentsQuery$Query$Node instance) =>
    <String, dynamic>{
      '__typename': instance.$$typename,
    };

ReviewThreadCommentsQuery$Query _$ReviewThreadCommentsQuery$QueryFromJson(
    Map<String, dynamic> json) {
  return ReviewThreadCommentsQuery$Query()
    ..node = json['node'] == null
        ? null
        : ReviewThreadCommentsQuery$Query$Node.fromJson(
            json['node'] as Map<String, dynamic>);
}

Map<String, dynamic> _$ReviewThreadCommentsQuery$QueryToJson(
        ReviewThreadCommentsQuery$Query instance) =>
    <String, dynamic>{
      'node': instance.node?.toJson(),
    };

CheckPendingViewerReviews$Query$Node$PullRequest$Reviews$Nodes
    _$CheckPendingViewerReviews$Query$Node$PullRequest$Reviews$NodesFromJson(
        Map<String, dynamic> json) {
  return CheckPendingViewerReviews$Query$Node$PullRequest$Reviews$Nodes()
    ..url = Uri.parse(json['url'] as String);
}

Map<String, dynamic>
    _$CheckPendingViewerReviews$Query$Node$PullRequest$Reviews$NodesToJson(
            CheckPendingViewerReviews$Query$Node$PullRequest$Reviews$Nodes
                instance) =>
        <String, dynamic>{
          'url': instance.url.toString(),
        };

CheckPendingViewerReviews$Query$Node$PullRequest$Reviews
    _$CheckPendingViewerReviews$Query$Node$PullRequest$ReviewsFromJson(
        Map<String, dynamic> json) {
  return CheckPendingViewerReviews$Query$Node$PullRequest$Reviews()
    ..totalCount = json['totalCount'] as int
    ..nodes = (json['nodes'] as List<dynamic>?)
        ?.map((e) => e == null
            ? null
            : CheckPendingViewerReviews$Query$Node$PullRequest$Reviews$Nodes
                .fromJson(e as Map<String, dynamic>))
        .toList();
}

Map<String,
    dynamic> _$CheckPendingViewerReviews$Query$Node$PullRequest$ReviewsToJson(
        CheckPendingViewerReviews$Query$Node$PullRequest$Reviews instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
      'nodes': instance.nodes?.map((e) => e?.toJson()).toList(),
    };

CheckPendingViewerReviews$Query$Node$PullRequest
    _$CheckPendingViewerReviews$Query$Node$PullRequestFromJson(
        Map<String, dynamic> json) {
  return CheckPendingViewerReviews$Query$Node$PullRequest()
    ..$$typename = json['__typename'] as String?
    ..reviews = json['reviews'] == null
        ? null
        : CheckPendingViewerReviews$Query$Node$PullRequest$Reviews.fromJson(
            json['reviews'] as Map<String, dynamic>);
}

Map<String, dynamic> _$CheckPendingViewerReviews$Query$Node$PullRequestToJson(
        CheckPendingViewerReviews$Query$Node$PullRequest instance) =>
    <String, dynamic>{
      '__typename': instance.$$typename,
      'reviews': instance.reviews?.toJson(),
    };

CheckPendingViewerReviews$Query$Node
    _$CheckPendingViewerReviews$Query$NodeFromJson(Map<String, dynamic> json) {
  return CheckPendingViewerReviews$Query$Node()
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic> _$CheckPendingViewerReviews$Query$NodeToJson(
        CheckPendingViewerReviews$Query$Node instance) =>
    <String, dynamic>{
      '__typename': instance.$$typename,
    };

CheckPendingViewerReviews$Query _$CheckPendingViewerReviews$QueryFromJson(
    Map<String, dynamic> json) {
  return CheckPendingViewerReviews$Query()
    ..node = json['node'] == null
        ? null
        : CheckPendingViewerReviews$Query$Node.fromJson(
            json['node'] as Map<String, dynamic>);
}

Map<String, dynamic> _$CheckPendingViewerReviews$QueryToJson(
        CheckPendingViewerReviews$Query instance) =>
    <String, dynamic>{
      'node': instance.node?.toJson(),
    };

GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$AddedToProjectEvent
    _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$AddedToProjectEventFromJson(
        Map<String, dynamic> json) {
  return GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$AddedToProjectEvent()
    ..id = json['id'] as String
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..actor = json['actor'] == null
        ? null
        : AddedToProjectMixin$Actor.fromJson(
            json['actor'] as Map<String, dynamic>)
    ..projectColumnName = json['projectColumnName'] as String
    ..project = json['project'] == null
        ? null
        : AddedToProjectMixin$Project.fromJson(
            json['project'] as Map<String, dynamic>)
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$AddedToProjectEventToJson(
            GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$AddedToProjectEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          'projectColumnName': instance.projectColumnName,
          'project': instance.project?.toJson(),
          '__typename': instance.$$typename,
        };

GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$AssignedEvent
    _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$AssignedEventFromJson(
        Map<String, dynamic> json) {
  return GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$AssignedEvent()
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
    _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$AssignedEventToJson(
            GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$AssignedEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          'assignee': instance.assignee?.toJson(),
          '__typename': instance.$$typename,
        };

GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$ClosedEvent
    _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$ClosedEventFromJson(
        Map<String, dynamic> json) {
  return GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$ClosedEvent()
    ..id = json['id'] as String
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..actor = json['actor'] == null
        ? null
        : ClosedMixin$Actor.fromJson(json['actor'] as Map<String, dynamic>)
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$ClosedEventToJson(
            GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$ClosedEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          '__typename': instance.$$typename,
        };

GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$CrossReferencedEvent
    _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$CrossReferencedEventFromJson(
        Map<String, dynamic> json) {
  return GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$CrossReferencedEvent()
    ..id = json['id'] as String
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..actor = json['actor'] == null
        ? null
        : CrossReferenceMixin$Actor.fromJson(
            json['actor'] as Map<String, dynamic>)
    ..source = CrossReferenceMixin$Source.fromJson(
        json['source'] as Map<String, dynamic>)
    ..isCrossRepository = json['isCrossRepository'] as bool
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$CrossReferencedEventToJson(
            GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$CrossReferencedEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          'source': instance.source.toJson(),
          'isCrossRepository': instance.isCrossRepository,
          '__typename': instance.$$typename,
        };

GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$DemilestonedEvent
    _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$DemilestonedEventFromJson(
        Map<String, dynamic> json) {
  return GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$DemilestonedEvent()
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
    _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$DemilestonedEventToJson(
            GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$DemilestonedEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          'milestoneTitle': instance.milestoneTitle,
          '__typename': instance.$$typename,
        };

GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$IssueComment
    _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$IssueCommentFromJson(
        Map<String, dynamic> json) {
  return GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$IssueComment()
    ..id = json['id'] as String
    ..author = json['author'] == null
        ? null
        : IssueCommentMixin$Author.fromJson(
            json['author'] as Map<String, dynamic>)
    ..createdAt = DateTime.parse(json['createdAt'] as String)
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
    _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$IssueCommentToJson(
            GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$IssueComment
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'author': instance.author?.toJson(),
          'createdAt': instance.createdAt.toIso8601String(),
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

GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$LabeledEvent
    _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$LabeledEventFromJson(
        Map<String, dynamic> json) {
  return GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$LabeledEvent()
    ..id = json['id'] as String
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..actor = json['actor'] == null
        ? null
        : LabeledMixin$Actor.fromJson(json['actor'] as Map<String, dynamic>)
    ..label = LabeledMixin$Label.fromJson(json['label'] as Map<String, dynamic>)
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$LabeledEventToJson(
            GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$LabeledEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          'label': instance.label.toJson(),
          '__typename': instance.$$typename,
        };

GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$LockedEvent
    _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$LockedEventFromJson(
        Map<String, dynamic> json) {
  return GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$LockedEvent()
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
    _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$LockedEventToJson(
            GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$LockedEvent
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

GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$MarkedAsDuplicateEvent
    _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$MarkedAsDuplicateEventFromJson(
        Map<String, dynamic> json) {
  return GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$MarkedAsDuplicateEvent()
    ..id = json['id'] as String
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..actor = json['actor'] == null
        ? null
        : MarkedAsDuplicateMixin$Actor.fromJson(
            json['actor'] as Map<String, dynamic>)
    ..isCrossRepository = json['isCrossRepository'] as bool
    ..canonical = json['canonical'] == null
        ? null
        : MarkedAsDuplicateMixin$Canonical.fromJson(
            json['canonical'] as Map<String, dynamic>)
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$MarkedAsDuplicateEventToJson(
            GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$MarkedAsDuplicateEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          'isCrossRepository': instance.isCrossRepository,
          'canonical': instance.canonical?.toJson(),
          '__typename': instance.$$typename,
        };

GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$MilestonedEvent
    _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$MilestonedEventFromJson(
        Map<String, dynamic> json) {
  return GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$MilestonedEvent()
    ..id = json['id'] as String
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..actor = json['actor'] == null
        ? null
        : MileStonedMixin$Actor.fromJson(json['actor'] as Map<String, dynamic>)
    ..milestoneTitle = json['milestoneTitle'] as String
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$MilestonedEventToJson(
            GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$MilestonedEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          'milestoneTitle': instance.milestoneTitle,
          '__typename': instance.$$typename,
        };

GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$MovedColumnsInProjectEvent
    _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$MovedColumnsInProjectEventFromJson(
        Map<String, dynamic> json) {
  return GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$MovedColumnsInProjectEvent()
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
    _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$MovedColumnsInProjectEventToJson(
            GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$MovedColumnsInProjectEvent
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

GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$PinnedEvent
    _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$PinnedEventFromJson(
        Map<String, dynamic> json) {
  return GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$PinnedEvent()
    ..id = json['id'] as String
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..actor = json['actor'] == null
        ? null
        : PinnedMixin$Actor.fromJson(json['actor'] as Map<String, dynamic>)
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$PinnedEventToJson(
            GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$PinnedEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          '__typename': instance.$$typename,
        };

GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$RemovedFromProjectEvent
    _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$RemovedFromProjectEventFromJson(
        Map<String, dynamic> json) {
  return GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$RemovedFromProjectEvent()
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
    ..projectColumnName = json['projectColumnName'] as String
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$RemovedFromProjectEventToJson(
            GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$RemovedFromProjectEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          'project': instance.project?.toJson(),
          'projectColumnName': instance.projectColumnName,
          '__typename': instance.$$typename,
        };

GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$RenamedTitleEvent
    _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$RenamedTitleEventFromJson(
        Map<String, dynamic> json) {
  return GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$RenamedTitleEvent()
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
    _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$RenamedTitleEventToJson(
            GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$RenamedTitleEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          'previousTitle': instance.previousTitle,
          'currentTitle': instance.currentTitle,
          '__typename': instance.$$typename,
        };

GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$ReopenedEvent
    _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$ReopenedEventFromJson(
        Map<String, dynamic> json) {
  return GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$ReopenedEvent()
    ..id = json['id'] as String
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..actor = json['actor'] == null
        ? null
        : ReopenedMixin$Actor.fromJson(json['actor'] as Map<String, dynamic>)
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$ReopenedEventToJson(
            GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$ReopenedEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          '__typename': instance.$$typename,
        };

GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$UnassignedEvent
    _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$UnassignedEventFromJson(
        Map<String, dynamic> json) {
  return GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$UnassignedEvent()
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
    _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$UnassignedEventToJson(
            GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$UnassignedEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          'assignee': instance.assignee?.toJson(),
          '__typename': instance.$$typename,
        };

GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$UnlabeledEvent
    _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$UnlabeledEventFromJson(
        Map<String, dynamic> json) {
  return GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$UnlabeledEvent()
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
    _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$UnlabeledEventToJson(
            GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$UnlabeledEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          'label': instance.label.toJson(),
          '__typename': instance.$$typename,
        };

GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$UnlockedEvent
    _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$UnlockedEventFromJson(
        Map<String, dynamic> json) {
  return GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$UnlockedEvent()
    ..id = json['id'] as String
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..actor = json['actor'] == null
        ? null
        : UnlockedMixin$Actor.fromJson(json['actor'] as Map<String, dynamic>)
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$UnlockedEventToJson(
            GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$UnlockedEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          '__typename': instance.$$typename,
        };

GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$UnmarkedAsDuplicateEvent
    _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$UnmarkedAsDuplicateEventFromJson(
        Map<String, dynamic> json) {
  return GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$UnmarkedAsDuplicateEvent()
    ..id = json['id'] as String
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..actor = json['actor'] == null
        ? null
        : UnmarkedAsDuplicateMixin$Actor.fromJson(
            json['actor'] as Map<String, dynamic>)
    ..isCrossRepository = json['isCrossRepository'] as bool
    ..canonical = json['canonical'] == null
        ? null
        : UnmarkedAsDuplicateMixin$Canonical.fromJson(
            json['canonical'] as Map<String, dynamic>)
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$UnmarkedAsDuplicateEventToJson(
            GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$UnmarkedAsDuplicateEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          'isCrossRepository': instance.isCrossRepository,
          'canonical': instance.canonical?.toJson(),
          '__typename': instance.$$typename,
        };

GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$UnpinnedEvent
    _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$UnpinnedEventFromJson(
        Map<String, dynamic> json) {
  return GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$UnpinnedEvent()
    ..id = json['id'] as String
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..actor = json['actor'] == null
        ? null
        : UnpinnedMixin$Actor.fromJson(json['actor'] as Map<String, dynamic>)
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$UnpinnedEventToJson(
            GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$UnpinnedEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          '__typename': instance.$$typename,
        };

GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node
    _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$NodeFromJson(
        Map<String, dynamic> json) {
  return GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node()
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$NodeToJson(
            GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node
                instance) =>
        <String, dynamic>{
          '__typename': instance.$$typename,
        };

GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges
    _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$EdgesFromJson(
        Map<String, dynamic> json) {
  return GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges()
    ..node = json['node'] == null
        ? null
        : GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node
            .fromJson(json['node'] as Map<String, dynamic>)
    ..cursor = json['cursor'] as String;
}

Map<String, dynamic>
    _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$EdgesToJson(
            GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges
                instance) =>
        <String, dynamic>{
          'node': instance.node?.toJson(),
          'cursor': instance.cursor,
        };

GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems
    _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItemsFromJson(
        Map<String, dynamic> json) {
  return GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems()
    ..edges = (json['edges'] as List<dynamic>?)
        ?.map((e) => e == null
            ? null
            : GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges
                .fromJson(e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic>
    _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItemsToJson(
            GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems
                instance) =>
        <String, dynamic>{
          'edges': instance.edges?.map((e) => e?.toJson()).toList(),
        };

GetTimeline$Query$Repository$IssueOrPullRequest$Issue
    _$GetTimeline$Query$Repository$IssueOrPullRequest$IssueFromJson(
        Map<String, dynamic> json) {
  return GetTimeline$Query$Repository$IssueOrPullRequest$Issue()
    ..$$typename = json['__typename'] as String?
    ..timelineItems =
        GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems
            .fromJson(json['timelineItems'] as Map<String, dynamic>);
}

Map<String, dynamic>
    _$GetTimeline$Query$Repository$IssueOrPullRequest$IssueToJson(
            GetTimeline$Query$Repository$IssueOrPullRequest$Issue instance) =>
        <String, dynamic>{
          '__typename': instance.$$typename,
          'timelineItems': instance.timelineItems.toJson(),
        };

GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$AddedToProjectEvent
    _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$AddedToProjectEventFromJson(
        Map<String, dynamic> json) {
  return GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$AddedToProjectEvent()
    ..id = json['id'] as String
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..actor = json['actor'] == null
        ? null
        : AddedToProjectMixin$Actor.fromJson(
            json['actor'] as Map<String, dynamic>)
    ..projectColumnName = json['projectColumnName'] as String
    ..project = json['project'] == null
        ? null
        : AddedToProjectMixin$Project.fromJson(
            json['project'] as Map<String, dynamic>)
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$AddedToProjectEventToJson(
            GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$AddedToProjectEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          'projectColumnName': instance.projectColumnName,
          'project': instance.project?.toJson(),
          '__typename': instance.$$typename,
        };

GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$AssignedEvent
    _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$AssignedEventFromJson(
        Map<String, dynamic> json) {
  return GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$AssignedEvent()
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
    _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$AssignedEventToJson(
            GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$AssignedEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          'assignee': instance.assignee?.toJson(),
          '__typename': instance.$$typename,
        };

GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$BaseRefChangedEvent
    _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$BaseRefChangedEventFromJson(
        Map<String, dynamic> json) {
  return GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$BaseRefChangedEvent()
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
    _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$BaseRefChangedEventToJson(
            GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$BaseRefChangedEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          'currentRefName': instance.currentRefName,
          'previousRefName': instance.previousRefName,
          '__typename': instance.$$typename,
        };

GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$BaseRefDeletedEvent
    _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$BaseRefDeletedEventFromJson(
        Map<String, dynamic> json) {
  return GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$BaseRefDeletedEvent()
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
    _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$BaseRefDeletedEventToJson(
            GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$BaseRefDeletedEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          'baseRefName': instance.baseRefName,
          '__typename': instance.$$typename,
        };

GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$BaseRefForcePushedEvent
    _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$BaseRefForcePushedEventFromJson(
        Map<String, dynamic> json) {
  return GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$BaseRefForcePushedEvent()
    ..id = json['id'] as String
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..beforeCommit = json['beforeCommit'] == null
        ? null
        : BaseRefForcePushedMixin$BeforeCommit.fromJson(
            json['beforeCommit'] as Map<String, dynamic>)
    ..afterCommit = json['afterCommit'] == null
        ? null
        : BaseRefForcePushedMixin$AfterCommit.fromJson(
            json['afterCommit'] as Map<String, dynamic>)
    ..ref = json['ref'] == null
        ? null
        : BaseRefForcePushedMixin$Ref.fromJson(
            json['ref'] as Map<String, dynamic>)
    ..actor = json['actor'] == null
        ? null
        : BaseRefForcePushedMixin$Actor.fromJson(
            json['actor'] as Map<String, dynamic>)
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$BaseRefForcePushedEventToJson(
            GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$BaseRefForcePushedEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'beforeCommit': instance.beforeCommit?.toJson(),
          'afterCommit': instance.afterCommit?.toJson(),
          'ref': instance.ref?.toJson(),
          'actor': instance.actor?.toJson(),
          '__typename': instance.$$typename,
        };

GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$ClosedEvent
    _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$ClosedEventFromJson(
        Map<String, dynamic> json) {
  return GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$ClosedEvent()
    ..id = json['id'] as String
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..actor = json['actor'] == null
        ? null
        : ClosedMixin$Actor.fromJson(json['actor'] as Map<String, dynamic>)
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$ClosedEventToJson(
            GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$ClosedEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          '__typename': instance.$$typename,
        };

GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$ConvertToDraftEvent
    _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$ConvertToDraftEventFromJson(
        Map<String, dynamic> json) {
  return GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$ConvertToDraftEvent()
    ..id = json['id'] as String
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..actor = json['actor'] == null
        ? null
        : ConvertedToDraftMixin$Actor.fromJson(
            json['actor'] as Map<String, dynamic>)
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$ConvertToDraftEventToJson(
            GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$ConvertToDraftEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          '__typename': instance.$$typename,
        };

GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$CrossReferencedEvent
    _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$CrossReferencedEventFromJson(
        Map<String, dynamic> json) {
  return GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$CrossReferencedEvent()
    ..id = json['id'] as String
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..actor = json['actor'] == null
        ? null
        : CrossReferenceMixin$Actor.fromJson(
            json['actor'] as Map<String, dynamic>)
    ..source = CrossReferenceMixin$Source.fromJson(
        json['source'] as Map<String, dynamic>)
    ..isCrossRepository = json['isCrossRepository'] as bool
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$CrossReferencedEventToJson(
            GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$CrossReferencedEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          'source': instance.source.toJson(),
          'isCrossRepository': instance.isCrossRepository,
          '__typename': instance.$$typename,
        };

GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$DemilestonedEvent
    _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$DemilestonedEventFromJson(
        Map<String, dynamic> json) {
  return GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$DemilestonedEvent()
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
    _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$DemilestonedEventToJson(
            GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$DemilestonedEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          'milestoneTitle': instance.milestoneTitle,
          '__typename': instance.$$typename,
        };

GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$HeadRefDeletedEvent
    _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$HeadRefDeletedEventFromJson(
        Map<String, dynamic> json) {
  return GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$HeadRefDeletedEvent()
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
    _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$HeadRefDeletedEventToJson(
            GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$HeadRefDeletedEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          'headRefName': instance.headRefName,
          '__typename': instance.$$typename,
        };

GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$HeadRefForcePushedEvent
    _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$HeadRefForcePushedEventFromJson(
        Map<String, dynamic> json) {
  return GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$HeadRefForcePushedEvent()
    ..id = json['id'] as String
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..beforeCommit = json['beforeCommit'] == null
        ? null
        : HeadRefForcePushedMixin$BeforeCommit.fromJson(
            json['beforeCommit'] as Map<String, dynamic>)
    ..afterCommit = json['afterCommit'] == null
        ? null
        : HeadRefForcePushedMixin$AfterCommit.fromJson(
            json['afterCommit'] as Map<String, dynamic>)
    ..ref = json['ref'] == null
        ? null
        : HeadRefForcePushedMixin$Ref.fromJson(
            json['ref'] as Map<String, dynamic>)
    ..actor = json['actor'] == null
        ? null
        : HeadRefForcePushedMixin$Actor.fromJson(
            json['actor'] as Map<String, dynamic>)
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$HeadRefForcePushedEventToJson(
            GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$HeadRefForcePushedEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'beforeCommit': instance.beforeCommit?.toJson(),
          'afterCommit': instance.afterCommit?.toJson(),
          'ref': instance.ref?.toJson(),
          'actor': instance.actor?.toJson(),
          '__typename': instance.$$typename,
        };

GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$HeadRefRestoredEvent
    _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$HeadRefRestoredEventFromJson(
        Map<String, dynamic> json) {
  return GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$HeadRefRestoredEvent()
    ..id = json['id'] as String
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..actor = json['actor'] == null
        ? null
        : HeadRefRestoredMixin$Actor.fromJson(
            json['actor'] as Map<String, dynamic>)
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$HeadRefRestoredEventToJson(
            GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$HeadRefRestoredEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          '__typename': instance.$$typename,
        };

GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$IssueComment
    _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$IssueCommentFromJson(
        Map<String, dynamic> json) {
  return GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$IssueComment()
    ..id = json['id'] as String
    ..author = json['author'] == null
        ? null
        : IssueCommentMixin$Author.fromJson(
            json['author'] as Map<String, dynamic>)
    ..createdAt = DateTime.parse(json['createdAt'] as String)
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
    _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$IssueCommentToJson(
            GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$IssueComment
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'author': instance.author?.toJson(),
          'createdAt': instance.createdAt.toIso8601String(),
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

GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$LabeledEvent
    _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$LabeledEventFromJson(
        Map<String, dynamic> json) {
  return GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$LabeledEvent()
    ..id = json['id'] as String
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..actor = json['actor'] == null
        ? null
        : LabeledMixin$Actor.fromJson(json['actor'] as Map<String, dynamic>)
    ..label = LabeledMixin$Label.fromJson(json['label'] as Map<String, dynamic>)
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$LabeledEventToJson(
            GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$LabeledEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          'label': instance.label.toJson(),
          '__typename': instance.$$typename,
        };

GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$LockedEvent
    _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$LockedEventFromJson(
        Map<String, dynamic> json) {
  return GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$LockedEvent()
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
    _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$LockedEventToJson(
            GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$LockedEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          'lockReason': _$LockReasonEnumMap[instance.lockReason],
          '__typename': instance.$$typename,
        };

GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$MarkedAsDuplicateEvent
    _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$MarkedAsDuplicateEventFromJson(
        Map<String, dynamic> json) {
  return GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$MarkedAsDuplicateEvent()
    ..id = json['id'] as String
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..actor = json['actor'] == null
        ? null
        : MarkedAsDuplicateMixin$Actor.fromJson(
            json['actor'] as Map<String, dynamic>)
    ..isCrossRepository = json['isCrossRepository'] as bool
    ..canonical = json['canonical'] == null
        ? null
        : MarkedAsDuplicateMixin$Canonical.fromJson(
            json['canonical'] as Map<String, dynamic>)
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$MarkedAsDuplicateEventToJson(
            GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$MarkedAsDuplicateEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          'isCrossRepository': instance.isCrossRepository,
          'canonical': instance.canonical?.toJson(),
          '__typename': instance.$$typename,
        };

GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$MergedEvent
    _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$MergedEventFromJson(
        Map<String, dynamic> json) {
  return GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$MergedEvent()
    ..id = json['id'] as String
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..actor = json['actor'] == null
        ? null
        : MergedMixin$Actor.fromJson(json['actor'] as Map<String, dynamic>)
    ..mergeRefName = json['mergeRefName'] as String
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$MergedEventToJson(
            GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$MergedEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          'mergeRefName': instance.mergeRefName,
          '__typename': instance.$$typename,
        };

GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$MilestonedEvent
    _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$MilestonedEventFromJson(
        Map<String, dynamic> json) {
  return GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$MilestonedEvent()
    ..id = json['id'] as String
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..actor = json['actor'] == null
        ? null
        : MileStonedMixin$Actor.fromJson(json['actor'] as Map<String, dynamic>)
    ..milestoneTitle = json['milestoneTitle'] as String
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$MilestonedEventToJson(
            GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$MilestonedEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          'milestoneTitle': instance.milestoneTitle,
          '__typename': instance.$$typename,
        };

GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$MovedColumnsInProjectEvent
    _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$MovedColumnsInProjectEventFromJson(
        Map<String, dynamic> json) {
  return GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$MovedColumnsInProjectEvent()
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
    _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$MovedColumnsInProjectEventToJson(
            GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$MovedColumnsInProjectEvent
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

GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$PinnedEvent
    _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$PinnedEventFromJson(
        Map<String, dynamic> json) {
  return GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$PinnedEvent()
    ..id = json['id'] as String
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..actor = json['actor'] == null
        ? null
        : PinnedMixin$Actor.fromJson(json['actor'] as Map<String, dynamic>)
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$PinnedEventToJson(
            GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$PinnedEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          '__typename': instance.$$typename,
        };

GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$PullRequestCommit
    _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$PullRequestCommitFromJson(
        Map<String, dynamic> json) {
  return GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$PullRequestCommit()
    ..id = json['id'] as String
    ..commit = PullRequestCommitMixin$Commit.fromJson(
        json['commit'] as Map<String, dynamic>)
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$PullRequestCommitToJson(
            GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$PullRequestCommit
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'commit': instance.commit.toJson(),
          '__typename': instance.$$typename,
        };

GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$PullRequestCommitCommentThread
    _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$PullRequestCommitCommentThreadFromJson(
        Map<String, dynamic> json) {
  return GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$PullRequestCommitCommentThread()
    ..$$typename = json['__typename'] as String?
    ..id = json['id'] as String;
}

Map<String, dynamic>
    _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$PullRequestCommitCommentThreadToJson(
            GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$PullRequestCommitCommentThread
                instance) =>
        <String, dynamic>{
          '__typename': instance.$$typename,
          'id': instance.id,
        };

GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$PullRequestReview
    _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$PullRequestReviewFromJson(
        Map<String, dynamic> json) {
  return GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$PullRequestReview()
    ..id = json['id'] as String
    ..author = json['author'] == null
        ? null
        : PullRequestReviewMixin$Author.fromJson(
            json['author'] as Map<String, dynamic>)
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..authorAssociation = _$enumDecode(
        _$CommentAuthorAssociationEnumMap, json['authorAssociation'],
        unknownValue: CommentAuthorAssociation.artemisUnknown)
    ..body = json['body'] as String
    ..bodyHTML = json['bodyHTML'] as String
    ..lastEditedAt = json['lastEditedAt'] == null
        ? null
        : DateTime.parse(json['lastEditedAt'] as String)
    ..state = _$enumDecode(_$PullRequestReviewStateEnumMap, json['state'],
        unknownValue: PullRequestReviewState.artemisUnknown)
    ..comments = PullRequestReviewMixin$Comments.fromJson(
        json['comments'] as Map<String, dynamic>)
    ..reactionGroups = (json['reactionGroups'] as List<dynamic>?)
        ?.map((e) => PullRequestReviewMixin$ReactionGroups.fromJson(
            e as Map<String, dynamic>))
        .toList()
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
    _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$PullRequestReviewToJson(
            GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$PullRequestReview
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'author': instance.author?.toJson(),
          'createdAt': instance.createdAt.toIso8601String(),
          'authorAssociation':
              _$CommentAuthorAssociationEnumMap[instance.authorAssociation],
          'body': instance.body,
          'bodyHTML': instance.bodyHTML,
          'lastEditedAt': instance.lastEditedAt?.toIso8601String(),
          'state': _$PullRequestReviewStateEnumMap[instance.state],
          'comments': instance.comments.toJson(),
          'reactionGroups':
              instance.reactionGroups?.map((e) => e.toJson()).toList(),
          'viewerCanDelete': instance.viewerCanDelete,
          'viewerCanUpdate': instance.viewerCanUpdate,
          'viewerDidAuthor': instance.viewerDidAuthor,
          'viewerCannotUpdateReasons': instance.viewerCannotUpdateReasons
              .map((e) => _$CommentCannotUpdateReasonEnumMap[e])
              .toList(),
          'viewerCanReact': instance.viewerCanReact,
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

GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$PullRequestReviewThread
    _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$PullRequestReviewThreadFromJson(
        Map<String, dynamic> json) {
  return GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$PullRequestReviewThread()
    ..$$typename = json['__typename'] as String?
    ..id = json['id'] as String;
}

Map<String, dynamic>
    _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$PullRequestReviewThreadToJson(
            GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$PullRequestReviewThread
                instance) =>
        <String, dynamic>{
          '__typename': instance.$$typename,
          'id': instance.id,
        };

GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$ReadyForReviewEvent
    _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$ReadyForReviewEventFromJson(
        Map<String, dynamic> json) {
  return GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$ReadyForReviewEvent()
    ..id = json['id'] as String
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..actor = json['actor'] == null
        ? null
        : ReadyForReviewMixin$Actor.fromJson(
            json['actor'] as Map<String, dynamic>)
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$ReadyForReviewEventToJson(
            GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$ReadyForReviewEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          '__typename': instance.$$typename,
        };

GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$RemovedFromProjectEvent
    _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$RemovedFromProjectEventFromJson(
        Map<String, dynamic> json) {
  return GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$RemovedFromProjectEvent()
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
    ..projectColumnName = json['projectColumnName'] as String
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$RemovedFromProjectEventToJson(
            GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$RemovedFromProjectEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          'project': instance.project?.toJson(),
          'projectColumnName': instance.projectColumnName,
          '__typename': instance.$$typename,
        };

GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$RenamedTitleEvent
    _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$RenamedTitleEventFromJson(
        Map<String, dynamic> json) {
  return GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$RenamedTitleEvent()
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
    _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$RenamedTitleEventToJson(
            GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$RenamedTitleEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          'previousTitle': instance.previousTitle,
          'currentTitle': instance.currentTitle,
          '__typename': instance.$$typename,
        };

GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$ReopenedEvent
    _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$ReopenedEventFromJson(
        Map<String, dynamic> json) {
  return GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$ReopenedEvent()
    ..id = json['id'] as String
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..actor = json['actor'] == null
        ? null
        : ReopenedMixin$Actor.fromJson(json['actor'] as Map<String, dynamic>)
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$ReopenedEventToJson(
            GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$ReopenedEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          '__typename': instance.$$typename,
        };

GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$ReviewDismissedEvent
    _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$ReviewDismissedEventFromJson(
        Map<String, dynamic> json) {
  return GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$ReviewDismissedEvent()
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
    _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$ReviewDismissedEventToJson(
            GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$ReviewDismissedEvent
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

GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$ReviewRequestedEvent
    _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$ReviewRequestedEventFromJson(
        Map<String, dynamic> json) {
  return GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$ReviewRequestedEvent()
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
    _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$ReviewRequestedEventToJson(
            GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$ReviewRequestedEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          'requestedReviewer': instance.requestedReviewer?.toJson(),
          '__typename': instance.$$typename,
        };

GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$UnassignedEvent
    _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$UnassignedEventFromJson(
        Map<String, dynamic> json) {
  return GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$UnassignedEvent()
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
    _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$UnassignedEventToJson(
            GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$UnassignedEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          'assignee': instance.assignee?.toJson(),
          '__typename': instance.$$typename,
        };

GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$UnlabeledEvent
    _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$UnlabeledEventFromJson(
        Map<String, dynamic> json) {
  return GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$UnlabeledEvent()
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
    _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$UnlabeledEventToJson(
            GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$UnlabeledEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          'label': instance.label.toJson(),
          '__typename': instance.$$typename,
        };

GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$UnlockedEvent
    _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$UnlockedEventFromJson(
        Map<String, dynamic> json) {
  return GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$UnlockedEvent()
    ..id = json['id'] as String
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..actor = json['actor'] == null
        ? null
        : UnlockedMixin$Actor.fromJson(json['actor'] as Map<String, dynamic>)
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$UnlockedEventToJson(
            GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$UnlockedEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          '__typename': instance.$$typename,
        };

GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$UnmarkedAsDuplicateEvent
    _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$UnmarkedAsDuplicateEventFromJson(
        Map<String, dynamic> json) {
  return GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$UnmarkedAsDuplicateEvent()
    ..id = json['id'] as String
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..actor = json['actor'] == null
        ? null
        : UnmarkedAsDuplicateMixin$Actor.fromJson(
            json['actor'] as Map<String, dynamic>)
    ..isCrossRepository = json['isCrossRepository'] as bool
    ..canonical = json['canonical'] == null
        ? null
        : UnmarkedAsDuplicateMixin$Canonical.fromJson(
            json['canonical'] as Map<String, dynamic>)
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$UnmarkedAsDuplicateEventToJson(
            GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$UnmarkedAsDuplicateEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          'isCrossRepository': instance.isCrossRepository,
          'canonical': instance.canonical?.toJson(),
          '__typename': instance.$$typename,
        };

GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$UnpinnedEvent
    _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$UnpinnedEventFromJson(
        Map<String, dynamic> json) {
  return GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$UnpinnedEvent()
    ..id = json['id'] as String
    ..createdAt = DateTime.parse(json['createdAt'] as String)
    ..actor = json['actor'] == null
        ? null
        : UnpinnedMixin$Actor.fromJson(json['actor'] as Map<String, dynamic>)
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$UnpinnedEventToJson(
            GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$UnpinnedEvent
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'createdAt': instance.createdAt.toIso8601String(),
          'actor': instance.actor?.toJson(),
          '__typename': instance.$$typename,
        };

GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node
    _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$NodeFromJson(
        Map<String, dynamic> json) {
  return GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node()
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$NodeToJson(
            GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node
                instance) =>
        <String, dynamic>{
          '__typename': instance.$$typename,
        };

GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges
    _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$EdgesFromJson(
        Map<String, dynamic> json) {
  return GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges()
    ..node = json['node'] == null
        ? null
        : GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node
            .fromJson(json['node'] as Map<String, dynamic>)
    ..cursor = json['cursor'] as String;
}

Map<String, dynamic>
    _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$EdgesToJson(
            GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges
                instance) =>
        <String, dynamic>{
          'node': instance.node?.toJson(),
          'cursor': instance.cursor,
        };

GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems
    _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItemsFromJson(
        Map<String, dynamic> json) {
  return GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems()
    ..edges = (json['edges'] as List<dynamic>?)
        ?.map((e) => e == null
            ? null
            : GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges
                .fromJson(e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic>
    _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItemsToJson(
            GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems
                instance) =>
        <String, dynamic>{
          'edges': instance.edges?.map((e) => e?.toJson()).toList(),
        };

GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest
    _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequestFromJson(
        Map<String, dynamic> json) {
  return GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest()
    ..$$typename = json['__typename'] as String?
    ..timelineItems =
        GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems
            .fromJson(json['timelineItems'] as Map<String, dynamic>);
}

Map<String, dynamic>
    _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequestToJson(
            GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest
                instance) =>
        <String, dynamic>{
          '__typename': instance.$$typename,
          'timelineItems': instance.timelineItems.toJson(),
        };

GetTimeline$Query$Repository$IssueOrPullRequest
    _$GetTimeline$Query$Repository$IssueOrPullRequestFromJson(
        Map<String, dynamic> json) {
  return GetTimeline$Query$Repository$IssueOrPullRequest()
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic> _$GetTimeline$Query$Repository$IssueOrPullRequestToJson(
        GetTimeline$Query$Repository$IssueOrPullRequest instance) =>
    <String, dynamic>{
      '__typename': instance.$$typename,
    };

GetTimeline$Query$Repository _$GetTimeline$Query$RepositoryFromJson(
    Map<String, dynamic> json) {
  return GetTimeline$Query$Repository()
    ..issueOrPullRequest = json['issueOrPullRequest'] == null
        ? null
        : GetTimeline$Query$Repository$IssueOrPullRequest.fromJson(
            json['issueOrPullRequest'] as Map<String, dynamic>);
}

Map<String, dynamic> _$GetTimeline$Query$RepositoryToJson(
        GetTimeline$Query$Repository instance) =>
    <String, dynamic>{
      'issueOrPullRequest': instance.issueOrPullRequest?.toJson(),
    };

GetTimeline$Query _$GetTimeline$QueryFromJson(Map<String, dynamic> json) {
  return GetTimeline$Query()
    ..repository = json['repository'] == null
        ? null
        : GetTimeline$Query$Repository.fromJson(
            json['repository'] as Map<String, dynamic>);
}

Map<String, dynamic> _$GetTimeline$QueryToJson(GetTimeline$Query instance) =>
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

AddedToProjectMixin$Project _$AddedToProjectMixin$ProjectFromJson(
    Map<String, dynamic> json) {
  return AddedToProjectMixin$Project()..name = json['name'] as String;
}

Map<String, dynamic> _$AddedToProjectMixin$ProjectToJson(
        AddedToProjectMixin$Project instance) =>
    <String, dynamic>{
      'name': instance.name,
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

AssignedMixin$Assignee$User _$AssignedMixin$Assignee$UserFromJson(
    Map<String, dynamic> json) {
  return AssignedMixin$Assignee$User()
    ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
    ..login = json['login'] as String
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic> _$AssignedMixin$Assignee$UserToJson(
        AssignedMixin$Assignee$User instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
      '__typename': instance.$$typename,
    };

AssignedMixin$Assignee$Bot _$AssignedMixin$Assignee$BotFromJson(
    Map<String, dynamic> json) {
  return AssignedMixin$Assignee$Bot()
    ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
    ..login = json['login'] as String
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic> _$AssignedMixin$Assignee$BotToJson(
        AssignedMixin$Assignee$Bot instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
      '__typename': instance.$$typename,
    };

AssignedMixin$Assignee$Mannequin _$AssignedMixin$Assignee$MannequinFromJson(
    Map<String, dynamic> json) {
  return AssignedMixin$Assignee$Mannequin()
    ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
    ..login = json['login'] as String
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic> _$AssignedMixin$Assignee$MannequinToJson(
        AssignedMixin$Assignee$Mannequin instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
      '__typename': instance.$$typename,
    };

AssignedMixin$Assignee$Organization
    _$AssignedMixin$Assignee$OrganizationFromJson(Map<String, dynamic> json) {
  return AssignedMixin$Assignee$Organization()
    ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
    ..login = json['login'] as String
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic> _$AssignedMixin$Assignee$OrganizationToJson(
        AssignedMixin$Assignee$Organization instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
      '__typename': instance.$$typename,
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

CrossReferenceMixin$Source$Issue _$CrossReferenceMixin$Source$IssueFromJson(
    Map<String, dynamic> json) {
  return CrossReferenceMixin$Source$Issue()
    ..url = Uri.parse(json['url'] as String)
    ..title = json['title'] as String
    ..number = json['number'] as int
    ..issueState = _$enumDecode(_$IssueStateEnumMap, json['issueState'],
        unknownValue: IssueState.artemisUnknown)
    ..repository = IssueMixin$Repository.fromJson(
        json['repository'] as Map<String, dynamic>)
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic> _$CrossReferenceMixin$Source$IssueToJson(
        CrossReferenceMixin$Source$Issue instance) =>
    <String, dynamic>{
      'url': instance.url.toString(),
      'title': instance.title,
      'number': instance.number,
      'issueState': _$IssueStateEnumMap[instance.issueState],
      'repository': instance.repository.toJson(),
      '__typename': instance.$$typename,
    };

const _$IssueStateEnumMap = {
  IssueState.closed: 'CLOSED',
  IssueState.open: 'OPEN',
  IssueState.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

CrossReferenceMixin$Source$PullRequest
    _$CrossReferenceMixin$Source$PullRequestFromJson(
        Map<String, dynamic> json) {
  return CrossReferenceMixin$Source$PullRequest()
    ..url = Uri.parse(json['url'] as String)
    ..title = json['title'] as String
    ..number = json['number'] as int
    ..pullState = _$enumDecode(_$PullRequestStateEnumMap, json['pullState'],
        unknownValue: PullRequestState.artemisUnknown)
    ..repository = PullRequestMixin$Repository.fromJson(
        json['repository'] as Map<String, dynamic>)
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic> _$CrossReferenceMixin$Source$PullRequestToJson(
        CrossReferenceMixin$Source$PullRequest instance) =>
    <String, dynamic>{
      'url': instance.url.toString(),
      'title': instance.title,
      'number': instance.number,
      'pullState': _$PullRequestStateEnumMap[instance.pullState],
      'repository': instance.repository.toJson(),
      '__typename': instance.$$typename,
    };

const _$PullRequestStateEnumMap = {
  PullRequestState.closed: 'CLOSED',
  PullRequestState.merged: 'MERGED',
  PullRequestState.open: 'OPEN',
  PullRequestState.artemisUnknown: 'ARTEMIS_UNKNOWN',
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

IssueMixin$Repository _$IssueMixin$RepositoryFromJson(
    Map<String, dynamic> json) {
  return IssueMixin$Repository()
    ..name = json['name'] as String
    ..nameWithOwner = json['nameWithOwner'] as String;
}

Map<String, dynamic> _$IssueMixin$RepositoryToJson(
        IssueMixin$Repository instance) =>
    <String, dynamic>{
      'name': instance.name,
      'nameWithOwner': instance.nameWithOwner,
    };

PullRequestMixin$Repository _$PullRequestMixin$RepositoryFromJson(
    Map<String, dynamic> json) {
  return PullRequestMixin$Repository()
    ..name = json['name'] as String
    ..nameWithOwner = json['nameWithOwner'] as String;
}

Map<String, dynamic> _$PullRequestMixin$RepositoryToJson(
        PullRequestMixin$Repository instance) =>
    <String, dynamic>{
      'name': instance.name,
      'nameWithOwner': instance.nameWithOwner,
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

IssueCommentMixin$ReactionGroups _$IssueCommentMixin$ReactionGroupsFromJson(
    Map<String, dynamic> json) {
  return IssueCommentMixin$ReactionGroups()
    ..content = _$enumDecode(_$ReactionContentEnumMap, json['content'],
        unknownValue: ReactionContent.artemisUnknown)
    ..viewerHasReacted = json['viewerHasReacted'] as bool
    ..users =
        ReactionsMixin$Users.fromJson(json['users'] as Map<String, dynamic>);
}

Map<String, dynamic> _$IssueCommentMixin$ReactionGroupsToJson(
        IssueCommentMixin$ReactionGroups instance) =>
    <String, dynamic>{
      'content': _$ReactionContentEnumMap[instance.content],
      'viewerHasReacted': instance.viewerHasReacted,
      'users': instance.users.toJson(),
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

MarkedAsDuplicateMixin$Canonical$Issue
    _$MarkedAsDuplicateMixin$Canonical$IssueFromJson(
        Map<String, dynamic> json) {
  return MarkedAsDuplicateMixin$Canonical$Issue()
    ..url = Uri.parse(json['url'] as String)
    ..title = json['title'] as String
    ..number = json['number'] as int
    ..issueState = _$enumDecode(_$IssueStateEnumMap, json['issueState'],
        unknownValue: IssueState.artemisUnknown)
    ..repository = IssueMixin$Repository.fromJson(
        json['repository'] as Map<String, dynamic>)
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic> _$MarkedAsDuplicateMixin$Canonical$IssueToJson(
        MarkedAsDuplicateMixin$Canonical$Issue instance) =>
    <String, dynamic>{
      'url': instance.url.toString(),
      'title': instance.title,
      'number': instance.number,
      'issueState': _$IssueStateEnumMap[instance.issueState],
      'repository': instance.repository.toJson(),
      '__typename': instance.$$typename,
    };

MarkedAsDuplicateMixin$Canonical$PullRequest
    _$MarkedAsDuplicateMixin$Canonical$PullRequestFromJson(
        Map<String, dynamic> json) {
  return MarkedAsDuplicateMixin$Canonical$PullRequest()
    ..url = Uri.parse(json['url'] as String)
    ..title = json['title'] as String
    ..number = json['number'] as int
    ..pullState = _$enumDecode(_$PullRequestStateEnumMap, json['pullState'],
        unknownValue: PullRequestState.artemisUnknown)
    ..repository = PullRequestMixin$Repository.fromJson(
        json['repository'] as Map<String, dynamic>)
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic> _$MarkedAsDuplicateMixin$Canonical$PullRequestToJson(
        MarkedAsDuplicateMixin$Canonical$PullRequest instance) =>
    <String, dynamic>{
      'url': instance.url.toString(),
      'title': instance.title,
      'number': instance.number,
      'pullState': _$PullRequestStateEnumMap[instance.pullState],
      'repository': instance.repository.toJson(),
      '__typename': instance.$$typename,
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

UnassignedMixin$Assignee$User _$UnassignedMixin$Assignee$UserFromJson(
    Map<String, dynamic> json) {
  return UnassignedMixin$Assignee$User()
    ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
    ..login = json['login'] as String
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic> _$UnassignedMixin$Assignee$UserToJson(
        UnassignedMixin$Assignee$User instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
      '__typename': instance.$$typename,
    };

UnassignedMixin$Assignee$Bot _$UnassignedMixin$Assignee$BotFromJson(
    Map<String, dynamic> json) {
  return UnassignedMixin$Assignee$Bot()
    ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
    ..login = json['login'] as String
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic> _$UnassignedMixin$Assignee$BotToJson(
        UnassignedMixin$Assignee$Bot instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
      '__typename': instance.$$typename,
    };

UnassignedMixin$Assignee$Mannequin _$UnassignedMixin$Assignee$MannequinFromJson(
    Map<String, dynamic> json) {
  return UnassignedMixin$Assignee$Mannequin()
    ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
    ..login = json['login'] as String
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic> _$UnassignedMixin$Assignee$MannequinToJson(
        UnassignedMixin$Assignee$Mannequin instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
      '__typename': instance.$$typename,
    };

UnassignedMixin$Assignee$Organization
    _$UnassignedMixin$Assignee$OrganizationFromJson(Map<String, dynamic> json) {
  return UnassignedMixin$Assignee$Organization()
    ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
    ..login = json['login'] as String
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic> _$UnassignedMixin$Assignee$OrganizationToJson(
        UnassignedMixin$Assignee$Organization instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
      '__typename': instance.$$typename,
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

UnmarkedAsDuplicateMixin$Canonical$Issue
    _$UnmarkedAsDuplicateMixin$Canonical$IssueFromJson(
        Map<String, dynamic> json) {
  return UnmarkedAsDuplicateMixin$Canonical$Issue()
    ..url = Uri.parse(json['url'] as String)
    ..title = json['title'] as String
    ..number = json['number'] as int
    ..issueState = _$enumDecode(_$IssueStateEnumMap, json['issueState'],
        unknownValue: IssueState.artemisUnknown)
    ..repository = IssueMixin$Repository.fromJson(
        json['repository'] as Map<String, dynamic>)
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic> _$UnmarkedAsDuplicateMixin$Canonical$IssueToJson(
        UnmarkedAsDuplicateMixin$Canonical$Issue instance) =>
    <String, dynamic>{
      'url': instance.url.toString(),
      'title': instance.title,
      'number': instance.number,
      'issueState': _$IssueStateEnumMap[instance.issueState],
      'repository': instance.repository.toJson(),
      '__typename': instance.$$typename,
    };

UnmarkedAsDuplicateMixin$Canonical$PullRequest
    _$UnmarkedAsDuplicateMixin$Canonical$PullRequestFromJson(
        Map<String, dynamic> json) {
  return UnmarkedAsDuplicateMixin$Canonical$PullRequest()
    ..url = Uri.parse(json['url'] as String)
    ..title = json['title'] as String
    ..number = json['number'] as int
    ..pullState = _$enumDecode(_$PullRequestStateEnumMap, json['pullState'],
        unknownValue: PullRequestState.artemisUnknown)
    ..repository = PullRequestMixin$Repository.fromJson(
        json['repository'] as Map<String, dynamic>)
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic> _$UnmarkedAsDuplicateMixin$Canonical$PullRequestToJson(
        UnmarkedAsDuplicateMixin$Canonical$PullRequest instance) =>
    <String, dynamic>{
      'url': instance.url.toString(),
      'title': instance.title,
      'number': instance.number,
      'pullState': _$PullRequestStateEnumMap[instance.pullState],
      'repository': instance.repository.toJson(),
      '__typename': instance.$$typename,
    };

UnmarkedAsDuplicateMixin$Canonical _$UnmarkedAsDuplicateMixin$CanonicalFromJson(
    Map<String, dynamic> json) {
  return UnmarkedAsDuplicateMixin$Canonical()
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic> _$UnmarkedAsDuplicateMixin$CanonicalToJson(
        UnmarkedAsDuplicateMixin$Canonical instance) =>
    <String, dynamic>{
      '__typename': instance.$$typename,
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

BaseRefForcePushedMixin$BeforeCommit
    _$BaseRefForcePushedMixin$BeforeCommitFromJson(Map<String, dynamic> json) {
  return BaseRefForcePushedMixin$BeforeCommit()
    ..abbreviatedOid = json['abbreviatedOid'] as String
    ..url = Uri.parse(json['url'] as String);
}

Map<String, dynamic> _$BaseRefForcePushedMixin$BeforeCommitToJson(
        BaseRefForcePushedMixin$BeforeCommit instance) =>
    <String, dynamic>{
      'abbreviatedOid': instance.abbreviatedOid,
      'url': instance.url.toString(),
    };

BaseRefForcePushedMixin$AfterCommit
    _$BaseRefForcePushedMixin$AfterCommitFromJson(Map<String, dynamic> json) {
  return BaseRefForcePushedMixin$AfterCommit()
    ..url = Uri.parse(json['url'] as String)
    ..abbreviatedOid = json['abbreviatedOid'] as String;
}

Map<String, dynamic> _$BaseRefForcePushedMixin$AfterCommitToJson(
        BaseRefForcePushedMixin$AfterCommit instance) =>
    <String, dynamic>{
      'url': instance.url.toString(),
      'abbreviatedOid': instance.abbreviatedOid,
    };

BaseRefForcePushedMixin$Ref _$BaseRefForcePushedMixin$RefFromJson(
    Map<String, dynamic> json) {
  return BaseRefForcePushedMixin$Ref()..name = json['name'] as String;
}

Map<String, dynamic> _$BaseRefForcePushedMixin$RefToJson(
        BaseRefForcePushedMixin$Ref instance) =>
    <String, dynamic>{
      'name': instance.name,
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

HeadRefForcePushedMixin$BeforeCommit
    _$HeadRefForcePushedMixin$BeforeCommitFromJson(Map<String, dynamic> json) {
  return HeadRefForcePushedMixin$BeforeCommit()
    ..abbreviatedOid = json['abbreviatedOid'] as String
    ..url = Uri.parse(json['url'] as String);
}

Map<String, dynamic> _$HeadRefForcePushedMixin$BeforeCommitToJson(
        HeadRefForcePushedMixin$BeforeCommit instance) =>
    <String, dynamic>{
      'abbreviatedOid': instance.abbreviatedOid,
      'url': instance.url.toString(),
    };

HeadRefForcePushedMixin$AfterCommit
    _$HeadRefForcePushedMixin$AfterCommitFromJson(Map<String, dynamic> json) {
  return HeadRefForcePushedMixin$AfterCommit()
    ..url = Uri.parse(json['url'] as String)
    ..abbreviatedOid = json['abbreviatedOid'] as String;
}

Map<String, dynamic> _$HeadRefForcePushedMixin$AfterCommitToJson(
        HeadRefForcePushedMixin$AfterCommit instance) =>
    <String, dynamic>{
      'url': instance.url.toString(),
      'abbreviatedOid': instance.abbreviatedOid,
    };

HeadRefForcePushedMixin$Ref _$HeadRefForcePushedMixin$RefFromJson(
    Map<String, dynamic> json) {
  return HeadRefForcePushedMixin$Ref()..name = json['name'] as String;
}

Map<String, dynamic> _$HeadRefForcePushedMixin$RefToJson(
        HeadRefForcePushedMixin$Ref instance) =>
    <String, dynamic>{
      'name': instance.name,
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

PullRequestCommitMixin$Commit _$PullRequestCommitMixin$CommitFromJson(
    Map<String, dynamic> json) {
  return PullRequestCommitMixin$Commit()
    ..additions = json['additions'] as int
    ..authoredDate = DateTime.parse(json['authoredDate'] as String)
    ..oid = json['oid'] as String
    ..message = json['message'] as String
    ..commitUrl = Uri.parse(json['commitUrl'] as String)
    ..messageHeadline = json['messageHeadline'] as String
    ..author = json['author'] == null
        ? null
        : CommitMixin$Author.fromJson(json['author'] as Map<String, dynamic>);
}

Map<String, dynamic> _$PullRequestCommitMixin$CommitToJson(
        PullRequestCommitMixin$Commit instance) =>
    <String, dynamic>{
      'additions': instance.additions,
      'authoredDate': instance.authoredDate.toIso8601String(),
      'oid': instance.oid,
      'message': instance.message,
      'commitUrl': instance.commitUrl.toString(),
      'messageHeadline': instance.messageHeadline,
      'author': instance.author?.toJson(),
    };

CommitMixin$Author$User _$CommitMixin$Author$UserFromJson(
    Map<String, dynamic> json) {
  return CommitMixin$Author$User()
    ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
    ..login = json['login'] as String;
}

Map<String, dynamic> _$CommitMixin$Author$UserToJson(
        CommitMixin$Author$User instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
    };

CommitMixin$Author _$CommitMixin$AuthorFromJson(Map<String, dynamic> json) {
  return CommitMixin$Author()
    ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
    ..name = json['name'] as String?
    ..user = json['user'] == null
        ? null
        : CommitMixin$Author$User.fromJson(
            json['user'] as Map<String, dynamic>);
}

Map<String, dynamic> _$CommitMixin$AuthorToJson(CommitMixin$Author instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'name': instance.name,
      'user': instance.user?.toJson(),
    };

PullRequestReviewMixin$Author _$PullRequestReviewMixin$AuthorFromJson(
    Map<String, dynamic> json) {
  return PullRequestReviewMixin$Author()
    ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
    ..login = json['login'] as String;
}

Map<String, dynamic> _$PullRequestReviewMixin$AuthorToJson(
        PullRequestReviewMixin$Author instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
    };

PullRequestReviewMixin$Comments _$PullRequestReviewMixin$CommentsFromJson(
    Map<String, dynamic> json) {
  return PullRequestReviewMixin$Comments()
    ..totalCount = json['totalCount'] as int;
}

Map<String, dynamic> _$PullRequestReviewMixin$CommentsToJson(
        PullRequestReviewMixin$Comments instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
    };

PullRequestReviewMixin$ReactionGroups
    _$PullRequestReviewMixin$ReactionGroupsFromJson(Map<String, dynamic> json) {
  return PullRequestReviewMixin$ReactionGroups()
    ..content = _$enumDecode(_$ReactionContentEnumMap, json['content'],
        unknownValue: ReactionContent.artemisUnknown)
    ..viewerHasReacted = json['viewerHasReacted'] as bool
    ..users =
        ReactionsMixin$Users.fromJson(json['users'] as Map<String, dynamic>);
}

Map<String, dynamic> _$PullRequestReviewMixin$ReactionGroupsToJson(
        PullRequestReviewMixin$ReactionGroups instance) =>
    <String, dynamic>{
      'content': _$ReactionContentEnumMap[instance.content],
      'viewerHasReacted': instance.viewerHasReacted,
      'users': instance.users.toJson(),
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

ReviewRequestedMixin$RequestedReviewer$User
    _$ReviewRequestedMixin$RequestedReviewer$UserFromJson(
        Map<String, dynamic> json) {
  return ReviewRequestedMixin$RequestedReviewer$User()
    ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
    ..login = json['login'] as String
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic> _$ReviewRequestedMixin$RequestedReviewer$UserToJson(
        ReviewRequestedMixin$RequestedReviewer$User instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
      '__typename': instance.$$typename,
    };

ReviewRequestedMixin$RequestedReviewer$Team
    _$ReviewRequestedMixin$RequestedReviewer$TeamFromJson(
        Map<String, dynamic> json) {
  return ReviewRequestedMixin$RequestedReviewer$Team()
    ..$$typename = json['__typename'] as String?
    ..avatar =
        json['avatar'] == null ? null : Uri.parse(json['avatar'] as String)
    ..name = json['name'] as String;
}

Map<String, dynamic> _$ReviewRequestedMixin$RequestedReviewer$TeamToJson(
        ReviewRequestedMixin$RequestedReviewer$Team instance) =>
    <String, dynamic>{
      '__typename': instance.$$typename,
      'avatar': instance.avatar?.toString(),
      'name': instance.name,
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

GetViewerOrgs$Query$Viewer$Organizations$Edges$Node
    _$GetViewerOrgs$Query$Viewer$Organizations$Edges$NodeFromJson(
        Map<String, dynamic> json) {
  return GetViewerOrgs$Query$Viewer$Organizations$Edges$Node()
    ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
    ..login = json['login'] as String;
}

Map<String, dynamic>
    _$GetViewerOrgs$Query$Viewer$Organizations$Edges$NodeToJson(
            GetViewerOrgs$Query$Viewer$Organizations$Edges$Node instance) =>
        <String, dynamic>{
          'avatarUrl': instance.avatarUrl.toString(),
          'login': instance.login,
        };

GetViewerOrgs$Query$Viewer$Organizations$Edges
    _$GetViewerOrgs$Query$Viewer$Organizations$EdgesFromJson(
        Map<String, dynamic> json) {
  return GetViewerOrgs$Query$Viewer$Organizations$Edges()
    ..cursor = json['cursor'] as String
    ..node = json['node'] == null
        ? null
        : GetViewerOrgs$Query$Viewer$Organizations$Edges$Node.fromJson(
            json['node'] as Map<String, dynamic>);
}

Map<String, dynamic> _$GetViewerOrgs$Query$Viewer$Organizations$EdgesToJson(
        GetViewerOrgs$Query$Viewer$Organizations$Edges instance) =>
    <String, dynamic>{
      'cursor': instance.cursor,
      'node': instance.node?.toJson(),
    };

GetViewerOrgs$Query$Viewer$Organizations
    _$GetViewerOrgs$Query$Viewer$OrganizationsFromJson(
        Map<String, dynamic> json) {
  return GetViewerOrgs$Query$Viewer$Organizations()
    ..edges = (json['edges'] as List<dynamic>?)
        ?.map((e) => e == null
            ? null
            : GetViewerOrgs$Query$Viewer$Organizations$Edges.fromJson(
                e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$GetViewerOrgs$Query$Viewer$OrganizationsToJson(
        GetViewerOrgs$Query$Viewer$Organizations instance) =>
    <String, dynamic>{
      'edges': instance.edges?.map((e) => e?.toJson()).toList(),
    };

GetViewerOrgs$Query$Viewer _$GetViewerOrgs$Query$ViewerFromJson(
    Map<String, dynamic> json) {
  return GetViewerOrgs$Query$Viewer()
    ..organizations = GetViewerOrgs$Query$Viewer$Organizations.fromJson(
        json['organizations'] as Map<String, dynamic>);
}

Map<String, dynamic> _$GetViewerOrgs$Query$ViewerToJson(
        GetViewerOrgs$Query$Viewer instance) =>
    <String, dynamic>{
      'organizations': instance.organizations.toJson(),
    };

GetViewerOrgs$Query _$GetViewerOrgs$QueryFromJson(Map<String, dynamic> json) {
  return GetViewerOrgs$Query()
    ..viewer = GetViewerOrgs$Query$Viewer.fromJson(
        json['viewer'] as Map<String, dynamic>);
}

Map<String, dynamic> _$GetViewerOrgs$QueryToJson(
        GetViewerOrgs$Query instance) =>
    <String, dynamic>{
      'viewer': instance.viewer.toJson(),
    };

FetchReviewArguments _$FetchReviewArgumentsFromJson(Map<String, dynamic> json) {
  return FetchReviewArguments(
    id: json['id'] as String,
  );
}

Map<String, dynamic> _$FetchReviewArgumentsToJson(
        FetchReviewArguments instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

GetPRReviewCommentsArguments _$GetPRReviewCommentsArgumentsFromJson(
    Map<String, dynamic> json) {
  return GetPRReviewCommentsArguments(
    id: json['id'] as String,
    cursor: json['cursor'] as String?,
  );
}

Map<String, dynamic> _$GetPRReviewCommentsArgumentsToJson(
        GetPRReviewCommentsArguments instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cursor': instance.cursor,
    };

ReviewThreadFirstCommentQueryArguments
    _$ReviewThreadFirstCommentQueryArgumentsFromJson(
        Map<String, dynamic> json) {
  return ReviewThreadFirstCommentQueryArguments(
    name: json['name'] as String,
    owner: json['owner'] as String,
    number: json['number'] as int,
    cursor: json['cursor'] as String?,
  );
}

Map<String, dynamic> _$ReviewThreadFirstCommentQueryArgumentsToJson(
        ReviewThreadFirstCommentQueryArguments instance) =>
    <String, dynamic>{
      'name': instance.name,
      'owner': instance.owner,
      'number': instance.number,
      'cursor': instance.cursor,
    };

ReviewThreadCommentsQueryArguments _$ReviewThreadCommentsQueryArgumentsFromJson(
    Map<String, dynamic> json) {
  return ReviewThreadCommentsQueryArguments(
    nodeID: json['nodeID'] as String,
    cursor: json['cursor'] as String?,
  );
}

Map<String, dynamic> _$ReviewThreadCommentsQueryArgumentsToJson(
        ReviewThreadCommentsQueryArguments instance) =>
    <String, dynamic>{
      'nodeID': instance.nodeID,
      'cursor': instance.cursor,
    };

CheckPendingViewerReviewsArguments _$CheckPendingViewerReviewsArgumentsFromJson(
    Map<String, dynamic> json) {
  return CheckPendingViewerReviewsArguments(
    pullNodeID: json['pullNodeID'] as String,
    author: json['author'] as String,
  );
}

Map<String, dynamic> _$CheckPendingViewerReviewsArgumentsToJson(
        CheckPendingViewerReviewsArguments instance) =>
    <String, dynamic>{
      'pullNodeID': instance.pullNodeID,
      'author': instance.author,
    };

GetTimelineArguments _$GetTimelineArgumentsFromJson(Map<String, dynamic> json) {
  return GetTimelineArguments(
    repoName: json['repoName'] as String,
    owner: json['owner'] as String,
    number: json['number'] as int,
    after: json['after'] as String?,
    since:
        json['since'] == null ? null : DateTime.parse(json['since'] as String),
  );
}

Map<String, dynamic> _$GetTimelineArgumentsToJson(
        GetTimelineArguments instance) =>
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

GetViewerOrgsArguments _$GetViewerOrgsArgumentsFromJson(
    Map<String, dynamic> json) {
  return GetViewerOrgsArguments(
    cursor: json['cursor'] as String?,
  );
}

Map<String, dynamic> _$GetViewerOrgsArgumentsToJson(
        GetViewerOrgsArguments instance) =>
    <String, dynamic>{
      'cursor': instance.cursor,
    };
