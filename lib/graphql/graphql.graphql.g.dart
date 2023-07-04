// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'graphql.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetRepoProjects$Query$Repository$Projects$Edges$Node
    _$GetRepoProjects$Query$Repository$Projects$Edges$NodeFromJson(
            Map<String, dynamic> json) =>
        GetRepoProjects$Query$Repository$Projects$Edges$Node()
          ..name = json['name'] as String
          ..id = json['id'] as String
          ..databaseId = json['databaseId'] as int?
          ..updatedAt = DateTime.parse(json['updatedAt'] as String)
          ..number = json['number'] as int
          ..bodyHTML = json['bodyHTML'] as String
          ..body = json['body'] as String?
          ..closed = json['closed'] as bool
          ..progress = ProjectMixin$Progress.fromJson(
              json['progress'] as Map<String, dynamic>);

Map<String, dynamic>
    _$GetRepoProjects$Query$Repository$Projects$Edges$NodeToJson(
            GetRepoProjects$Query$Repository$Projects$Edges$Node instance) =>
        <String, dynamic>{
          'name': instance.name,
          'id': instance.id,
          'databaseId': instance.databaseId,
          'updatedAt': instance.updatedAt.toIso8601String(),
          'number': instance.number,
          'bodyHTML': instance.bodyHTML,
          'body': instance.body,
          'closed': instance.closed,
          'progress': instance.progress.toJson(),
        };

GetRepoProjects$Query$Repository$Projects$Edges
    _$GetRepoProjects$Query$Repository$Projects$EdgesFromJson(
            Map<String, dynamic> json) =>
        GetRepoProjects$Query$Repository$Projects$Edges()
          ..cursor = json['cursor'] as String
          ..node = json['node'] == null
              ? null
              : GetRepoProjects$Query$Repository$Projects$Edges$Node.fromJson(
                  json['node'] as Map<String, dynamic>);

Map<String, dynamic> _$GetRepoProjects$Query$Repository$Projects$EdgesToJson(
        GetRepoProjects$Query$Repository$Projects$Edges instance) =>
    <String, dynamic>{
      'cursor': instance.cursor,
      'node': instance.node?.toJson(),
    };

GetRepoProjects$Query$Repository$Projects
    _$GetRepoProjects$Query$Repository$ProjectsFromJson(
            Map<String, dynamic> json) =>
        GetRepoProjects$Query$Repository$Projects()
          ..totalCount = json['totalCount'] as int
          ..edges = (json['edges'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : GetRepoProjects$Query$Repository$Projects$Edges.fromJson(
                      e as Map<String, dynamic>))
              .toList();

Map<String, dynamic> _$GetRepoProjects$Query$Repository$ProjectsToJson(
        GetRepoProjects$Query$Repository$Projects instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
      'edges': instance.edges?.map((e) => e?.toJson()).toList(),
    };

GetRepoProjects$Query$Repository _$GetRepoProjects$Query$RepositoryFromJson(
        Map<String, dynamic> json) =>
    GetRepoProjects$Query$Repository()
      ..projects = GetRepoProjects$Query$Repository$Projects.fromJson(
          json['projects'] as Map<String, dynamic>);

Map<String, dynamic> _$GetRepoProjects$Query$RepositoryToJson(
        GetRepoProjects$Query$Repository instance) =>
    <String, dynamic>{
      'projects': instance.projects.toJson(),
    };

GetRepoProjects$Query _$GetRepoProjects$QueryFromJson(
        Map<String, dynamic> json) =>
    GetRepoProjects$Query()
      ..repository = json['repository'] == null
          ? null
          : GetRepoProjects$Query$Repository.fromJson(
              json['repository'] as Map<String, dynamic>);

Map<String, dynamic> _$GetRepoProjects$QueryToJson(
        GetRepoProjects$Query instance) =>
    <String, dynamic>{
      'repository': instance.repository?.toJson(),
    };

ProjectMixin$Progress _$ProjectMixin$ProgressFromJson(
        Map<String, dynamic> json) =>
    ProjectMixin$Progress()
      ..donePercentage = (json['donePercentage'] as num).toDouble();

Map<String, dynamic> _$ProjectMixin$ProgressToJson(
        ProjectMixin$Progress instance) =>
    <String, dynamic>{
      'donePercentage': instance.donePercentage,
    };

GetProjectInfo$Query$Node$Project _$GetProjectInfo$Query$Node$ProjectFromJson(
        Map<String, dynamic> json) =>
    GetProjectInfo$Query$Node$Project()
      ..name = json['name'] as String
      ..id = json['id'] as String
      ..databaseId = json['databaseId'] as int?
      ..updatedAt = DateTime.parse(json['updatedAt'] as String)
      ..number = json['number'] as int
      ..bodyHTML = json['bodyHTML'] as String
      ..body = json['body'] as String?
      ..closed = json['closed'] as bool
      ..progress = ProjectMixin$Progress.fromJson(
          json['progress'] as Map<String, dynamic>)
      ..$$typename = json['__typename'] as String?;

Map<String, dynamic> _$GetProjectInfo$Query$Node$ProjectToJson(
        GetProjectInfo$Query$Node$Project instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'databaseId': instance.databaseId,
      'updatedAt': instance.updatedAt.toIso8601String(),
      'number': instance.number,
      'bodyHTML': instance.bodyHTML,
      'body': instance.body,
      'closed': instance.closed,
      'progress': instance.progress.toJson(),
      '__typename': instance.$$typename,
    };

GetProjectInfo$Query$Node _$GetProjectInfo$Query$NodeFromJson(
        Map<String, dynamic> json) =>
    GetProjectInfo$Query$Node()..$$typename = json['__typename'] as String?;

Map<String, dynamic> _$GetProjectInfo$Query$NodeToJson(
        GetProjectInfo$Query$Node instance) =>
    <String, dynamic>{
      '__typename': instance.$$typename,
    };

GetProjectInfo$Query _$GetProjectInfo$QueryFromJson(
        Map<String, dynamic> json) =>
    GetProjectInfo$Query()
      ..node = json['node'] == null
          ? null
          : GetProjectInfo$Query$Node.fromJson(
              json['node'] as Map<String, dynamic>);

Map<String, dynamic> _$GetProjectInfo$QueryToJson(
        GetProjectInfo$Query instance) =>
    <String, dynamic>{
      'node': instance.node?.toJson(),
    };

GetProjectColumns$Query$Node$Project$Columns$Edges$Node
    _$GetProjectColumns$Query$Node$Project$Columns$Edges$NodeFromJson(
            Map<String, dynamic> json) =>
        GetProjectColumns$Query$Node$Project$Columns$Edges$Node()
          ..name = json['name'] as String
          ..id = json['id'] as String
          ..updatedAt = DateTime.parse(json['updatedAt'] as String);

Map<String, dynamic>
    _$GetProjectColumns$Query$Node$Project$Columns$Edges$NodeToJson(
            GetProjectColumns$Query$Node$Project$Columns$Edges$Node instance) =>
        <String, dynamic>{
          'name': instance.name,
          'id': instance.id,
          'updatedAt': instance.updatedAt.toIso8601String(),
        };

GetProjectColumns$Query$Node$Project$Columns$Edges
    _$GetProjectColumns$Query$Node$Project$Columns$EdgesFromJson(
            Map<String, dynamic> json) =>
        GetProjectColumns$Query$Node$Project$Columns$Edges()
          ..cursor = json['cursor'] as String
          ..node = json['node'] == null
              ? null
              : GetProjectColumns$Query$Node$Project$Columns$Edges$Node
                  .fromJson(json['node'] as Map<String, dynamic>);

Map<String, dynamic> _$GetProjectColumns$Query$Node$Project$Columns$EdgesToJson(
        GetProjectColumns$Query$Node$Project$Columns$Edges instance) =>
    <String, dynamic>{
      'cursor': instance.cursor,
      'node': instance.node?.toJson(),
    };

GetProjectColumns$Query$Node$Project$Columns
    _$GetProjectColumns$Query$Node$Project$ColumnsFromJson(
            Map<String, dynamic> json) =>
        GetProjectColumns$Query$Node$Project$Columns()
          ..totalCount = json['totalCount'] as int
          ..edges = (json['edges'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : GetProjectColumns$Query$Node$Project$Columns$Edges.fromJson(
                      e as Map<String, dynamic>))
              .toList();

Map<String, dynamic> _$GetProjectColumns$Query$Node$Project$ColumnsToJson(
        GetProjectColumns$Query$Node$Project$Columns instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
      'edges': instance.edges?.map((e) => e?.toJson()).toList(),
    };

GetProjectColumns$Query$Node$Project
    _$GetProjectColumns$Query$Node$ProjectFromJson(Map<String, dynamic> json) =>
        GetProjectColumns$Query$Node$Project()
          ..$$typename = json['__typename'] as String?
          ..columns = GetProjectColumns$Query$Node$Project$Columns.fromJson(
              json['columns'] as Map<String, dynamic>);

Map<String, dynamic> _$GetProjectColumns$Query$Node$ProjectToJson(
        GetProjectColumns$Query$Node$Project instance) =>
    <String, dynamic>{
      '__typename': instance.$$typename,
      'columns': instance.columns.toJson(),
    };

GetProjectColumns$Query$Node _$GetProjectColumns$Query$NodeFromJson(
        Map<String, dynamic> json) =>
    GetProjectColumns$Query$Node()..$$typename = json['__typename'] as String?;

Map<String, dynamic> _$GetProjectColumns$Query$NodeToJson(
        GetProjectColumns$Query$Node instance) =>
    <String, dynamic>{
      '__typename': instance.$$typename,
    };

GetProjectColumns$Query _$GetProjectColumns$QueryFromJson(
        Map<String, dynamic> json) =>
    GetProjectColumns$Query()
      ..node = json['node'] == null
          ? null
          : GetProjectColumns$Query$Node.fromJson(
              json['node'] as Map<String, dynamic>);

Map<String, dynamic> _$GetProjectColumns$QueryToJson(
        GetProjectColumns$Query instance) =>
    <String, dynamic>{
      'node': instance.node?.toJson(),
    };

GetProjectColumnCards$Query$Node$ProjectColumn$Cards$Edges$Node$Content$Issue
    _$GetProjectColumnCards$Query$Node$ProjectColumn$Cards$Edges$Node$Content$IssueFromJson(
            Map<String, dynamic> json) =>
        GetProjectColumnCards$Query$Node$ProjectColumn$Cards$Edges$Node$Content$Issue()
          ..$$typename = json['__typename'] as String?
          ..bodyHTML = json['bodyHTML'] as String
          ..title = json['title'] as String
          ..number = json['number'] as int;

Map<String, dynamic>
    _$GetProjectColumnCards$Query$Node$ProjectColumn$Cards$Edges$Node$Content$IssueToJson(
            GetProjectColumnCards$Query$Node$ProjectColumn$Cards$Edges$Node$Content$Issue
                instance) =>
        <String, dynamic>{
          '__typename': instance.$$typename,
          'bodyHTML': instance.bodyHTML,
          'title': instance.title,
          'number': instance.number,
        };

GetProjectColumnCards$Query$Node$ProjectColumn$Cards$Edges$Node$Content
    _$GetProjectColumnCards$Query$Node$ProjectColumn$Cards$Edges$Node$ContentFromJson(
            Map<String, dynamic> json) =>
        GetProjectColumnCards$Query$Node$ProjectColumn$Cards$Edges$Node$Content()
          ..$$typename = json['__typename'] as String?;

Map<String, dynamic>
    _$GetProjectColumnCards$Query$Node$ProjectColumn$Cards$Edges$Node$ContentToJson(
            GetProjectColumnCards$Query$Node$ProjectColumn$Cards$Edges$Node$Content
                instance) =>
        <String, dynamic>{
          '__typename': instance.$$typename,
        };

GetProjectColumnCards$Query$Node$ProjectColumn$Cards$Edges$Node
    _$GetProjectColumnCards$Query$Node$ProjectColumn$Cards$Edges$NodeFromJson(
            Map<String, dynamic> json) =>
        GetProjectColumnCards$Query$Node$ProjectColumn$Cards$Edges$Node()
          ..note = json['note'] as String?
          ..content = json['content'] == null
              ? null
              : GetProjectColumnCards$Query$Node$ProjectColumn$Cards$Edges$Node$Content
                  .fromJson(json['content'] as Map<String, dynamic>);

Map<String, dynamic>
    _$GetProjectColumnCards$Query$Node$ProjectColumn$Cards$Edges$NodeToJson(
            GetProjectColumnCards$Query$Node$ProjectColumn$Cards$Edges$Node
                instance) =>
        <String, dynamic>{
          'note': instance.note,
          'content': instance.content?.toJson(),
        };

GetProjectColumnCards$Query$Node$ProjectColumn$Cards$Edges
    _$GetProjectColumnCards$Query$Node$ProjectColumn$Cards$EdgesFromJson(
            Map<String, dynamic> json) =>
        GetProjectColumnCards$Query$Node$ProjectColumn$Cards$Edges()
          ..cursor = json['cursor'] as String
          ..node = json['node'] == null
              ? null
              : GetProjectColumnCards$Query$Node$ProjectColumn$Cards$Edges$Node
                  .fromJson(json['node'] as Map<String, dynamic>);

Map<String,
    dynamic> _$GetProjectColumnCards$Query$Node$ProjectColumn$Cards$EdgesToJson(
        GetProjectColumnCards$Query$Node$ProjectColumn$Cards$Edges instance) =>
    <String, dynamic>{
      'cursor': instance.cursor,
      'node': instance.node?.toJson(),
    };

GetProjectColumnCards$Query$Node$ProjectColumn$Cards
    _$GetProjectColumnCards$Query$Node$ProjectColumn$CardsFromJson(
            Map<String, dynamic> json) =>
        GetProjectColumnCards$Query$Node$ProjectColumn$Cards()
          ..totalCount = json['totalCount'] as int
          ..edges = (json['edges'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : GetProjectColumnCards$Query$Node$ProjectColumn$Cards$Edges
                      .fromJson(e as Map<String, dynamic>))
              .toList();

Map<String, dynamic>
    _$GetProjectColumnCards$Query$Node$ProjectColumn$CardsToJson(
            GetProjectColumnCards$Query$Node$ProjectColumn$Cards instance) =>
        <String, dynamic>{
          'totalCount': instance.totalCount,
          'edges': instance.edges?.map((e) => e?.toJson()).toList(),
        };

GetProjectColumnCards$Query$Node$ProjectColumn
    _$GetProjectColumnCards$Query$Node$ProjectColumnFromJson(
            Map<String, dynamic> json) =>
        GetProjectColumnCards$Query$Node$ProjectColumn()
          ..$$typename = json['__typename'] as String?
          ..cards =
              GetProjectColumnCards$Query$Node$ProjectColumn$Cards.fromJson(
                  json['cards'] as Map<String, dynamic>);

Map<String, dynamic> _$GetProjectColumnCards$Query$Node$ProjectColumnToJson(
        GetProjectColumnCards$Query$Node$ProjectColumn instance) =>
    <String, dynamic>{
      '__typename': instance.$$typename,
      'cards': instance.cards.toJson(),
    };

GetProjectColumnCards$Query$Node _$GetProjectColumnCards$Query$NodeFromJson(
        Map<String, dynamic> json) =>
    GetProjectColumnCards$Query$Node()
      ..$$typename = json['__typename'] as String?;

Map<String, dynamic> _$GetProjectColumnCards$Query$NodeToJson(
        GetProjectColumnCards$Query$Node instance) =>
    <String, dynamic>{
      '__typename': instance.$$typename,
    };

GetProjectColumnCards$Query _$GetProjectColumnCards$QueryFromJson(
        Map<String, dynamic> json) =>
    GetProjectColumnCards$Query()
      ..node = json['node'] == null
          ? null
          : GetProjectColumnCards$Query$Node.fromJson(
              json['node'] as Map<String, dynamic>);

Map<String, dynamic> _$GetProjectColumnCards$QueryToJson(
        GetProjectColumnCards$Query instance) =>
    <String, dynamic>{
      'node': instance.node?.toJson(),
    };

IssueTemplates$Query$Repository$IssueTemplates
    _$IssueTemplates$Query$Repository$IssueTemplatesFromJson(
            Map<String, dynamic> json) =>
        IssueTemplates$Query$Repository$IssueTemplates()
          ..name = json['name'] as String
          ..title = json['title'] as String?
          ..body = json['body'] as String?
          ..about = json['about'] as String?;

Map<String, dynamic> _$IssueTemplates$Query$Repository$IssueTemplatesToJson(
        IssueTemplates$Query$Repository$IssueTemplates instance) =>
    <String, dynamic>{
      'name': instance.name,
      'title': instance.title,
      'body': instance.body,
      'about': instance.about,
    };

IssueTemplates$Query$Repository _$IssueTemplates$Query$RepositoryFromJson(
        Map<String, dynamic> json) =>
    IssueTemplates$Query$Repository()
      ..issueTemplates = (json['issueTemplates'] as List<dynamic>?)
          ?.map((e) => IssueTemplates$Query$Repository$IssueTemplates.fromJson(
              e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$IssueTemplates$Query$RepositoryToJson(
        IssueTemplates$Query$Repository instance) =>
    <String, dynamic>{
      'issueTemplates':
          instance.issueTemplates?.map((e) => e.toJson()).toList(),
    };

IssueTemplates$Query _$IssueTemplates$QueryFromJson(
        Map<String, dynamic> json) =>
    IssueTemplates$Query()
      ..repository = json['repository'] == null
          ? null
          : IssueTemplates$Query$Repository.fromJson(
              json['repository'] as Map<String, dynamic>);

Map<String, dynamic> _$IssueTemplates$QueryToJson(
        IssueTemplates$Query instance) =>
    <String, dynamic>{
      'repository': instance.repository?.toJson(),
    };

PinnedIssues$Query$Repository$PinnedIssues$Nodes$Issue
    _$PinnedIssues$Query$Repository$PinnedIssues$Nodes$IssueFromJson(
            Map<String, dynamic> json) =>
        PinnedIssues$Query$Repository$PinnedIssues$Nodes$Issue()
          ..url = Uri.parse(json['url'] as String)
          ..title = json['title'] as String
          ..number = json['number'] as int
          ..issueState = $enumDecode(_$IssueStateEnumMap, json['issueState'],
              unknownValue: IssueState.artemisUnknown)
          ..repository = IssueMixin$Repository.fromJson(
              json['repository'] as Map<String, dynamic>);

Map<String, dynamic>
    _$PinnedIssues$Query$Repository$PinnedIssues$Nodes$IssueToJson(
            PinnedIssues$Query$Repository$PinnedIssues$Nodes$Issue instance) =>
        <String, dynamic>{
          'url': instance.url.toString(),
          'title': instance.title,
          'number': instance.number,
          'issueState': _$IssueStateEnumMap[instance.issueState]!,
          'repository': instance.repository.toJson(),
        };

const _$IssueStateEnumMap = {
  IssueState.closed: 'CLOSED',
  IssueState.open: 'OPEN',
  IssueState.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

PinnedIssues$Query$Repository$PinnedIssues$Nodes
    _$PinnedIssues$Query$Repository$PinnedIssues$NodesFromJson(
            Map<String, dynamic> json) =>
        PinnedIssues$Query$Repository$PinnedIssues$Nodes()
          ..issue =
              PinnedIssues$Query$Repository$PinnedIssues$Nodes$Issue.fromJson(
                  json['issue'] as Map<String, dynamic>);

Map<String, dynamic> _$PinnedIssues$Query$Repository$PinnedIssues$NodesToJson(
        PinnedIssues$Query$Repository$PinnedIssues$Nodes instance) =>
    <String, dynamic>{
      'issue': instance.issue.toJson(),
    };

PinnedIssues$Query$Repository$PinnedIssues
    _$PinnedIssues$Query$Repository$PinnedIssuesFromJson(
            Map<String, dynamic> json) =>
        PinnedIssues$Query$Repository$PinnedIssues()
          ..totalCount = json['totalCount'] as int
          ..nodes = (json['nodes'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : PinnedIssues$Query$Repository$PinnedIssues$Nodes.fromJson(
                      e as Map<String, dynamic>))
              .toList();

Map<String, dynamic> _$PinnedIssues$Query$Repository$PinnedIssuesToJson(
        PinnedIssues$Query$Repository$PinnedIssues instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
      'nodes': instance.nodes?.map((e) => e?.toJson()).toList(),
    };

PinnedIssues$Query$Repository _$PinnedIssues$Query$RepositoryFromJson(
        Map<String, dynamic> json) =>
    PinnedIssues$Query$Repository()
      ..pinnedIssues = json['pinnedIssues'] == null
          ? null
          : PinnedIssues$Query$Repository$PinnedIssues.fromJson(
              json['pinnedIssues'] as Map<String, dynamic>);

Map<String, dynamic> _$PinnedIssues$Query$RepositoryToJson(
        PinnedIssues$Query$Repository instance) =>
    <String, dynamic>{
      'pinnedIssues': instance.pinnedIssues?.toJson(),
    };

PinnedIssues$Query _$PinnedIssues$QueryFromJson(Map<String, dynamic> json) =>
    PinnedIssues$Query()
      ..repository = json['repository'] == null
          ? null
          : PinnedIssues$Query$Repository.fromJson(
              json['repository'] as Map<String, dynamic>);

Map<String, dynamic> _$PinnedIssues$QueryToJson(PinnedIssues$Query instance) =>
    <String, dynamic>{
      'repository': instance.repository?.toJson(),
    };

IssueMixin$Repository _$IssueMixin$RepositoryFromJson(
        Map<String, dynamic> json) =>
    IssueMixin$Repository()
      ..name = json['name'] as String
      ..nameWithOwner = json['nameWithOwner'] as String;

Map<String, dynamic> _$IssueMixin$RepositoryToJson(
        IssueMixin$Repository instance) =>
    <String, dynamic>{
      'name': instance.name,
      'nameWithOwner': instance.nameWithOwner,
    };

HasStarred$Query$Repository _$HasStarred$Query$RepositoryFromJson(
        Map<String, dynamic> json) =>
    HasStarred$Query$Repository()
      ..viewerHasStarred = json['viewerHasStarred'] as bool
      ..stargazerCount = json['stargazerCount'] as int;

Map<String, dynamic> _$HasStarred$Query$RepositoryToJson(
        HasStarred$Query$Repository instance) =>
    <String, dynamic>{
      'viewerHasStarred': instance.viewerHasStarred,
      'stargazerCount': instance.stargazerCount,
    };

HasStarred$Query _$HasStarred$QueryFromJson(Map<String, dynamic> json) =>
    HasStarred$Query()
      ..repository = json['repository'] == null
          ? null
          : HasStarred$Query$Repository.fromJson(
              json['repository'] as Map<String, dynamic>);

Map<String, dynamic> _$HasStarred$QueryToJson(HasStarred$Query instance) =>
    <String, dynamic>{
      'repository': instance.repository?.toJson(),
    };

HasWatched$Query$Repository$Watchers
    _$HasWatched$Query$Repository$WatchersFromJson(Map<String, dynamic> json) =>
        HasWatched$Query$Repository$Watchers()
          ..totalCount = json['totalCount'] as int;

Map<String, dynamic> _$HasWatched$Query$Repository$WatchersToJson(
        HasWatched$Query$Repository$Watchers instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
    };

HasWatched$Query$Repository _$HasWatched$Query$RepositoryFromJson(
        Map<String, dynamic> json) =>
    HasWatched$Query$Repository()
      ..viewerSubscription = $enumDecodeNullable(
          _$SubscriptionStateEnumMap, json['viewerSubscription'],
          unknownValue: SubscriptionState.artemisUnknown)
      ..viewerCanSubscribe = json['viewerCanSubscribe'] as bool
      ..watchers = HasWatched$Query$Repository$Watchers.fromJson(
          json['watchers'] as Map<String, dynamic>);

Map<String, dynamic> _$HasWatched$Query$RepositoryToJson(
        HasWatched$Query$Repository instance) =>
    <String, dynamic>{
      'viewerSubscription':
          _$SubscriptionStateEnumMap[instance.viewerSubscription],
      'viewerCanSubscribe': instance.viewerCanSubscribe,
      'watchers': instance.watchers.toJson(),
    };

const _$SubscriptionStateEnumMap = {
  SubscriptionState.ignored: 'IGNORED',
  SubscriptionState.subscribed: 'SUBSCRIBED',
  SubscriptionState.unsubscribed: 'UNSUBSCRIBED',
  SubscriptionState.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

HasWatched$Query _$HasWatched$QueryFromJson(Map<String, dynamic> json) =>
    HasWatched$Query()
      ..repository = json['repository'] == null
          ? null
          : HasWatched$Query$Repository.fromJson(
              json['repository'] as Map<String, dynamic>);

Map<String, dynamic> _$HasWatched$QueryToJson(HasWatched$Query instance) =>
    <String, dynamic>{
      'repository': instance.repository?.toJson(),
    };

GetViewerOrgs$Query$Viewer$Organizations$Edges$Node
    _$GetViewerOrgs$Query$Viewer$Organizations$Edges$NodeFromJson(
            Map<String, dynamic> json) =>
        GetViewerOrgs$Query$Viewer$Organizations$Edges$Node()
          ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
          ..login = json['login'] as String;

Map<String, dynamic>
    _$GetViewerOrgs$Query$Viewer$Organizations$Edges$NodeToJson(
            GetViewerOrgs$Query$Viewer$Organizations$Edges$Node instance) =>
        <String, dynamic>{
          'avatarUrl': instance.avatarUrl.toString(),
          'login': instance.login,
        };

GetViewerOrgs$Query$Viewer$Organizations$Edges
    _$GetViewerOrgs$Query$Viewer$Organizations$EdgesFromJson(
            Map<String, dynamic> json) =>
        GetViewerOrgs$Query$Viewer$Organizations$Edges()
          ..cursor = json['cursor'] as String
          ..node = json['node'] == null
              ? null
              : GetViewerOrgs$Query$Viewer$Organizations$Edges$Node.fromJson(
                  json['node'] as Map<String, dynamic>);

Map<String, dynamic> _$GetViewerOrgs$Query$Viewer$Organizations$EdgesToJson(
        GetViewerOrgs$Query$Viewer$Organizations$Edges instance) =>
    <String, dynamic>{
      'cursor': instance.cursor,
      'node': instance.node?.toJson(),
    };

GetViewerOrgs$Query$Viewer$Organizations
    _$GetViewerOrgs$Query$Viewer$OrganizationsFromJson(
            Map<String, dynamic> json) =>
        GetViewerOrgs$Query$Viewer$Organizations()
          ..edges = (json['edges'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : GetViewerOrgs$Query$Viewer$Organizations$Edges.fromJson(
                      e as Map<String, dynamic>))
              .toList();

Map<String, dynamic> _$GetViewerOrgs$Query$Viewer$OrganizationsToJson(
        GetViewerOrgs$Query$Viewer$Organizations instance) =>
    <String, dynamic>{
      'edges': instance.edges?.map((e) => e?.toJson()).toList(),
    };

GetViewerOrgs$Query$Viewer _$GetViewerOrgs$Query$ViewerFromJson(
        Map<String, dynamic> json) =>
    GetViewerOrgs$Query$Viewer()
      ..organizations = GetViewerOrgs$Query$Viewer$Organizations.fromJson(
          json['organizations'] as Map<String, dynamic>);

Map<String, dynamic> _$GetViewerOrgs$Query$ViewerToJson(
        GetViewerOrgs$Query$Viewer instance) =>
    <String, dynamic>{
      'organizations': instance.organizations.toJson(),
    };

GetViewerOrgs$Query _$GetViewerOrgs$QueryFromJson(Map<String, dynamic> json) =>
    GetViewerOrgs$Query()
      ..viewer = GetViewerOrgs$Query$Viewer.fromJson(
          json['viewer'] as Map<String, dynamic>);

Map<String, dynamic> _$GetViewerOrgs$QueryToJson(
        GetViewerOrgs$Query instance) =>
    <String, dynamic>{
      'viewer': instance.viewer.toJson(),
    };

GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$AddedToProjectEvent
    _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$AddedToProjectEventFromJson(
            Map<String, dynamic> json) =>
        GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$AddedToProjectEvent()
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
            Map<String, dynamic> json) =>
        GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$AssignedEvent()
          ..id = json['id'] as String
          ..createdAt = DateTime.parse(json['createdAt'] as String)
          ..actor = json['actor'] == null
              ? null
              : AssignedMixin$Actor.fromJson(
                  json['actor'] as Map<String, dynamic>)
          ..assignee = json['assignee'] == null
              ? null
              : AssignedMixin$Assignee.fromJson(
                  json['assignee'] as Map<String, dynamic>)
          ..$$typename = json['__typename'] as String?;

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
            Map<String, dynamic> json) =>
        GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$ClosedEvent()
          ..id = json['id'] as String
          ..createdAt = DateTime.parse(json['createdAt'] as String)
          ..actor = json['actor'] == null
              ? null
              : ClosedMixin$Actor.fromJson(
                  json['actor'] as Map<String, dynamic>)
          ..$$typename = json['__typename'] as String?;

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
            Map<String, dynamic> json) =>
        GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$CrossReferencedEvent()
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
            Map<String, dynamic> json) =>
        GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$DemilestonedEvent()
          ..id = json['id'] as String
          ..createdAt = DateTime.parse(json['createdAt'] as String)
          ..actor = json['actor'] == null
              ? null
              : DeMileStonedMixin$Actor.fromJson(
                  json['actor'] as Map<String, dynamic>)
          ..milestoneTitle = json['milestoneTitle'] as String
          ..$$typename = json['__typename'] as String?;

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
            Map<String, dynamic> json) =>
        GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$IssueComment()
          ..id = json['id'] as String
          ..author = json['author'] == null
              ? null
              : IssueCommentMixin$Author.fromJson(
                  json['author'] as Map<String, dynamic>)
          ..createdAt = DateTime.parse(json['createdAt'] as String)
          ..authorAssociation = $enumDecode(
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
                  .map((e) => $enumDecode(_$CommentCannotUpdateReasonEnumMap, e,
                      unknownValue: CommentCannotUpdateReason.artemisUnknown))
                  .toList()
          ..viewerCanReact = json['viewerCanReact'] as bool
          ..$$typename = json['__typename'] as String?;

Map<String, dynamic>
    _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$IssueCommentToJson(
            GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$IssueComment
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'author': instance.author?.toJson(),
          'createdAt': instance.createdAt.toIso8601String(),
          'authorAssociation':
              _$CommentAuthorAssociationEnumMap[instance.authorAssociation]!,
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
              .map((e) => _$CommentCannotUpdateReasonEnumMap[e]!)
              .toList(),
          'viewerCanReact': instance.viewerCanReact,
          '__typename': instance.$$typename,
        };

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

GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$LabeledEvent
    _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$LabeledEventFromJson(
            Map<String, dynamic> json) =>
        GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$LabeledEvent()
          ..id = json['id'] as String
          ..createdAt = DateTime.parse(json['createdAt'] as String)
          ..actor = json['actor'] == null
              ? null
              : LabeledMixin$Actor.fromJson(
                  json['actor'] as Map<String, dynamic>)
          ..label =
              LabeledMixin$Label.fromJson(json['label'] as Map<String, dynamic>)
          ..$$typename = json['__typename'] as String?;

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
            Map<String, dynamic> json) =>
        GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$LockedEvent()
          ..id = json['id'] as String
          ..createdAt = DateTime.parse(json['createdAt'] as String)
          ..actor = json['actor'] == null
              ? null
              : LockedMixin$Actor.fromJson(
                  json['actor'] as Map<String, dynamic>)
          ..lockReason = $enumDecodeNullable(
              _$LockReasonEnumMap, json['lockReason'],
              unknownValue: LockReason.artemisUnknown)
          ..$$typename = json['__typename'] as String?;

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

const _$LockReasonEnumMap = {
  LockReason.offTopic: 'OFF_TOPIC',
  LockReason.resolved: 'RESOLVED',
  LockReason.spam: 'SPAM',
  LockReason.tooHeated: 'TOO_HEATED',
  LockReason.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$MarkedAsDuplicateEvent
    _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$MarkedAsDuplicateEventFromJson(
            Map<String, dynamic> json) =>
        GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$MarkedAsDuplicateEvent()
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
            Map<String, dynamic> json) =>
        GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$MilestonedEvent()
          ..id = json['id'] as String
          ..createdAt = DateTime.parse(json['createdAt'] as String)
          ..actor = json['actor'] == null
              ? null
              : MileStonedMixin$Actor.fromJson(
                  json['actor'] as Map<String, dynamic>)
          ..milestoneTitle = json['milestoneTitle'] as String
          ..$$typename = json['__typename'] as String?;

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
            Map<String, dynamic> json) =>
        GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$MovedColumnsInProjectEvent()
          ..id = json['id'] as String
          ..createdAt = DateTime.parse(json['createdAt'] as String)
          ..actor = json['actor'] == null
              ? null
              : MovedColumnsInProjectMixin$Actor.fromJson(
                  json['actor'] as Map<String, dynamic>)
          ..previousProjectColumnName =
              json['previousProjectColumnName'] as String
          ..projectColumnName = json['projectColumnName'] as String
          ..project = json['project'] == null
              ? null
              : MovedColumnsInProjectMixin$Project.fromJson(
                  json['project'] as Map<String, dynamic>)
          ..$$typename = json['__typename'] as String?;

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
            Map<String, dynamic> json) =>
        GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$PinnedEvent()
          ..id = json['id'] as String
          ..createdAt = DateTime.parse(json['createdAt'] as String)
          ..actor = json['actor'] == null
              ? null
              : PinnedMixin$Actor.fromJson(
                  json['actor'] as Map<String, dynamic>)
          ..$$typename = json['__typename'] as String?;

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
            Map<String, dynamic> json) =>
        GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$RemovedFromProjectEvent()
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
            Map<String, dynamic> json) =>
        GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$RenamedTitleEvent()
          ..id = json['id'] as String
          ..createdAt = DateTime.parse(json['createdAt'] as String)
          ..actor = json['actor'] == null
              ? null
              : RenamedTitleMixin$Actor.fromJson(
                  json['actor'] as Map<String, dynamic>)
          ..previousTitle = json['previousTitle'] as String
          ..currentTitle = json['currentTitle'] as String
          ..$$typename = json['__typename'] as String?;

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
            Map<String, dynamic> json) =>
        GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$ReopenedEvent()
          ..id = json['id'] as String
          ..createdAt = DateTime.parse(json['createdAt'] as String)
          ..actor = json['actor'] == null
              ? null
              : ReopenedMixin$Actor.fromJson(
                  json['actor'] as Map<String, dynamic>)
          ..$$typename = json['__typename'] as String?;

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
            Map<String, dynamic> json) =>
        GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$UnassignedEvent()
          ..id = json['id'] as String
          ..createdAt = DateTime.parse(json['createdAt'] as String)
          ..actor = json['actor'] == null
              ? null
              : UnassignedMixin$Actor.fromJson(
                  json['actor'] as Map<String, dynamic>)
          ..assignee = json['assignee'] == null
              ? null
              : UnassignedMixin$Assignee.fromJson(
                  json['assignee'] as Map<String, dynamic>)
          ..$$typename = json['__typename'] as String?;

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
            Map<String, dynamic> json) =>
        GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$UnlabeledEvent()
          ..id = json['id'] as String
          ..createdAt = DateTime.parse(json['createdAt'] as String)
          ..actor = json['actor'] == null
              ? null
              : UnlabeledMixin$Actor.fromJson(
                  json['actor'] as Map<String, dynamic>)
          ..label = UnlabeledMixin$Label.fromJson(
              json['label'] as Map<String, dynamic>)
          ..$$typename = json['__typename'] as String?;

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
            Map<String, dynamic> json) =>
        GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$UnlockedEvent()
          ..id = json['id'] as String
          ..createdAt = DateTime.parse(json['createdAt'] as String)
          ..actor = json['actor'] == null
              ? null
              : UnlockedMixin$Actor.fromJson(
                  json['actor'] as Map<String, dynamic>)
          ..$$typename = json['__typename'] as String?;

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
            Map<String, dynamic> json) =>
        GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$UnmarkedAsDuplicateEvent()
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
            Map<String, dynamic> json) =>
        GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$UnpinnedEvent()
          ..id = json['id'] as String
          ..createdAt = DateTime.parse(json['createdAt'] as String)
          ..actor = json['actor'] == null
              ? null
              : UnpinnedMixin$Actor.fromJson(
                  json['actor'] as Map<String, dynamic>)
          ..$$typename = json['__typename'] as String?;

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
            Map<String, dynamic> json) =>
        GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node()
          ..$$typename = json['__typename'] as String?;

