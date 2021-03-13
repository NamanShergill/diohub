// To parse this JSON data, do
//
//     final issuesTimelineEventModel = issuesTimelineEventModelFromJson(jsonString);

import 'dart:convert';

import 'package:onehub/models/users/user_info_model.dart';

class IssuesTimelineEventModel {
  IssuesTimelineEventModel({
    this.url,
    this.htmlUrl,
    this.issueUrl,
    this.id,
    this.nodeId,
    this.user,
    this.createdAt,
    this.updatedAt,
    this.authorAssociation,
    this.body,
    this.performedViaGithubApp,
    this.event,
    this.actor,
    this.commitId,
    this.commitUrl,
    this.label,
    this.source,
    this.rename,
  });

  String url;
  String htmlUrl;
  String issueUrl;
  int id;
  String nodeId;
  UserInfoModel user;
  DateTime createdAt;
  DateTime updatedAt;
  AuthorAssociation authorAssociation;
  String body;
  dynamic performedViaGithubApp;
  Event event;
  UserInfoModel actor;
  dynamic commitId;
  dynamic commitUrl;
  IssuesTimelineEventModelLabel label;
  Source source;
  Rename rename;

  IssuesTimelineEventModel copyWith({
    String url,
    String htmlUrl,
    String issueUrl,
    int id,
    String nodeId,
    UserInfoModel user,
    DateTime createdAt,
    DateTime updatedAt,
    AuthorAssociation authorAssociation,
    String body,
    dynamic performedViaGithubApp,
    Event event,
    UserInfoModel actor,
    dynamic commitId,
    dynamic commitUrl,
    IssuesTimelineEventModelLabel label,
    Source source,
    Rename rename,
  }) =>
      IssuesTimelineEventModel(
        url: url ?? this.url,
        htmlUrl: htmlUrl ?? this.htmlUrl,
        issueUrl: issueUrl ?? this.issueUrl,
        id: id ?? this.id,
        nodeId: nodeId ?? this.nodeId,
        user: user ?? this.user,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        authorAssociation: authorAssociation ?? this.authorAssociation,
        body: body ?? this.body,
        performedViaGithubApp:
            performedViaGithubApp ?? this.performedViaGithubApp,
        event: event ?? this.event,
        actor: actor ?? this.actor,
        commitId: commitId ?? this.commitId,
        commitUrl: commitUrl ?? this.commitUrl,
        label: label ?? this.label,
        source: source ?? this.source,
        rename: rename ?? this.rename,
      );

