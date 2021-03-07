// To parse this JSON data, do
//
//     final issueModel = issueModelFromJson(jsonString);

import 'dart:convert';

class IssueModel {
  IssueModel({
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
    this.body,
    this.closedBy,
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
  Assignee user;
  List<Label> labels;
  String state;
  bool locked;
  Assignee assignee;
  List<Assignee> assignees;
  Milestone milestone;
  int comments;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic closedAt;
  String authorAssociation;
  dynamic activeLockReason;
  String body;
  dynamic closedBy;
  dynamic performedViaGithubApp;

  IssueModel copyWith({
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
    Assignee user,
    List<Label> labels,
    String state,
    bool locked,
    Assignee assignee,
    List<Assignee> assignees,
    Milestone milestone,
    int comments,
    DateTime createdAt,
    DateTime updatedAt,
    dynamic closedAt,
    String authorAssociation,
    dynamic activeLockReason,
    String body,
    dynamic closedBy,
    dynamic performedViaGithubApp,
  }) =>
      IssueModel(
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
        body: body ?? this.body,
        closedBy: closedBy ?? this.closedBy,
        performedViaGithubApp:
            performedViaGithubApp ?? this.performedViaGithubApp,
      );

  factory IssueModel.fromRawJson(String str) =>
      IssueModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory IssueModel.fromJson(Map<String, dynamic> json) => IssueModel(
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
        user: json["user"] == null ? null : Assignee.fromJson(json["user"]),
        labels: json["labels"] == null
            ? null
            : List<Label>.from(json["labels"].map((x) => Label.fromJson(x))),
        state: json["state"] == null ? null : json["state"],
        locked: json["locked"] == null ? null : json["locked"],
        assignee: json["assignee"] == null
            ? null
            : Assignee.fromJson(json["assignee"]),
        assignees: json["assignees"] == null
            ? null
            : List<Assignee>.from(
                json["assignees"].map((x) => Assignee.fromJson(x))),
        milestone: json["milestone"] == null
            ? null
            : Milestone.fromJson(json["milestone"]),
        comments: json["comments"] == null ? null : json["comments"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        closedAt: json["closed_at"],
        authorAssociation: json["author_association"] == null
            ? null
            : json["author_association"],
        activeLockReason: json["active_lock_reason"],
        body: json["body"] == null ? null : json["body"],
        closedBy: json["closed_by"],
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
        "assignee": assignee == null ? null : assignee.toJson(),
        "assignees": assignees == null
            ? null
            : List<dynamic>.from(assignees.map((x) => x.toJson())),
        "milestone": milestone == null ? null : milestone.toJson(),
        "comments": comments == null ? null : comments,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "closed_at": closedAt,
        "author_association":
            authorAssociation == null ? null : authorAssociation,
        "active_lock_reason": activeLockReason,
        "body": body == null ? null : body,
        "closed_by": closedBy,
        "performed_via_github_app": performedViaGithubApp,
      };
}

class Assignee {
  Assignee({
    this.login,
    this.id,
    this.nodeId,
    this.avatarUrl,
    this.gravatarId,
    this.url,
    this.htmlUrl,
    this.followersUrl,
    this.followingUrl,
    this.gistsUrl,
    this.starredUrl,
    this.subscriptionsUrl,
    this.organizationsUrl,
    this.reposUrl,
    this.eventsUrl,
    this.receivedEventsUrl,
    this.type,
    this.siteAdmin,
  });

  String login;
  int id;
  String nodeId;
  String avatarUrl;
  String gravatarId;
  String url;
  String htmlUrl;
  String followersUrl;
  String followingUrl;
  String gistsUrl;
  String starredUrl;
  String subscriptionsUrl;
  String organizationsUrl;
  String reposUrl;
  String eventsUrl;
  String receivedEventsUrl;
  String type;
  bool siteAdmin;

  Assignee copyWith({
    String login,
    int id,
    String nodeId,
    String avatarUrl,
    String gravatarId,
    String url,
    String htmlUrl,
    String followersUrl,
    String followingUrl,
    String gistsUrl,
    String starredUrl,
    String subscriptionsUrl,
    String organizationsUrl,
    String reposUrl,
    String eventsUrl,
    String receivedEventsUrl,
    String type,
    bool siteAdmin,
  }) =>
      Assignee(
        login: login ?? this.login,
        id: id ?? this.id,
        nodeId: nodeId ?? this.nodeId,
        avatarUrl: avatarUrl ?? this.avatarUrl,
        gravatarId: gravatarId ?? this.gravatarId,
        url: url ?? this.url,
        htmlUrl: htmlUrl ?? this.htmlUrl,
        followersUrl: followersUrl ?? this.followersUrl,
        followingUrl: followingUrl ?? this.followingUrl,
        gistsUrl: gistsUrl ?? this.gistsUrl,
        starredUrl: starredUrl ?? this.starredUrl,
        subscriptionsUrl: subscriptionsUrl ?? this.subscriptionsUrl,
        organizationsUrl: organizationsUrl ?? this.organizationsUrl,
        reposUrl: reposUrl ?? this.reposUrl,
        eventsUrl: eventsUrl ?? this.eventsUrl,
        receivedEventsUrl: receivedEventsUrl ?? this.receivedEventsUrl,
        type: type ?? this.type,
        siteAdmin: siteAdmin ?? this.siteAdmin,
      );

  factory Assignee.fromRawJson(String str) =>
      Assignee.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Assignee.fromJson(Map<String, dynamic> json) => Assignee(
        login: json["login"] == null ? null : json["login"],
        id: json["id"] == null ? null : json["id"],
        nodeId: json["node_id"] == null ? null : json["node_id"],
        avatarUrl: json["avatar_url"] == null ? null : json["avatar_url"],
        gravatarId: json["gravatar_id"] == null ? null : json["gravatar_id"],
        url: json["url"] == null ? null : json["url"],
        htmlUrl: json["html_url"] == null ? null : json["html_url"],
        followersUrl:
            json["followers_url"] == null ? null : json["followers_url"],
        followingUrl:
            json["following_url"] == null ? null : json["following_url"],
        gistsUrl: json["gists_url"] == null ? null : json["gists_url"],
        starredUrl: json["starred_url"] == null ? null : json["starred_url"],
        subscriptionsUrl: json["subscriptions_url"] == null
            ? null
            : json["subscriptions_url"],
        organizationsUrl: json["organizations_url"] == null
            ? null
            : json["organizations_url"],
        reposUrl: json["repos_url"] == null ? null : json["repos_url"],
        eventsUrl: json["events_url"] == null ? null : json["events_url"],
        receivedEventsUrl: json["received_events_url"] == null
            ? null
            : json["received_events_url"],
        type: json["type"] == null ? null : json["type"],
        siteAdmin: json["site_admin"] == null ? null : json["site_admin"],
      );

  Map<String, dynamic> toJson() => {
        "login": login == null ? null : login,
        "id": id == null ? null : id,
        "node_id": nodeId == null ? null : nodeId,
        "avatar_url": avatarUrl == null ? null : avatarUrl,
        "gravatar_id": gravatarId == null ? null : gravatarId,
        "url": url == null ? null : url,
        "html_url": htmlUrl == null ? null : htmlUrl,
        "followers_url": followersUrl == null ? null : followersUrl,
        "following_url": followingUrl == null ? null : followingUrl,
        "gists_url": gistsUrl == null ? null : gistsUrl,
        "starred_url": starredUrl == null ? null : starredUrl,
        "subscriptions_url": subscriptionsUrl == null ? null : subscriptionsUrl,
        "organizations_url": organizationsUrl == null ? null : organizationsUrl,
        "repos_url": reposUrl == null ? null : reposUrl,
        "events_url": eventsUrl == null ? null : eventsUrl,
        "received_events_url":
            receivedEventsUrl == null ? null : receivedEventsUrl,
        "type": type == null ? null : type,
        "site_admin": siteAdmin == null ? null : siteAdmin,
      };
}

class Label {
  Label({
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

  Label copyWith({
    int id,
    String nodeId,
    String url,
    String name,
    String color,
    bool labelDefault,
    String description,
  }) =>
      Label(
        id: id ?? this.id,
        nodeId: nodeId ?? this.nodeId,
        url: url ?? this.url,
        name: name ?? this.name,
        color: color ?? this.color,
        labelDefault: labelDefault ?? this.labelDefault,
        description: description ?? this.description,
      );

  factory Label.fromRawJson(String str) => Label.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Label.fromJson(Map<String, dynamic> json) => Label(
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

class Milestone {
  Milestone({
    this.url,
    this.htmlUrl,
    this.labelsUrl,
    this.id,
    this.nodeId,
    this.number,
    this.title,
    this.description,
    this.creator,
    this.openIssues,
    this.closedIssues,
    this.state,
    this.createdAt,
    this.updatedAt,
    this.dueOn,
    this.closedAt,
  });

  String url;
  String htmlUrl;
  String labelsUrl;
  int id;
  String nodeId;
  int number;
  String title;
  String description;
  Assignee creator;
  int openIssues;
  int closedIssues;
  String state;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime dueOn;
  dynamic closedAt;

  Milestone copyWith({
    String url,
    String htmlUrl,
    String labelsUrl,
    int id,
    String nodeId,
    int number,
    String title,
    String description,
    Assignee creator,
    int openIssues,
    int closedIssues,
    String state,
    DateTime createdAt,
    DateTime updatedAt,
    DateTime dueOn,
    dynamic closedAt,
  }) =>
      Milestone(
        url: url ?? this.url,
        htmlUrl: htmlUrl ?? this.htmlUrl,
        labelsUrl: labelsUrl ?? this.labelsUrl,
        id: id ?? this.id,
        nodeId: nodeId ?? this.nodeId,
        number: number ?? this.number,
        title: title ?? this.title,
        description: description ?? this.description,
        creator: creator ?? this.creator,
        openIssues: openIssues ?? this.openIssues,
        closedIssues: closedIssues ?? this.closedIssues,
        state: state ?? this.state,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        dueOn: dueOn ?? this.dueOn,
        closedAt: closedAt ?? this.closedAt,
      );

  factory Milestone.fromRawJson(String str) =>
      Milestone.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Milestone.fromJson(Map<String, dynamic> json) => Milestone(
        url: json["url"] == null ? null : json["url"],
        htmlUrl: json["html_url"] == null ? null : json["html_url"],
        labelsUrl: json["labels_url"] == null ? null : json["labels_url"],
        id: json["id"] == null ? null : json["id"],
        nodeId: json["node_id"] == null ? null : json["node_id"],
        number: json["number"] == null ? null : json["number"],
        title: json["title"] == null ? null : json["title"],
        description: json["description"] == null ? null : json["description"],
        creator:
            json["creator"] == null ? null : Assignee.fromJson(json["creator"]),
        openIssues: json["open_issues"] == null ? null : json["open_issues"],
        closedIssues:
            json["closed_issues"] == null ? null : json["closed_issues"],
        state: json["state"] == null ? null : json["state"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        dueOn: json["due_on"] == null ? null : DateTime.parse(json["due_on"]),
        closedAt: json["closed_at"],
      );

  Map<String, dynamic> toJson() => {
        "url": url == null ? null : url,
        "html_url": htmlUrl == null ? null : htmlUrl,
        "labels_url": labelsUrl == null ? null : labelsUrl,
        "id": id == null ? null : id,
        "node_id": nodeId == null ? null : nodeId,
        "number": number == null ? null : number,
        "title": title == null ? null : title,
        "description": description == null ? null : description,
        "creator": creator == null ? null : creator.toJson(),
        "open_issues": openIssues == null ? null : openIssues,
        "closed_issues": closedIssues == null ? null : closedIssues,
        "state": state == null ? null : state,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "due_on": dueOn == null ? null : dueOn.toIso8601String(),
        "closed_at": closedAt,
      };
}