Map<String, dynamic>
    _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$NodeToJson(
            GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node
                instance) =>
        <String, dynamic>{
          '__typename': instance.$$typename,
        };

GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges
    _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$EdgesFromJson(
            Map<String, dynamic> json) =>
        GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges()
          ..node = json['node'] == null
              ? null
              : GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node
                  .fromJson(json['node'] as Map<String, dynamic>)
          ..cursor = json['cursor'] as String;

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
            Map<String, dynamic> json) =>
        GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems()
          ..edges = (json['edges'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges
                      .fromJson(e as Map<String, dynamic>))
              .toList();

Map<String, dynamic>
    _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItemsToJson(
            GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems
                instance) =>
        <String, dynamic>{
          'edges': instance.edges?.map((e) => e?.toJson()).toList(),
        };

GetTimeline$Query$Repository$IssueOrPullRequest$Issue
    _$GetTimeline$Query$Repository$IssueOrPullRequest$IssueFromJson(
            Map<String, dynamic> json) =>
        GetTimeline$Query$Repository$IssueOrPullRequest$Issue()
          ..$$typename = json['__typename'] as String?
          ..timelineItems =
              GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems
                  .fromJson(json['timelineItems'] as Map<String, dynamic>);

Map<String, dynamic>
    _$GetTimeline$Query$Repository$IssueOrPullRequest$IssueToJson(
            GetTimeline$Query$Repository$IssueOrPullRequest$Issue instance) =>
        <String, dynamic>{
          '__typename': instance.$$typename,
          'timelineItems': instance.timelineItems.toJson(),
        };

GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$AddedToProjectEvent
    _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$AddedToProjectEventFromJson(
            Map<String, dynamic> json) =>
        GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$AddedToProjectEvent()
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
            Map<String, dynamic> json) =>
        GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$AssignedEvent()
          ..id = json['id'] as String
          ..createdAt = DateTime.parse(json['createdAt'] as String)
          ..actor = json['actor'] == null
              ? null
              : AssignedMixin$Actor.fromJson(
                  json['actor'] as Map<String, dynamic>)
          ..assignee = json['assignee'] == null
              ? null
              : AssignedMixin$Assignee.fromJson(
                  json['assignee'] as Map<String, dynamic>)
          ..$$typename = json['__typename'] as String?;

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
            Map<String, dynamic> json) =>
        GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$BaseRefChangedEvent()
          ..id = json['id'] as String
          ..createdAt = DateTime.parse(json['createdAt'] as String)
          ..actor = json['actor'] == null
              ? null
              : BaseRefChangedMixin$Actor.fromJson(
                  json['actor'] as Map<String, dynamic>)
          ..currentRefName = json['currentRefName'] as String
          ..previousRefName = json['previousRefName'] as String
          ..$$typename = json['__typename'] as String?;

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
            Map<String, dynamic> json) =>
        GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$BaseRefDeletedEvent()
          ..id = json['id'] as String
          ..createdAt = DateTime.parse(json['createdAt'] as String)
          ..actor = json['actor'] == null
              ? null
              : BaseRefDeletedMixin$Actor.fromJson(
                  json['actor'] as Map<String, dynamic>)
          ..baseRefName = json['baseRefName'] as String?
          ..$$typename = json['__typename'] as String?;

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
            Map<String, dynamic> json) =>
        GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$BaseRefForcePushedEvent()
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
            Map<String, dynamic> json) =>
        GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$ClosedEvent()
          ..id = json['id'] as String
          ..createdAt = DateTime.parse(json['createdAt'] as String)
          ..actor = json['actor'] == null
              ? null
              : ClosedMixin$Actor.fromJson(
                  json['actor'] as Map<String, dynamic>)
          ..$$typename = json['__typename'] as String?;

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
            Map<String, dynamic> json) =>
        GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$ConvertToDraftEvent()
          ..id = json['id'] as String
          ..createdAt = DateTime.parse(json['createdAt'] as String)
          ..actor = json['actor'] == null
              ? null
              : ConvertedToDraftMixin$Actor.fromJson(
                  json['actor'] as Map<String, dynamic>)
          ..$$typename = json['__typename'] as String?;

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
            Map<String, dynamic> json) =>
        GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$CrossReferencedEvent()
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
            Map<String, dynamic> json) =>
        GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$DemilestonedEvent()
          ..id = json['id'] as String
          ..createdAt = DateTime.parse(json['createdAt'] as String)
          ..actor = json['actor'] == null
              ? null
              : DeMileStonedMixin$Actor.fromJson(
                  json['actor'] as Map<String, dynamic>)
          ..milestoneTitle = json['milestoneTitle'] as String
          ..$$typename = json['__typename'] as String?;

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
            Map<String, dynamic> json) =>
        GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$HeadRefDeletedEvent()
          ..id = json['id'] as String
          ..createdAt = DateTime.parse(json['createdAt'] as String)
          ..actor = json['actor'] == null
              ? null
              : HeadRefDeletedMixin$Actor.fromJson(
                  json['actor'] as Map<String, dynamic>)
          ..headRefName = json['headRefName'] as String
          ..$$typename = json['__typename'] as String?;

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
            Map<String, dynamic> json) =>
        GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$HeadRefForcePushedEvent()
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
            Map<String, dynamic> json) =>
        GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$HeadRefRestoredEvent()
          ..id = json['id'] as String
          ..createdAt = DateTime.parse(json['createdAt'] as String)
          ..actor = json['actor'] == null
              ? null
              : HeadRefRestoredMixin$Actor.fromJson(
                  json['actor'] as Map<String, dynamic>)
          ..$$typename = json['__typename'] as String?;

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
            Map<String, dynamic> json) =>
        GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$IssueComment()
          ..id = json['id'] as String
          ..author = json['author'] == null
              ? null
              : IssueCommentMixin$Author.fromJson(
                  json['author'] as Map<String, dynamic>)
          ..createdAt = DateTime.parse(json['createdAt'] as String)
          ..authorAssociation = $enumDecode(
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
                  .map((e) => $enumDecode(_$CommentCannotUpdateReasonEnumMap, e,
                      unknownValue: CommentCannotUpdateReason.artemisUnknown))
                  .toList()
          ..viewerCanReact = json['viewerCanReact'] as bool
          ..$$typename = json['__typename'] as String?;

Map<String, dynamic>
    _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$IssueCommentToJson(
            GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$IssueComment
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'author': instance.author?.toJson(),
          'createdAt': instance.createdAt.toIso8601String(),
          'authorAssociation':
              _$CommentAuthorAssociationEnumMap[instance.authorAssociation]!,
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
              .map((e) => _$CommentCannotUpdateReasonEnumMap[e]!)
              .toList(),
          'viewerCanReact': instance.viewerCanReact,
          '__typename': instance.$$typename,
        };

GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$LabeledEvent
    _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$LabeledEventFromJson(
            Map<String, dynamic> json) =>
        GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$LabeledEvent()
          ..id = json['id'] as String
          ..createdAt = DateTime.parse(json['createdAt'] as String)
          ..actor = json['actor'] == null
              ? null
              : LabeledMixin$Actor.fromJson(
                  json['actor'] as Map<String, dynamic>)
          ..label =
              LabeledMixin$Label.fromJson(json['label'] as Map<String, dynamic>)
          ..$$typename = json['__typename'] as String?;

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
            Map<String, dynamic> json) =>
        GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$LockedEvent()
          ..id = json['id'] as String
          ..createdAt = DateTime.parse(json['createdAt'] as String)
          ..actor = json['actor'] == null
              ? null
              : LockedMixin$Actor.fromJson(
                  json['actor'] as Map<String, dynamic>)
          ..lockReason = $enumDecodeNullable(
              _$LockReasonEnumMap, json['lockReason'],
              unknownValue: LockReason.artemisUnknown)
          ..$$typename = json['__typename'] as String?;

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
            Map<String, dynamic> json) =>
        GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$MarkedAsDuplicateEvent()
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
            Map<String, dynamic> json) =>
        GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$MergedEvent()
          ..id = json['id'] as String
          ..createdAt = DateTime.parse(json['createdAt'] as String)
          ..actor = json['actor'] == null
              ? null
              : MergedMixin$Actor.fromJson(
                  json['actor'] as Map<String, dynamic>)
          ..mergeRefName = json['mergeRefName'] as String
          ..$$typename = json['__typename'] as String?;

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
            Map<String, dynamic> json) =>
        GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$MilestonedEvent()
          ..id = json['id'] as String
          ..createdAt = DateTime.parse(json['createdAt'] as String)
          ..actor = json['actor'] == null
              ? null
              : MileStonedMixin$Actor.fromJson(
                  json['actor'] as Map<String, dynamic>)
          ..milestoneTitle = json['milestoneTitle'] as String
          ..$$typename = json['__typename'] as String?;

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
            Map<String, dynamic> json) =>
        GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$MovedColumnsInProjectEvent()
          ..id = json['id'] as String
          ..createdAt = DateTime.parse(json['createdAt'] as String)
          ..actor = json['actor'] == null
              ? null
              : MovedColumnsInProjectMixin$Actor.fromJson(
                  json['actor'] as Map<String, dynamic>)
          ..previousProjectColumnName =
              json['previousProjectColumnName'] as String
          ..projectColumnName = json['projectColumnName'] as String
          ..project = json['project'] == null
              ? null
              : MovedColumnsInProjectMixin$Project.fromJson(
                  json['project'] as Map<String, dynamic>)
          ..$$typename = json['__typename'] as String?;

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
            Map<String, dynamic> json) =>
        GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$PinnedEvent()
          ..id = json['id'] as String
          ..createdAt = DateTime.parse(json['createdAt'] as String)
          ..actor = json['actor'] == null
              ? null
              : PinnedMixin$Actor.fromJson(
                  json['actor'] as Map<String, dynamic>)
          ..$$typename = json['__typename'] as String?;

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
            Map<String, dynamic> json) =>
        GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$PullRequestCommit()
          ..id = json['id'] as String
          ..commit = PullRequestCommitMixin$Commit.fromJson(
              json['commit'] as Map<String, dynamic>)
          ..$$typename = json['__typename'] as String?;

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
            Map<String, dynamic> json) =>
        GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$PullRequestCommitCommentThread()
          ..$$typename = json['__typename'] as String?
          ..id = json['id'] as String;

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
            Map<String, dynamic> json) =>
        GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$PullRequestReview()
          ..id = json['id'] as String
          ..author = json['author'] == null
              ? null
              : PullRequestReviewMixin$Author.fromJson(
                  json['author'] as Map<String, dynamic>)
          ..createdAt = DateTime.parse(json['createdAt'] as String)
          ..authorAssociation = $enumDecode(
              _$CommentAuthorAssociationEnumMap, json['authorAssociation'],
              unknownValue: CommentAuthorAssociation.artemisUnknown)
          ..body = json['body'] as String
          ..bodyHTML = json['bodyHTML'] as String
          ..lastEditedAt = json['lastEditedAt'] == null
              ? null
              : DateTime.parse(json['lastEditedAt'] as String)
          ..state = $enumDecode(_$PullRequestReviewStateEnumMap, json['state'],
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
                  .map((e) => $enumDecode(_$CommentCannotUpdateReasonEnumMap, e,
                      unknownValue: CommentCannotUpdateReason.artemisUnknown))
                  .toList()
          ..viewerCanReact = json['viewerCanReact'] as bool
          ..$$typename = json['__typename'] as String?;

Map<String, dynamic>
    _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$PullRequestReviewToJson(
            GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$PullRequestReview
                instance) =>
        <String, dynamic>{
          'id': instance.id,
          'author': instance.author?.toJson(),
          'createdAt': instance.createdAt.toIso8601String(),
          'authorAssociation':
              _$CommentAuthorAssociationEnumMap[instance.authorAssociation]!,
          'body': instance.body,
          'bodyHTML': instance.bodyHTML,
          'lastEditedAt': instance.lastEditedAt?.toIso8601String(),
          'state': _$PullRequestReviewStateEnumMap[instance.state]!,
          'comments': instance.comments.toJson(),
          'reactionGroups':
              instance.reactionGroups?.map((e) => e.toJson()).toList(),
          'viewerCanDelete': instance.viewerCanDelete,
          'viewerCanUpdate': instance.viewerCanUpdate,
          'viewerDidAuthor': instance.viewerDidAuthor,
          'viewerCannotUpdateReasons': instance.viewerCannotUpdateReasons
              .map((e) => _$CommentCannotUpdateReasonEnumMap[e]!)
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
            Map<String, dynamic> json) =>
        GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$PullRequestReviewThread()
          ..$$typename = json['__typename'] as String?
          ..id = json['id'] as String;

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
            Map<String, dynamic> json) =>
        GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$ReadyForReviewEvent()
          ..id = json['id'] as String
          ..createdAt = DateTime.parse(json['createdAt'] as String)
          ..actor = json['actor'] == null
              ? null
              : ReadyForReviewMixin$Actor.fromJson(
                  json['actor'] as Map<String, dynamic>)
          ..$$typename = json['__typename'] as String?;

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
            Map<String, dynamic> json) =>
        GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$RemovedFromProjectEvent()
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
            Map<String, dynamic> json) =>
        GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$RenamedTitleEvent()
          ..id = json['id'] as String
          ..createdAt = DateTime.parse(json['createdAt'] as String)
          ..actor = json['actor'] == null
              ? null
              : RenamedTitleMixin$Actor.fromJson(
                  json['actor'] as Map<String, dynamic>)
          ..previousTitle = json['previousTitle'] as String
          ..currentTitle = json['currentTitle'] as String
          ..$$typename = json['__typename'] as String?;

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
            Map<String, dynamic> json) =>
        GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$ReopenedEvent()
          ..id = json['id'] as String
          ..createdAt = DateTime.parse(json['createdAt'] as String)
          ..actor = json['actor'] == null
              ? null
              : ReopenedMixin$Actor.fromJson(
                  json['actor'] as Map<String, dynamic>)
          ..$$typename = json['__typename'] as String?;

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
            Map<String, dynamic> json) =>
        GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$ReviewDismissedEvent()
          ..id = json['id'] as String
          ..createdAt = DateTime.parse(json['createdAt'] as String)
          ..actor = json['actor'] == null
              ? null
              : ReviewDismissedMixin$Actor.fromJson(
                  json['actor'] as Map<String, dynamic>)
          ..dismissalMessage = json['dismissalMessage'] as String?
          ..dismissalMessageHTML = json['dismissalMessageHTML'] as String?
          ..previousReviewState = $enumDecode(
              _$PullRequestReviewStateEnumMap, json['previousReviewState'],
              unknownValue: PullRequestReviewState.artemisUnknown)
          ..$$typename = json['__typename'] as String?;

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
              _$PullRequestReviewStateEnumMap[instance.previousReviewState]!,
          '__typename': instance.$$typename,
        };

GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$ReviewRequestedEvent
    _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$ReviewRequestedEventFromJson(
            Map<String, dynamic> json) =>
        GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$ReviewRequestedEvent()
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
            Map<String, dynamic> json) =>
        GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$UnassignedEvent()
          ..id = json['id'] as String
          ..createdAt = DateTime.parse(json['createdAt'] as String)
          ..actor = json['actor'] == null
              ? null
              : UnassignedMixin$Actor.fromJson(
                  json['actor'] as Map<String, dynamic>)
          ..assignee = json['assignee'] == null
              ? null
              : UnassignedMixin$Assignee.fromJson(
                  json['assignee'] as Map<String, dynamic>)
          ..$$typename = json['__typename'] as String?;

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
            Map<String, dynamic> json) =>
        GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$UnlabeledEvent()
          ..id = json['id'] as String
          ..createdAt = DateTime.parse(json['createdAt'] as String)
          ..actor = json['actor'] == null
              ? null
              : UnlabeledMixin$Actor.fromJson(
                  json['actor'] as Map<String, dynamic>)
          ..label = UnlabeledMixin$Label.fromJson(
              json['label'] as Map<String, dynamic>)
          ..$$typename = json['__typename'] as String?;

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
            Map<String, dynamic> json) =>
        GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$UnlockedEvent()
          ..id = json['id'] as String
          ..createdAt = DateTime.parse(json['createdAt'] as String)
          ..actor = json['actor'] == null
              ? null
              : UnlockedMixin$Actor.fromJson(
                  json['actor'] as Map<String, dynamic>)
          ..$$typename = json['__typename'] as String?;

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
            Map<String, dynamic> json) =>
        GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$UnmarkedAsDuplicateEvent()
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
            Map<String, dynamic> json) =>
        GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$UnpinnedEvent()
          ..id = json['id'] as String
          ..createdAt = DateTime.parse(json['createdAt'] as String)
          ..actor = json['actor'] == null
              ? null
              : UnpinnedMixin$Actor.fromJson(
                  json['actor'] as Map<String, dynamic>)
          ..$$typename = json['__typename'] as String?;

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
            Map<String, dynamic> json) =>
        GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node()
          ..$$typename = json['__typename'] as String?;

Map<String, dynamic>
    _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$NodeToJson(
            GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node
                instance) =>
        <String, dynamic>{
          '__typename': instance.$$typename,
        };

GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges
    _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$EdgesFromJson(
            Map<String, dynamic> json) =>
        GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges()
          ..node = json['node'] == null
              ? null
              : GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node
                  .fromJson(json['node'] as Map<String, dynamic>)
          ..cursor = json['cursor'] as String;

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
            Map<String, dynamic> json) =>
        GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems()
          ..edges = (json['edges'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges
                      .fromJson(e as Map<String, dynamic>))
              .toList();

Map<String, dynamic>
    _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItemsToJson(
            GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems
                instance) =>
        <String, dynamic>{
          'edges': instance.edges?.map((e) => e?.toJson()).toList(),
        };

GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest
    _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequestFromJson(
            Map<String, dynamic> json) =>
        GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest()
          ..$$typename = json['__typename'] as String?
          ..timelineItems =
              GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems
                  .fromJson(json['timelineItems'] as Map<String, dynamic>);

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
            Map<String, dynamic> json) =>
        GetTimeline$Query$Repository$IssueOrPullRequest()
          ..$$typename = json['__typename'] as String?;

Map<String, dynamic> _$GetTimeline$Query$Repository$IssueOrPullRequestToJson(
        GetTimeline$Query$Repository$IssueOrPullRequest instance) =>
    <String, dynamic>{
      '__typename': instance.$$typename,
    };

GetTimeline$Query$Repository _$GetTimeline$Query$RepositoryFromJson(
        Map<String, dynamic> json) =>
    GetTimeline$Query$Repository()
      ..issueOrPullRequest = json['issueOrPullRequest'] == null
          ? null
          : GetTimeline$Query$Repository$IssueOrPullRequest.fromJson(
              json['issueOrPullRequest'] as Map<String, dynamic>);

Map<String, dynamic> _$GetTimeline$Query$RepositoryToJson(
        GetTimeline$Query$Repository instance) =>
    <String, dynamic>{
      'issueOrPullRequest': instance.issueOrPullRequest?.toJson(),
    };

GetTimeline$Query _$GetTimeline$QueryFromJson(Map<String, dynamic> json) =>
    GetTimeline$Query()
      ..repository = json['repository'] == null
          ? null
          : GetTimeline$Query$Repository.fromJson(
              json['repository'] as Map<String, dynamic>);

Map<String, dynamic> _$GetTimeline$QueryToJson(GetTimeline$Query instance) =>
    <String, dynamic>{
      'repository': instance.repository?.toJson(),
    };

AddedToProjectMixin$Actor _$AddedToProjectMixin$ActorFromJson(
        Map<String, dynamic> json) =>
    AddedToProjectMixin$Actor()
      ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
      ..login = json['login'] as String;

Map<String, dynamic> _$AddedToProjectMixin$ActorToJson(
        AddedToProjectMixin$Actor instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
    };

AddedToProjectMixin$Project _$AddedToProjectMixin$ProjectFromJson(
        Map<String, dynamic> json) =>
    AddedToProjectMixin$Project()..name = json['name'] as String;

