// To parse this JSON data, do
//
//     final issuesTimelineEventModel = issuesTimelineEventModelFromJson(jsonString);

import 'dart:convert';

import 'package:onehub/models/issues/issue_model.dart';
import 'package:onehub/models/users/user_info_model.dart';

class IssuesTimelineEventModel {
  IssuesTimelineEventModel({
    this.id,
    this.nodeId,
    this.url,
    this.actor,
    this.event,
    this.commitId,
    this.commitUrl,
    this.createdAt,
    this.performedViaGithubApp,
    this.rename,
    this.assignee,
    this.htmlUrl,
    this.issueUrl,
    this.user,
    this.updatedAt,
    this.authorAssociation,
    this.body,
    this.source,
  });

  int id;
  String nodeId;
  String url;
  UserInfoModel actor;
  Event event;
  dynamic commitId;
  dynamic commitUrl;
  DateTime createdAt;
  dynamic performedViaGithubApp;
  Rename rename;
  UserInfoModel assignee;
  String htmlUrl;
  String issueUrl;
  UserInfoModel user;
  DateTime updatedAt;
  AuthorAssociation authorAssociation;
  String body;
  Source source;

  IssuesTimelineEventModel copyWith({
    int id,
    String nodeId,
    String url,
    UserInfoModel actor,
    Event event,
    dynamic commitId,
    dynamic commitUrl,
    DateTime createdAt,
    dynamic performedViaGithubApp,
    Rename rename,
    UserInfoModel assignee,
    String htmlUrl,
    String issueUrl,
    UserInfoModel user,
    DateTime updatedAt,
    AuthorAssociation authorAssociation,
    String body,
    Source source,
  }) =>
      IssuesTimelineEventModel(
        id: id ?? this.id,
        nodeId: nodeId ?? this.nodeId,
        url: url ?? this.url,
        actor: actor ?? this.actor,
        event: event ?? this.event,
        commitId: commitId ?? this.commitId,
        commitUrl: commitUrl ?? this.commitUrl,
        createdAt: createdAt ?? this.createdAt,
        performedViaGithubApp:
            performedViaGithubApp ?? this.performedViaGithubApp,
        rename: rename ?? this.rename,
        assignee: assignee ?? this.assignee,
        htmlUrl: htmlUrl ?? this.htmlUrl,
        issueUrl: issueUrl ?? this.issueUrl,
        user: user ?? this.user,
        updatedAt: updatedAt ?? this.updatedAt,
        authorAssociation: authorAssociation ?? this.authorAssociation,
        body: body ?? this.body,
        source: source ?? this.source,
      );

