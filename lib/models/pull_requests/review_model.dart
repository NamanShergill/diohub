// To parse this JSON data, do
//
//     final reviewModel = reviewModelFromJson(jsonString);

import 'dart:convert';

class ReviewModel {
  ReviewModel({
    this.id,
    this.nodeId,
    this.user,
    this.body,
    this.state,
    this.htmlUrl,
    this.pullRequestUrl,
    this.authorAssociation,
    this.links,
    this.submittedAt,
    this.commitId,
  });

  int? id;
  String? nodeId;
  User? user;
  String? body;
  String? state;
  String? htmlUrl;
  String? pullRequestUrl;
  String? authorAssociation;
  Links? links;
  DateTime? submittedAt;
  String? commitId;

  ReviewModel copyWith({
    int? id,
    String? nodeId,
    User? user,
    String? body,
    String? state,
    String? htmlUrl,
    String? pullRequestUrl,
    String? authorAssociation,
    Links? links,
    DateTime? submittedAt,
    String? commitId,
  }) =>
      ReviewModel(
        id: id ?? this.id,
        nodeId: nodeId ?? this.nodeId,
        user: user ?? this.user,
        body: body ?? this.body,
        state: state ?? this.state,
        htmlUrl: htmlUrl ?? this.htmlUrl,
        pullRequestUrl: pullRequestUrl ?? this.pullRequestUrl,
        authorAssociation: authorAssociation ?? this.authorAssociation,
        links: links ?? this.links,
        submittedAt: submittedAt ?? this.submittedAt,
        commitId: commitId ?? this.commitId,
      );

  factory ReviewModel.fromRawJson(String str) =>
      ReviewModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ReviewModel.fromJson(Map<String, dynamic> json) => ReviewModel(
        id: json["id"] == null ? null : json["id"],
        nodeId: json["node_id"] == null ? null : json["node_id"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        body: json["body"] == null ? null : json["body"],
        state: json["state"] == null ? null : json["state"],
        htmlUrl: json["html_url"] == null ? null : json["html_url"],
        pullRequestUrl:
            json["pull_request_url"] == null ? null : json["pull_request_url"],
        authorAssociation: json["author_association"] == null
            ? null
            : json["author_association"],
        links: json["_links"] == null ? null : Links.fromJson(json["_links"]),
        submittedAt: json["submitted_at"] == null
            ? null
            : DateTime.parse(json["submitted_at"]),
        commitId: json["commit_id"] == null ? null : json["commit_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "node_id": nodeId == null ? null : nodeId,
        "user": user == null ? null : user!.toJson(),
        "body": body == null ? null : body,
        "state": state == null ? null : state,
        "html_url": htmlUrl == null ? null : htmlUrl,
        "pull_request_url": pullRequestUrl == null ? null : pullRequestUrl,
        "author_association":
            authorAssociation == null ? null : authorAssociation,
        "_links": links == null ? null : links!.toJson(),
        "submitted_at":
            submittedAt == null ? null : submittedAt!.toIso8601String(),
        "commit_id": commitId == null ? null : commitId,
      };
}

class Links {
  Links({
    this.html,
    this.pullRequest,
  });

  Html? html;
  Html? pullRequest;

  Links copyWith({
    Html? html,
    Html? pullRequest,
  }) =>
      Links(
        html: html ?? this.html,
        pullRequest: pullRequest ?? this.pullRequest,
      );

  factory Links.fromRawJson(String str) => Links.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        html: json["html"] == null ? null : Html.fromJson(json["html"]),
        pullRequest: json["pull_request"] == null
            ? null
            : Html.fromJson(json["pull_request"]),
      );

  Map<String, dynamic> toJson() => {
        "html": html == null ? null : html!.toJson(),
        "pull_request": pullRequest == null ? null : pullRequest!.toJson(),
      };
}

class Html {
  Html({
    this.href,
  });

  String? href;

  Html copyWith({
    String? href,
  }) =>
      Html(
        href: href ?? this.href,
      );

  factory Html.fromRawJson(String str) => Html.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Html.fromJson(Map<String, dynamic> json) => Html(
        href: json["href"] == null ? null : json["href"],
      );

  Map<String, dynamic> toJson() => {
        "href": href == null ? null : href,
      };
}

class User {
  User({
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

  User copyWith({
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
      User(
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

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
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