Map<String, dynamic> _$AddedToProjectMixin$ProjectToJson(
        AddedToProjectMixin$Project instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

AssignedMixin$Actor _$AssignedMixin$ActorFromJson(Map<String, dynamic> json) =>
    AssignedMixin$Actor()
      ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
      ..login = json['login'] as String;

Map<String, dynamic> _$AssignedMixin$ActorToJson(
        AssignedMixin$Actor instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
    };

AssignedMixin$Assignee$User _$AssignedMixin$Assignee$UserFromJson(
        Map<String, dynamic> json) =>
    AssignedMixin$Assignee$User()
      ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
      ..login = json['login'] as String
      ..$$typename = json['__typename'] as String?;

Map<String, dynamic> _$AssignedMixin$Assignee$UserToJson(
        AssignedMixin$Assignee$User instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
      '__typename': instance.$$typename,
    };

AssignedMixin$Assignee$Bot _$AssignedMixin$Assignee$BotFromJson(
        Map<String, dynamic> json) =>
    AssignedMixin$Assignee$Bot()
      ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
      ..login = json['login'] as String
      ..$$typename = json['__typename'] as String?;

Map<String, dynamic> _$AssignedMixin$Assignee$BotToJson(
        AssignedMixin$Assignee$Bot instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
      '__typename': instance.$$typename,
    };

AssignedMixin$Assignee$Mannequin _$AssignedMixin$Assignee$MannequinFromJson(
        Map<String, dynamic> json) =>
    AssignedMixin$Assignee$Mannequin()
      ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
      ..login = json['login'] as String
      ..$$typename = json['__typename'] as String?;

Map<String, dynamic> _$AssignedMixin$Assignee$MannequinToJson(
        AssignedMixin$Assignee$Mannequin instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
      '__typename': instance.$$typename,
    };

AssignedMixin$Assignee$Organization
    _$AssignedMixin$Assignee$OrganizationFromJson(Map<String, dynamic> json) =>
        AssignedMixin$Assignee$Organization()
          ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
          ..login = json['login'] as String
          ..$$typename = json['__typename'] as String?;

Map<String, dynamic> _$AssignedMixin$Assignee$OrganizationToJson(
        AssignedMixin$Assignee$Organization instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
      '__typename': instance.$$typename,
    };

AssignedMixin$Assignee _$AssignedMixin$AssigneeFromJson(
        Map<String, dynamic> json) =>
    AssignedMixin$Assignee()..$$typename = json['__typename'] as String?;

Map<String, dynamic> _$AssignedMixin$AssigneeToJson(
        AssignedMixin$Assignee instance) =>
    <String, dynamic>{
      '__typename': instance.$$typename,
    };

ClosedMixin$Actor _$ClosedMixin$ActorFromJson(Map<String, dynamic> json) =>
    ClosedMixin$Actor()
      ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
      ..login = json['login'] as String;

Map<String, dynamic> _$ClosedMixin$ActorToJson(ClosedMixin$Actor instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
    };

CrossReferenceMixin$Actor _$CrossReferenceMixin$ActorFromJson(
        Map<String, dynamic> json) =>
    CrossReferenceMixin$Actor()
      ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
      ..login = json['login'] as String;

Map<String, dynamic> _$CrossReferenceMixin$ActorToJson(
        CrossReferenceMixin$Actor instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
    };

CrossReferenceMixin$Source$Issue _$CrossReferenceMixin$Source$IssueFromJson(
        Map<String, dynamic> json) =>
    CrossReferenceMixin$Source$Issue()
      ..url = Uri.parse(json['url'] as String)
      ..title = json['title'] as String
      ..number = json['number'] as int
      ..issueState = $enumDecode(_$IssueStateEnumMap, json['issueState'],
          unknownValue: IssueState.artemisUnknown)
      ..repository = IssueMixin$Repository.fromJson(
          json['repository'] as Map<String, dynamic>)
      ..$$typename = json['__typename'] as String?;

Map<String, dynamic> _$CrossReferenceMixin$Source$IssueToJson(
        CrossReferenceMixin$Source$Issue instance) =>
    <String, dynamic>{
      'url': instance.url.toString(),
      'title': instance.title,
      'number': instance.number,
      'issueState': _$IssueStateEnumMap[instance.issueState]!,
      'repository': instance.repository.toJson(),
      '__typename': instance.$$typename,
    };

CrossReferenceMixin$Source$PullRequest
    _$CrossReferenceMixin$Source$PullRequestFromJson(
            Map<String, dynamic> json) =>
        CrossReferenceMixin$Source$PullRequest()
          ..url = Uri.parse(json['url'] as String)
          ..title = json['title'] as String
          ..number = json['number'] as int
          ..pullState = $enumDecode(
              _$PullRequestStateEnumMap, json['pullState'],
              unknownValue: PullRequestState.artemisUnknown)
          ..repository = PullRequestMixin$Repository.fromJson(
              json['repository'] as Map<String, dynamic>)
          ..$$typename = json['__typename'] as String?;

Map<String, dynamic> _$CrossReferenceMixin$Source$PullRequestToJson(
        CrossReferenceMixin$Source$PullRequest instance) =>
    <String, dynamic>{
      'url': instance.url.toString(),
      'title': instance.title,
      'number': instance.number,
      'pullState': _$PullRequestStateEnumMap[instance.pullState]!,
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
        Map<String, dynamic> json) =>
    CrossReferenceMixin$Source()..$$typename = json['__typename'] as String?;

Map<String, dynamic> _$CrossReferenceMixin$SourceToJson(
        CrossReferenceMixin$Source instance) =>
    <String, dynamic>{
      '__typename': instance.$$typename,
    };

PullRequestMixin$Repository _$PullRequestMixin$RepositoryFromJson(
        Map<String, dynamic> json) =>
    PullRequestMixin$Repository()
      ..name = json['name'] as String
      ..nameWithOwner = json['nameWithOwner'] as String;

Map<String, dynamic> _$PullRequestMixin$RepositoryToJson(
        PullRequestMixin$Repository instance) =>
    <String, dynamic>{
      'name': instance.name,
      'nameWithOwner': instance.nameWithOwner,
    };

DeMileStonedMixin$Actor _$DeMileStonedMixin$ActorFromJson(
        Map<String, dynamic> json) =>
    DeMileStonedMixin$Actor()
      ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
      ..login = json['login'] as String;

Map<String, dynamic> _$DeMileStonedMixin$ActorToJson(
        DeMileStonedMixin$Actor instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
    };

IssueCommentMixin$Author _$IssueCommentMixin$AuthorFromJson(
        Map<String, dynamic> json) =>
    IssueCommentMixin$Author()
      ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
      ..login = json['login'] as String;

Map<String, dynamic> _$IssueCommentMixin$AuthorToJson(
        IssueCommentMixin$Author instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
    };

IssueCommentMixin$ReactionGroups _$IssueCommentMixin$ReactionGroupsFromJson(
        Map<String, dynamic> json) =>
    IssueCommentMixin$ReactionGroups()
      ..content = $enumDecode(_$ReactionContentEnumMap, json['content'],
          unknownValue: ReactionContent.artemisUnknown)
      ..viewerHasReacted = json['viewerHasReacted'] as bool
      ..reactors = ReactionGroupsMixin$Reactors.fromJson(
          json['reactors'] as Map<String, dynamic>)
      ..subject = ReactionGroupsMixin$Subject.fromJson(
          json['subject'] as Map<String, dynamic>);

Map<String, dynamic> _$IssueCommentMixin$ReactionGroupsToJson(
        IssueCommentMixin$ReactionGroups instance) =>
    <String, dynamic>{
      'content': _$ReactionContentEnumMap[instance.content]!,
      'viewerHasReacted': instance.viewerHasReacted,
      'reactors': instance.reactors.toJson(),
      'subject': instance.subject.toJson(),
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

ReactionGroupsMixin$Reactors _$ReactionGroupsMixin$ReactorsFromJson(
        Map<String, dynamic> json) =>
    ReactionGroupsMixin$Reactors()..totalCount = json['totalCount'] as int;

Map<String, dynamic> _$ReactionGroupsMixin$ReactorsToJson(
        ReactionGroupsMixin$Reactors instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
    };

ReactionGroupsMixin$Subject _$ReactionGroupsMixin$SubjectFromJson(
        Map<String, dynamic> json) =>
    ReactionGroupsMixin$Subject()..id = json['id'] as String;

Map<String, dynamic> _$ReactionGroupsMixin$SubjectToJson(
        ReactionGroupsMixin$Subject instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

LabeledMixin$Actor _$LabeledMixin$ActorFromJson(Map<String, dynamic> json) =>
    LabeledMixin$Actor()
      ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
      ..login = json['login'] as String;

Map<String, dynamic> _$LabeledMixin$ActorToJson(LabeledMixin$Actor instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
    };

LabeledMixin$Label _$LabeledMixin$LabelFromJson(Map<String, dynamic> json) =>
    LabeledMixin$Label()
      ..color = json['color'] as String
      ..name = json['name'] as String;

Map<String, dynamic> _$LabeledMixin$LabelToJson(LabeledMixin$Label instance) =>
    <String, dynamic>{
      'color': instance.color,
      'name': instance.name,
    };

LockedMixin$Actor _$LockedMixin$ActorFromJson(Map<String, dynamic> json) =>
    LockedMixin$Actor()
      ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
      ..login = json['login'] as String;

Map<String, dynamic> _$LockedMixin$ActorToJson(LockedMixin$Actor instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
    };

MarkedAsDuplicateMixin$Actor _$MarkedAsDuplicateMixin$ActorFromJson(
        Map<String, dynamic> json) =>
    MarkedAsDuplicateMixin$Actor()
      ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
      ..login = json['login'] as String;

Map<String, dynamic> _$MarkedAsDuplicateMixin$ActorToJson(
        MarkedAsDuplicateMixin$Actor instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
    };

MarkedAsDuplicateMixin$Canonical$Issue
    _$MarkedAsDuplicateMixin$Canonical$IssueFromJson(
            Map<String, dynamic> json) =>
        MarkedAsDuplicateMixin$Canonical$Issue()
          ..url = Uri.parse(json['url'] as String)
          ..title = json['title'] as String
          ..number = json['number'] as int
          ..issueState = $enumDecode(_$IssueStateEnumMap, json['issueState'],
              unknownValue: IssueState.artemisUnknown)
          ..repository = IssueMixin$Repository.fromJson(
              json['repository'] as Map<String, dynamic>)
          ..$$typename = json['__typename'] as String?;

Map<String, dynamic> _$MarkedAsDuplicateMixin$Canonical$IssueToJson(
        MarkedAsDuplicateMixin$Canonical$Issue instance) =>
    <String, dynamic>{
      'url': instance.url.toString(),
      'title': instance.title,
      'number': instance.number,
      'issueState': _$IssueStateEnumMap[instance.issueState]!,
      'repository': instance.repository.toJson(),
      '__typename': instance.$$typename,
    };

MarkedAsDuplicateMixin$Canonical$PullRequest
    _$MarkedAsDuplicateMixin$Canonical$PullRequestFromJson(
            Map<String, dynamic> json) =>
        MarkedAsDuplicateMixin$Canonical$PullRequest()
          ..url = Uri.parse(json['url'] as String)
          ..title = json['title'] as String
          ..number = json['number'] as int
          ..pullState = $enumDecode(
              _$PullRequestStateEnumMap, json['pullState'],
              unknownValue: PullRequestState.artemisUnknown)
          ..repository = PullRequestMixin$Repository.fromJson(
              json['repository'] as Map<String, dynamic>)
          ..$$typename = json['__typename'] as String?;

Map<String, dynamic> _$MarkedAsDuplicateMixin$Canonical$PullRequestToJson(
        MarkedAsDuplicateMixin$Canonical$PullRequest instance) =>
    <String, dynamic>{
      'url': instance.url.toString(),
      'title': instance.title,
      'number': instance.number,
      'pullState': _$PullRequestStateEnumMap[instance.pullState]!,
      'repository': instance.repository.toJson(),
      '__typename': instance.$$typename,
    };

MarkedAsDuplicateMixin$Canonical _$MarkedAsDuplicateMixin$CanonicalFromJson(
        Map<String, dynamic> json) =>
    MarkedAsDuplicateMixin$Canonical()
      ..$$typename = json['__typename'] as String?;

Map<String, dynamic> _$MarkedAsDuplicateMixin$CanonicalToJson(
        MarkedAsDuplicateMixin$Canonical instance) =>
    <String, dynamic>{
      '__typename': instance.$$typename,
    };

MileStonedMixin$Actor _$MileStonedMixin$ActorFromJson(
        Map<String, dynamic> json) =>
    MileStonedMixin$Actor()
      ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
      ..login = json['login'] as String;

Map<String, dynamic> _$MileStonedMixin$ActorToJson(
        MileStonedMixin$Actor instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
    };

MovedColumnsInProjectMixin$Actor _$MovedColumnsInProjectMixin$ActorFromJson(
        Map<String, dynamic> json) =>
    MovedColumnsInProjectMixin$Actor()
      ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
      ..login = json['login'] as String;

Map<String, dynamic> _$MovedColumnsInProjectMixin$ActorToJson(
        MovedColumnsInProjectMixin$Actor instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
    };

MovedColumnsInProjectMixin$Project _$MovedColumnsInProjectMixin$ProjectFromJson(
        Map<String, dynamic> json) =>
    MovedColumnsInProjectMixin$Project()..name = json['name'] as String;

Map<String, dynamic> _$MovedColumnsInProjectMixin$ProjectToJson(
        MovedColumnsInProjectMixin$Project instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

PinnedMixin$Actor _$PinnedMixin$ActorFromJson(Map<String, dynamic> json) =>
    PinnedMixin$Actor()
      ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
      ..login = json['login'] as String;

Map<String, dynamic> _$PinnedMixin$ActorToJson(PinnedMixin$Actor instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
    };

RemovedFromProjectMixin$Actor _$RemovedFromProjectMixin$ActorFromJson(
        Map<String, dynamic> json) =>
    RemovedFromProjectMixin$Actor()
      ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
      ..login = json['login'] as String;

Map<String, dynamic> _$RemovedFromProjectMixin$ActorToJson(
        RemovedFromProjectMixin$Actor instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
    };

RemovedFromProjectMixin$Project _$RemovedFromProjectMixin$ProjectFromJson(
        Map<String, dynamic> json) =>
    RemovedFromProjectMixin$Project()..name = json['name'] as String;

Map<String, dynamic> _$RemovedFromProjectMixin$ProjectToJson(
        RemovedFromProjectMixin$Project instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

RenamedTitleMixin$Actor _$RenamedTitleMixin$ActorFromJson(
        Map<String, dynamic> json) =>
    RenamedTitleMixin$Actor()
      ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
      ..login = json['login'] as String;

Map<String, dynamic> _$RenamedTitleMixin$ActorToJson(
        RenamedTitleMixin$Actor instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
    };

ReopenedMixin$Actor _$ReopenedMixin$ActorFromJson(Map<String, dynamic> json) =>
    ReopenedMixin$Actor()
      ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
      ..login = json['login'] as String;

Map<String, dynamic> _$ReopenedMixin$ActorToJson(
        ReopenedMixin$Actor instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
    };

UnassignedMixin$Actor _$UnassignedMixin$ActorFromJson(
        Map<String, dynamic> json) =>
    UnassignedMixin$Actor()
      ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
      ..login = json['login'] as String;

Map<String, dynamic> _$UnassignedMixin$ActorToJson(
        UnassignedMixin$Actor instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
    };

UnassignedMixin$Assignee$User _$UnassignedMixin$Assignee$UserFromJson(
        Map<String, dynamic> json) =>
    UnassignedMixin$Assignee$User()
      ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
      ..login = json['login'] as String
      ..$$typename = json['__typename'] as String?;

Map<String, dynamic> _$UnassignedMixin$Assignee$UserToJson(
        UnassignedMixin$Assignee$User instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
      '__typename': instance.$$typename,
    };

UnassignedMixin$Assignee$Bot _$UnassignedMixin$Assignee$BotFromJson(
        Map<String, dynamic> json) =>
    UnassignedMixin$Assignee$Bot()
      ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
      ..login = json['login'] as String
      ..$$typename = json['__typename'] as String?;

Map<String, dynamic> _$UnassignedMixin$Assignee$BotToJson(
        UnassignedMixin$Assignee$Bot instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
      '__typename': instance.$$typename,
    };

UnassignedMixin$Assignee$Mannequin _$UnassignedMixin$Assignee$MannequinFromJson(
        Map<String, dynamic> json) =>
    UnassignedMixin$Assignee$Mannequin()
      ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
      ..login = json['login'] as String
      ..$$typename = json['__typename'] as String?;

Map<String, dynamic> _$UnassignedMixin$Assignee$MannequinToJson(
        UnassignedMixin$Assignee$Mannequin instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
      '__typename': instance.$$typename,
    };

UnassignedMixin$Assignee$Organization
    _$UnassignedMixin$Assignee$OrganizationFromJson(
            Map<String, dynamic> json) =>
        UnassignedMixin$Assignee$Organization()
          ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
          ..login = json['login'] as String
          ..$$typename = json['__typename'] as String?;

Map<String, dynamic> _$UnassignedMixin$Assignee$OrganizationToJson(
        UnassignedMixin$Assignee$Organization instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
      '__typename': instance.$$typename,
    };

UnassignedMixin$Assignee _$UnassignedMixin$AssigneeFromJson(
        Map<String, dynamic> json) =>
    UnassignedMixin$Assignee()..$$typename = json['__typename'] as String?;

Map<String, dynamic> _$UnassignedMixin$AssigneeToJson(
        UnassignedMixin$Assignee instance) =>
    <String, dynamic>{
      '__typename': instance.$$typename,
    };

UnlabeledMixin$Actor _$UnlabeledMixin$ActorFromJson(
        Map<String, dynamic> json) =>
    UnlabeledMixin$Actor()
      ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
      ..login = json['login'] as String;

Map<String, dynamic> _$UnlabeledMixin$ActorToJson(
        UnlabeledMixin$Actor instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
    };

UnlabeledMixin$Label _$UnlabeledMixin$LabelFromJson(
        Map<String, dynamic> json) =>
    UnlabeledMixin$Label()
      ..color = json['color'] as String
      ..name = json['name'] as String;

Map<String, dynamic> _$UnlabeledMixin$LabelToJson(
        UnlabeledMixin$Label instance) =>
    <String, dynamic>{
      'color': instance.color,
      'name': instance.name,
    };

UnlockedMixin$Actor _$UnlockedMixin$ActorFromJson(Map<String, dynamic> json) =>
    UnlockedMixin$Actor()
      ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
      ..login = json['login'] as String;

Map<String, dynamic> _$UnlockedMixin$ActorToJson(
        UnlockedMixin$Actor instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
    };

UnmarkedAsDuplicateMixin$Actor _$UnmarkedAsDuplicateMixin$ActorFromJson(
        Map<String, dynamic> json) =>
    UnmarkedAsDuplicateMixin$Actor()
      ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
      ..login = json['login'] as String;

Map<String, dynamic> _$UnmarkedAsDuplicateMixin$ActorToJson(
        UnmarkedAsDuplicateMixin$Actor instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
    };

UnmarkedAsDuplicateMixin$Canonical$Issue
    _$UnmarkedAsDuplicateMixin$Canonical$IssueFromJson(
            Map<String, dynamic> json) =>
        UnmarkedAsDuplicateMixin$Canonical$Issue()
          ..url = Uri.parse(json['url'] as String)
          ..title = json['title'] as String
          ..number = json['number'] as int
          ..issueState = $enumDecode(_$IssueStateEnumMap, json['issueState'],
              unknownValue: IssueState.artemisUnknown)
          ..repository = IssueMixin$Repository.fromJson(
              json['repository'] as Map<String, dynamic>)
          ..$$typename = json['__typename'] as String?;

Map<String, dynamic> _$UnmarkedAsDuplicateMixin$Canonical$IssueToJson(
        UnmarkedAsDuplicateMixin$Canonical$Issue instance) =>
    <String, dynamic>{
      'url': instance.url.toString(),
      'title': instance.title,
      'number': instance.number,
      'issueState': _$IssueStateEnumMap[instance.issueState]!,
      'repository': instance.repository.toJson(),
      '__typename': instance.$$typename,
    };

UnmarkedAsDuplicateMixin$Canonical$PullRequest
    _$UnmarkedAsDuplicateMixin$Canonical$PullRequestFromJson(
            Map<String, dynamic> json) =>
        UnmarkedAsDuplicateMixin$Canonical$PullRequest()
          ..url = Uri.parse(json['url'] as String)
          ..title = json['title'] as String
          ..number = json['number'] as int
          ..pullState = $enumDecode(
              _$PullRequestStateEnumMap, json['pullState'],
              unknownValue: PullRequestState.artemisUnknown)
          ..repository = PullRequestMixin$Repository.fromJson(
              json['repository'] as Map<String, dynamic>)
          ..$$typename = json['__typename'] as String?;

Map<String, dynamic> _$UnmarkedAsDuplicateMixin$Canonical$PullRequestToJson(
        UnmarkedAsDuplicateMixin$Canonical$PullRequest instance) =>
    <String, dynamic>{
      'url': instance.url.toString(),
      'title': instance.title,
      'number': instance.number,
      'pullState': _$PullRequestStateEnumMap[instance.pullState]!,
      'repository': instance.repository.toJson(),
      '__typename': instance.$$typename,
    };

UnmarkedAsDuplicateMixin$Canonical _$UnmarkedAsDuplicateMixin$CanonicalFromJson(
        Map<String, dynamic> json) =>
    UnmarkedAsDuplicateMixin$Canonical()
      ..$$typename = json['__typename'] as String?;

Map<String, dynamic> _$UnmarkedAsDuplicateMixin$CanonicalToJson(
        UnmarkedAsDuplicateMixin$Canonical instance) =>
    <String, dynamic>{
      '__typename': instance.$$typename,
    };

UnpinnedMixin$Actor _$UnpinnedMixin$ActorFromJson(Map<String, dynamic> json) =>
    UnpinnedMixin$Actor()
      ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
      ..login = json['login'] as String;

Map<String, dynamic> _$UnpinnedMixin$ActorToJson(
        UnpinnedMixin$Actor instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
    };

BaseRefChangedMixin$Actor _$BaseRefChangedMixin$ActorFromJson(
        Map<String, dynamic> json) =>
    BaseRefChangedMixin$Actor()
      ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
      ..login = json['login'] as String;

Map<String, dynamic> _$BaseRefChangedMixin$ActorToJson(
        BaseRefChangedMixin$Actor instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
    };

BaseRefDeletedMixin$Actor _$BaseRefDeletedMixin$ActorFromJson(
        Map<String, dynamic> json) =>
    BaseRefDeletedMixin$Actor()
      ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
      ..login = json['login'] as String;

Map<String, dynamic> _$BaseRefDeletedMixin$ActorToJson(
        BaseRefDeletedMixin$Actor instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
    };

BaseRefForcePushedMixin$BeforeCommit
    _$BaseRefForcePushedMixin$BeforeCommitFromJson(Map<String, dynamic> json) =>
        BaseRefForcePushedMixin$BeforeCommit()
          ..abbreviatedOid = json['abbreviatedOid'] as String
          ..url = Uri.parse(json['url'] as String);

Map<String, dynamic> _$BaseRefForcePushedMixin$BeforeCommitToJson(
        BaseRefForcePushedMixin$BeforeCommit instance) =>
    <String, dynamic>{
      'abbreviatedOid': instance.abbreviatedOid,
      'url': instance.url.toString(),
    };

BaseRefForcePushedMixin$AfterCommit
    _$BaseRefForcePushedMixin$AfterCommitFromJson(Map<String, dynamic> json) =>
        BaseRefForcePushedMixin$AfterCommit()
          ..url = Uri.parse(json['url'] as String)
          ..abbreviatedOid = json['abbreviatedOid'] as String;

Map<String, dynamic> _$BaseRefForcePushedMixin$AfterCommitToJson(
        BaseRefForcePushedMixin$AfterCommit instance) =>
    <String, dynamic>{
      'url': instance.url.toString(),
      'abbreviatedOid': instance.abbreviatedOid,
    };

BaseRefForcePushedMixin$Ref _$BaseRefForcePushedMixin$RefFromJson(
        Map<String, dynamic> json) =>
    BaseRefForcePushedMixin$Ref()..name = json['name'] as String;

Map<String, dynamic> _$BaseRefForcePushedMixin$RefToJson(
        BaseRefForcePushedMixin$Ref instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

BaseRefForcePushedMixin$Actor _$BaseRefForcePushedMixin$ActorFromJson(
        Map<String, dynamic> json) =>
    BaseRefForcePushedMixin$Actor()
      ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
      ..login = json['login'] as String;

Map<String, dynamic> _$BaseRefForcePushedMixin$ActorToJson(
        BaseRefForcePushedMixin$Actor instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
    };

ConvertedToDraftMixin$Actor _$ConvertedToDraftMixin$ActorFromJson(
        Map<String, dynamic> json) =>
    ConvertedToDraftMixin$Actor()
      ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
      ..login = json['login'] as String;

Map<String, dynamic> _$ConvertedToDraftMixin$ActorToJson(
        ConvertedToDraftMixin$Actor instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
    };

HeadRefDeletedMixin$Actor _$HeadRefDeletedMixin$ActorFromJson(
        Map<String, dynamic> json) =>
    HeadRefDeletedMixin$Actor()
      ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
      ..login = json['login'] as String;

Map<String, dynamic> _$HeadRefDeletedMixin$ActorToJson(
        HeadRefDeletedMixin$Actor instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
    };

HeadRefForcePushedMixin$BeforeCommit
    _$HeadRefForcePushedMixin$BeforeCommitFromJson(Map<String, dynamic> json) =>
        HeadRefForcePushedMixin$BeforeCommit()
          ..abbreviatedOid = json['abbreviatedOid'] as String
          ..url = Uri.parse(json['url'] as String);

Map<String, dynamic> _$HeadRefForcePushedMixin$BeforeCommitToJson(
        HeadRefForcePushedMixin$BeforeCommit instance) =>
    <String, dynamic>{
      'abbreviatedOid': instance.abbreviatedOid,
      'url': instance.url.toString(),
    };

HeadRefForcePushedMixin$AfterCommit
    _$HeadRefForcePushedMixin$AfterCommitFromJson(Map<String, dynamic> json) =>
        HeadRefForcePushedMixin$AfterCommit()
          ..url = Uri.parse(json['url'] as String)
          ..abbreviatedOid = json['abbreviatedOid'] as String;

Map<String, dynamic> _$HeadRefForcePushedMixin$AfterCommitToJson(
        HeadRefForcePushedMixin$AfterCommit instance) =>
    <String, dynamic>{
      'url': instance.url.toString(),
      'abbreviatedOid': instance.abbreviatedOid,
    };

HeadRefForcePushedMixin$Ref _$HeadRefForcePushedMixin$RefFromJson(
        Map<String, dynamic> json) =>
    HeadRefForcePushedMixin$Ref()..name = json['name'] as String;

Map<String, dynamic> _$HeadRefForcePushedMixin$RefToJson(
        HeadRefForcePushedMixin$Ref instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

HeadRefForcePushedMixin$Actor _$HeadRefForcePushedMixin$ActorFromJson(
        Map<String, dynamic> json) =>
    HeadRefForcePushedMixin$Actor()
      ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
      ..login = json['login'] as String;

Map<String, dynamic> _$HeadRefForcePushedMixin$ActorToJson(
        HeadRefForcePushedMixin$Actor instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
    };

HeadRefRestoredMixin$Actor _$HeadRefRestoredMixin$ActorFromJson(
        Map<String, dynamic> json) =>
    HeadRefRestoredMixin$Actor()
      ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
      ..login = json['login'] as String;

Map<String, dynamic> _$HeadRefRestoredMixin$ActorToJson(
        HeadRefRestoredMixin$Actor instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
    };

MergedMixin$Actor _$MergedMixin$ActorFromJson(Map<String, dynamic> json) =>
    MergedMixin$Actor()
      ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
      ..login = json['login'] as String;

Map<String, dynamic> _$MergedMixin$ActorToJson(MergedMixin$Actor instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
    };

PullRequestCommitMixin$Commit _$PullRequestCommitMixin$CommitFromJson(
        Map<String, dynamic> json) =>
    PullRequestCommitMixin$Commit()
      ..additions = json['additions'] as int
      ..authoredDate = DateTime.parse(json['authoredDate'] as String)
      ..oid = json['oid'] as String
      ..message = json['message'] as String
      ..commitUrl = Uri.parse(json['commitUrl'] as String)
      ..messageHeadline = json['messageHeadline'] as String
      ..author = json['author'] == null
          ? null
          : CommitMixin$Author.fromJson(json['author'] as Map<String, dynamic>);

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
        Map<String, dynamic> json) =>
    CommitMixin$Author$User()
      ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
      ..login = json['login'] as String;

Map<String, dynamic> _$CommitMixin$Author$UserToJson(
        CommitMixin$Author$User instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
    };

CommitMixin$Author _$CommitMixin$AuthorFromJson(Map<String, dynamic> json) =>
    CommitMixin$Author()
      ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
      ..name = json['name'] as String?
      ..user = json['user'] == null
          ? null
          : CommitMixin$Author$User.fromJson(
              json['user'] as Map<String, dynamic>);

Map<String, dynamic> _$CommitMixin$AuthorToJson(CommitMixin$Author instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'name': instance.name,
      'user': instance.user?.toJson(),
    };

PullRequestReviewMixin$Author _$PullRequestReviewMixin$AuthorFromJson(
        Map<String, dynamic> json) =>
    PullRequestReviewMixin$Author()
      ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
      ..login = json['login'] as String;

Map<String, dynamic> _$PullRequestReviewMixin$AuthorToJson(
        PullRequestReviewMixin$Author instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
    };

PullRequestReviewMixin$Comments _$PullRequestReviewMixin$CommentsFromJson(
        Map<String, dynamic> json) =>
    PullRequestReviewMixin$Comments()..totalCount = json['totalCount'] as int;

Map<String, dynamic> _$PullRequestReviewMixin$CommentsToJson(
        PullRequestReviewMixin$Comments instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
    };

PullRequestReviewMixin$ReactionGroups
    _$PullRequestReviewMixin$ReactionGroupsFromJson(
            Map<String, dynamic> json) =>
        PullRequestReviewMixin$ReactionGroups()
          ..content = $enumDecode(_$ReactionContentEnumMap, json['content'],
              unknownValue: ReactionContent.artemisUnknown)
          ..viewerHasReacted = json['viewerHasReacted'] as bool
          ..reactors = ReactionGroupsMixin$Reactors.fromJson(
              json['reactors'] as Map<String, dynamic>)
          ..subject = ReactionGroupsMixin$Subject.fromJson(
              json['subject'] as Map<String, dynamic>);

Map<String, dynamic> _$PullRequestReviewMixin$ReactionGroupsToJson(
        PullRequestReviewMixin$ReactionGroups instance) =>
    <String, dynamic>{
      'content': _$ReactionContentEnumMap[instance.content]!,
      'viewerHasReacted': instance.viewerHasReacted,
      'reactors': instance.reactors.toJson(),
      'subject': instance.subject.toJson(),
    };

ReadyForReviewMixin$Actor _$ReadyForReviewMixin$ActorFromJson(
        Map<String, dynamic> json) =>
    ReadyForReviewMixin$Actor()
      ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
      ..login = json['login'] as String;

Map<String, dynamic> _$ReadyForReviewMixin$ActorToJson(
        ReadyForReviewMixin$Actor instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
    };

ReviewDismissedMixin$Actor _$ReviewDismissedMixin$ActorFromJson(
        Map<String, dynamic> json) =>
    ReviewDismissedMixin$Actor()
      ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
      ..login = json['login'] as String;

Map<String, dynamic> _$ReviewDismissedMixin$ActorToJson(
        ReviewDismissedMixin$Actor instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
    };

ReviewRequestedMixin$Actor _$ReviewRequestedMixin$ActorFromJson(
        Map<String, dynamic> json) =>
    ReviewRequestedMixin$Actor()
      ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
      ..login = json['login'] as String;

Map<String, dynamic> _$ReviewRequestedMixin$ActorToJson(
        ReviewRequestedMixin$Actor instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
    };

ReviewRequestedMixin$RequestedReviewer$User
    _$ReviewRequestedMixin$RequestedReviewer$UserFromJson(
            Map<String, dynamic> json) =>
        ReviewRequestedMixin$RequestedReviewer$User()
          ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
          ..login = json['login'] as String
          ..$$typename = json['__typename'] as String?;

Map<String, dynamic> _$ReviewRequestedMixin$RequestedReviewer$UserToJson(
        ReviewRequestedMixin$RequestedReviewer$User instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
      '__typename': instance.$$typename,
    };

ReviewRequestedMixin$RequestedReviewer$Team
    _$ReviewRequestedMixin$RequestedReviewer$TeamFromJson(
            Map<String, dynamic> json) =>
        ReviewRequestedMixin$RequestedReviewer$Team()
          ..$$typename = json['__typename'] as String?
          ..avatar = json['avatar'] == null
              ? null
              : Uri.parse(json['avatar'] as String)
          ..name = json['name'] as String;

Map<String, dynamic> _$ReviewRequestedMixin$RequestedReviewer$TeamToJson(
        ReviewRequestedMixin$RequestedReviewer$Team instance) =>
    <String, dynamic>{
      '__typename': instance.$$typename,
      'avatar': instance.avatar?.toString(),
      'name': instance.name,
    };

ReviewRequestedMixin$RequestedReviewer
    _$ReviewRequestedMixin$RequestedReviewerFromJson(
            Map<String, dynamic> json) =>
        ReviewRequestedMixin$RequestedReviewer()
          ..$$typename = json['__typename'] as String?;

Map<String, dynamic> _$ReviewRequestedMixin$RequestedReviewerToJson(
        ReviewRequestedMixin$RequestedReviewer instance) =>
    <String, dynamic>{
      '__typename': instance.$$typename,
    };

GetPRReviewComments$Query$Node$PullRequestReview
    _$GetPRReviewComments$Query$Node$PullRequestReviewFromJson(
            Map<String, dynamic> json) =>
        GetPRReviewComments$Query$Node$PullRequestReview()
          ..comments = PRReviewCommentsMixin$Comments.fromJson(
              json['comments'] as Map<String, dynamic>)
          ..$$typename = json['__typename'] as String?;

Map<String, dynamic> _$GetPRReviewComments$Query$Node$PullRequestReviewToJson(
        GetPRReviewComments$Query$Node$PullRequestReview instance) =>
    <String, dynamic>{
      'comments': instance.comments.toJson(),
      '__typename': instance.$$typename,
    };

GetPRReviewComments$Query$Node _$GetPRReviewComments$Query$NodeFromJson(
        Map<String, dynamic> json) =>
    GetPRReviewComments$Query$Node()
      ..$$typename = json['__typename'] as String?;

Map<String, dynamic> _$GetPRReviewComments$Query$NodeToJson(
        GetPRReviewComments$Query$Node instance) =>
    <String, dynamic>{
      '__typename': instance.$$typename,
    };

GetPRReviewComments$Query _$GetPRReviewComments$QueryFromJson(
        Map<String, dynamic> json) =>
    GetPRReviewComments$Query()
      ..node = json['node'] == null
          ? null
          : GetPRReviewComments$Query$Node.fromJson(
              json['node'] as Map<String, dynamic>);

Map<String, dynamic> _$GetPRReviewComments$QueryToJson(
        GetPRReviewComments$Query instance) =>
    <String, dynamic>{
      'node': instance.node?.toJson(),
    };

PRReviewCommentsMixin$Comments$Edges$Node
    _$PRReviewCommentsMixin$Comments$Edges$NodeFromJson(
            Map<String, dynamic> json) =>
        PRReviewCommentsMixin$Comments$Edges$Node()
          ..id = json['id'] as String
          ..databaseId = json['databaseId'] as int?
          ..author = json['author'] == null
              ? null
              : PullRequestReviewCommentMixin$Author.fromJson(
                  json['author'] as Map<String, dynamic>)
          ..createdAt = DateTime.parse(json['createdAt'] as String)
          ..authorAssociation = $enumDecode(
              _$CommentAuthorAssociationEnumMap, json['authorAssociation'],
              unknownValue: CommentAuthorAssociation.artemisUnknown)
          ..body = json['body'] as String
          ..bodyHTML = json['bodyHTML'] as String
          ..lastEditedAt = json['lastEditedAt'] == null
              ? null
              : DateTime.parse(json['lastEditedAt'] as String)
          ..state = $enumDecode(
              _$PullRequestReviewCommentStateEnumMap, json['state'],
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
              ?.map((e) =>
                  PullRequestReviewCommentMixin$ReactionGroups.fromJson(
                      e as Map<String, dynamic>))
              .toList()
          ..viewerCanDelete = json['viewerCanDelete'] as bool
          ..viewerCanUpdate = json['viewerCanUpdate'] as bool
          ..viewerDidAuthor = json['viewerDidAuthor'] as bool
          ..viewerCannotUpdateReasons =
              (json['viewerCannotUpdateReasons'] as List<dynamic>)
                  .map((e) => $enumDecode(_$CommentCannotUpdateReasonEnumMap, e,
                      unknownValue: CommentCannotUpdateReason.artemisUnknown))
                  .toList()
          ..viewerCanReact = json['viewerCanReact'] as bool
          ..viewerCanMinimize = json['viewerCanMinimize'] as bool
          ..pullRequest = PullRequestReviewCommentMixin$PullRequest.fromJson(
              json['pullRequest'] as Map<String, dynamic>)
          ..repository = PullRequestReviewCommentMixin$Repository.fromJson(
              json['repository'] as Map<String, dynamic>);

Map<String, dynamic> _$PRReviewCommentsMixin$Comments$Edges$NodeToJson(
        PRReviewCommentsMixin$Comments$Edges$Node instance) =>
    <String, dynamic>{
      'id': instance.id,
      'databaseId': instance.databaseId,
      'author': instance.author?.toJson(),
      'createdAt': instance.createdAt.toIso8601String(),
      'authorAssociation':
          _$CommentAuthorAssociationEnumMap[instance.authorAssociation]!,
      'body': instance.body,
      'bodyHTML': instance.bodyHTML,
      'lastEditedAt': instance.lastEditedAt?.toIso8601String(),
      'state': _$PullRequestReviewCommentStateEnumMap[instance.state]!,
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
          .map((e) => _$CommentCannotUpdateReasonEnumMap[e]!)
          .toList(),
      'viewerCanReact': instance.viewerCanReact,
      'viewerCanMinimize': instance.viewerCanMinimize,
      'pullRequest': instance.pullRequest.toJson(),
      'repository': instance.repository.toJson(),
    };

const _$PullRequestReviewCommentStateEnumMap = {
  PullRequestReviewCommentState.pending: 'PENDING',
  PullRequestReviewCommentState.submitted: 'SUBMITTED',
  PullRequestReviewCommentState.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

PRReviewCommentsMixin$Comments$Edges
    _$PRReviewCommentsMixin$Comments$EdgesFromJson(Map<String, dynamic> json) =>
        PRReviewCommentsMixin$Comments$Edges()
          ..$$typename = json['__typename'] as String?
          ..cursor = json['cursor'] as String
          ..node = json['node'] == null
              ? null
              : PRReviewCommentsMixin$Comments$Edges$Node.fromJson(
                  json['node'] as Map<String, dynamic>);

Map<String, dynamic> _$PRReviewCommentsMixin$Comments$EdgesToJson(
        PRReviewCommentsMixin$Comments$Edges instance) =>
    <String, dynamic>{
      '__typename': instance.$$typename,
      'cursor': instance.cursor,
      'node': instance.node?.toJson(),
    };

PRReviewCommentsMixin$Comments _$PRReviewCommentsMixin$CommentsFromJson(
        Map<String, dynamic> json) =>
    PRReviewCommentsMixin$Comments()
      ..edges = (json['edges'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : PRReviewCommentsMixin$Comments$Edges.fromJson(
                  e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$PRReviewCommentsMixin$CommentsToJson(
        PRReviewCommentsMixin$Comments instance) =>
    <String, dynamic>{
      'edges': instance.edges?.map((e) => e?.toJson()).toList(),
    };

PullRequestReviewCommentMixin$Author
    _$PullRequestReviewCommentMixin$AuthorFromJson(Map<String, dynamic> json) =>
        PullRequestReviewCommentMixin$Author()
          ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
          ..login = json['login'] as String;

Map<String, dynamic> _$PullRequestReviewCommentMixin$AuthorToJson(
        PullRequestReviewCommentMixin$Author instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
    };

PullRequestReviewCommentMixin$ReplyTo
    _$PullRequestReviewCommentMixin$ReplyToFromJson(
            Map<String, dynamic> json) =>
        PullRequestReviewCommentMixin$ReplyTo()..id = json['id'] as String;

Map<String, dynamic> _$PullRequestReviewCommentMixin$ReplyToToJson(
        PullRequestReviewCommentMixin$ReplyTo instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

PullRequestReviewCommentMixin$ReactionGroups
    _$PullRequestReviewCommentMixin$ReactionGroupsFromJson(
            Map<String, dynamic> json) =>
        PullRequestReviewCommentMixin$ReactionGroups()
          ..content = $enumDecode(_$ReactionContentEnumMap, json['content'],
              unknownValue: ReactionContent.artemisUnknown)
          ..viewerHasReacted = json['viewerHasReacted'] as bool
          ..reactors = ReactionGroupsMixin$Reactors.fromJson(
              json['reactors'] as Map<String, dynamic>)
          ..subject = ReactionGroupsMixin$Subject.fromJson(
              json['subject'] as Map<String, dynamic>);

Map<String, dynamic> _$PullRequestReviewCommentMixin$ReactionGroupsToJson(
        PullRequestReviewCommentMixin$ReactionGroups instance) =>
    <String, dynamic>{
      'content': _$ReactionContentEnumMap[instance.content]!,
      'viewerHasReacted': instance.viewerHasReacted,
      'reactors': instance.reactors.toJson(),
      'subject': instance.subject.toJson(),
    };

PullRequestReviewCommentMixin$PullRequest
    _$PullRequestReviewCommentMixin$PullRequestFromJson(
            Map<String, dynamic> json) =>
        PullRequestReviewCommentMixin$PullRequest()
          ..number = json['number'] as int;

Map<String, dynamic> _$PullRequestReviewCommentMixin$PullRequestToJson(
        PullRequestReviewCommentMixin$PullRequest instance) =>
    <String, dynamic>{
      'number': instance.number,
    };

PullRequestReviewCommentMixin$Repository$Owner
    _$PullRequestReviewCommentMixin$Repository$OwnerFromJson(
            Map<String, dynamic> json) =>
        PullRequestReviewCommentMixin$Repository$Owner()
          ..login = json['login'] as String;

Map<String, dynamic> _$PullRequestReviewCommentMixin$Repository$OwnerToJson(
        PullRequestReviewCommentMixin$Repository$Owner instance) =>
    <String, dynamic>{
      'login': instance.login,
    };

PullRequestReviewCommentMixin$Repository
    _$PullRequestReviewCommentMixin$RepositoryFromJson(
            Map<String, dynamic> json) =>
        PullRequestReviewCommentMixin$Repository()
          ..name = json['name'] as String
          ..owner = PullRequestReviewCommentMixin$Repository$Owner.fromJson(
              json['owner'] as Map<String, dynamic>);

Map<String, dynamic> _$PullRequestReviewCommentMixin$RepositoryToJson(
        PullRequestReviewCommentMixin$Repository instance) =>
    <String, dynamic>{
      'name': instance.name,
      'owner': instance.owner.toJson(),
    };

ReviewThreadFirstCommentQuery$Query$Repository$PullRequest$ReviewThreads$Edges$Node$Comments$Nodes
    _$ReviewThreadFirstCommentQuery$Query$Repository$PullRequest$ReviewThreads$Edges$Node$Comments$NodesFromJson(
            Map<String, dynamic> json) =>
        ReviewThreadFirstCommentQuery$Query$Repository$PullRequest$ReviewThreads$Edges$Node$Comments$Nodes()
          ..id = json['id'] as String;

Map<String, dynamic>
    _$ReviewThreadFirstCommentQuery$Query$Repository$PullRequest$ReviewThreads$Edges$Node$Comments$NodesToJson(
            ReviewThreadFirstCommentQuery$Query$Repository$PullRequest$ReviewThreads$Edges$Node$Comments$Nodes
                instance) =>
        <String, dynamic>{
          'id': instance.id,
        };

ReviewThreadFirstCommentQuery$Query$Repository$PullRequest$ReviewThreads$Edges$Node$Comments
    _$ReviewThreadFirstCommentQuery$Query$Repository$PullRequest$ReviewThreads$Edges$Node$CommentsFromJson(
            Map<String, dynamic> json) =>
        ReviewThreadFirstCommentQuery$Query$Repository$PullRequest$ReviewThreads$Edges$Node$Comments()
          ..totalCount = json['totalCount'] as int
          ..nodes = (json['nodes'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : ReviewThreadFirstCommentQuery$Query$Repository$PullRequest$ReviewThreads$Edges$Node$Comments$Nodes
                      .fromJson(e as Map<String, dynamic>))
              .toList();

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
            Map<String, dynamic> json) =>
        ReviewThreadFirstCommentQuery$Query$Repository$PullRequest$ReviewThreads$Edges$Node()
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
            Map<String, dynamic> json) =>
        ReviewThreadFirstCommentQuery$Query$Repository$PullRequest$ReviewThreads$Edges()
          ..cursor = json['cursor'] as String
          ..node = json['node'] == null
              ? null
              : ReviewThreadFirstCommentQuery$Query$Repository$PullRequest$ReviewThreads$Edges$Node
                  .fromJson(json['node'] as Map<String, dynamic>);

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
            Map<String, dynamic> json) =>
        ReviewThreadFirstCommentQuery$Query$Repository$PullRequest$ReviewThreads()
          ..edges = (json['edges'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : ReviewThreadFirstCommentQuery$Query$Repository$PullRequest$ReviewThreads$Edges
                      .fromJson(e as Map<String, dynamic>))
              .toList();

Map<String, dynamic>
    _$ReviewThreadFirstCommentQuery$Query$Repository$PullRequest$ReviewThreadsToJson(
            ReviewThreadFirstCommentQuery$Query$Repository$PullRequest$ReviewThreads
                instance) =>
        <String, dynamic>{
          'edges': instance.edges?.map((e) => e?.toJson()).toList(),
        };

ReviewThreadFirstCommentQuery$Query$Repository$PullRequest
    _$ReviewThreadFirstCommentQuery$Query$Repository$PullRequestFromJson(
            Map<String, dynamic> json) =>
        ReviewThreadFirstCommentQuery$Query$Repository$PullRequest()
          ..id = json['id'] as String
          ..reviewThreads =
              ReviewThreadFirstCommentQuery$Query$Repository$PullRequest$ReviewThreads
                  .fromJson(json['reviewThreads'] as Map<String, dynamic>);

Map<String,
    dynamic> _$ReviewThreadFirstCommentQuery$Query$Repository$PullRequestToJson(
        ReviewThreadFirstCommentQuery$Query$Repository$PullRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'reviewThreads': instance.reviewThreads.toJson(),
    };

ReviewThreadFirstCommentQuery$Query$Repository
    _$ReviewThreadFirstCommentQuery$Query$RepositoryFromJson(
            Map<String, dynamic> json) =>
        ReviewThreadFirstCommentQuery$Query$Repository()
          ..pullRequest = json['pullRequest'] == null
              ? null
              : ReviewThreadFirstCommentQuery$Query$Repository$PullRequest
                  .fromJson(json['pullRequest'] as Map<String, dynamic>);

Map<String, dynamic> _$ReviewThreadFirstCommentQuery$Query$RepositoryToJson(
        ReviewThreadFirstCommentQuery$Query$Repository instance) =>
    <String, dynamic>{
      'pullRequest': instance.pullRequest?.toJson(),
    };

ReviewThreadFirstCommentQuery$Query
    _$ReviewThreadFirstCommentQuery$QueryFromJson(Map<String, dynamic> json) =>
        ReviewThreadFirstCommentQuery$Query()
          ..repository = json['repository'] == null
              ? null
              : ReviewThreadFirstCommentQuery$Query$Repository.fromJson(
                  json['repository'] as Map<String, dynamic>);

Map<String, dynamic> _$ReviewThreadFirstCommentQuery$QueryToJson(
        ReviewThreadFirstCommentQuery$Query instance) =>
    <String, dynamic>{
      'repository': instance.repository?.toJson(),
    };

ReviewThreadCommentsQuery$Query$Node$PullRequestReviewThread$Comments$Edges$Node
    _$ReviewThreadCommentsQuery$Query$Node$PullRequestReviewThread$Comments$Edges$NodeFromJson(
            Map<String, dynamic> json) =>
        ReviewThreadCommentsQuery$Query$Node$PullRequestReviewThread$Comments$Edges$Node()
          ..id = json['id'] as String
          ..databaseId = json['databaseId'] as int?
          ..author = json['author'] == null
              ? null
              : PullRequestReviewCommentMixin$Author.fromJson(
                  json['author'] as Map<String, dynamic>)
          ..createdAt = DateTime.parse(json['createdAt'] as String)
          ..authorAssociation = $enumDecode(
              _$CommentAuthorAssociationEnumMap, json['authorAssociation'],
              unknownValue: CommentAuthorAssociation.artemisUnknown)
          ..body = json['body'] as String
          ..bodyHTML = json['bodyHTML'] as String
          ..lastEditedAt = json['lastEditedAt'] == null
              ? null
              : DateTime.parse(json['lastEditedAt'] as String)
          ..state = $enumDecode(
              _$PullRequestReviewCommentStateEnumMap, json['state'],
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
              ?.map((e) =>
                  PullRequestReviewCommentMixin$ReactionGroups.fromJson(
                      e as Map<String, dynamic>))
              .toList()
          ..viewerCanDelete = json['viewerCanDelete'] as bool
          ..viewerCanUpdate = json['viewerCanUpdate'] as bool
          ..viewerDidAuthor = json['viewerDidAuthor'] as bool
          ..viewerCannotUpdateReasons =
              (json['viewerCannotUpdateReasons'] as List<dynamic>)
                  .map((e) => $enumDecode(_$CommentCannotUpdateReasonEnumMap, e,
                      unknownValue: CommentCannotUpdateReason.artemisUnknown))
                  .toList()
          ..viewerCanReact = json['viewerCanReact'] as bool
          ..viewerCanMinimize = json['viewerCanMinimize'] as bool
          ..pullRequest = PullRequestReviewCommentMixin$PullRequest.fromJson(
              json['pullRequest'] as Map<String, dynamic>)
          ..repository = PullRequestReviewCommentMixin$Repository.fromJson(
              json['repository'] as Map<String, dynamic>);

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
              _$CommentAuthorAssociationEnumMap[instance.authorAssociation]!,
          'body': instance.body,
          'bodyHTML': instance.bodyHTML,
          'lastEditedAt': instance.lastEditedAt?.toIso8601String(),
          'state': _$PullRequestReviewCommentStateEnumMap[instance.state]!,
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
              .map((e) => _$CommentCannotUpdateReasonEnumMap[e]!)
              .toList(),
          'viewerCanReact': instance.viewerCanReact,
          'viewerCanMinimize': instance.viewerCanMinimize,
          'pullRequest': instance.pullRequest.toJson(),
          'repository': instance.repository.toJson(),
        };

ReviewThreadCommentsQuery$Query$Node$PullRequestReviewThread$Comments$Edges
    _$ReviewThreadCommentsQuery$Query$Node$PullRequestReviewThread$Comments$EdgesFromJson(
            Map<String, dynamic> json) =>
        ReviewThreadCommentsQuery$Query$Node$PullRequestReviewThread$Comments$Edges()
          ..cursor = json['cursor'] as String
          ..node = json['node'] == null
              ? null
              : ReviewThreadCommentsQuery$Query$Node$PullRequestReviewThread$Comments$Edges$Node
                  .fromJson(json['node'] as Map<String, dynamic>);

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
            Map<String, dynamic> json) =>
        ReviewThreadCommentsQuery$Query$Node$PullRequestReviewThread$Comments()
          ..edges = (json['edges'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : ReviewThreadCommentsQuery$Query$Node$PullRequestReviewThread$Comments$Edges
                      .fromJson(e as Map<String, dynamic>))
              .toList();

Map<String, dynamic>
    _$ReviewThreadCommentsQuery$Query$Node$PullRequestReviewThread$CommentsToJson(
            ReviewThreadCommentsQuery$Query$Node$PullRequestReviewThread$Comments
                instance) =>
        <String, dynamic>{
          'edges': instance.edges?.map((e) => e?.toJson()).toList(),
        };

ReviewThreadCommentsQuery$Query$Node$PullRequestReviewThread
    _$ReviewThreadCommentsQuery$Query$Node$PullRequestReviewThreadFromJson(
            Map<String, dynamic> json) =>
        ReviewThreadCommentsQuery$Query$Node$PullRequestReviewThread()
          ..$$typename = json['__typename'] as String?
          ..comments =
              ReviewThreadCommentsQuery$Query$Node$PullRequestReviewThread$Comments
                  .fromJson(json['comments'] as Map<String, dynamic>);

Map<String, dynamic>
    _$ReviewThreadCommentsQuery$Query$Node$PullRequestReviewThreadToJson(
            ReviewThreadCommentsQuery$Query$Node$PullRequestReviewThread
                instance) =>
        <String, dynamic>{
          '__typename': instance.$$typename,
          'comments': instance.comments.toJson(),
        };

ReviewThreadCommentsQuery$Query$Node
    _$ReviewThreadCommentsQuery$Query$NodeFromJson(Map<String, dynamic> json) =>
        ReviewThreadCommentsQuery$Query$Node()
          ..$$typename = json['__typename'] as String?;

Map<String, dynamic> _$ReviewThreadCommentsQuery$Query$NodeToJson(
        ReviewThreadCommentsQuery$Query$Node instance) =>
    <String, dynamic>{
      '__typename': instance.$$typename,
    };

ReviewThreadCommentsQuery$Query _$ReviewThreadCommentsQuery$QueryFromJson(
        Map<String, dynamic> json) =>
    ReviewThreadCommentsQuery$Query()
      ..node = json['node'] == null
          ? null
          : ReviewThreadCommentsQuery$Query$Node.fromJson(
              json['node'] as Map<String, dynamic>);

Map<String, dynamic> _$ReviewThreadCommentsQuery$QueryToJson(
        ReviewThreadCommentsQuery$Query instance) =>
    <String, dynamic>{
      'node': instance.node?.toJson(),
    };

CheckPendingViewerReviews$Query$Node$PullRequest$Reviews$Nodes
    _$CheckPendingViewerReviews$Query$Node$PullRequest$Reviews$NodesFromJson(
            Map<String, dynamic> json) =>
        CheckPendingViewerReviews$Query$Node$PullRequest$Reviews$Nodes()
          ..url = Uri.parse(json['url'] as String);

Map<String, dynamic>
    _$CheckPendingViewerReviews$Query$Node$PullRequest$Reviews$NodesToJson(
            CheckPendingViewerReviews$Query$Node$PullRequest$Reviews$Nodes
                instance) =>
        <String, dynamic>{
          'url': instance.url.toString(),
        };

CheckPendingViewerReviews$Query$Node$PullRequest$Reviews
    _$CheckPendingViewerReviews$Query$Node$PullRequest$ReviewsFromJson(
            Map<String, dynamic> json) =>
        CheckPendingViewerReviews$Query$Node$PullRequest$Reviews()
          ..totalCount = json['totalCount'] as int
          ..nodes = (json['nodes'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : CheckPendingViewerReviews$Query$Node$PullRequest$Reviews$Nodes
                      .fromJson(e as Map<String, dynamic>))
              .toList();

Map<String,
    dynamic> _$CheckPendingViewerReviews$Query$Node$PullRequest$ReviewsToJson(
        CheckPendingViewerReviews$Query$Node$PullRequest$Reviews instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
      'nodes': instance.nodes?.map((e) => e?.toJson()).toList(),
    };

CheckPendingViewerReviews$Query$Node$PullRequest
    _$CheckPendingViewerReviews$Query$Node$PullRequestFromJson(
            Map<String, dynamic> json) =>
        CheckPendingViewerReviews$Query$Node$PullRequest()
          ..$$typename = json['__typename'] as String?
          ..reviews = json['reviews'] == null
              ? null
              : CheckPendingViewerReviews$Query$Node$PullRequest$Reviews
                  .fromJson(json['reviews'] as Map<String, dynamic>);

Map<String, dynamic> _$CheckPendingViewerReviews$Query$Node$PullRequestToJson(
        CheckPendingViewerReviews$Query$Node$PullRequest instance) =>
    <String, dynamic>{
      '__typename': instance.$$typename,
      'reviews': instance.reviews?.toJson(),
    };

CheckPendingViewerReviews$Query$Node
    _$CheckPendingViewerReviews$Query$NodeFromJson(Map<String, dynamic> json) =>
        CheckPendingViewerReviews$Query$Node()
          ..$$typename = json['__typename'] as String?;

Map<String, dynamic> _$CheckPendingViewerReviews$Query$NodeToJson(
        CheckPendingViewerReviews$Query$Node instance) =>
    <String, dynamic>{
      '__typename': instance.$$typename,
    };

CheckPendingViewerReviews$Query _$CheckPendingViewerReviews$QueryFromJson(
        Map<String, dynamic> json) =>
    CheckPendingViewerReviews$Query()
      ..node = json['node'] == null
          ? null
          : CheckPendingViewerReviews$Query$Node.fromJson(
              json['node'] as Map<String, dynamic>);

Map<String, dynamic> _$CheckPendingViewerReviews$QueryToJson(
        CheckPendingViewerReviews$Query instance) =>
    <String, dynamic>{
      'node': instance.node?.toJson(),
    };

FetchReview$Query$Node$PullRequestReviewComment$Author
    _$FetchReview$Query$Node$PullRequestReviewComment$AuthorFromJson(
            Map<String, dynamic> json) =>
        FetchReview$Query$Node$PullRequestReviewComment$Author()
          ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
          ..login = json['login'] as String;

Map<String, dynamic>
    _$FetchReview$Query$Node$PullRequestReviewComment$AuthorToJson(
            FetchReview$Query$Node$PullRequestReviewComment$Author instance) =>
        <String, dynamic>{
          'avatarUrl': instance.avatarUrl.toString(),
          'login': instance.login,
        };

FetchReview$Query$Node$PullRequestReviewComment
    _$FetchReview$Query$Node$PullRequestReviewCommentFromJson(
            Map<String, dynamic> json) =>
        FetchReview$Query$Node$PullRequestReviewComment()
          ..$$typename = json['__typename'] as String?
          ..bodyHTML = json['bodyHTML'] as String
          ..author = json['author'] == null
              ? null
              : FetchReview$Query$Node$PullRequestReviewComment$Author.fromJson(
                  json['author'] as Map<String, dynamic>)
          ..diffHunk = json['diffHunk'] as String
          ..path = json['path'] as String;

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
        Map<String, dynamic> json) =>
    FetchReview$Query$Node()..$$typename = json['__typename'] as String?;

Map<String, dynamic> _$FetchReview$Query$NodeToJson(
        FetchReview$Query$Node instance) =>
    <String, dynamic>{
      '__typename': instance.$$typename,
    };

FetchReview$Query _$FetchReview$QueryFromJson(Map<String, dynamic> json) =>
    FetchReview$Query()
      ..node = json['node'] == null
          ? null
          : FetchReview$Query$Node.fromJson(
              json['node'] as Map<String, dynamic>);

Map<String, dynamic> _$FetchReview$QueryToJson(FetchReview$Query instance) =>
    <String, dynamic>{
      'node': instance.node?.toJson(),
    };

IssuePullInfo$Query$Repository$IssueOrPullRequest$Issue
    _$IssuePullInfo$Query$Repository$IssueOrPullRequest$IssueFromJson(
            Map<String, dynamic> json) =>
        IssuePullInfo$Query$Repository$IssueOrPullRequest$Issue()
          ..id = json['id'] as String
          ..activeLockReason = $enumDecodeNullable(
              _$LockReasonEnumMap, json['activeLockReason'],
              unknownValue: LockReason.artemisUnknown)
          ..assignees = IssueInfoMixin$Assignees.fromJson(
              json['assignees'] as Map<String, dynamic>)
          ..author = json['author'] == null
              ? null
              : IssueInfoMixin$Author.fromJson(
                  json['author'] as Map<String, dynamic>)
          ..participants = IssueInfoMixin$Participants.fromJson(
              json['participants'] as Map<String, dynamic>)
          ..authorAssociation = $enumDecode(
              _$CommentAuthorAssociationEnumMap, json['authorAssociation'],
              unknownValue: CommentAuthorAssociation.artemisUnknown)
          ..bodyHTML = json['bodyHTML'] as String
          ..body = json['body'] as String
          ..closed = json['closed'] as bool
          ..closedAt = json['closedAt'] == null
              ? null
              : DateTime.parse(json['closedAt'] as String)
          ..createdAt = DateTime.parse(json['createdAt'] as String)
          ..comments = IssueInfoMixin$Comments.fromJson(
              json['comments'] as Map<String, dynamic>)
          ..userContentEdits = json['userContentEdits'] == null
              ? null
              : IssueInfoMixin$UserContentEdits.fromJson(
                  json['userContentEdits'] as Map<String, dynamic>)
          ..includesCreatedEdit = json['includesCreatedEdit'] as bool
          ..isPinned = json['isPinned'] as bool?
          ..labels = json['labels'] == null
              ? null
              : IssueInfoMixin$Labels.fromJson(
                  json['labels'] as Map<String, dynamic>)
          ..locked = json['locked'] as bool
          ..number = json['number'] as int
          ..reactionGroups = (json['reactionGroups'] as List<dynamic>?)
              ?.map((e) => IssueInfoMixin$ReactionGroups.fromJson(
                  e as Map<String, dynamic>))
              .toList()
          ..repository = IssueInfoMixin$Repository.fromJson(
              json['repository'] as Map<String, dynamic>)
          ..state = $enumDecode(_$IssueStateEnumMap, json['state'],
              unknownValue: IssueState.artemisUnknown)
          ..titleHTML = json['titleHTML'] as String
          ..timelineItems = IssueInfoMixin$TimelineItems.fromJson(
              json['timelineItems'] as Map<String, dynamic>)
          ..url = Uri.parse(json['url'] as String)
          ..viewerCanReact = json['viewerCanReact'] as bool
          ..viewerCanUpdate = json['viewerCanUpdate'] as bool
          ..$$typename = json['__typename'] as String?;

Map<String, dynamic>
    _$IssuePullInfo$Query$Repository$IssueOrPullRequest$IssueToJson(
            IssuePullInfo$Query$Repository$IssueOrPullRequest$Issue instance) =>
        <String, dynamic>{
          'id': instance.id,
          'activeLockReason': _$LockReasonEnumMap[instance.activeLockReason],
          'assignees': instance.assignees.toJson(),
          'author': instance.author?.toJson(),
          'participants': instance.participants.toJson(),
          'authorAssociation':
              _$CommentAuthorAssociationEnumMap[instance.authorAssociation]!,
          'bodyHTML': instance.bodyHTML,
          'body': instance.body,
          'closed': instance.closed,
          'closedAt': instance.closedAt?.toIso8601String(),
          'createdAt': instance.createdAt.toIso8601String(),
          'comments': instance.comments.toJson(),
          'userContentEdits': instance.userContentEdits?.toJson(),
          'includesCreatedEdit': instance.includesCreatedEdit,
          'isPinned': instance.isPinned,
          'labels': instance.labels?.toJson(),
          'locked': instance.locked,
          'number': instance.number,
          'reactionGroups':
              instance.reactionGroups?.map((e) => e.toJson()).toList(),
          'repository': instance.repository.toJson(),
          'state': _$IssueStateEnumMap[instance.state]!,
          'titleHTML': instance.titleHTML,
          'timelineItems': instance.timelineItems.toJson(),
          'url': instance.url.toString(),
          'viewerCanReact': instance.viewerCanReact,
          'viewerCanUpdate': instance.viewerCanUpdate,
          '__typename': instance.$$typename,
        };

IssuePullInfo$Query$Repository$IssueOrPullRequest$PullRequest
    _$IssuePullInfo$Query$Repository$IssueOrPullRequest$PullRequestFromJson(
            Map<String, dynamic> json) =>
        IssuePullInfo$Query$Repository$IssueOrPullRequest$PullRequest()
          ..activeLockReason = $enumDecodeNullable(
              _$LockReasonEnumMap, json['activeLockReason'],
              unknownValue: LockReason.artemisUnknown)
          ..assignees = PullInfoMixin$Assignees.fromJson(
              json['assignees'] as Map<String, dynamic>)
          ..author = json['author'] == null
              ? null
              : PullInfoMixin$Author.fromJson(
                  json['author'] as Map<String, dynamic>)
          ..authorAssociation = $enumDecode(
              _$CommentAuthorAssociationEnumMap, json['authorAssociation'],
              unknownValue: CommentAuthorAssociation.artemisUnknown)
          ..bodyHTML = json['bodyHTML'] as String
          ..body = json['body'] as String
          ..closed = json['closed'] as bool
          ..closedAt = json['closedAt'] == null
              ? null
              : DateTime.parse(json['closedAt'] as String)
          ..createdAt = DateTime.parse(json['createdAt'] as String)
          ..comments = PullInfoMixin$Comments.fromJson(
              json['comments'] as Map<String, dynamic>)
          ..labels = json['labels'] == null
              ? null
              : PullInfoMixin$Labels.fromJson(
                  json['labels'] as Map<String, dynamic>)
          ..locked = json['locked'] as bool
          ..number = json['number'] as int
          ..reactionGroups = (json['reactionGroups'] as List<dynamic>?)
              ?.map((e) => PullInfoMixin$ReactionGroups.fromJson(
                  e as Map<String, dynamic>))
              .toList()
          ..repository = PullInfoMixin$Repository.fromJson(
              json['repository'] as Map<String, dynamic>)
          ..state = $enumDecode(_$PullRequestStateEnumMap, json['state'],
              unknownValue: PullRequestState.artemisUnknown)
          ..timelineItems = PullInfoMixin$TimelineItems.fromJson(
              json['timelineItems'] as Map<String, dynamic>)
          ..titleHTML = json['titleHTML'] as String
          ..url = Uri.parse(json['url'] as String)
          ..userContentEdits = json['userContentEdits'] == null
              ? null
              : PullInfoMixin$UserContentEdits.fromJson(
                  json['userContentEdits'] as Map<String, dynamic>)
          ..includesCreatedEdit = json['includesCreatedEdit'] as bool
          ..viewerCanReact = json['viewerCanReact'] as bool
          ..additions = json['additions'] as int
          ..deletions = json['deletions'] as int
          ..baseRef = json['baseRef'] == null
              ? null
              : PullInfoMixin$BaseRef.fromJson(
                  json['baseRef'] as Map<String, dynamic>)
          ..headRef = json['headRef'] == null
              ? null
              : PullInfoMixin$HeadRef.fromJson(
                  json['headRef'] as Map<String, dynamic>)
          ..changedFiles = json['changedFiles'] as int
          ..closingIssuesReferences = json['closingIssuesReferences'] == null
              ? null
              : PullInfoMixin$ClosingIssuesReferences.fromJson(
                  json['closingIssuesReferences'] as Map<String, dynamic>)
          ..commits = PullInfoMixin$Commits.fromJson(
              json['commits'] as Map<String, dynamic>)
          ..isCrossRepository = json['isCrossRepository'] as bool
          ..merged = json['merged'] as bool
          ..reviewDecision = $enumDecodeNullable(
              _$PullRequestReviewDecisionEnumMap, json['reviewDecision'],
              unknownValue: PullRequestReviewDecision.artemisUnknown)
          ..viewerCanUpdate = json['viewerCanUpdate'] as bool
          ..$$typename = json['__typename'] as String?;

Map<String, dynamic>
    _$IssuePullInfo$Query$Repository$IssueOrPullRequest$PullRequestToJson(
            IssuePullInfo$Query$Repository$IssueOrPullRequest$PullRequest
                instance) =>
        <String, dynamic>{
          'activeLockReason': _$LockReasonEnumMap[instance.activeLockReason],
          'assignees': instance.assignees.toJson(),
          'author': instance.author?.toJson(),
          'authorAssociation':
              _$CommentAuthorAssociationEnumMap[instance.authorAssociation]!,
          'bodyHTML': instance.bodyHTML,
          'body': instance.body,
          'closed': instance.closed,
          'closedAt': instance.closedAt?.toIso8601String(),
          'createdAt': instance.createdAt.toIso8601String(),
          'comments': instance.comments.toJson(),
          'labels': instance.labels?.toJson(),
          'locked': instance.locked,
          'number': instance.number,
          'reactionGroups':
              instance.reactionGroups?.map((e) => e.toJson()).toList(),
          'repository': instance.repository.toJson(),
          'state': _$PullRequestStateEnumMap[instance.state]!,
          'timelineItems': instance.timelineItems.toJson(),
          'titleHTML': instance.titleHTML,
          'url': instance.url.toString(),
          'userContentEdits': instance.userContentEdits?.toJson(),
          'includesCreatedEdit': instance.includesCreatedEdit,
          'viewerCanReact': instance.viewerCanReact,
          'additions': instance.additions,
          'deletions': instance.deletions,
          'baseRef': instance.baseRef?.toJson(),
          'headRef': instance.headRef?.toJson(),
          'changedFiles': instance.changedFiles,
          'closingIssuesReferences': instance.closingIssuesReferences?.toJson(),
          'commits': instance.commits.toJson(),
          'isCrossRepository': instance.isCrossRepository,
          'merged': instance.merged,
          'reviewDecision':
              _$PullRequestReviewDecisionEnumMap[instance.reviewDecision],
          'viewerCanUpdate': instance.viewerCanUpdate,
          '__typename': instance.$$typename,
        };

const _$PullRequestReviewDecisionEnumMap = {
  PullRequestReviewDecision.approved: 'APPROVED',
  PullRequestReviewDecision.changesRequested: 'CHANGES_REQUESTED',
  PullRequestReviewDecision.reviewRequired: 'REVIEW_REQUIRED',
  PullRequestReviewDecision.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

IssuePullInfo$Query$Repository$IssueOrPullRequest
    _$IssuePullInfo$Query$Repository$IssueOrPullRequestFromJson(
            Map<String, dynamic> json) =>
        IssuePullInfo$Query$Repository$IssueOrPullRequest()
          ..$$typename = json['__typename'] as String?;

Map<String, dynamic> _$IssuePullInfo$Query$Repository$IssueOrPullRequestToJson(
        IssuePullInfo$Query$Repository$IssueOrPullRequest instance) =>
    <String, dynamic>{
      '__typename': instance.$$typename,
    };

IssuePullInfo$Query$Repository _$IssuePullInfo$Query$RepositoryFromJson(
        Map<String, dynamic> json) =>
    IssuePullInfo$Query$Repository()
      ..issueOrPullRequest = json['issueOrPullRequest'] == null
          ? null
          : IssuePullInfo$Query$Repository$IssueOrPullRequest.fromJson(
              json['issueOrPullRequest'] as Map<String, dynamic>);

Map<String, dynamic> _$IssuePullInfo$Query$RepositoryToJson(
        IssuePullInfo$Query$Repository instance) =>
    <String, dynamic>{
      'issueOrPullRequest': instance.issueOrPullRequest?.toJson(),
    };

IssuePullInfo$Query _$IssuePullInfo$QueryFromJson(Map<String, dynamic> json) =>
    IssuePullInfo$Query()
      ..repository = json['repository'] == null
          ? null
          : IssuePullInfo$Query$Repository.fromJson(
              json['repository'] as Map<String, dynamic>);

Map<String, dynamic> _$IssuePullInfo$QueryToJson(
        IssuePullInfo$Query instance) =>
    <String, dynamic>{
      'repository': instance.repository?.toJson(),
    };

IssueInfoMixin$Assignees _$IssueInfoMixin$AssigneesFromJson(
        Map<String, dynamic> json) =>
    IssueInfoMixin$Assignees()
      ..totalCount = json['totalCount'] as int
      ..edges = (json['edges'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : AssigneeInfoMixin$Edges.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$IssueInfoMixin$AssigneesToJson(
        IssueInfoMixin$Assignees instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
      'edges': instance.edges?.map((e) => e?.toJson()).toList(),
    };

IssueInfoMixin$Author _$IssueInfoMixin$AuthorFromJson(
        Map<String, dynamic> json) =>
    IssueInfoMixin$Author()
      ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
      ..login = json['login'] as String;

Map<String, dynamic> _$IssueInfoMixin$AuthorToJson(
        IssueInfoMixin$Author instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
    };

IssueInfoMixin$Participants$Nodes _$IssueInfoMixin$Participants$NodesFromJson(
        Map<String, dynamic> json) =>
    IssueInfoMixin$Participants$Nodes()
      ..avatarUrl = Uri.parse(json['avatarUrl'] as String);

Map<String, dynamic> _$IssueInfoMixin$Participants$NodesToJson(
        IssueInfoMixin$Participants$Nodes instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
    };

IssueInfoMixin$Participants _$IssueInfoMixin$ParticipantsFromJson(
        Map<String, dynamic> json) =>
    IssueInfoMixin$Participants()
      ..totalCount = json['totalCount'] as int
      ..nodes = (json['nodes'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : IssueInfoMixin$Participants$Nodes.fromJson(
                  e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$IssueInfoMixin$ParticipantsToJson(
        IssueInfoMixin$Participants instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
      'nodes': instance.nodes?.map((e) => e?.toJson()).toList(),
    };

IssueInfoMixin$Comments _$IssueInfoMixin$CommentsFromJson(
        Map<String, dynamic> json) =>
    IssueInfoMixin$Comments()..totalCount = json['totalCount'] as int;

Map<String, dynamic> _$IssueInfoMixin$CommentsToJson(
        IssueInfoMixin$Comments instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
    };

IssueInfoMixin$UserContentEdits _$IssueInfoMixin$UserContentEditsFromJson(
        Map<String, dynamic> json) =>
    IssueInfoMixin$UserContentEdits()..totalCount = json['totalCount'] as int;

Map<String, dynamic> _$IssueInfoMixin$UserContentEditsToJson(
        IssueInfoMixin$UserContentEdits instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
    };

IssueInfoMixin$Labels$Nodes _$IssueInfoMixin$Labels$NodesFromJson(
        Map<String, dynamic> json) =>
    IssueInfoMixin$Labels$Nodes()
      ..color = json['color'] as String
      ..name = json['name'] as String;

Map<String, dynamic> _$IssueInfoMixin$Labels$NodesToJson(
        IssueInfoMixin$Labels$Nodes instance) =>
    <String, dynamic>{
      'color': instance.color,
      'name': instance.name,
    };

IssueInfoMixin$Labels _$IssueInfoMixin$LabelsFromJson(
        Map<String, dynamic> json) =>
    IssueInfoMixin$Labels()
      ..nodes = (json['nodes'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : IssueInfoMixin$Labels$Nodes.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$IssueInfoMixin$LabelsToJson(
        IssueInfoMixin$Labels instance) =>
    <String, dynamic>{
      'nodes': instance.nodes?.map((e) => e?.toJson()).toList(),
    };

IssueInfoMixin$ReactionGroups _$IssueInfoMixin$ReactionGroupsFromJson(
        Map<String, dynamic> json) =>
    IssueInfoMixin$ReactionGroups()
      ..content = $enumDecode(_$ReactionContentEnumMap, json['content'],
          unknownValue: ReactionContent.artemisUnknown)
      ..viewerHasReacted = json['viewerHasReacted'] as bool
      ..reactors = ReactionGroupsMixin$Reactors.fromJson(
          json['reactors'] as Map<String, dynamic>)
      ..subject = ReactionGroupsMixin$Subject.fromJson(
          json['subject'] as Map<String, dynamic>);

Map<String, dynamic> _$IssueInfoMixin$ReactionGroupsToJson(
        IssueInfoMixin$ReactionGroups instance) =>
    <String, dynamic>{
      'content': _$ReactionContentEnumMap[instance.content]!,
      'viewerHasReacted': instance.viewerHasReacted,
      'reactors': instance.reactors.toJson(),
      'subject': instance.subject.toJson(),
    };

IssueInfoMixin$Repository _$IssueInfoMixin$RepositoryFromJson(
        Map<String, dynamic> json) =>
    IssueInfoMixin$Repository()
      ..name = json['name'] as String
      ..owner =
          RepoInfoMixin$Owner.fromJson(json['owner'] as Map<String, dynamic>);

Map<String, dynamic> _$IssueInfoMixin$RepositoryToJson(
        IssueInfoMixin$Repository instance) =>
    <String, dynamic>{
      'name': instance.name,
      'owner': instance.owner.toJson(),
    };

IssueInfoMixin$TimelineItems _$IssueInfoMixin$TimelineItemsFromJson(
        Map<String, dynamic> json) =>
    IssueInfoMixin$TimelineItems()..totalCount = json['totalCount'] as int;

Map<String, dynamic> _$IssueInfoMixin$TimelineItemsToJson(
        IssueInfoMixin$TimelineItems instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
    };

AssigneeInfoMixin$Edges$Node _$AssigneeInfoMixin$Edges$NodeFromJson(
        Map<String, dynamic> json) =>
    AssigneeInfoMixin$Edges$Node()
      ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
      ..login = json['login'] as String;

Map<String, dynamic> _$AssigneeInfoMixin$Edges$NodeToJson(
        AssigneeInfoMixin$Edges$Node instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
    };

AssigneeInfoMixin$Edges _$AssigneeInfoMixin$EdgesFromJson(
        Map<String, dynamic> json) =>
    AssigneeInfoMixin$Edges()
      ..cursor = json['cursor'] as String
      ..node = json['node'] == null
          ? null
          : AssigneeInfoMixin$Edges$Node.fromJson(
              json['node'] as Map<String, dynamic>);

Map<String, dynamic> _$AssigneeInfoMixin$EdgesToJson(
        AssigneeInfoMixin$Edges instance) =>
    <String, dynamic>{
      'cursor': instance.cursor,
      'node': instance.node?.toJson(),
    };

RepoInfoMixin$Owner _$RepoInfoMixin$OwnerFromJson(Map<String, dynamic> json) =>
    RepoInfoMixin$Owner()
      ..login = json['login'] as String
      ..avatarUrl = Uri.parse(json['avatarUrl'] as String);

Map<String, dynamic> _$RepoInfoMixin$OwnerToJson(
        RepoInfoMixin$Owner instance) =>
    <String, dynamic>{
      'login': instance.login,
      'avatarUrl': instance.avatarUrl.toString(),
    };

PullInfoMixin$Assignees _$PullInfoMixin$AssigneesFromJson(
        Map<String, dynamic> json) =>
    PullInfoMixin$Assignees()
      ..totalCount = json['totalCount'] as int
      ..edges = (json['edges'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : AssigneeInfoMixin$Edges.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$PullInfoMixin$AssigneesToJson(
        PullInfoMixin$Assignees instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
      'edges': instance.edges?.map((e) => e?.toJson()).toList(),
    };

PullInfoMixin$Author _$PullInfoMixin$AuthorFromJson(
        Map<String, dynamic> json) =>
    PullInfoMixin$Author()
      ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
      ..login = json['login'] as String;

Map<String, dynamic> _$PullInfoMixin$AuthorToJson(
        PullInfoMixin$Author instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
    };

PullInfoMixin$Comments _$PullInfoMixin$CommentsFromJson(
        Map<String, dynamic> json) =>
    PullInfoMixin$Comments()..totalCount = json['totalCount'] as int;

Map<String, dynamic> _$PullInfoMixin$CommentsToJson(
        PullInfoMixin$Comments instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
    };

PullInfoMixin$Labels$Nodes _$PullInfoMixin$Labels$NodesFromJson(
        Map<String, dynamic> json) =>
    PullInfoMixin$Labels$Nodes()
      ..color = json['color'] as String
      ..name = json['name'] as String;

Map<String, dynamic> _$PullInfoMixin$Labels$NodesToJson(
        PullInfoMixin$Labels$Nodes instance) =>
    <String, dynamic>{
      'color': instance.color,
      'name': instance.name,
    };

PullInfoMixin$Labels _$PullInfoMixin$LabelsFromJson(
        Map<String, dynamic> json) =>
    PullInfoMixin$Labels()
      ..nodes = (json['nodes'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : PullInfoMixin$Labels$Nodes.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$PullInfoMixin$LabelsToJson(
        PullInfoMixin$Labels instance) =>
    <String, dynamic>{
      'nodes': instance.nodes?.map((e) => e?.toJson()).toList(),
    };

PullInfoMixin$ReactionGroups _$PullInfoMixin$ReactionGroupsFromJson(
        Map<String, dynamic> json) =>
    PullInfoMixin$ReactionGroups()
      ..content = $enumDecode(_$ReactionContentEnumMap, json['content'],
          unknownValue: ReactionContent.artemisUnknown)
      ..viewerHasReacted = json['viewerHasReacted'] as bool
      ..reactors = ReactionGroupsMixin$Reactors.fromJson(
          json['reactors'] as Map<String, dynamic>)
      ..subject = ReactionGroupsMixin$Subject.fromJson(
          json['subject'] as Map<String, dynamic>);

Map<String, dynamic> _$PullInfoMixin$ReactionGroupsToJson(
        PullInfoMixin$ReactionGroups instance) =>
    <String, dynamic>{
      'content': _$ReactionContentEnumMap[instance.content]!,
      'viewerHasReacted': instance.viewerHasReacted,
      'reactors': instance.reactors.toJson(),
      'subject': instance.subject.toJson(),
    };

PullInfoMixin$Repository _$PullInfoMixin$RepositoryFromJson(
        Map<String, dynamic> json) =>
    PullInfoMixin$Repository()
      ..name = json['name'] as String
      ..owner =
          RepoInfoMixin$Owner.fromJson(json['owner'] as Map<String, dynamic>);

Map<String, dynamic> _$PullInfoMixin$RepositoryToJson(
        PullInfoMixin$Repository instance) =>
    <String, dynamic>{
      'name': instance.name,
      'owner': instance.owner.toJson(),
    };

PullInfoMixin$TimelineItems _$PullInfoMixin$TimelineItemsFromJson(
        Map<String, dynamic> json) =>
    PullInfoMixin$TimelineItems()..totalCount = json['totalCount'] as int;

Map<String, dynamic> _$PullInfoMixin$TimelineItemsToJson(
        PullInfoMixin$TimelineItems instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
    };

PullInfoMixin$UserContentEdits _$PullInfoMixin$UserContentEditsFromJson(
        Map<String, dynamic> json) =>
    PullInfoMixin$UserContentEdits()..totalCount = json['totalCount'] as int;

Map<String, dynamic> _$PullInfoMixin$UserContentEditsToJson(
        PullInfoMixin$UserContentEdits instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
    };

PullInfoMixin$BaseRef$Repository _$PullInfoMixin$BaseRef$RepositoryFromJson(
        Map<String, dynamic> json) =>
    PullInfoMixin$BaseRef$Repository()..url = Uri.parse(json['url'] as String);

Map<String, dynamic> _$PullInfoMixin$BaseRef$RepositoryToJson(
        PullInfoMixin$BaseRef$Repository instance) =>
    <String, dynamic>{
      'url': instance.url.toString(),
    };

PullInfoMixin$BaseRef _$PullInfoMixin$BaseRefFromJson(
        Map<String, dynamic> json) =>
    PullInfoMixin$BaseRef()
      ..name = json['name'] as String
      ..repository = PullInfoMixin$BaseRef$Repository.fromJson(
          json['repository'] as Map<String, dynamic>);

Map<String, dynamic> _$PullInfoMixin$BaseRefToJson(
        PullInfoMixin$BaseRef instance) =>
    <String, dynamic>{
      'name': instance.name,
      'repository': instance.repository.toJson(),
    };

PullInfoMixin$HeadRef$Repository _$PullInfoMixin$HeadRef$RepositoryFromJson(
        Map<String, dynamic> json) =>
    PullInfoMixin$HeadRef$Repository()..url = Uri.parse(json['url'] as String);

Map<String, dynamic> _$PullInfoMixin$HeadRef$RepositoryToJson(
        PullInfoMixin$HeadRef$Repository instance) =>
    <String, dynamic>{
      'url': instance.url.toString(),
    };

PullInfoMixin$HeadRef _$PullInfoMixin$HeadRefFromJson(
        Map<String, dynamic> json) =>
    PullInfoMixin$HeadRef()
      ..name = json['name'] as String
      ..repository = PullInfoMixin$HeadRef$Repository.fromJson(
          json['repository'] as Map<String, dynamic>);

Map<String, dynamic> _$PullInfoMixin$HeadRefToJson(
        PullInfoMixin$HeadRef instance) =>
    <String, dynamic>{
      'name': instance.name,
      'repository': instance.repository.toJson(),
    };

PullInfoMixin$ClosingIssuesReferences
    _$PullInfoMixin$ClosingIssuesReferencesFromJson(
            Map<String, dynamic> json) =>
        PullInfoMixin$ClosingIssuesReferences()
          ..totalCount = json['totalCount'] as int;

Map<String, dynamic> _$PullInfoMixin$ClosingIssuesReferencesToJson(
        PullInfoMixin$ClosingIssuesReferences instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
    };

PullInfoMixin$Commits _$PullInfoMixin$CommitsFromJson(
        Map<String, dynamic> json) =>
    PullInfoMixin$Commits()..totalCount = json['totalCount'] as int;

Map<String, dynamic> _$PullInfoMixin$CommitsToJson(
        PullInfoMixin$Commits instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
    };

GetReactors$Query$Node$Issue$ReactionGroups
    _$GetReactors$Query$Node$Issue$ReactionGroupsFromJson(
            Map<String, dynamic> json) =>
        GetReactors$Query$Node$Issue$ReactionGroups()
          ..content = $enumDecode(_$ReactionContentEnumMap, json['content'],
              unknownValue: ReactionContent.artemisUnknown)
          ..reactors = ReactorsGroupMixin$Reactors.fromJson(
              json['reactors'] as Map<String, dynamic>);

Map<String, dynamic> _$GetReactors$Query$Node$Issue$ReactionGroupsToJson(
        GetReactors$Query$Node$Issue$ReactionGroups instance) =>
    <String, dynamic>{
      'content': _$ReactionContentEnumMap[instance.content]!,
      'reactors': instance.reactors.toJson(),
    };

GetReactors$Query$Node$Issue _$GetReactors$Query$Node$IssueFromJson(
        Map<String, dynamic> json) =>
    GetReactors$Query$Node$Issue()
      ..$$typename = json['__typename'] as String?
      ..reactionGroups = (json['reactionGroups'] as List<dynamic>?)
          ?.map((e) => GetReactors$Query$Node$Issue$ReactionGroups.fromJson(
              e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$GetReactors$Query$Node$IssueToJson(
        GetReactors$Query$Node$Issue instance) =>
    <String, dynamic>{
      '__typename': instance.$$typename,
      'reactionGroups':
          instance.reactionGroups?.map((e) => e.toJson()).toList(),
    };

GetReactors$Query$Node$PullRequest$ReactionGroups
    _$GetReactors$Query$Node$PullRequest$ReactionGroupsFromJson(
            Map<String, dynamic> json) =>
        GetReactors$Query$Node$PullRequest$ReactionGroups()
          ..content = $enumDecode(_$ReactionContentEnumMap, json['content'],
              unknownValue: ReactionContent.artemisUnknown)
          ..reactors = ReactorsGroupMixin$Reactors.fromJson(
              json['reactors'] as Map<String, dynamic>);

Map<String, dynamic> _$GetReactors$Query$Node$PullRequest$ReactionGroupsToJson(
        GetReactors$Query$Node$PullRequest$ReactionGroups instance) =>
    <String, dynamic>{
      'content': _$ReactionContentEnumMap[instance.content]!,
      'reactors': instance.reactors.toJson(),
    };

GetReactors$Query$Node$PullRequest _$GetReactors$Query$Node$PullRequestFromJson(
        Map<String, dynamic> json) =>
    GetReactors$Query$Node$PullRequest()
      ..$$typename = json['__typename'] as String?
      ..reactionGroups = (json['reactionGroups'] as List<dynamic>?)
          ?.map((e) =>
              GetReactors$Query$Node$PullRequest$ReactionGroups.fromJson(
                  e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$GetReactors$Query$Node$PullRequestToJson(
        GetReactors$Query$Node$PullRequest instance) =>
    <String, dynamic>{
      '__typename': instance.$$typename,
      'reactionGroups':
          instance.reactionGroups?.map((e) => e.toJson()).toList(),
    };

GetReactors$Query$Node _$GetReactors$Query$NodeFromJson(
        Map<String, dynamic> json) =>
    GetReactors$Query$Node()..$$typename = json['__typename'] as String?;

Map<String, dynamic> _$GetReactors$Query$NodeToJson(
        GetReactors$Query$Node instance) =>
    <String, dynamic>{
      '__typename': instance.$$typename,
    };

GetReactors$Query _$GetReactors$QueryFromJson(Map<String, dynamic> json) =>
    GetReactors$Query()
      ..node = json['node'] == null
          ? null
          : GetReactors$Query$Node.fromJson(
              json['node'] as Map<String, dynamic>);

Map<String, dynamic> _$GetReactors$QueryToJson(GetReactors$Query instance) =>
    <String, dynamic>{
      'node': instance.node?.toJson(),
    };

ReactorsGroupMixin$Reactors$Edges$Node$User
    _$ReactorsGroupMixin$Reactors$Edges$Node$UserFromJson(
            Map<String, dynamic> json) =>
        ReactorsGroupMixin$Reactors$Edges$Node$User()
          ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
          ..login = json['login'] as String
          ..$$typename = json['__typename'] as String?;

Map<String, dynamic> _$ReactorsGroupMixin$Reactors$Edges$Node$UserToJson(
        ReactorsGroupMixin$Reactors$Edges$Node$User instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
      '__typename': instance.$$typename,
    };

ReactorsGroupMixin$Reactors$Edges$Node
    _$ReactorsGroupMixin$Reactors$Edges$NodeFromJson(
            Map<String, dynamic> json) =>
        ReactorsGroupMixin$Reactors$Edges$Node()
          ..$$typename = json['__typename'] as String?;

Map<String, dynamic> _$ReactorsGroupMixin$Reactors$Edges$NodeToJson(
        ReactorsGroupMixin$Reactors$Edges$Node instance) =>
    <String, dynamic>{
      '__typename': instance.$$typename,
    };

ReactorsGroupMixin$Reactors$Edges _$ReactorsGroupMixin$Reactors$EdgesFromJson(
        Map<String, dynamic> json) =>
    ReactorsGroupMixin$Reactors$Edges()
      ..cursor = json['cursor'] as String
      ..node = ReactorsGroupMixin$Reactors$Edges$Node.fromJson(
          json['node'] as Map<String, dynamic>);

Map<String, dynamic> _$ReactorsGroupMixin$Reactors$EdgesToJson(
        ReactorsGroupMixin$Reactors$Edges instance) =>
    <String, dynamic>{
      'cursor': instance.cursor,
      'node': instance.node.toJson(),
    };

ReactorsGroupMixin$Reactors _$ReactorsGroupMixin$ReactorsFromJson(
        Map<String, dynamic> json) =>
    ReactorsGroupMixin$Reactors()
      ..edges = (json['edges'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : ReactorsGroupMixin$Reactors$Edges.fromJson(
                  e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$ReactorsGroupMixin$ReactorsToJson(
        ReactorsGroupMixin$Reactors instance) =>
    <String, dynamic>{
      'edges': instance.edges?.map((e) => e?.toJson()).toList(),
    };

AddReaction$Mutation$AddReaction$Reaction
    _$AddReaction$Mutation$AddReaction$ReactionFromJson(
            Map<String, dynamic> json) =>
        AddReaction$Mutation$AddReaction$Reaction()
          ..createdAt = DateTime.parse(json['createdAt'] as String);

Map<String, dynamic> _$AddReaction$Mutation$AddReaction$ReactionToJson(
        AddReaction$Mutation$AddReaction$Reaction instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt.toIso8601String(),
    };

AddReaction$Mutation$AddReaction _$AddReaction$Mutation$AddReactionFromJson(
        Map<String, dynamic> json) =>
    AddReaction$Mutation$AddReaction()
      ..reaction = json['reaction'] == null
          ? null
          : AddReaction$Mutation$AddReaction$Reaction.fromJson(
              json['reaction'] as Map<String, dynamic>);

Map<String, dynamic> _$AddReaction$Mutation$AddReactionToJson(
        AddReaction$Mutation$AddReaction instance) =>
    <String, dynamic>{
      'reaction': instance.reaction?.toJson(),
    };

AddReaction$Mutation _$AddReaction$MutationFromJson(
        Map<String, dynamic> json) =>
    AddReaction$Mutation()
      ..addReaction = json['addReaction'] == null
          ? null
          : AddReaction$Mutation$AddReaction.fromJson(
              json['addReaction'] as Map<String, dynamic>);

Map<String, dynamic> _$AddReaction$MutationToJson(
        AddReaction$Mutation instance) =>
    <String, dynamic>{
      'addReaction': instance.addReaction?.toJson(),
    };

RemoveReaction$Mutation$RemoveReaction$Reaction
    _$RemoveReaction$Mutation$RemoveReaction$ReactionFromJson(
            Map<String, dynamic> json) =>
        RemoveReaction$Mutation$RemoveReaction$Reaction()
          ..createdAt = DateTime.parse(json['createdAt'] as String);

Map<String, dynamic> _$RemoveReaction$Mutation$RemoveReaction$ReactionToJson(
        RemoveReaction$Mutation$RemoveReaction$Reaction instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt.toIso8601String(),
    };

RemoveReaction$Mutation$RemoveReaction
    _$RemoveReaction$Mutation$RemoveReactionFromJson(
            Map<String, dynamic> json) =>
        RemoveReaction$Mutation$RemoveReaction()
          ..reaction = json['reaction'] == null
              ? null
              : RemoveReaction$Mutation$RemoveReaction$Reaction.fromJson(
                  json['reaction'] as Map<String, dynamic>);

Map<String, dynamic> _$RemoveReaction$Mutation$RemoveReactionToJson(
        RemoveReaction$Mutation$RemoveReaction instance) =>
    <String, dynamic>{
      'reaction': instance.reaction?.toJson(),
    };

RemoveReaction$Mutation _$RemoveReaction$MutationFromJson(
        Map<String, dynamic> json) =>
    RemoveReaction$Mutation()
      ..removeReaction = json['removeReaction'] == null
          ? null
          : RemoveReaction$Mutation$RemoveReaction.fromJson(
              json['removeReaction'] as Map<String, dynamic>);

Map<String, dynamic> _$RemoveReaction$MutationToJson(
        RemoveReaction$Mutation instance) =>
    <String, dynamic>{
      'removeReaction': instance.removeReaction?.toJson(),
    };

IssuePullAssignees$Query$Repository$IssueOrPullRequest$Issue
    _$IssuePullAssignees$Query$Repository$IssueOrPullRequest$IssueFromJson(
            Map<String, dynamic> json) =>
        IssuePullAssignees$Query$Repository$IssueOrPullRequest$Issue()
          ..assignees = AssigneeUserListMixin$Assignees.fromJson(
              json['assignees'] as Map<String, dynamic>)
          ..$$typename = json['__typename'] as String?;

Map<String, dynamic>
    _$IssuePullAssignees$Query$Repository$IssueOrPullRequest$IssueToJson(
            IssuePullAssignees$Query$Repository$IssueOrPullRequest$Issue
                instance) =>
        <String, dynamic>{
          'assignees': instance.assignees.toJson(),
          '__typename': instance.$$typename,
        };

IssuePullAssignees$Query$Repository$IssueOrPullRequest$PullRequest
    _$IssuePullAssignees$Query$Repository$IssueOrPullRequest$PullRequestFromJson(
            Map<String, dynamic> json) =>
        IssuePullAssignees$Query$Repository$IssueOrPullRequest$PullRequest()
          ..assignees = AssigneeUserListMixin$Assignees.fromJson(
              json['assignees'] as Map<String, dynamic>)
          ..$$typename = json['__typename'] as String?;

Map<String, dynamic>
    _$IssuePullAssignees$Query$Repository$IssueOrPullRequest$PullRequestToJson(
            IssuePullAssignees$Query$Repository$IssueOrPullRequest$PullRequest
                instance) =>
        <String, dynamic>{
          'assignees': instance.assignees.toJson(),
          '__typename': instance.$$typename,
        };

IssuePullAssignees$Query$Repository$IssueOrPullRequest
    _$IssuePullAssignees$Query$Repository$IssueOrPullRequestFromJson(
            Map<String, dynamic> json) =>
        IssuePullAssignees$Query$Repository$IssueOrPullRequest()
          ..$$typename = json['__typename'] as String?;

Map<String, dynamic>
    _$IssuePullAssignees$Query$Repository$IssueOrPullRequestToJson(
            IssuePullAssignees$Query$Repository$IssueOrPullRequest instance) =>
        <String, dynamic>{
          '__typename': instance.$$typename,
        };

IssuePullAssignees$Query$Repository
    _$IssuePullAssignees$Query$RepositoryFromJson(Map<String, dynamic> json) =>
        IssuePullAssignees$Query$Repository()
          ..issueOrPullRequest = json['issueOrPullRequest'] == null
              ? null
              : IssuePullAssignees$Query$Repository$IssueOrPullRequest.fromJson(
                  json['issueOrPullRequest'] as Map<String, dynamic>);

Map<String, dynamic> _$IssuePullAssignees$Query$RepositoryToJson(
        IssuePullAssignees$Query$Repository instance) =>
    <String, dynamic>{
      'issueOrPullRequest': instance.issueOrPullRequest?.toJson(),
    };

IssuePullAssignees$Query _$IssuePullAssignees$QueryFromJson(
        Map<String, dynamic> json) =>
    IssuePullAssignees$Query()
      ..repository = json['repository'] == null
          ? null
          : IssuePullAssignees$Query$Repository.fromJson(
              json['repository'] as Map<String, dynamic>);

Map<String, dynamic> _$IssuePullAssignees$QueryToJson(
        IssuePullAssignees$Query instance) =>
    <String, dynamic>{
      'repository': instance.repository?.toJson(),
    };

AssigneeUserListMixin$Assignees$Edges$Node
    _$AssigneeUserListMixin$Assignees$Edges$NodeFromJson(
            Map<String, dynamic> json) =>
        AssigneeUserListMixin$Assignees$Edges$Node()
          ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
          ..login = json['login'] as String;

Map<String, dynamic> _$AssigneeUserListMixin$Assignees$Edges$NodeToJson(
        AssigneeUserListMixin$Assignees$Edges$Node instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
    };

AssigneeUserListMixin$Assignees$Edges
    _$AssigneeUserListMixin$Assignees$EdgesFromJson(
            Map<String, dynamic> json) =>
        AssigneeUserListMixin$Assignees$Edges()
          ..cursor = json['cursor'] as String
          ..node = json['node'] == null
              ? null
              : AssigneeUserListMixin$Assignees$Edges$Node.fromJson(
                  json['node'] as Map<String, dynamic>);

Map<String, dynamic> _$AssigneeUserListMixin$Assignees$EdgesToJson(
        AssigneeUserListMixin$Assignees$Edges instance) =>
    <String, dynamic>{
      'cursor': instance.cursor,
      'node': instance.node?.toJson(),
    };

AssigneeUserListMixin$Assignees _$AssigneeUserListMixin$AssigneesFromJson(
        Map<String, dynamic> json) =>
    AssigneeUserListMixin$Assignees()
      ..edges = (json['edges'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : AssigneeUserListMixin$Assignees$Edges.fromJson(
                  e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$AssigneeUserListMixin$AssigneesToJson(
        AssigneeUserListMixin$Assignees instance) =>
    <String, dynamic>{
      'edges': instance.edges?.map((e) => e?.toJson()).toList(),
    };

SearchMentionUsers$Query$Search$Edges$Node$User
    _$SearchMentionUsers$Query$Search$Edges$Node$UserFromJson(
            Map<String, dynamic> json) =>
        SearchMentionUsers$Query$Search$Edges$Node$User()
          ..$$typename = json['__typename'] as String?
          ..login = json['login'] as String
          ..avatarUrl = Uri.parse(json['avatarUrl'] as String);

Map<String, dynamic> _$SearchMentionUsers$Query$Search$Edges$Node$UserToJson(
        SearchMentionUsers$Query$Search$Edges$Node$User instance) =>
    <String, dynamic>{
      '__typename': instance.$$typename,
      'login': instance.login,
      'avatarUrl': instance.avatarUrl.toString(),
    };

SearchMentionUsers$Query$Search$Edges$Node$Organization
    _$SearchMentionUsers$Query$Search$Edges$Node$OrganizationFromJson(
            Map<String, dynamic> json) =>
        SearchMentionUsers$Query$Search$Edges$Node$Organization()
          ..$$typename = json['__typename'] as String?
          ..login = json['login'] as String
          ..avatarUrl = Uri.parse(json['avatarUrl'] as String);

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
            Map<String, dynamic> json) =>
        SearchMentionUsers$Query$Search$Edges$Node()
          ..$$typename = json['__typename'] as String?;

Map<String, dynamic> _$SearchMentionUsers$Query$Search$Edges$NodeToJson(
        SearchMentionUsers$Query$Search$Edges$Node instance) =>
    <String, dynamic>{
      '__typename': instance.$$typename,
    };

SearchMentionUsers$Query$Search$Edges
    _$SearchMentionUsers$Query$Search$EdgesFromJson(
            Map<String, dynamic> json) =>
        SearchMentionUsers$Query$Search$Edges()
          ..node = json['node'] == null
              ? null
              : SearchMentionUsers$Query$Search$Edges$Node.fromJson(
                  json['node'] as Map<String, dynamic>)
          ..cursor = json['cursor'] as String;

Map<String, dynamic> _$SearchMentionUsers$Query$Search$EdgesToJson(
        SearchMentionUsers$Query$Search$Edges instance) =>
    <String, dynamic>{
      'node': instance.node?.toJson(),
      'cursor': instance.cursor,
    };

SearchMentionUsers$Query$Search _$SearchMentionUsers$Query$SearchFromJson(
        Map<String, dynamic> json) =>
    SearchMentionUsers$Query$Search()
      ..edges = (json['edges'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : SearchMentionUsers$Query$Search$Edges.fromJson(
                  e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$SearchMentionUsers$Query$SearchToJson(
        SearchMentionUsers$Query$Search instance) =>
    <String, dynamic>{
      'edges': instance.edges?.map((e) => e?.toJson()).toList(),
    };

SearchMentionUsers$Query _$SearchMentionUsers$QueryFromJson(
        Map<String, dynamic> json) =>
    SearchMentionUsers$Query()
      ..search = SearchMentionUsers$Query$Search.fromJson(
          json['search'] as Map<String, dynamic>);

Map<String, dynamic> _$SearchMentionUsers$QueryToJson(
        SearchMentionUsers$Query instance) =>
    <String, dynamic>{
      'search': instance.search.toJson(),
    };

GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$Owner
    _$GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$OwnerFromJson(
            Map<String, dynamic> json) =>
        GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$Owner()
          ..login = json['login'] as String;

Map<String, dynamic>
    _$GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$OwnerToJson(
            GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$Owner
                instance) =>
        <String, dynamic>{
          'login': instance.login,
        };

GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$Languages$Edges$Node
    _$GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$Languages$Edges$NodeFromJson(
            Map<String, dynamic> json) =>
        GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$Languages$Edges$Node()
          ..name = json['name'] as String;

Map<String, dynamic>
    _$GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$Languages$Edges$NodeToJson(
            GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$Languages$Edges$Node
                instance) =>
        <String, dynamic>{
          'name': instance.name,
        };

GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$Languages$Edges
    _$GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$Languages$EdgesFromJson(
            Map<String, dynamic> json) =>
        GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$Languages$Edges()
          ..node =
              GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$Languages$Edges$Node
                  .fromJson(json['node'] as Map<String, dynamic>);

Map<String, dynamic>
    _$GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$Languages$EdgesToJson(
            GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$Languages$Edges
                instance) =>
        <String, dynamic>{
          'node': instance.node.toJson(),
        };

GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$Languages
    _$GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$LanguagesFromJson(
            Map<String, dynamic> json) =>
        GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$Languages()
          ..edges = (json['edges'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$Languages$Edges
                      .fromJson(e as Map<String, dynamic>))
              .toList();

Map<String, dynamic>
    _$GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$LanguagesToJson(
            GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$Languages
                instance) =>
        <String, dynamic>{
          'edges': instance.edges?.map((e) => e?.toJson()).toList(),
        };

GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository
    _$GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$RepositoryFromJson(
            Map<String, dynamic> json) =>
        GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository()
          ..$$typename = json['__typename'] as String?
          ..name = json['name'] as String
          ..description = json['description'] as String?
          ..stargazerCount = json['stargazerCount'] as int
          ..updatedAt = DateTime.parse(json['updatedAt'] as String)
          ..url = Uri.parse(json['url'] as String)
          ..owner =
              GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$Owner
                  .fromJson(json['owner'] as Map<String, dynamic>)
          ..languages = json['languages'] == null
              ? null
              : GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$Languages
                  .fromJson(json['languages'] as Map<String, dynamic>);

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
          'owner': instance.owner.toJson(),
          'languages': instance.languages?.toJson(),
        };

GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node
    _$GetUserPinnedRepos$Query$User$PinnedItems$Edges$NodeFromJson(
            Map<String, dynamic> json) =>
        GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node()
          ..$$typename = json['__typename'] as String?;

Map<String, dynamic>
    _$GetUserPinnedRepos$Query$User$PinnedItems$Edges$NodeToJson(
            GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node instance) =>
        <String, dynamic>{
          '__typename': instance.$$typename,
        };

GetUserPinnedRepos$Query$User$PinnedItems$Edges
    _$GetUserPinnedRepos$Query$User$PinnedItems$EdgesFromJson(
            Map<String, dynamic> json) =>
        GetUserPinnedRepos$Query$User$PinnedItems$Edges()
          ..node = json['node'] == null
              ? null
              : GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node.fromJson(
                  json['node'] as Map<String, dynamic>);

Map<String, dynamic> _$GetUserPinnedRepos$Query$User$PinnedItems$EdgesToJson(
        GetUserPinnedRepos$Query$User$PinnedItems$Edges instance) =>
    <String, dynamic>{
      'node': instance.node?.toJson(),
    };

GetUserPinnedRepos$Query$User$PinnedItems
    _$GetUserPinnedRepos$Query$User$PinnedItemsFromJson(
            Map<String, dynamic> json) =>
        GetUserPinnedRepos$Query$User$PinnedItems()
          ..edges = (json['edges'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : GetUserPinnedRepos$Query$User$PinnedItems$Edges.fromJson(
                      e as Map<String, dynamic>))
              .toList();

Map<String, dynamic> _$GetUserPinnedRepos$Query$User$PinnedItemsToJson(
        GetUserPinnedRepos$Query$User$PinnedItems instance) =>
    <String, dynamic>{
      'edges': instance.edges?.map((e) => e?.toJson()).toList(),
    };

GetUserPinnedRepos$Query$User _$GetUserPinnedRepos$Query$UserFromJson(
        Map<String, dynamic> json) =>
    GetUserPinnedRepos$Query$User()
      ..pinnedItems = GetUserPinnedRepos$Query$User$PinnedItems.fromJson(
          json['pinnedItems'] as Map<String, dynamic>);

Map<String, dynamic> _$GetUserPinnedRepos$Query$UserToJson(
        GetUserPinnedRepos$Query$User instance) =>
    <String, dynamic>{
      'pinnedItems': instance.pinnedItems.toJson(),
    };

GetUserPinnedRepos$Query _$GetUserPinnedRepos$QueryFromJson(
        Map<String, dynamic> json) =>
    GetUserPinnedRepos$Query()
      ..user = json['user'] == null
          ? null
          : GetUserPinnedRepos$Query$User.fromJson(
              json['user'] as Map<String, dynamic>);

Map<String, dynamic> _$GetUserPinnedRepos$QueryToJson(
        GetUserPinnedRepos$Query instance) =>
    <String, dynamic>{
      'user': instance.user?.toJson(),
    };

FollowStatusInfo$Query$User$Followers
    _$FollowStatusInfo$Query$User$FollowersFromJson(
            Map<String, dynamic> json) =>
        FollowStatusInfo$Query$User$Followers()
          ..totalCount = json['totalCount'] as int;

Map<String, dynamic> _$FollowStatusInfo$Query$User$FollowersToJson(
        FollowStatusInfo$Query$User$Followers instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
    };

FollowStatusInfo$Query$User _$FollowStatusInfo$Query$UserFromJson(
        Map<String, dynamic> json) =>
    FollowStatusInfo$Query$User()
      ..id = json['id'] as String
      ..viewerIsFollowing = json['viewerIsFollowing'] as bool
      ..viewerCanFollow = json['viewerCanFollow'] as bool
      ..followers = FollowStatusInfo$Query$User$Followers.fromJson(
          json['followers'] as Map<String, dynamic>);

Map<String, dynamic> _$FollowStatusInfo$Query$UserToJson(
        FollowStatusInfo$Query$User instance) =>
    <String, dynamic>{
      'id': instance.id,
      'viewerIsFollowing': instance.viewerIsFollowing,
      'viewerCanFollow': instance.viewerCanFollow,
      'followers': instance.followers.toJson(),
    };

FollowStatusInfo$Query _$FollowStatusInfo$QueryFromJson(
        Map<String, dynamic> json) =>
    FollowStatusInfo$Query()
      ..user = json['user'] == null
          ? null
          : FollowStatusInfo$Query$User.fromJson(
              json['user'] as Map<String, dynamic>);

Map<String, dynamic> _$FollowStatusInfo$QueryToJson(
        FollowStatusInfo$Query instance) =>
    <String, dynamic>{
      'user': instance.user?.toJson(),
    };

FollowUser$Mutation$FollowUser$User
    _$FollowUser$Mutation$FollowUser$UserFromJson(Map<String, dynamic> json) =>
        FollowUser$Mutation$FollowUser$User()..login = json['login'] as String;

Map<String, dynamic> _$FollowUser$Mutation$FollowUser$UserToJson(
        FollowUser$Mutation$FollowUser$User instance) =>
    <String, dynamic>{
      'login': instance.login,
    };

FollowUser$Mutation$FollowUser _$FollowUser$Mutation$FollowUserFromJson(
        Map<String, dynamic> json) =>
    FollowUser$Mutation$FollowUser()
      ..user = json['user'] == null
          ? null
          : FollowUser$Mutation$FollowUser$User.fromJson(
              json['user'] as Map<String, dynamic>);

Map<String, dynamic> _$FollowUser$Mutation$FollowUserToJson(
        FollowUser$Mutation$FollowUser instance) =>
    <String, dynamic>{
      'user': instance.user?.toJson(),
    };

FollowUser$Mutation _$FollowUser$MutationFromJson(Map<String, dynamic> json) =>
    FollowUser$Mutation()
      ..followUser = json['followUser'] == null
          ? null
          : FollowUser$Mutation$FollowUser.fromJson(
              json['followUser'] as Map<String, dynamic>);

Map<String, dynamic> _$FollowUser$MutationToJson(
        FollowUser$Mutation instance) =>
    <String, dynamic>{
      'followUser': instance.followUser?.toJson(),
    };

UnfollowUser$Mutation$UnfollowUser$User
    _$UnfollowUser$Mutation$UnfollowUser$UserFromJson(
            Map<String, dynamic> json) =>
        UnfollowUser$Mutation$UnfollowUser$User()
          ..login = json['login'] as String;

Map<String, dynamic> _$UnfollowUser$Mutation$UnfollowUser$UserToJson(
        UnfollowUser$Mutation$UnfollowUser$User instance) =>
    <String, dynamic>{
      'login': instance.login,
    };

UnfollowUser$Mutation$UnfollowUser _$UnfollowUser$Mutation$UnfollowUserFromJson(
        Map<String, dynamic> json) =>
    UnfollowUser$Mutation$UnfollowUser()
      ..user = json['user'] == null
          ? null
          : UnfollowUser$Mutation$UnfollowUser$User.fromJson(
              json['user'] as Map<String, dynamic>);

Map<String, dynamic> _$UnfollowUser$Mutation$UnfollowUserToJson(
        UnfollowUser$Mutation$UnfollowUser instance) =>
    <String, dynamic>{
      'user': instance.user?.toJson(),
    };

UnfollowUser$Mutation _$UnfollowUser$MutationFromJson(
        Map<String, dynamic> json) =>
    UnfollowUser$Mutation()
      ..unfollowUser = json['unfollowUser'] == null
          ? null
          : UnfollowUser$Mutation$UnfollowUser.fromJson(
              json['unfollowUser'] as Map<String, dynamic>);

Map<String, dynamic> _$UnfollowUser$MutationToJson(
        UnfollowUser$Mutation instance) =>
    <String, dynamic>{
      'unfollowUser': instance.unfollowUser?.toJson(),
    };

GetParticipants$Query$Node$Issue$Participants$Edges$Node
    _$GetParticipants$Query$Node$Issue$Participants$Edges$NodeFromJson(
            Map<String, dynamic> json) =>
        GetParticipants$Query$Node$Issue$Participants$Edges$Node()
          ..avatarUrl = Uri.parse(json['avatarUrl'] as String)
          ..login = json['login'] as String;

Map<String,
    dynamic> _$GetParticipants$Query$Node$Issue$Participants$Edges$NodeToJson(
        GetParticipants$Query$Node$Issue$Participants$Edges$Node instance) =>
    <String, dynamic>{
      'avatarUrl': instance.avatarUrl.toString(),
      'login': instance.login,
    };

GetParticipants$Query$Node$Issue$Participants$Edges
    _$GetParticipants$Query$Node$Issue$Participants$EdgesFromJson(
            Map<String, dynamic> json) =>
        GetParticipants$Query$Node$Issue$Participants$Edges()
          ..cursor = json['cursor'] as String
          ..node = json['node'] == null
              ? null
              : GetParticipants$Query$Node$Issue$Participants$Edges$Node
                  .fromJson(json['node'] as Map<String, dynamic>);

Map<String, dynamic>
    _$GetParticipants$Query$Node$Issue$Participants$EdgesToJson(
            GetParticipants$Query$Node$Issue$Participants$Edges instance) =>
        <String, dynamic>{
          'cursor': instance.cursor,
          'node': instance.node?.toJson(),
        };

GetParticipants$Query$Node$Issue$Participants
    _$GetParticipants$Query$Node$Issue$ParticipantsFromJson(
            Map<String, dynamic> json) =>
        GetParticipants$Query$Node$Issue$Participants()
          ..edges = (json['edges'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : GetParticipants$Query$Node$Issue$Participants$Edges
                      .fromJson(e as Map<String, dynamic>))
              .toList();

Map<String, dynamic> _$GetParticipants$Query$Node$Issue$ParticipantsToJson(
        GetParticipants$Query$Node$Issue$Participants instance) =>
    <String, dynamic>{
      'edges': instance.edges?.map((e) => e?.toJson()).toList(),
    };

GetParticipants$Query$Node$Issue _$GetParticipants$Query$Node$IssueFromJson(
        Map<String, dynamic> json) =>
    GetParticipants$Query$Node$Issue()
      ..$$typename = json['__typename'] as String?
      ..participants = GetParticipants$Query$Node$Issue$Participants.fromJson(
          json['participants'] as Map<String, dynamic>);

Map<String, dynamic> _$GetParticipants$Query$Node$IssueToJson(
        GetParticipants$Query$Node$Issue instance) =>
    <String, dynamic>{
      '__typename': instance.$$typename,
      'participants': instance.participants.toJson(),
    };

GetParticipants$Query$Node _$GetParticipants$Query$NodeFromJson(
        Map<String, dynamic> json) =>
    GetParticipants$Query$Node()..$$typename = json['__typename'] as String?;

Map<String, dynamic> _$GetParticipants$Query$NodeToJson(
        GetParticipants$Query$Node instance) =>
    <String, dynamic>{
      '__typename': instance.$$typename,
    };

GetParticipants$Query _$GetParticipants$QueryFromJson(
        Map<String, dynamic> json) =>
    GetParticipants$Query()
      ..node = json['node'] == null
          ? null
          : GetParticipants$Query$Node.fromJson(
              json['node'] as Map<String, dynamic>);

Map<String, dynamic> _$GetParticipants$QueryToJson(
        GetParticipants$Query instance) =>
    <String, dynamic>{
      'node': instance.node?.toJson(),
    };

GetRepoProjectsArguments _$GetRepoProjectsArgumentsFromJson(
        Map<String, dynamic> json) =>
    GetRepoProjectsArguments(
      name: json['name'] as String,
      owner: json['owner'] as String,
      cursor: json['cursor'] as String?,
      query: json['query'] as String?,
      states: (json['states'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$ProjectStateEnumMap, e,
              unknownValue: ProjectState.artemisUnknown))
          .toList(),
      orderByField: $enumDecode(
          _$ProjectOrderFieldEnumMap, json['orderByField'],
          unknownValue: ProjectOrderField.artemisUnknown),
      orderByDir: $enumDecode(_$OrderDirectionEnumMap, json['orderByDir'],
          unknownValue: OrderDirection.artemisUnknown),
    );

Map<String, dynamic> _$GetRepoProjectsArgumentsToJson(
        GetRepoProjectsArguments instance) =>
    <String, dynamic>{
      'name': instance.name,
      'owner': instance.owner,
      'cursor': instance.cursor,
      'query': instance.query,
      'states': instance.states?.map((e) => _$ProjectStateEnumMap[e]!).toList(),
      'orderByField': _$ProjectOrderFieldEnumMap[instance.orderByField]!,
      'orderByDir': _$OrderDirectionEnumMap[instance.orderByDir]!,
    };

const _$ProjectStateEnumMap = {
  ProjectState.closed: 'CLOSED',
  ProjectState.open: 'OPEN',
  ProjectState.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

const _$ProjectOrderFieldEnumMap = {
  ProjectOrderField.createdAt: 'CREATED_AT',
  ProjectOrderField.name: 'NAME',
  ProjectOrderField.updatedAt: 'UPDATED_AT',
  ProjectOrderField.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

const _$OrderDirectionEnumMap = {
  OrderDirection.asc: 'ASC',
  OrderDirection.desc: 'DESC',
  OrderDirection.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

GetProjectInfoArguments _$GetProjectInfoArgumentsFromJson(
        Map<String, dynamic> json) =>
    GetProjectInfoArguments(
      id: json['id'] as String,
    );

Map<String, dynamic> _$GetProjectInfoArgumentsToJson(
        GetProjectInfoArguments instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

GetProjectColumnsArguments _$GetProjectColumnsArgumentsFromJson(
        Map<String, dynamic> json) =>
    GetProjectColumnsArguments(
      id: json['id'] as String,
      cursor: json['cursor'] as String?,
    );

Map<String, dynamic> _$GetProjectColumnsArgumentsToJson(
        GetProjectColumnsArguments instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cursor': instance.cursor,
    };

GetProjectColumnCardsArguments _$GetProjectColumnCardsArgumentsFromJson(
        Map<String, dynamic> json) =>
    GetProjectColumnCardsArguments(
      id: json['id'] as String,
      cursor: json['cursor'] as String?,
      archiveStates: (json['archiveStates'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$ProjectCardArchivedStateEnumMap, e,
              unknownValue: ProjectCardArchivedState.artemisUnknown))
          .toList(),
    );

Map<String, dynamic> _$GetProjectColumnCardsArgumentsToJson(
        GetProjectColumnCardsArguments instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cursor': instance.cursor,
      'archiveStates': instance.archiveStates
          ?.map((e) => _$ProjectCardArchivedStateEnumMap[e]!)
          .toList(),
    };

const _$ProjectCardArchivedStateEnumMap = {
  ProjectCardArchivedState.archived: 'ARCHIVED',
  ProjectCardArchivedState.notArchived: 'NOT_ARCHIVED',
  ProjectCardArchivedState.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

IssueTemplatesArguments _$IssueTemplatesArgumentsFromJson(
        Map<String, dynamic> json) =>
    IssueTemplatesArguments(
      name: json['name'] as String,
      owner: json['owner'] as String,
    );

Map<String, dynamic> _$IssueTemplatesArgumentsToJson(
        IssueTemplatesArguments instance) =>
    <String, dynamic>{
      'name': instance.name,
      'owner': instance.owner,
    };

PinnedIssuesArguments _$PinnedIssuesArgumentsFromJson(
        Map<String, dynamic> json) =>
    PinnedIssuesArguments(
      name: json['name'] as String,
      owner: json['owner'] as String,
    );

Map<String, dynamic> _$PinnedIssuesArgumentsToJson(
        PinnedIssuesArguments instance) =>
    <String, dynamic>{
      'name': instance.name,
      'owner': instance.owner,
    };

HasStarredArguments _$HasStarredArgumentsFromJson(Map<String, dynamic> json) =>
    HasStarredArguments(
      name: json['name'] as String,
      owner: json['owner'] as String,
    );

Map<String, dynamic> _$HasStarredArgumentsToJson(
        HasStarredArguments instance) =>
    <String, dynamic>{
      'name': instance.name,
      'owner': instance.owner,
    };

HasWatchedArguments _$HasWatchedArgumentsFromJson(Map<String, dynamic> json) =>
    HasWatchedArguments(
      name: json['name'] as String,
      owner: json['owner'] as String,
    );

Map<String, dynamic> _$HasWatchedArgumentsToJson(
        HasWatchedArguments instance) =>
    <String, dynamic>{
      'name': instance.name,
      'owner': instance.owner,
    };

GetViewerOrgsArguments _$GetViewerOrgsArgumentsFromJson(
        Map<String, dynamic> json) =>
    GetViewerOrgsArguments(
      cursor: json['cursor'] as String?,
    );

Map<String, dynamic> _$GetViewerOrgsArgumentsToJson(
        GetViewerOrgsArguments instance) =>
    <String, dynamic>{
      'cursor': instance.cursor,
    };

GetTimelineArguments _$GetTimelineArgumentsFromJson(
        Map<String, dynamic> json) =>
    GetTimelineArguments(
      repoName: json['repoName'] as String,
      owner: json['owner'] as String,
      number: json['number'] as int,
      after: json['after'] as String?,
      since: json['since'] == null
          ? null
          : DateTime.parse(json['since'] as String),
    );

Map<String, dynamic> _$GetTimelineArgumentsToJson(
        GetTimelineArguments instance) =>
    <String, dynamic>{
      'repoName': instance.repoName,
      'owner': instance.owner,
      'number': instance.number,
      'after': instance.after,
      'since': instance.since?.toIso8601String(),
    };

GetPRReviewCommentsArguments _$GetPRReviewCommentsArgumentsFromJson(
        Map<String, dynamic> json) =>
    GetPRReviewCommentsArguments(
      id: json['id'] as String,
      cursor: json['cursor'] as String?,
    );

Map<String, dynamic> _$GetPRReviewCommentsArgumentsToJson(
        GetPRReviewCommentsArguments instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cursor': instance.cursor,
    };

ReviewThreadFirstCommentQueryArguments
    _$ReviewThreadFirstCommentQueryArgumentsFromJson(
            Map<String, dynamic> json) =>
        ReviewThreadFirstCommentQueryArguments(
          name: json['name'] as String,
          owner: json['owner'] as String,
          number: json['number'] as int,
          cursor: json['cursor'] as String?,
        );

Map<String, dynamic> _$ReviewThreadFirstCommentQueryArgumentsToJson(
        ReviewThreadFirstCommentQueryArguments instance) =>
    <String, dynamic>{
      'name': instance.name,
      'owner': instance.owner,
      'number': instance.number,
      'cursor': instance.cursor,
    };

ReviewThreadCommentsQueryArguments _$ReviewThreadCommentsQueryArgumentsFromJson(
        Map<String, dynamic> json) =>
    ReviewThreadCommentsQueryArguments(
      nodeID: json['nodeID'] as String,
      cursor: json['cursor'] as String?,
    );

Map<String, dynamic> _$ReviewThreadCommentsQueryArgumentsToJson(
        ReviewThreadCommentsQueryArguments instance) =>
    <String, dynamic>{
      'nodeID': instance.nodeID,
      'cursor': instance.cursor,
    };

CheckPendingViewerReviewsArguments _$CheckPendingViewerReviewsArgumentsFromJson(
        Map<String, dynamic> json) =>
    CheckPendingViewerReviewsArguments(
      pullNodeID: json['pullNodeID'] as String,
      author: json['author'] as String,
    );

Map<String, dynamic> _$CheckPendingViewerReviewsArgumentsToJson(
        CheckPendingViewerReviewsArguments instance) =>
    <String, dynamic>{
      'pullNodeID': instance.pullNodeID,
      'author': instance.author,
    };

FetchReviewArguments _$FetchReviewArgumentsFromJson(
        Map<String, dynamic> json) =>
    FetchReviewArguments(
      id: json['id'] as String,
    );

Map<String, dynamic> _$FetchReviewArgumentsToJson(
        FetchReviewArguments instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

IssuePullInfoArguments _$IssuePullInfoArgumentsFromJson(
        Map<String, dynamic> json) =>
    IssuePullInfoArguments(
      user: json['user'] as String,
      repo: json['repo'] as String,
      number: json['number'] as int,
    );

Map<String, dynamic> _$IssuePullInfoArgumentsToJson(
        IssuePullInfoArguments instance) =>
    <String, dynamic>{
      'user': instance.user,
      'repo': instance.repo,
      'number': instance.number,
    };

GetReactorsArguments _$GetReactorsArgumentsFromJson(
        Map<String, dynamic> json) =>
    GetReactorsArguments(
      id: json['id'] as String,
    );

Map<String, dynamic> _$GetReactorsArgumentsToJson(
        GetReactorsArguments instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

AddReactionArguments _$AddReactionArgumentsFromJson(
        Map<String, dynamic> json) =>
    AddReactionArguments(
      id: json['id'] as String,
      content: $enumDecode(_$ReactionContentEnumMap, json['content'],
          unknownValue: ReactionContent.artemisUnknown),
    );

Map<String, dynamic> _$AddReactionArgumentsToJson(
        AddReactionArguments instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': _$ReactionContentEnumMap[instance.content]!,
    };

RemoveReactionArguments _$RemoveReactionArgumentsFromJson(
        Map<String, dynamic> json) =>
    RemoveReactionArguments(
      id: json['id'] as String,
      content: $enumDecode(_$ReactionContentEnumMap, json['content'],
          unknownValue: ReactionContent.artemisUnknown),
    );

Map<String, dynamic> _$RemoveReactionArgumentsToJson(
        RemoveReactionArguments instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': _$ReactionContentEnumMap[instance.content]!,
    };

IssuePullAssigneesArguments _$IssuePullAssigneesArgumentsFromJson(
        Map<String, dynamic> json) =>
    IssuePullAssigneesArguments(
      user: json['user'] as String,
      repo: json['repo'] as String,
      number: json['number'] as int,
      after: json['after'] as String?,
    );

Map<String, dynamic> _$IssuePullAssigneesArgumentsToJson(
        IssuePullAssigneesArguments instance) =>
    <String, dynamic>{
      'user': instance.user,
      'repo': instance.repo,
      'number': instance.number,
      'after': instance.after,
    };

SearchMentionUsersArguments _$SearchMentionUsersArgumentsFromJson(
        Map<String, dynamic> json) =>
    SearchMentionUsersArguments(
      query: json['query'] as String,
      after: json['after'] as String?,
    );

Map<String, dynamic> _$SearchMentionUsersArgumentsToJson(
        SearchMentionUsersArguments instance) =>
    <String, dynamic>{
      'query': instance.query,
      'after': instance.after,
    };

GetUserPinnedReposArguments _$GetUserPinnedReposArgumentsFromJson(
        Map<String, dynamic> json) =>
    GetUserPinnedReposArguments(
      user: json['user'] as String,
    );

Map<String, dynamic> _$GetUserPinnedReposArgumentsToJson(
        GetUserPinnedReposArguments instance) =>
    <String, dynamic>{
      'user': instance.user,
    };

FollowStatusInfoArguments _$FollowStatusInfoArgumentsFromJson(
        Map<String, dynamic> json) =>
    FollowStatusInfoArguments(
      user: json['user'] as String,
    );

Map<String, dynamic> _$FollowStatusInfoArgumentsToJson(
        FollowStatusInfoArguments instance) =>
    <String, dynamic>{
      'user': instance.user,
    };

FollowUserArguments _$FollowUserArgumentsFromJson(Map<String, dynamic> json) =>
    FollowUserArguments(
      user: json['user'] as String,
    );

Map<String, dynamic> _$FollowUserArgumentsToJson(
        FollowUserArguments instance) =>
    <String, dynamic>{
      'user': instance.user,
    };

UnfollowUserArguments _$UnfollowUserArgumentsFromJson(
        Map<String, dynamic> json) =>
    UnfollowUserArguments(
      user: json['user'] as String,
    );

Map<String, dynamic> _$UnfollowUserArgumentsToJson(
        UnfollowUserArguments instance) =>
    <String, dynamic>{
      'user': instance.user,
    };

GetParticipantsArguments _$GetParticipantsArgumentsFromJson(
        Map<String, dynamic> json) =>
    GetParticipantsArguments(
      id: json['id'] as String,
      after: json['after'] as String?,
    );

Map<String, dynamic> _$GetParticipantsArgumentsToJson(
        GetParticipantsArguments instance) =>
    <String, dynamic>{
      'id': instance.id,
      'after': instance.after,
    };