  factory IssuesTimelineEventModel.fromRawJson(String str) =>
      IssuesTimelineEventModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory IssuesTimelineEventModel.fromJson(Map<String, dynamic> json) =>
      IssuesTimelineEventModel(
        id: json["id"] == null ? null : json["id"],
        nodeId: json["node_id"] == null ? null : json["node_id"],
        url: json["url"] == null ? null : json["url"],
        actor: json["actor"] == null
            ? null
            : UserInfoModel.fromJson(json["actor"]),
        event: json["event"] == null ? null : eventValues.map[json["event"]],
        commitId: json["commit_id"],
        commitUrl: json["commit_url"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        performedViaGithubApp: json["performed_via_github_app"],
        rename: json["rename"] == null ? null : Rename.fromJson(json["rename"]),
        assignee: json["assignee"] == null
            ? null
            : UserInfoModel.fromJson(json["assignee"]),
        htmlUrl: json["html_url"] == null ? null : json["html_url"],
        issueUrl: json["issue_url"] == null ? null : json["issue_url"],
        user:
            json["user"] == null ? null : UserInfoModel.fromJson(json["user"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        authorAssociation: json["author_association"] == null
            ? null
            : authorAssociationValues.map[json["author_association"]],
        body: json["body"] == null ? null : json["body"],
        source: json["source"] == null ? null : Source.fromJson(json["source"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "node_id": nodeId == null ? null : nodeId,
        "url": url == null ? null : url,
        "actor": actor == null ? null : actor.toJson(),
        "event": event == null ? null : eventValues.reverse[event],
        "commit_id": commitId,
        "commit_url": commitUrl,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "performed_via_github_app": performedViaGithubApp,
        "rename": rename == null ? null : rename.toJson(),
        "assignee": assignee == null ? null : assignee.toJson(),
        "html_url": htmlUrl == null ? null : htmlUrl,
        "issue_url": issueUrl == null ? null : issueUrl,
        "user": user == null ? null : user.toJson(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "author_association": authorAssociation == null
            ? null
            : authorAssociationValues.reverse[authorAssociation],
        "body": body == null ? null : body,
        "source": source == null ? null : source.toJson(),
      };
}

enum ActorType { USER, ORGANIZATION }

final actorTypeValues = EnumValues(
    {"Organization": ActorType.ORGANIZATION, "User": ActorType.USER});

enum AuthorAssociation { CONTRIBUTOR, MEMBER, NONE, COLLABORATOR }

final authorAssociationValues = EnumValues({
  "COLLABORATOR": AuthorAssociation.COLLABORATOR,
  "CONTRIBUTOR": AuthorAssociation.CONTRIBUTOR,
  "MEMBER": AuthorAssociation.MEMBER,
  "NONE": AuthorAssociation.NONE
});

enum Event {
  added_to_project,
  assigned,
  automatic_base_change_failed,
  automatic_base_change_succeeded,
  base_ref_changed,
  closed,
  commented,
  committed,
  connected,
  convert_to_draft,
  converted_note_to_issue,
  cross_referenced,
  demilestoned,
  deployed,
  deployment_environment_changed,
  disconnected,
  head_ref_deleted,
  head_ref_restored,
  labeled,
  locked,
  mentioned,
  marked_as_duplicate,
  merged,
  milestoned,
  moved_columns_in_project,
  pinned,
  ready_for_review,
  referenced,
  removed_from_project,
  renamed,
  reopened,
  review_dismissed,
  review_requested,
  review_request_removed,
  reviewed,
  subscribed,
  transferred,
  unassigned,
  unlabeled,
  unlocked,
  unmarked_as_duplicate,
  unpinned,
  unsubscribed,
  user_blocked,
}

final eventValues = EnumValues({
  "added_to_project": Event.added_to_project,
  "assigned": Event.assigned,
  "automatic_base_change_failed": Event.automatic_base_change_failed,
  "automatic_base_change_succeeded": Event.automatic_base_change_succeeded,
  "base_ref_changed": Event.base_ref_changed,
  "closed": Event.closed,
  "commented": Event.commented,
  "committed": Event.committed,
  "connected": Event.connected,
  "convert_to_draft": Event.convert_to_draft,
  "converted_note_to_issue": Event.converted_note_to_issue,
  "cross-referenced": Event.cross_referenced,
  "demilestoned": Event.demilestoned,
  "deployed": Event.deployed,
  "deployment_environment_changed": Event.deployment_environment_changed,
  "disconnected": Event.disconnected,
  "head_ref_deleted": Event.head_ref_deleted,
  "head_ref_restored": Event.head_ref_restored,
  "labeled": Event.labeled,
  "locked": Event.locked,
  "mentioned": Event.mentioned,
  "marked_as_duplicate": Event.marked_as_duplicate,
  "merged": Event.merged,
  "milestoned": Event.milestoned,
  "moved_columns_in_project": Event.moved_columns_in_project,
  "pinned": Event.pinned,
  "ready_for_review": Event.ready_for_review,
  "referenced": Event.referenced,
  "removed_from_project": Event.removed_from_project,
  "renamed": Event.renamed,
  "reopened": Event.reopened,
  "review_dismissed": Event.review_dismissed,
  "review_requested": Event.review_requested,
  "review_request_removed": Event.review_request_removed,
  "reviewed": Event.reviewed,
  "subscribed": Event.subscribed,
  "transferred": Event.transferred,
  "unassigned": Event.unassigned,
  "unlabeled": Event.unlabeled,
  "unlocked": Event.unlocked,
  "unmarked_as_duplicate": Event.unmarked_as_duplicate,
  "unpinned": Event.unpinned,
  "unsubscribed": Event.unsubscribed,
  "user_blocked": Event.user_blocked,
});

class Rename {
  Rename({
    this.from,
    this.to,
  });

  String from;
  String to;

  Rename copyWith({
    String from,
    String to,
  }) =>
      Rename(
        from: from ?? this.from,
        to: to ?? this.to,
      );

  factory Rename.fromRawJson(String str) => Rename.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Rename.fromJson(Map<String, dynamic> json) => Rename(
        from: json["from"] == null ? null : json["from"],
        to: json["to"] == null ? null : json["to"],
      );

  Map<String, dynamic> toJson() => {
        "from": from == null ? null : from,
        "to": to == null ? null : to,
      };
}

class Source {
  Source({
    this.type,
    this.issue,
  });

  SourceType type;
  Issue issue;

  Source copyWith({
    SourceType type,
    Issue issue,
  }) =>
      Source(
        type: type ?? this.type,
        issue: issue ?? this.issue,
      );

  factory Source.fromRawJson(String str) => Source.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        type: json["type"] == null ? null : sourceTypeValues.map[json["type"]],
        issue: json["issue"] == null ? null : Issue.fromJson(json["issue"]),
      );

  Map<String, dynamic> toJson() => {
        "type": type == null ? null : sourceTypeValues.reverse[type],
        "issue": issue == null ? null : issue.toJson(),
      };
}

class Issue {
  Issue({
    this.url,
    this.repositoryUrl,
    this.labelsUrl,
    this.commentsUrl,
    this.eventsUrl,
    this.htmlUrl,
    this.id,
    this.nodeId,
    this.number,
    this.title,
    this.user,
    this.labels,
    this.state,
    this.locked,
    this.assignee,
    this.assignees,
    this.milestone,
    this.comments,
    this.createdAt,
    this.updatedAt,
    this.closedAt,
    this.authorAssociation,
    this.activeLockReason,
    this.repository,
    this.body,
    this.timelineUrl,
    this.performedViaGithubApp,
    this.pullRequest,
  });

  String url;
  String repositoryUrl;
  String labelsUrl;
  String commentsUrl;
  String eventsUrl;
  String htmlUrl;
  int id;
  String nodeId;
  int number;
  String title;
  UserInfoModel user;
  List<Label> labels;
  IssueState state;
  bool locked;
  UserInfoModel assignee;
  List<UserInfoModel> assignees;
  dynamic milestone;
  int comments;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime closedAt;
  AuthorAssociation authorAssociation;
  dynamic activeLockReason;
  Repository repository;
  String body;
  String timelineUrl;
  dynamic performedViaGithubApp;
  PullRequest pullRequest;

  Issue copyWith({
    String url,
    String repositoryUrl,
    String labelsUrl,
    String commentsUrl,
    String eventsUrl,
    String htmlUrl,
    int id,
    String nodeId,
    int number,
    String title,
    UserInfoModel user,
    List<Label> labels,
    IssueState state,
    bool locked,
    UserInfoModel assignee,
    List<UserInfoModel> assignees,
    dynamic milestone,
    int comments,
    DateTime createdAt,
    DateTime updatedAt,
    DateTime closedAt,
    AuthorAssociation authorAssociation,
    dynamic activeLockReason,
    Repository repository,
    String body,
    String timelineUrl,
    dynamic performedViaGithubApp,
    PullRequest pullRequest,
  }) =>
      Issue(
        url: url ?? this.url,
        repositoryUrl: repositoryUrl ?? this.repositoryUrl,
        labelsUrl: labelsUrl ?? this.labelsUrl,
        commentsUrl: commentsUrl ?? this.commentsUrl,
        eventsUrl: eventsUrl ?? this.eventsUrl,
        htmlUrl: htmlUrl ?? this.htmlUrl,
        id: id ?? this.id,
        nodeId: nodeId ?? this.nodeId,
        number: number ?? this.number,
        title: title ?? this.title,
        user: user ?? this.user,
        labels: labels ?? this.labels,
        state: state ?? this.state,
        locked: locked ?? this.locked,
        assignee: assignee ?? this.assignee,
        assignees: assignees ?? this.assignees,
        milestone: milestone ?? this.milestone,
        comments: comments ?? this.comments,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        closedAt: closedAt ?? this.closedAt,
        authorAssociation: authorAssociation ?? this.authorAssociation,
        activeLockReason: activeLockReason ?? this.activeLockReason,
        repository: repository ?? this.repository,
        body: body ?? this.body,
        timelineUrl: timelineUrl ?? this.timelineUrl,
        performedViaGithubApp:
            performedViaGithubApp ?? this.performedViaGithubApp,
        pullRequest: pullRequest ?? this.pullRequest,
      );

  factory Issue.fromRawJson(String str) => Issue.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Issue.fromJson(Map<String, dynamic> json) => Issue(
        url: json["url"] == null ? null : json["url"],
        repositoryUrl:
            json["repository_url"] == null ? null : json["repository_url"],
        labelsUrl: json["labels_url"] == null ? null : json["labels_url"],
        commentsUrl: json["comments_url"] == null ? null : json["comments_url"],
        eventsUrl: json["events_url"] == null ? null : json["events_url"],
        htmlUrl: json["html_url"] == null ? null : json["html_url"],
        id: json["id"] == null ? null : json["id"],
        nodeId: json["node_id"] == null ? null : json["node_id"],
        number: json["number"] == null ? null : json["number"],
        title: json["title"] == null ? null : json["title"],
        user:
            json["user"] == null ? null : UserInfoModel.fromJson(json["user"]),
        labels: json["labels"] == null
            ? null
            : List<Label>.from(json["labels"].map((x) => Label.fromJson(x))),
        state: json["state"] == null ? null : stateValues.map[json["state"]],
        locked: json["locked"] == null ? null : json["locked"],
        assignee: json["assignee"] == null
            ? null
            : UserInfoModel.fromJson(json["assignee"]),
        assignees: json["assignees"] == null
            ? null
            : List<UserInfoModel>.from(
                json["assignees"].map((x) => UserInfoModel.fromJson(x))),
        milestone: json["milestone"],
        comments: json["comments"] == null ? null : json["comments"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        closedAt: json["closed_at"] == null
            ? null
            : DateTime.parse(json["closed_at"]),
        authorAssociation: json["author_association"] == null
            ? null
            : authorAssociationValues.map[json["author_association"]],
        activeLockReason: json["active_lock_reason"],
        repository: json["repository"] == null
            ? null
            : Repository.fromJson(json["repository"]),
        body: json["body"] == null ? null : json["body"],
        timelineUrl: json["timeline_url"] == null ? null : json["timeline_url"],
        performedViaGithubApp: json["performed_via_github_app"],
        pullRequest: json["pull_request"] == null
            ? null
            : PullRequest.fromJson(json["pull_request"]),
      );

  Map<String, dynamic> toJson() => {
        "url": url == null ? null : url,
        "repository_url": repositoryUrl == null ? null : repositoryUrl,
        "labels_url": labelsUrl == null ? null : labelsUrl,
        "comments_url": commentsUrl == null ? null : commentsUrl,
        "events_url": eventsUrl == null ? null : eventsUrl,
        "html_url": htmlUrl == null ? null : htmlUrl,
        "id": id == null ? null : id,
        "node_id": nodeId == null ? null : nodeId,
        "number": number == null ? null : number,
        "title": title == null ? null : title,
        "user": user == null ? null : user.toJson(),
        "labels": labels == null
            ? null
            : List<dynamic>.from(labels.map((x) => x.toJson())),
        "state": state == null ? null : stateValues.reverse[state],
        "locked": locked == null ? null : locked,
        "assignee": assignee == null ? null : assignee.toJson(),
        "assignees": assignees == null
            ? null
            : List<dynamic>.from(assignees.map((x) => x.toJson())),
        "milestone": milestone,
        "comments": comments == null ? null : comments,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "closed_at": closedAt == null ? null : closedAt.toIso8601String(),
        "author_association": authorAssociation == null
            ? null
            : authorAssociationValues.reverse[authorAssociation],
        "active_lock_reason": activeLockReason,
        "repository": repository == null ? null : repository.toJson(),
        "body": body == null ? null : body,
        "timeline_url": timelineUrl == null ? null : timelineUrl,
        "performed_via_github_app": performedViaGithubApp,
        "pull_request": pullRequest == null ? null : pullRequest.toJson(),
      };
}

class PullRequest {
  PullRequest({
    this.url,
    this.htmlUrl,
    this.diffUrl,
    this.patchUrl,
  });

  String url;
  String htmlUrl;
  String diffUrl;
  String patchUrl;

  PullRequest copyWith({
    String url,
    String htmlUrl,
    String diffUrl,
    String patchUrl,
  }) =>
      PullRequest(
        url: url ?? this.url,
        htmlUrl: htmlUrl ?? this.htmlUrl,
        diffUrl: diffUrl ?? this.diffUrl,
        patchUrl: patchUrl ?? this.patchUrl,
      );

  factory PullRequest.fromRawJson(String str) =>
      PullRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PullRequest.fromJson(Map<String, dynamic> json) => PullRequest(
        url: json["url"] == null ? null : json["url"],
        htmlUrl: json["html_url"] == null ? null : json["html_url"],
        diffUrl: json["diff_url"] == null ? null : json["diff_url"],
        patchUrl: json["patch_url"] == null ? null : json["patch_url"],
      );

  Map<String, dynamic> toJson() => {
        "url": url == null ? null : url,
        "html_url": htmlUrl == null ? null : htmlUrl,
        "diff_url": diffUrl == null ? null : diffUrl,
        "patch_url": patchUrl == null ? null : patchUrl,
      };
}

class Repository {
  Repository({
    this.id,
    this.nodeId,
    this.name,
    this.fullName,
    this.private,
    this.owner,
    this.htmlUrl,
    this.description,
    this.fork,
    this.url,
    this.forksUrl,
    this.keysUrl,
    this.collaboratorsUrl,
    this.teamsUrl,
    this.hooksUrl,
    this.issueEventsUrl,
    this.eventsUrl,
    this.assigneesUrl,
    this.branchesUrl,
    this.tagsUrl,
    this.blobsUrl,
    this.gitTagsUrl,
    this.gitRefsUrl,
    this.treesUrl,
    this.statusesUrl,
    this.languagesUrl,
    this.stargazersUrl,
    this.contributorsUrl,
    this.subscribersUrl,
    this.subscriptionUrl,
    this.commitsUrl,
    this.gitCommitsUrl,
    this.commentsUrl,
    this.issueCommentUrl,
    this.contentsUrl,
    this.compareUrl,
    this.mergesUrl,
    this.archiveUrl,
    this.downloadsUrl,
    this.issuesUrl,
    this.pullsUrl,
    this.milestonesUrl,
    this.notificationsUrl,
    this.labelsUrl,
    this.releasesUrl,
    this.deploymentsUrl,
    this.createdAt,
    this.updatedAt,
    this.pushedAt,
    this.gitUrl,
    this.sshUrl,
    this.cloneUrl,
    this.svnUrl,
    this.homepage,
    this.size,
    this.stargazersCount,
    this.watchersCount,
    this.language,
    this.hasIssues,
    this.hasProjects,
    this.hasDownloads,
    this.hasWiki,
    this.hasPages,
    this.forksCount,
    this.mirrorUrl,
    this.archived,
    this.disabled,
    this.openIssuesCount,
    this.license,
    this.forks,
    this.openIssues,
    this.watchers,
    this.defaultBranch,
    this.permissions,
  });

  int id;
  RepositoryNodeId nodeId;
  RepositoryName name;
  FullName fullName;
  bool private;
  UserInfoModel owner;
  String htmlUrl;
  Description description;
  bool fork;
  String url;
  String forksUrl;
  String keysUrl;
  String collaboratorsUrl;
  String teamsUrl;
  String hooksUrl;
  String issueEventsUrl;
  String eventsUrl;
  String assigneesUrl;
  String branchesUrl;
  String tagsUrl;
  String blobsUrl;
  String gitTagsUrl;
  String gitRefsUrl;
  String treesUrl;
  String statusesUrl;
  String languagesUrl;
  String stargazersUrl;
  String contributorsUrl;
  String subscribersUrl;
  String subscriptionUrl;
  String commitsUrl;
  String gitCommitsUrl;
  String commentsUrl;
  String issueCommentUrl;
  String contentsUrl;
  String compareUrl;
  String mergesUrl;
  String archiveUrl;
  String downloadsUrl;
  String issuesUrl;
  String pullsUrl;
  String milestonesUrl;
  String notificationsUrl;
  String labelsUrl;
  String releasesUrl;
  String deploymentsUrl;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime pushedAt;
  GitUrl gitUrl;
  SshUrl sshUrl;
  String cloneUrl;
  String svnUrl;
  String homepage;
  int size;
  int stargazersCount;
  int watchersCount;
  Language language;
  bool hasIssues;
  bool hasProjects;
  bool hasDownloads;
  bool hasWiki;
  bool hasPages;
  int forksCount;
  dynamic mirrorUrl;
  bool archived;
  bool disabled;
  int openIssuesCount;
  License license;
  int forks;
  int openIssues;
  int watchers;
  DefaultBranch defaultBranch;
  Permissions permissions;

  Repository copyWith({
    int id,
    RepositoryNodeId nodeId,
    RepositoryName name,
    FullName fullName,
    bool private,
    UserInfoModel owner,
    String htmlUrl,
    Description description,
    bool fork,
    String url,
    String forksUrl,
    String keysUrl,
    String collaboratorsUrl,
    String teamsUrl,
    String hooksUrl,
    String issueEventsUrl,
    String eventsUrl,
    String assigneesUrl,
    String branchesUrl,
    String tagsUrl,
    String blobsUrl,
    String gitTagsUrl,
    String gitRefsUrl,
    String treesUrl,
    String statusesUrl,
    String languagesUrl,
    String stargazersUrl,
    String contributorsUrl,
    String subscribersUrl,
    String subscriptionUrl,
    String commitsUrl,
    String gitCommitsUrl,
    String commentsUrl,
    String issueCommentUrl,
    String contentsUrl,
    String compareUrl,
    String mergesUrl,
    String archiveUrl,
    String downloadsUrl,
    String issuesUrl,
    String pullsUrl,
    String milestonesUrl,
    String notificationsUrl,
    String labelsUrl,
    String releasesUrl,
    String deploymentsUrl,
    DateTime createdAt,
    DateTime updatedAt,
    DateTime pushedAt,
    GitUrl gitUrl,
    SshUrl sshUrl,
    String cloneUrl,
    String svnUrl,
    String homepage,
    int size,
    int stargazersCount,
    int watchersCount,
    Language language,
    bool hasIssues,
    bool hasProjects,
    bool hasDownloads,
    bool hasWiki,
    bool hasPages,
    int forksCount,
    dynamic mirrorUrl,
    bool archived,
    bool disabled,
    int openIssuesCount,
    License license,
    int forks,
    int openIssues,
    int watchers,
    DefaultBranch defaultBranch,
    Permissions permissions,
  }) =>
      Repository(
        id: id ?? this.id,
        nodeId: nodeId ?? this.nodeId,
        name: name ?? this.name,
        fullName: fullName ?? this.fullName,
        private: private ?? this.private,
        owner: owner ?? this.owner,
        htmlUrl: htmlUrl ?? this.htmlUrl,
        description: description ?? this.description,
        fork: fork ?? this.fork,
        url: url ?? this.url,
        forksUrl: forksUrl ?? this.forksUrl,
        keysUrl: keysUrl ?? this.keysUrl,
        collaboratorsUrl: collaboratorsUrl ?? this.collaboratorsUrl,
        teamsUrl: teamsUrl ?? this.teamsUrl,
        hooksUrl: hooksUrl ?? this.hooksUrl,
        issueEventsUrl: issueEventsUrl ?? this.issueEventsUrl,
        eventsUrl: eventsUrl ?? this.eventsUrl,
        assigneesUrl: assigneesUrl ?? this.assigneesUrl,
        branchesUrl: branchesUrl ?? this.branchesUrl,
        tagsUrl: tagsUrl ?? this.tagsUrl,
        blobsUrl: blobsUrl ?? this.blobsUrl,
        gitTagsUrl: gitTagsUrl ?? this.gitTagsUrl,
        gitRefsUrl: gitRefsUrl ?? this.gitRefsUrl,
        treesUrl: treesUrl ?? this.treesUrl,
        statusesUrl: statusesUrl ?? this.statusesUrl,
        languagesUrl: languagesUrl ?? this.languagesUrl,
        stargazersUrl: stargazersUrl ?? this.stargazersUrl,
        contributorsUrl: contributorsUrl ?? this.contributorsUrl,
        subscribersUrl: subscribersUrl ?? this.subscribersUrl,
        subscriptionUrl: subscriptionUrl ?? this.subscriptionUrl,
        commitsUrl: commitsUrl ?? this.commitsUrl,
        gitCommitsUrl: gitCommitsUrl ?? this.gitCommitsUrl,
        commentsUrl: commentsUrl ?? this.commentsUrl,
        issueCommentUrl: issueCommentUrl ?? this.issueCommentUrl,
        contentsUrl: contentsUrl ?? this.contentsUrl,
        compareUrl: compareUrl ?? this.compareUrl,
        mergesUrl: mergesUrl ?? this.mergesUrl,
        archiveUrl: archiveUrl ?? this.archiveUrl,
        downloadsUrl: downloadsUrl ?? this.downloadsUrl,
        issuesUrl: issuesUrl ?? this.issuesUrl,
        pullsUrl: pullsUrl ?? this.pullsUrl,
        milestonesUrl: milestonesUrl ?? this.milestonesUrl,
        notificationsUrl: notificationsUrl ?? this.notificationsUrl,
        labelsUrl: labelsUrl ?? this.labelsUrl,
        releasesUrl: releasesUrl ?? this.releasesUrl,
        deploymentsUrl: deploymentsUrl ?? this.deploymentsUrl,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        pushedAt: pushedAt ?? this.pushedAt,
        gitUrl: gitUrl ?? this.gitUrl,
        sshUrl: sshUrl ?? this.sshUrl,
        cloneUrl: cloneUrl ?? this.cloneUrl,
        svnUrl: svnUrl ?? this.svnUrl,
        homepage: homepage ?? this.homepage,
        size: size ?? this.size,
        stargazersCount: stargazersCount ?? this.stargazersCount,
        watchersCount: watchersCount ?? this.watchersCount,
        language: language ?? this.language,
        hasIssues: hasIssues ?? this.hasIssues,
        hasProjects: hasProjects ?? this.hasProjects,
        hasDownloads: hasDownloads ?? this.hasDownloads,
        hasWiki: hasWiki ?? this.hasWiki,
        hasPages: hasPages ?? this.hasPages,
        forksCount: forksCount ?? this.forksCount,
        mirrorUrl: mirrorUrl ?? this.mirrorUrl,
        archived: archived ?? this.archived,
        disabled: disabled ?? this.disabled,
        openIssuesCount: openIssuesCount ?? this.openIssuesCount,
        license: license ?? this.license,
        forks: forks ?? this.forks,
        openIssues: openIssues ?? this.openIssues,
        watchers: watchers ?? this.watchers,
        defaultBranch: defaultBranch ?? this.defaultBranch,
        permissions: permissions ?? this.permissions,
      );

  factory Repository.fromRawJson(String str) =>
      Repository.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Repository.fromJson(Map<String, dynamic> json) => Repository(
        id: json["id"] == null ? null : json["id"],
        nodeId: json["node_id"] == null
            ? null
            : repositoryNodeIdValues.map[json["node_id"]],
        name: json["name"] == null
            ? null
            : repositoryNameValues.map[json["name"]],
        fullName: json["full_name"] == null
            ? null
            : fullNameValues.map[json["full_name"]],
        private: json["private"] == null ? null : json["private"],
        owner: json["owner"] == null
            ? null
            : UserInfoModel.fromJson(json["owner"]),
        htmlUrl: json["html_url"] == null ? null : json["html_url"],
        description: json["description"] == null
            ? null
            : descriptionValues.map[json["description"]],
        fork: json["fork"] == null ? null : json["fork"],
        url: json["url"] == null ? null : json["url"],
        forksUrl: json["forks_url"] == null ? null : json["forks_url"],
        keysUrl: json["keys_url"] == null ? null : json["keys_url"],
        collaboratorsUrl: json["collaborators_url"] == null
            ? null
            : json["collaborators_url"],
        teamsUrl: json["teams_url"] == null ? null : json["teams_url"],
        hooksUrl: json["hooks_url"] == null ? null : json["hooks_url"],
        issueEventsUrl:
            json["issue_events_url"] == null ? null : json["issue_events_url"],
        eventsUrl: json["events_url"] == null ? null : json["events_url"],
        assigneesUrl:
            json["assignees_url"] == null ? null : json["assignees_url"],
        branchesUrl: json["branches_url"] == null ? null : json["branches_url"],
        tagsUrl: json["tags_url"] == null ? null : json["tags_url"],
        blobsUrl: json["blobs_url"] == null ? null : json["blobs_url"],
        gitTagsUrl: json["git_tags_url"] == null ? null : json["git_tags_url"],
        gitRefsUrl: json["git_refs_url"] == null ? null : json["git_refs_url"],
        treesUrl: json["trees_url"] == null ? null : json["trees_url"],
        statusesUrl: json["statuses_url"] == null ? null : json["statuses_url"],
        languagesUrl:
            json["languages_url"] == null ? null : json["languages_url"],
        stargazersUrl:
            json["stargazers_url"] == null ? null : json["stargazers_url"],
        contributorsUrl:
            json["contributors_url"] == null ? null : json["contributors_url"],
        subscribersUrl:
            json["subscribers_url"] == null ? null : json["subscribers_url"],
        subscriptionUrl:
            json["subscription_url"] == null ? null : json["subscription_url"],
        commitsUrl: json["commits_url"] == null ? null : json["commits_url"],
        gitCommitsUrl:
            json["git_commits_url"] == null ? null : json["git_commits_url"],
        commentsUrl: json["comments_url"] == null ? null : json["comments_url"],
        issueCommentUrl: json["issue_comment_url"] == null
            ? null
            : json["issue_comment_url"],
        contentsUrl: json["contents_url"] == null ? null : json["contents_url"],
        compareUrl: json["compare_url"] == null ? null : json["compare_url"],
        mergesUrl: json["merges_url"] == null ? null : json["merges_url"],
        archiveUrl: json["archive_url"] == null ? null : json["archive_url"],
        downloadsUrl:
            json["downloads_url"] == null ? null : json["downloads_url"],
        issuesUrl: json["issues_url"] == null ? null : json["issues_url"],
        pullsUrl: json["pulls_url"] == null ? null : json["pulls_url"],
        milestonesUrl:
            json["milestones_url"] == null ? null : json["milestones_url"],
        notificationsUrl: json["notifications_url"] == null
            ? null
            : json["notifications_url"],
        labelsUrl: json["labels_url"] == null ? null : json["labels_url"],
        releasesUrl: json["releases_url"] == null ? null : json["releases_url"],
        deploymentsUrl:
            json["deployments_url"] == null ? null : json["deployments_url"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        pushedAt: json["pushed_at"] == null
            ? null
            : DateTime.parse(json["pushed_at"]),
        gitUrl:
            json["git_url"] == null ? null : gitUrlValues.map[json["git_url"]],
        sshUrl:
            json["ssh_url"] == null ? null : sshUrlValues.map[json["ssh_url"]],
        cloneUrl: json["clone_url"] == null ? null : json["clone_url"],
        svnUrl: json["svn_url"] == null ? null : json["svn_url"],
        homepage: json["homepage"] == null ? null : json["homepage"],
        size: json["size"] == null ? null : json["size"],
        stargazersCount:
            json["stargazers_count"] == null ? null : json["stargazers_count"],
        watchersCount:
            json["watchers_count"] == null ? null : json["watchers_count"],
        language: json["language"] == null
            ? null
            : languageValues.map[json["language"]],
        hasIssues: json["has_issues"] == null ? null : json["has_issues"],
        hasProjects: json["has_projects"] == null ? null : json["has_projects"],
        hasDownloads:
            json["has_downloads"] == null ? null : json["has_downloads"],
        hasWiki: json["has_wiki"] == null ? null : json["has_wiki"],
        hasPages: json["has_pages"] == null ? null : json["has_pages"],
        forksCount: json["forks_count"] == null ? null : json["forks_count"],
        mirrorUrl: json["mirror_url"],
        archived: json["archived"] == null ? null : json["archived"],
        disabled: json["disabled"] == null ? null : json["disabled"],
        openIssuesCount: json["open_issues_count"] == null
            ? null
            : json["open_issues_count"],
        license:
            json["license"] == null ? null : License.fromJson(json["license"]),
        forks: json["forks"] == null ? null : json["forks"],
        openIssues: json["open_issues"] == null ? null : json["open_issues"],
        watchers: json["watchers"] == null ? null : json["watchers"],
        defaultBranch: json["default_branch"] == null
            ? null
            : defaultBranchValues.map[json["default_branch"]],
        permissions: json["permissions"] == null
            ? null
            : Permissions.fromJson(json["permissions"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "node_id":
            nodeId == null ? null : repositoryNodeIdValues.reverse[nodeId],
        "name": name == null ? null : repositoryNameValues.reverse[name],
        "full_name": fullName == null ? null : fullNameValues.reverse[fullName],
        "private": private == null ? null : private,
        "owner": owner == null ? null : owner.toJson(),
        "html_url": htmlUrl == null ? null : htmlUrl,
        "description":
            description == null ? null : descriptionValues.reverse[description],
        "fork": fork == null ? null : fork,
        "url": url == null ? null : url,
        "forks_url": forksUrl == null ? null : forksUrl,
        "keys_url": keysUrl == null ? null : keysUrl,
        "collaborators_url": collaboratorsUrl == null ? null : collaboratorsUrl,
        "teams_url": teamsUrl == null ? null : teamsUrl,
        "hooks_url": hooksUrl == null ? null : hooksUrl,
        "issue_events_url": issueEventsUrl == null ? null : issueEventsUrl,
        "events_url": eventsUrl == null ? null : eventsUrl,
        "assignees_url": assigneesUrl == null ? null : assigneesUrl,
        "branches_url": branchesUrl == null ? null : branchesUrl,
        "tags_url": tagsUrl == null ? null : tagsUrl,
        "blobs_url": blobsUrl == null ? null : blobsUrl,
        "git_tags_url": gitTagsUrl == null ? null : gitTagsUrl,
        "git_refs_url": gitRefsUrl == null ? null : gitRefsUrl,
        "trees_url": treesUrl == null ? null : treesUrl,
        "statuses_url": statusesUrl == null ? null : statusesUrl,
        "languages_url": languagesUrl == null ? null : languagesUrl,
        "stargazers_url": stargazersUrl == null ? null : stargazersUrl,
        "contributors_url": contributorsUrl == null ? null : contributorsUrl,
        "subscribers_url": subscribersUrl == null ? null : subscribersUrl,
        "subscription_url": subscriptionUrl == null ? null : subscriptionUrl,
        "commits_url": commitsUrl == null ? null : commitsUrl,
        "git_commits_url": gitCommitsUrl == null ? null : gitCommitsUrl,
        "comments_url": commentsUrl == null ? null : commentsUrl,
        "issue_comment_url": issueCommentUrl == null ? null : issueCommentUrl,
        "contents_url": contentsUrl == null ? null : contentsUrl,
        "compare_url": compareUrl == null ? null : compareUrl,
        "merges_url": mergesUrl == null ? null : mergesUrl,
        "archive_url": archiveUrl == null ? null : archiveUrl,
        "downloads_url": downloadsUrl == null ? null : downloadsUrl,
        "issues_url": issuesUrl == null ? null : issuesUrl,
        "pulls_url": pullsUrl == null ? null : pullsUrl,
        "milestones_url": milestonesUrl == null ? null : milestonesUrl,
        "notifications_url": notificationsUrl == null ? null : notificationsUrl,
        "labels_url": labelsUrl == null ? null : labelsUrl,
        "releases_url": releasesUrl == null ? null : releasesUrl,
        "deployments_url": deploymentsUrl == null ? null : deploymentsUrl,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "pushed_at": pushedAt == null ? null : pushedAt.toIso8601String(),
        "git_url": gitUrl == null ? null : gitUrlValues.reverse[gitUrl],
        "ssh_url": sshUrl == null ? null : sshUrlValues.reverse[sshUrl],
        "clone_url": cloneUrl == null ? null : cloneUrl,
        "svn_url": svnUrl == null ? null : svnUrl,
        "homepage": homepage == null ? null : homepage,
        "size": size == null ? null : size,
        "stargazers_count": stargazersCount == null ? null : stargazersCount,
        "watchers_count": watchersCount == null ? null : watchersCount,
        "language": language == null ? null : languageValues.reverse[language],
        "has_issues": hasIssues == null ? null : hasIssues,
        "has_projects": hasProjects == null ? null : hasProjects,
        "has_downloads": hasDownloads == null ? null : hasDownloads,
        "has_wiki": hasWiki == null ? null : hasWiki,
        "has_pages": hasPages == null ? null : hasPages,
        "forks_count": forksCount == null ? null : forksCount,
        "mirror_url": mirrorUrl,
        "archived": archived == null ? null : archived,
        "disabled": disabled == null ? null : disabled,
        "open_issues_count": openIssuesCount == null ? null : openIssuesCount,
        "license": license == null ? null : license.toJson(),
        "forks": forks == null ? null : forks,
        "open_issues": openIssues == null ? null : openIssues,
        "watchers": watchers == null ? null : watchers,
        "default_branch": defaultBranch == null
            ? null
            : defaultBranchValues.reverse[defaultBranch],
        "permissions": permissions == null ? null : permissions.toJson(),
      };
}

enum DefaultBranch { MASTER }

final defaultBranchValues = EnumValues({"master": DefaultBranch.MASTER});

enum Description { A_COLLECTION_OF_FIREBASE_PLUGINS_FOR_FLUTTER_APPS }

final descriptionValues = EnumValues({
  "\ud83d\udd25 A collection of Firebase plugins for Flutter apps.":
      Description.A_COLLECTION_OF_FIREBASE_PLUGINS_FOR_FLUTTER_APPS
});

enum FullName { FIREBASE_EXTENDED_FLUTTERFIRE, ATN832_CLOUD_FIRESTORE_MOCKS }

final fullNameValues = EnumValues({
  "atn832/cloud_firestore_mocks": FullName.ATN832_CLOUD_FIRESTORE_MOCKS,
  "FirebaseExtended/flutterfire": FullName.FIREBASE_EXTENDED_FLUTTERFIRE
});

enum GitUrl {
  GIT_GITHUB_COM_FIREBASE_EXTENDED_FLUTTERFIRE_GIT,
  GIT_GITHUB_COM_ATN832_CLOUD_FIRESTORE_MOCKS_GIT
}

final gitUrlValues = EnumValues({
  "git://github.com/atn832/cloud_firestore_mocks.git":
      GitUrl.GIT_GITHUB_COM_ATN832_CLOUD_FIRESTORE_MOCKS_GIT,
  "git://github.com/FirebaseExtended/flutterfire.git":
      GitUrl.GIT_GITHUB_COM_FIREBASE_EXTENDED_FLUTTERFIRE_GIT
});

enum Language { DART }

final languageValues = EnumValues({"Dart": Language.DART});

class License {
  License({
    this.key,
    this.name,
    this.spdxId,
    this.url,
    this.nodeId,
  });

  Key key;
  LicenseName name;
  SpdxId spdxId;
  String url;
  LicenseNodeId nodeId;

  License copyWith({
    Key key,
    LicenseName name,
    SpdxId spdxId,
    String url,
    LicenseNodeId nodeId,
  }) =>
      License(
        key: key ?? this.key,
        name: name ?? this.name,
        spdxId: spdxId ?? this.spdxId,
        url: url ?? this.url,
        nodeId: nodeId ?? this.nodeId,
      );

  factory License.fromRawJson(String str) => License.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory License.fromJson(Map<String, dynamic> json) => License(
        key: json["key"] == null ? null : keyValues.map[json["key"]],
        name: json["name"] == null ? null : licenseNameValues.map[json["name"]],
        spdxId:
            json["spdx_id"] == null ? null : spdxIdValues.map[json["spdx_id"]],
        url: json["url"] == null ? null : json["url"],
        nodeId: json["node_id"] == null
            ? null
            : licenseNodeIdValues.map[json["node_id"]],
      );

  Map<String, dynamic> toJson() => {
        "key": key == null ? null : keyValues.reverse[key],
        "name": name == null ? null : licenseNameValues.reverse[name],
        "spdx_id": spdxId == null ? null : spdxIdValues.reverse[spdxId],
        "url": url == null ? null : url,
        "node_id": nodeId == null ? null : licenseNodeIdValues.reverse[nodeId],
      };
}

enum Key { BSD_3_CLAUSE, BSD_2_CLAUSE }

final keyValues = EnumValues(
    {"bsd-2-clause": Key.BSD_2_CLAUSE, "bsd-3-clause": Key.BSD_3_CLAUSE});

enum LicenseName {
  BSD_3_CLAUSE_NEW_OR_REVISED_LICENSE,
  BSD_2_CLAUSE_SIMPLIFIED_LICENSE
}

final licenseNameValues = EnumValues({
  "BSD 2-Clause \"Simplified\" License":
      LicenseName.BSD_2_CLAUSE_SIMPLIFIED_LICENSE,
  "BSD 3-Clause \"New\" or \"Revised\" License":
      LicenseName.BSD_3_CLAUSE_NEW_OR_REVISED_LICENSE
});

enum LicenseNodeId { M_DC6_T_GLJ_ZW5_Z_ZTU, M_DC6_T_GLJ_ZW5_Z_ZTQ }

final licenseNodeIdValues = EnumValues({
  "MDc6TGljZW5zZTQ=": LicenseNodeId.M_DC6_T_GLJ_ZW5_Z_ZTQ,
  "MDc6TGljZW5zZTU=": LicenseNodeId.M_DC6_T_GLJ_ZW5_Z_ZTU
});

enum SpdxId { BSD_3_CLAUSE, BSD_2_CLAUSE }

final spdxIdValues = EnumValues(
    {"BSD-2-Clause": SpdxId.BSD_2_CLAUSE, "BSD-3-Clause": SpdxId.BSD_3_CLAUSE});

enum RepositoryName { FLUTTERFIRE, CLOUD_FIRESTORE_MOCKS }

final repositoryNameValues = EnumValues({
  "cloud_firestore_mocks": RepositoryName.CLOUD_FIRESTORE_MOCKS,
  "flutterfire": RepositoryName.FLUTTERFIRE
});

enum RepositoryNodeId {
  MD_EW_OL_JLC_G9_ZA_X_RVCNKY_MDI0_MJK3_MDM,
  MD_EW_OL_JLC_G9_ZA_X_RVCNKY_MJ_EY_MD_YY_NJ_Y
}

final repositoryNodeIdValues = EnumValues({
  "MDEwOlJlcG9zaXRvcnkyMDI0Mjk3MDM=":
      RepositoryNodeId.MD_EW_OL_JLC_G9_ZA_X_RVCNKY_MDI0_MJK3_MDM,
  "MDEwOlJlcG9zaXRvcnkyMjEyMDYyNjY=":
      RepositoryNodeId.MD_EW_OL_JLC_G9_ZA_X_RVCNKY_MJ_EY_MD_YY_NJ_Y
});

class Permissions {
  Permissions({
    this.admin,
    this.push,
    this.pull,
  });

  bool admin;
  bool push;
  bool pull;

  Permissions copyWith({
    bool admin,
    bool push,
    bool pull,
  }) =>
      Permissions(
        admin: admin ?? this.admin,
        push: push ?? this.push,
        pull: pull ?? this.pull,
      );

  factory Permissions.fromRawJson(String str) =>
      Permissions.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Permissions.fromJson(Map<String, dynamic> json) => Permissions(
        admin: json["admin"] == null ? null : json["admin"],
        push: json["push"] == null ? null : json["push"],
        pull: json["pull"] == null ? null : json["pull"],
      );

  Map<String, dynamic> toJson() => {
        "admin": admin == null ? null : admin,
        "push": push == null ? null : push,
        "pull": pull == null ? null : pull,
      };
}

enum SshUrl {
  GIT_GITHUB_COM_FIREBASE_EXTENDED_FLUTTERFIRE_GIT,
  GIT_GITHUB_COM_ATN832_CLOUD_FIRESTORE_MOCKS_GIT
}

final sshUrlValues = EnumValues({
  "git@github.com:atn832/cloud_firestore_mocks.git":
      SshUrl.GIT_GITHUB_COM_ATN832_CLOUD_FIRESTORE_MOCKS_GIT,
  "git@github.com:FirebaseExtended/flutterfire.git":
      SshUrl.GIT_GITHUB_COM_FIREBASE_EXTENDED_FLUTTERFIRE_GIT
});

enum IssueState { CLOSED, OPEN }

final stateValues =
    EnumValues({"closed": IssueState.CLOSED, "open": IssueState.OPEN});

enum SourceType { ISSUE }

final sourceTypeValues = EnumValues({"issue": SourceType.ISSUE});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
