// To parse this JSON data, do
//
//     final issueEventModel = issueEventModelFromJson(jsonString);

import 'dart:convert';

import 'package:onehub/models/issues/issue_model.dart';

class IssueEventModel {
  IssueEventModel({
    this.id,
    this.nodeId,
    this.url,
    this.actor,
    this.event,
    this.commitId,
    this.commitUrl,
    this.createdAt,
    this.label,
    this.performedViaGithubApp,
    this.rename,
    this.milestone,
    this.assignee,
    this.assigner,
  });

  int? id;
  String? nodeId;
  String? url;
  Actor? actor;
  String? event;
  dynamic commitId;
  dynamic commitUrl;
  DateTime? createdAt;
  Label? label;
  dynamic performedViaGithubApp;
  Rename? rename;
  Milestone? milestone;
  Actor? assignee;
  Actor? assigner;

  IssueEventModel copyWith({
    int? id,
    String? nodeId,
    String? url,
    Actor? actor,
    String? event,
    dynamic commitId,
    dynamic commitUrl,
    DateTime? createdAt,
    Label? label,
    dynamic performedViaGithubApp,
    Rename? rename,
    Milestone? milestone,
    Actor? assignee,
    Actor? assigner,
  }) =>
      IssueEventModel(
        id: id ?? this.id,
        nodeId: nodeId ?? this.nodeId,
        url: url ?? this.url,
        actor: actor ?? this.actor,
        event: event ?? this.event,
        commitId: commitId ?? this.commitId,
        commitUrl: commitUrl ?? this.commitUrl,
        createdAt: createdAt ?? this.createdAt,
        label: label ?? this.label,
        performedViaGithubApp:
            performedViaGithubApp ?? this.performedViaGithubApp,
        rename: rename ?? this.rename,
        milestone: milestone ?? this.milestone,
        assignee: assignee ?? this.assignee,
        assigner: assigner ?? this.assigner,
      );

  factory IssueEventModel.fromRawJson(String str) =>
      IssueEventModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory IssueEventModel.fromJson(Map<String, dynamic> json) =>
      IssueEventModel(
        id: json["id"] == null ? null : json["id"],
        nodeId: json["node_id"] == null ? null : json["node_id"],
        url: json["url"] == null ? null : json["url"],
        actor: json["actor"] == null ? null : Actor.fromJson(json["actor"]),
        event: json["event"] == null ? null : json["event"],
        commitId: json["commit_id"],
        commitUrl: json["commit_url"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        label: json["label"] == null ? null : Label.fromJson(json["label"]),
        performedViaGithubApp: json["performed_via_github_app"],
        rename: json["rename"] == null ? null : Rename.fromJson(json["rename"]),
        milestone: json["milestone"] == null
            ? null
            : Milestone.fromJson(json["milestone"]),
        assignee:
            json["assignee"] == null ? null : Actor.fromJson(json["assignee"]),
        assigner:
            json["assigner"] == null ? null : Actor.fromJson(json["assigner"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "node_id": nodeId == null ? null : nodeId,
        "url": url == null ? null : url,
        "actor": actor == null ? null : actor!.toJson(),
        "event": event == null ? null : event,
        "commit_id": commitId,
        "commit_url": commitUrl,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "label": label == null ? null : label!.toJson(),
        "performed_via_github_app": performedViaGithubApp,
        "rename": rename == null ? null : rename!.toJson(),
        "milestone": milestone == null ? null : milestone!.toJson(),
        "assignee": assignee == null ? null : assignee!.toJson(),
        "assigner": assigner == null ? null : assigner!.toJson(),
      };
}

class Actor {
  Actor({
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

  String? login;
  int? id;
  String? nodeId;
  String? avatarUrl;
  String? gravatarId;
  String? url;
  String? htmlUrl;
  String? followersUrl;
  String? followingUrl;
  String? gistsUrl;
  String? starredUrl;
  String? subscriptionsUrl;
  String? organizationsUrl;
  String? reposUrl;
  String? eventsUrl;
  String? receivedEventsUrl;
  String? type;
  bool? siteAdmin;

  Actor copyWith({
    String? login,
    int? id,
    String? nodeId,
    String? avatarUrl,
    String? gravatarId,
    String? url,
    String? htmlUrl,
    String? followersUrl,
    String? followingUrl,
    String? gistsUrl,
    String? starredUrl,
    String? subscriptionsUrl,
    String? organizationsUrl,
    String? reposUrl,
    String? eventsUrl,
    String? receivedEventsUrl,
    String? type,
    bool? siteAdmin,
  }) =>
      Actor(
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

  factory Actor.fromRawJson(String str) => Actor.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Actor.fromJson(Map<String, dynamic> json) => Actor(
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
    this.name,
    this.color,
  });

  String? name;
  String? color;

  Label copyWith({
    String? name,
    String? color,
  }) =>
      Label(
        name: name ?? this.name,
        color: color ?? this.color,
      );

  factory Label.fromRawJson(String str) => Label.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Label.fromJson(Map<String, dynamic> json) => Label(
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

  String? from;
  String? to;

  Rename copyWith({
    String? from,
    String? to,
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
