// To parse this JSON data, do
//
//     final commitModel = commitModelFromJson(jsonString);

import 'dart:convert';

class CommitModel {
  CommitModel({
    this.url,
    this.sha,
    this.nodeId,
    this.htmlUrl,
    this.commentsUrl,
    this.commit,
    this.author,
    this.committer,
    this.parents,
  });

  String url;
  String sha;
  String nodeId;
  String htmlUrl;
  String commentsUrl;
  Commit commit;
  CommitModelAuthor author;
  CommitModelAuthor committer;
  List<Parent> parents;

  CommitModel copyWith({
    String url,
    String sha,
    String nodeId,
    String htmlUrl,
    String commentsUrl,
    Commit commit,
    CommitModelAuthor author,
    CommitModelAuthor committer,
    List<Parent> parents,
  }) =>
      CommitModel(
        url: url ?? this.url,
        sha: sha ?? this.sha,
        nodeId: nodeId ?? this.nodeId,
        htmlUrl: htmlUrl ?? this.htmlUrl,
        commentsUrl: commentsUrl ?? this.commentsUrl,
        commit: commit ?? this.commit,
        author: author ?? this.author,
        committer: committer ?? this.committer,
        parents: parents ?? this.parents,
      );

  factory CommitModel.fromRawJson(String str) =>
      CommitModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CommitModel.fromJson(Map<String, dynamic> json) => CommitModel(
        url: json["url"] == null ? null : json["url"],
        sha: json["sha"] == null ? null : json["sha"],
        nodeId: json["node_id"] == null ? null : json["node_id"],
        htmlUrl: json["html_url"] == null ? null : json["html_url"],
        commentsUrl: json["comments_url"] == null ? null : json["comments_url"],
        commit: json["commit"] == null ? null : Commit.fromJson(json["commit"]),
        author: json["author"] == null
            ? null
            : CommitModelAuthor.fromJson(json["author"]),
        committer: json["committer"] == null
            ? null
            : CommitModelAuthor.fromJson(json["committer"]),
        parents: json["parents"] == null
            ? null
            : List<Parent>.from(json["parents"].map((x) => Parent.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "url": url == null ? null : url,
        "sha": sha == null ? null : sha,
        "node_id": nodeId == null ? null : nodeId,
        "html_url": htmlUrl == null ? null : htmlUrl,
        "comments_url": commentsUrl == null ? null : commentsUrl,
        "commit": commit == null ? null : commit.toJson(),
        "author": author == null ? null : author.toJson(),
        "committer": committer == null ? null : committer.toJson(),
        "parents": parents == null
            ? null
            : List<dynamic>.from(parents.map((x) => x.toJson())),
      };
}

class CommitModelAuthor {
  CommitModelAuthor({
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

  CommitModelAuthor copyWith({
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
      CommitModelAuthor(
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

  factory CommitModelAuthor.fromRawJson(String str) =>
      CommitModelAuthor.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CommitModelAuthor.fromJson(Map<String, dynamic> json) =>
      CommitModelAuthor(
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

class Commit {
  Commit({
    this.url,
    this.author,
    this.committer,
    this.message,
    this.tree,
    this.commentCount,
    this.verification,
  });

  String url;
  CommitAuthor author;
  CommitAuthor committer;
  String message;
  Parent tree;
  int commentCount;
  Verification verification;

  Commit copyWith({
    String url,
    CommitAuthor author,
    CommitAuthor committer,
    String message,
    Parent tree,
    int commentCount,
    Verification verification,
  }) =>
      Commit(
        url: url ?? this.url,
        author: author ?? this.author,
        committer: committer ?? this.committer,
        message: message ?? this.message,
        tree: tree ?? this.tree,
        commentCount: commentCount ?? this.commentCount,
        verification: verification ?? this.verification,
      );

  factory Commit.fromRawJson(String str) => Commit.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Commit.fromJson(Map<String, dynamic> json) => Commit(
        url: json["url"] == null ? null : json["url"],
        author: json["author"] == null
            ? null
            : CommitAuthor.fromJson(json["author"]),
        committer: json["committer"] == null
            ? null
            : CommitAuthor.fromJson(json["committer"]),
        message: json["message"] == null ? null : json["message"],
        tree: json["tree"] == null ? null : Parent.fromJson(json["tree"]),
        commentCount:
            json["comment_count"] == null ? null : json["comment_count"],
        verification: json["verification"] == null
            ? null
            : Verification.fromJson(json["verification"]),
      );

  Map<String, dynamic> toJson() => {
        "url": url == null ? null : url,
        "author": author == null ? null : author.toJson(),
        "committer": committer == null ? null : committer.toJson(),
        "message": message == null ? null : message,
        "tree": tree == null ? null : tree.toJson(),
        "comment_count": commentCount == null ? null : commentCount,
        "verification": verification == null ? null : verification.toJson(),
      };
}

class CommitAuthor {
  CommitAuthor({
    this.name,
    this.email,
    this.date,
  });

  String name;
  String email;
  DateTime date;

  CommitAuthor copyWith({
    String name,
    String email,
    DateTime date,
  }) =>
      CommitAuthor(
        name: name ?? this.name,
        email: email ?? this.email,
        date: date ?? this.date,
      );

  factory CommitAuthor.fromRawJson(String str) =>
      CommitAuthor.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CommitAuthor.fromJson(Map<String, dynamic> json) => CommitAuthor(
        name: json["name"] == null ? null : json["name"],
        email: json["email"] == null ? null : json["email"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "email": email == null ? null : email,
        "date": date == null ? null : date.toIso8601String(),
      };
}

class Parent {
  Parent({
    this.url,
    this.sha,
  });

  String url;
  String sha;

  Parent copyWith({
    String url,
    String sha,
  }) =>
      Parent(
        url: url ?? this.url,
        sha: sha ?? this.sha,
      );

  factory Parent.fromRawJson(String str) => Parent.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Parent.fromJson(Map<String, dynamic> json) => Parent(
        url: json["url"] == null ? null : json["url"],
        sha: json["sha"] == null ? null : json["sha"],
      );

  Map<String, dynamic> toJson() => {
        "url": url == null ? null : url,
        "sha": sha == null ? null : sha,
      };
}

class Verification {
  Verification({
    this.verified,
    this.reason,
    this.signature,
    this.payload,
  });

  bool verified;
  String reason;
  dynamic signature;
  dynamic payload;

  Verification copyWith({
    bool verified,
    String reason,
    dynamic signature,
    dynamic payload,
  }) =>
      Verification(
        verified: verified ?? this.verified,
        reason: reason ?? this.reason,
        signature: signature ?? this.signature,
        payload: payload ?? this.payload,
      );

  factory Verification.fromRawJson(String str) =>
      Verification.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Verification.fromJson(Map<String, dynamic> json) => Verification(
        verified: json["verified"] == null ? null : json["verified"],
        reason: json["reason"] == null ? null : json["reason"],
        signature: json["signature"],
        payload: json["payload"],
      );

  Map<String, dynamic> toJson() => {
        "verified": verified == null ? null : verified,
        "reason": reason == null ? null : reason,
        "signature": signature,
        "payload": payload,
      };
}
