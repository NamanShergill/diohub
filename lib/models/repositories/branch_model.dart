// To parse this JSON data, do
//
//     final branchModel = branchModelFromJson(jsonString);

import 'dart:convert';

class BranchModel {
  BranchModel({
    this.name,
    this.commit,
    this.links,
    this.protected,
    this.protection,
    this.protectionUrl,
  });

  String? name;
  BranchModelCommit? commit;
  Links? links;
  bool? protected;
  Protection? protection;
  String? protectionUrl;

  BranchModel copyWith({
    String? name,
    BranchModelCommit? commit,
    Links? links,
    bool? protected,
    Protection? protection,
    String? protectionUrl,
  }) =>
      BranchModel(
        name: name ?? this.name,
        commit: commit ?? this.commit,
        links: links ?? this.links,
        protected: protected ?? this.protected,
        protection: protection ?? this.protection,
        protectionUrl: protectionUrl ?? this.protectionUrl,
      );

  factory BranchModel.fromRawJson(String str) =>
      BranchModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BranchModel.fromJson(Map<String, dynamic> json) => BranchModel(
        name: json["name"] == null ? null : json["name"],
        commit: json["commit"] == null
            ? null
            : BranchModelCommit.fromJson(json["commit"]),
        links: json["_links"] == null ? null : Links.fromJson(json["_links"]),
        protected: json["protected"] == null ? null : json["protected"],
        protection: json["protection"] == null
            ? null
            : Protection.fromJson(json["protection"]),
        protectionUrl:
            json["protection_url"] == null ? null : json["protection_url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "commit": commit == null ? null : commit!.toJson(),
        "_links": links == null ? null : links!.toJson(),
        "protected": protected == null ? null : protected,
        "protection": protection == null ? null : protection!.toJson(),
        "protection_url": protectionUrl == null ? null : protectionUrl,
      };
}

class BranchModelCommit {
  BranchModelCommit({
    this.sha,
    this.nodeId,
    this.commit,
    this.url,
    this.htmlUrl,
    this.commentsUrl,
    this.author,
    this.committer,
    this.parents,
  });

  String? sha;
  String? nodeId;
  CommitCommit? commit;
  String? url;
  String? htmlUrl;
  String? commentsUrl;
  PurpleAuthor? author;
  PurpleAuthor? committer;
  List<Parent>? parents;

  BranchModelCommit copyWith({
    String? sha,
    String? nodeId,
    CommitCommit? commit,
    String? url,
    String? htmlUrl,
    String? commentsUrl,
    PurpleAuthor? author,
    PurpleAuthor? committer,
    List<Parent>? parents,
  }) =>
      BranchModelCommit(
        sha: sha ?? this.sha,
        nodeId: nodeId ?? this.nodeId,
        commit: commit ?? this.commit,
        url: url ?? this.url,
        htmlUrl: htmlUrl ?? this.htmlUrl,
        commentsUrl: commentsUrl ?? this.commentsUrl,
        author: author ?? this.author,
        committer: committer ?? this.committer,
        parents: parents ?? this.parents,
      );