  factory IssuesTimelineEventModel.fromRawJson(String str) =>
      IssuesTimelineEventModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory IssuesTimelineEventModel.fromJson(Map<String, dynamic> json) =>
      IssuesTimelineEventModel(
        url: json["url"] == null ? null : json["url"],
        htmlUrl: json["html_url"] == null ? null : json["html_url"],
        issueUrl: json["issue_url"] == null ? null : json["issue_url"],
        id: json["id"] == null ? null : json["id"],
        nodeId: json["node_id"] == null ? null : json["node_id"],
        user:
            json["user"] == null ? null : UserInfoModel.fromJson(json["user"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        authorAssociation: json["author_association"] == null
            ? null
            : authorAssociationValues.map[json["author_association"]],
        body: json["body"] == null ? null : json["body"],
        performedViaGithubApp: json["performed_via_github_app"],
        event: json["event"] == null ? null : eventValues.map[json["event"]],
        actor: json["actor"] == null
            ? null
            : UserInfoModel.fromJson(json["actor"]),
        commitId: json["commit_id"],
        commitUrl: json["commit_url"],
        label: json["label"] == null
            ? null
            : IssuesTimelineEventModelLabel.fromJson(json["label"]),
        source: json["source"] == null ? null : Source.fromJson(json["source"]),
        rename: json["rename"] == null ? null : Rename.fromJson(json["rename"]),
      );

  Map<String, dynamic> toJson() => {
        "url": url == null ? null : url,
        "html_url": htmlUrl == null ? null : htmlUrl,
        "issue_url": issueUrl == null ? null : issueUrl,
        "id": id == null ? null : id,
        "node_id": nodeId == null ? null : nodeId,
        "user": user == null ? null : user.toJson(),
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "author_association": authorAssociation == null
            ? null
            : authorAssociationValues.reverse[authorAssociation],
        "body": body == null ? null : body,
        "performed_via_github_app": performedViaGithubApp,
        "event": event == null ? null : eventValues.reverse[event],
        "actor": actor == null ? null : actor.toJson(),
        "commit_id": commitId,
        "commit_url": commitUrl,
        "label": label == null ? null : label.toJson(),
        "source": source == null ? null : source.toJson(),
        "rename": rename == null ? null : rename.toJson(),
      };
}

enum Type { USER, ORGANIZATION }

final typeValues =
    EnumValues({"Organization": Type.ORGANIZATION, "User": Type.USER});

enum AuthorAssociation { CONTRIBUTOR, MEMBER, NONE, COLLABORATOR }

final authorAssociationValues = EnumValues({
  "CONTRIBUTOR": AuthorAssociation.CONTRIBUTOR,
  "MEMBER": AuthorAssociation.MEMBER,
  "NONE": AuthorAssociation.NONE,
  "COLLABORATOR": AuthorAssociation.COLLABORATOR,
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

class IssuesTimelineEventModelLabel {
  IssuesTimelineEventModelLabel({
    this.name,
    this.color,
  });

  String name;
  String color;

  IssuesTimelineEventModelLabel copyWith({
    String name,
    String color,
  }) =>
      IssuesTimelineEventModelLabel(
        name: name ?? this.name,
        color: color ?? this.color,
      );

  factory IssuesTimelineEventModelLabel.fromRawJson(String str) =>
      IssuesTimelineEventModelLabel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory IssuesTimelineEventModelLabel.fromJson(Map<String, dynamic> json) =>
      IssuesTimelineEventModelLabel(
        name: json["name"] == null ? null : json["name"],
        color: json["color"] == null ? null : json["color"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "color": color == null ? null : color,
      };
}

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

  String type;
  Issue issue;

  Source copyWith({
    String type,
    Issue issue,
  }) =>
      Source(
        type: type ?? this.type,
        issue: issue ?? this.issue,
      );

  factory Source.fromRawJson(String str) => Source.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        type: json["type"] == null ? null : json["type"],
        issue: json["issue"] == null ? null : Issue.fromJson(json["issue"]),
      );

  Map<String, dynamic> toJson() => {
        "type": type == null ? null : type,
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
  List<LabelElement> labels;
  String state;
  bool locked;
  dynamic assignee;
  List<dynamic> assignees;
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
    List<LabelElement> labels,
    String state,
    bool locked,
    dynamic assignee,
    List<dynamic> assignees,
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
            : List<LabelElement>.from(
                json["labels"].map((x) => LabelElement.fromJson(x))),
        state: json["state"] == null ? null : json["state"],
        locked: json["locked"] == null ? null : json["locked"],
        assignee: json["assignee"],
        assignees: json["assignees"] == null
            ? null
            : List<dynamic>.from(json["assignees"].map((x) => x)),
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
        "state": state == null ? null : state,
        "locked": locked == null ? null : locked,
        "assignee": assignee,
        "assignees": assignees == null
            ? null
            : List<dynamic>.from(assignees.map((x) => x)),
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
      };
}

class LabelElement {
  LabelElement({
    this.id,
    this.nodeId,
    this.url,
    this.name,
    this.color,
    this.labelDefault,
    this.description,
  });

  int id;
  String nodeId;
  String url;
  String name;
  String color;
  bool labelDefault;
  String description;

  LabelElement copyWith({
    int id,
    String nodeId,
    String url,
    String name,
    String color,
    bool labelDefault,
    String description,
  }) =>
      LabelElement(
        id: id ?? this.id,
        nodeId: nodeId ?? this.nodeId,
        url: url ?? this.url,
        name: name ?? this.name,
        color: color ?? this.color,
        labelDefault: labelDefault ?? this.labelDefault,
        description: description ?? this.description,
      );

  factory LabelElement.fromRawJson(String str) =>
      LabelElement.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LabelElement.fromJson(Map<String, dynamic> json) => LabelElement(
        id: json["id"] == null ? null : json["id"],
        nodeId: json["node_id"] == null ? null : json["node_id"],
        url: json["url"] == null ? null : json["url"],
        name: json["name"] == null ? null : json["name"],
        color: json["color"] == null ? null : json["color"],
        labelDefault: json["default"] == null ? null : json["default"],
        description: json["description"] == null ? null : json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "node_id": nodeId == null ? null : nodeId,
        "url": url == null ? null : url,
        "name": name == null ? null : name,
        "color": color == null ? null : color,
        "default": labelDefault == null ? null : labelDefault,
        "description": description == null ? null : description,
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
  String nodeId;
  String name;
  String fullName;
  bool private;
  UserInfoModel owner;
  String htmlUrl;
  String description;
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
  String gitUrl;
  String sshUrl;
  String cloneUrl;
  String svnUrl;
  String homepage;
  int size;
  int stargazersCount;
  int watchersCount;
  String language;
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
  String defaultBranch;
  Permissions permissions;

  Repository copyWith({
    int id,
    String nodeId,
    String name,
    String fullName,
    bool private,
    UserInfoModel owner,
    String htmlUrl,
    String description,
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
    String gitUrl,
    String sshUrl,
    String cloneUrl,
    String svnUrl,
    String homepage,
    int size,
    int stargazersCount,
    int watchersCount,
    String language,
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
    String defaultBranch,
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
        nodeId: json["node_id"] == null ? null : json["node_id"],
        name: json["name"] == null ? null : json["name"],
        fullName: json["full_name"] == null ? null : json["full_name"],
        private: json["private"] == null ? null : json["private"],
        owner: json["owner"] == null
            ? null
            : UserInfoModel.fromJson(json["owner"]),
        htmlUrl: json["html_url"] == null ? null : json["html_url"],
        description: json["description"] == null ? null : json["description"],
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
        gitUrl: json["git_url"] == null ? null : json["git_url"],
        sshUrl: json["ssh_url"] == null ? null : json["ssh_url"],
        cloneUrl: json["clone_url"] == null ? null : json["clone_url"],
        svnUrl: json["svn_url"] == null ? null : json["svn_url"],
        homepage: json["homepage"] == null ? null : json["homepage"],
        size: json["size"] == null ? null : json["size"],
        stargazersCount:
            json["stargazers_count"] == null ? null : json["stargazers_count"],
        watchersCount:
            json["watchers_count"] == null ? null : json["watchers_count"],
        language: json["language"] == null ? null : json["language"],
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
        defaultBranch:
            json["default_branch"] == null ? null : json["default_branch"],
        permissions: json["permissions"] == null
            ? null
            : Permissions.fromJson(json["permissions"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "node_id": nodeId == null ? null : nodeId,
        "name": name == null ? null : name,
        "full_name": fullName == null ? null : fullName,
        "private": private == null ? null : private,
        "owner": owner == null ? null : owner.toJson(),
        "html_url": htmlUrl == null ? null : htmlUrl,
        "description": description == null ? null : description,
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
        "git_url": gitUrl == null ? null : gitUrl,
        "ssh_url": sshUrl == null ? null : sshUrl,
        "clone_url": cloneUrl == null ? null : cloneUrl,
        "svn_url": svnUrl == null ? null : svnUrl,
        "homepage": homepage == null ? null : homepage,
        "size": size == null ? null : size,
        "stargazers_count": stargazersCount == null ? null : stargazersCount,
        "watchers_count": watchersCount == null ? null : watchersCount,
        "language": language == null ? null : language,
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
        "default_branch": defaultBranch == null ? null : defaultBranch,
        "permissions": permissions == null ? null : permissions.toJson(),
      };
}

class License {
  License({
    this.key,
    this.name,
    this.spdxId,
    this.url,
    this.nodeId,
  });

  String key;
  String name;
  String spdxId;
  String url;
  String nodeId;

  License copyWith({
    String key,
    String name,
    String spdxId,
    String url,
    String nodeId,
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
        key: json["key"] == null ? null : json["key"],
        name: json["name"] == null ? null : json["name"],
        spdxId: json["spdx_id"] == null ? null : json["spdx_id"],
        url: json["url"] == null ? null : json["url"],
        nodeId: json["node_id"] == null ? null : json["node_id"],
      );

  Map<String, dynamic> toJson() => {
        "key": key == null ? null : key,
        "name": name == null ? null : name,
        "spdx_id": spdxId == null ? null : spdxId,
        "url": url == null ? null : url,
        "node_id": nodeId == null ? null : nodeId,
      };
}

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