  factory BranchModelCommit.fromRawJson(String str) =>
      BranchModelCommit.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BranchModelCommit.fromJson(Map<String, dynamic> json) =>
      BranchModelCommit(
        sha: json["sha"] == null ? null : json["sha"],
        nodeId: json["node_id"] == null ? null : json["node_id"],
        commit: json["commit"] == null
            ? null
            : CommitCommit.fromJson(json["commit"]),
        url: json["url"] == null ? null : json["url"],
        htmlUrl: json["html_url"] == null ? null : json["html_url"],
        commentsUrl: json["comments_url"] == null ? null : json["comments_url"],
        author: json["author"] == null
            ? null
            : PurpleAuthor.fromJson(json["author"]),
        committer: json["committer"] == null
            ? null
            : PurpleAuthor.fromJson(json["committer"]),
        parents: json["parents"] == null
            ? null
            : List<Parent>.from(json["parents"].map((x) => Parent.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "sha": sha == null ? null : sha,
        "node_id": nodeId == null ? null : nodeId,
        "commit": commit == null ? null : commit!.toJson(),
        "url": url == null ? null : url,
        "html_url": htmlUrl == null ? null : htmlUrl,
        "comments_url": commentsUrl == null ? null : commentsUrl,
        "author": author == null ? null : author!.toJson(),
        "committer": committer == null ? null : committer!.toJson(),
        "parents": parents == null
            ? null
            : List<dynamic>.from(parents!.map((x) => x.toJson())),
      };
}

class PurpleAuthor {
  PurpleAuthor({
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

  PurpleAuthor copyWith({
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
      PurpleAuthor(
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

  factory PurpleAuthor.fromRawJson(String str) =>
      PurpleAuthor.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PurpleAuthor.fromJson(Map<String, dynamic> json) => PurpleAuthor(
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

class CommitCommit {
  CommitCommit({
    this.author,
    this.committer,
    this.message,
    this.tree,
    this.url,
    this.commentCount,
    this.verification,
  });

  FluffyAuthor? author;
  FluffyAuthor? committer;
  String? message;
  Tree? tree;
  String? url;
  int? commentCount;
  Verification? verification;

  CommitCommit copyWith({
    FluffyAuthor? author,
    FluffyAuthor? committer,
    String? message,
    Tree? tree,
    String? url,
    int? commentCount,
    Verification? verification,
  }) =>
      CommitCommit(
        author: author ?? this.author,
        committer: committer ?? this.committer,
        message: message ?? this.message,
        tree: tree ?? this.tree,
        url: url ?? this.url,
        commentCount: commentCount ?? this.commentCount,
        verification: verification ?? this.verification,
      );

  factory CommitCommit.fromRawJson(String str) =>
      CommitCommit.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CommitCommit.fromJson(Map<String, dynamic> json) => CommitCommit(
        author: json["author"] == null
            ? null
            : FluffyAuthor.fromJson(json["author"]),
        committer: json["committer"] == null
            ? null
            : FluffyAuthor.fromJson(json["committer"]),
        message: json["message"] == null ? null : json["message"],
        tree: json["tree"] == null ? null : Tree.fromJson(json["tree"]),
        url: json["url"] == null ? null : json["url"],
        commentCount:
            json["comment_count"] == null ? null : json["comment_count"],
        verification: json["verification"] == null
            ? null
            : Verification.fromJson(json["verification"]),
      );

  Map<String, dynamic> toJson() => {
        "author": author == null ? null : author!.toJson(),
        "committer": committer == null ? null : committer!.toJson(),
        "message": message == null ? null : message,
        "tree": tree == null ? null : tree!.toJson(),
        "url": url == null ? null : url,
        "comment_count": commentCount == null ? null : commentCount,
        "verification": verification == null ? null : verification!.toJson(),
      };
}

class FluffyAuthor {
  FluffyAuthor({
    this.name,
    this.email,
    this.date,
  });

  String? name;
  String? email;
  DateTime? date;

  FluffyAuthor copyWith({
    String? name,
    String? email,
    DateTime? date,
  }) =>
      FluffyAuthor(
        name: name ?? this.name,
        email: email ?? this.email,
        date: date ?? this.date,
      );

  factory FluffyAuthor.fromRawJson(String str) =>
      FluffyAuthor.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FluffyAuthor.fromJson(Map<String, dynamic> json) => FluffyAuthor(
        name: json["name"] == null ? null : json["name"],
        email: json["email"] == null ? null : json["email"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "email": email == null ? null : email,
        "date": date == null ? null : date!.toIso8601String(),
      };
}

class Tree {
  Tree({
    this.sha,
    this.url,
  });

  String? sha;
  String? url;

  Tree copyWith({
    String? sha,
    String? url,
  }) =>
      Tree(
        sha: sha ?? this.sha,
        url: url ?? this.url,
      );

  factory Tree.fromRawJson(String str) => Tree.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Tree.fromJson(Map<String, dynamic> json) => Tree(
        sha: json["sha"] == null ? null : json["sha"],
        url: json["url"] == null ? null : json["url"],
      );

  Map<String, dynamic> toJson() => {
        "sha": sha == null ? null : sha,
        "url": url == null ? null : url,
      };
}

class Verification {
  Verification({
    this.verified,
    this.reason,
    this.signature,
    this.payload,
  });

  bool? verified;
  String? reason;
  String? signature;
  String? payload;

  Verification copyWith({
    bool? verified,
    String? reason,
    String? signature,
    String? payload,
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
        signature: json["signature"] == null ? null : json["signature"],
        payload: json["payload"] == null ? null : json["payload"],
      );

  Map<String, dynamic> toJson() => {
        "verified": verified == null ? null : verified,
        "reason": reason == null ? null : reason,
        "signature": signature == null ? null : signature,
        "payload": payload == null ? null : payload,
      };
}

class Parent {
  Parent({
    this.sha,
    this.url,
    this.htmlUrl,
  });

  String? sha;
  String? url;
  String? htmlUrl;

  Parent copyWith({
    String? sha,
    String? url,
    String? htmlUrl,
  }) =>
      Parent(
        sha: sha ?? this.sha,
        url: url ?? this.url,
        htmlUrl: htmlUrl ?? this.htmlUrl,
      );

  factory Parent.fromRawJson(String str) => Parent.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Parent.fromJson(Map<String, dynamic> json) => Parent(
        sha: json["sha"] == null ? null : json["sha"],
        url: json["url"] == null ? null : json["url"],
        htmlUrl: json["html_url"] == null ? null : json["html_url"],
      );

  Map<String, dynamic> toJson() => {
        "sha": sha == null ? null : sha,
        "url": url == null ? null : url,
        "html_url": htmlUrl == null ? null : htmlUrl,
      };
}

class Links {
  Links({
    this.self,
    this.html,
  });

  String? self;
  String? html;

  Links copyWith({
    String? self,
    String? html,
  }) =>
      Links(
        self: self ?? this.self,
        html: html ?? this.html,
      );

  factory Links.fromRawJson(String str) => Links.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: json["self"] == null ? null : json["self"],
        html: json["html"] == null ? null : json["html"],
      );

  Map<String, dynamic> toJson() => {
        "self": self == null ? null : self,
        "html": html == null ? null : html,
      };
}

class Protection {
  Protection({
    this.enabled,
    this.requiredStatusChecks,
  });

  bool? enabled;
  RequiredStatusChecks? requiredStatusChecks;

  Protection copyWith({
    bool? enabled,
    RequiredStatusChecks? requiredStatusChecks,
  }) =>
      Protection(
        enabled: enabled ?? this.enabled,
        requiredStatusChecks: requiredStatusChecks ?? this.requiredStatusChecks,
      );

  factory Protection.fromRawJson(String str) =>
      Protection.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Protection.fromJson(Map<String, dynamic> json) => Protection(
        enabled: json["enabled"] == null ? null : json["enabled"],
        requiredStatusChecks: json["required_status_checks"] == null
            ? null
            : RequiredStatusChecks.fromJson(json["required_status_checks"]),
      );

  Map<String, dynamic> toJson() => {
        "enabled": enabled == null ? null : enabled,
        "required_status_checks":
            requiredStatusChecks == null ? null : requiredStatusChecks!.toJson(),
      };
}

class RequiredStatusChecks {
  RequiredStatusChecks({
    this.enforcementLevel,
    this.contexts,
  });

  String? enforcementLevel;
  List<dynamic>? contexts;

  RequiredStatusChecks copyWith({
    String? enforcementLevel,
    List<dynamic>? contexts,
  }) =>
      RequiredStatusChecks(
        enforcementLevel: enforcementLevel ?? this.enforcementLevel,
        contexts: contexts ?? this.contexts,
      );

  factory RequiredStatusChecks.fromRawJson(String str) =>
      RequiredStatusChecks.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RequiredStatusChecks.fromJson(Map<String, dynamic> json) =>
      RequiredStatusChecks(
        enforcementLevel: json["enforcement_level"] == null
            ? null
            : json["enforcement_level"],
        contexts: json["contexts"] == null
            ? null
            : List<dynamic>.from(json["contexts"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "enforcement_level": enforcementLevel == null ? null : enforcementLevel,
        "contexts": contexts == null
            ? null
            : List<dynamic>.from(contexts!.map((x) => x)),
      };
}
