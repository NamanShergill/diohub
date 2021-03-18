// To parse this JSON data, do
//
//     final commitModel = commitModelFromJson(jsonString);

import 'dart:convert';

class CommitModel {
  CommitModel({
    this.sha,
    this.nodeId,
    this.commit,
    this.url,
    this.htmlUrl,
    this.commentsUrl,
    this.author,
    this.committer,
    this.parents,
    this.stats,
    this.files,
  });

  String? sha;
  String? nodeId;
  Commit? commit;
  String? url;
  String? htmlUrl;
  String? commentsUrl;
  CommitModelAuthor? author;
  CommitModelAuthor? committer;
  List<Parent>? parents;
  Stats? stats;
  List<FileElement>? files;

  CommitModel copyWith({
    String? sha,
    String? nodeId,
    Commit? commit,
    String? url,
    String? htmlUrl,
    String? commentsUrl,
    CommitModelAuthor? author,
    CommitModelAuthor? committer,
    List<Parent>? parents,
    Stats? stats,
    List<FileElement>? files,
  }) =>
      CommitModel(
        sha: sha ?? this.sha,
        nodeId: nodeId ?? this.nodeId,
        commit: commit ?? this.commit,
        url: url ?? this.url,
        htmlUrl: htmlUrl ?? this.htmlUrl,
        commentsUrl: commentsUrl ?? this.commentsUrl,
        author: author ?? this.author,
        committer: committer ?? this.committer,
        parents: parents ?? this.parents,
        stats: stats ?? this.stats,
        files: files ?? this.files,
      );

  factory CommitModel.fromRawJson(String str) =>
      CommitModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CommitModel.fromJson(Map<String, dynamic> json) => CommitModel(
        sha: json["sha"] == null ? null : json["sha"],
        nodeId: json["node_id"] == null ? null : json["node_id"],
        commit: json["commit"] == null ? null : Commit.fromJson(json["commit"]),
        url: json["url"] == null ? null : json["url"],
        htmlUrl: json["html_url"] == null ? null : json["html_url"],
        commentsUrl: json["comments_url"] == null ? null : json["comments_url"],
        author: json["author"] == null
            ? null
            : CommitModelAuthor.fromJson(json["author"]),
        committer: json["committer"] == null
            ? null
            : CommitModelAuthor.fromJson(json["committer"]),
        parents: json["parents"] == null
            ? null
            : List<Parent>.from(json["parents"].map((x) => Parent.fromJson(x))),
        stats: json["stats"] == null ? null : Stats.fromJson(json["stats"]),
        files: json["files"] == null
            ? null
            : List<FileElement>.from(
                json["files"].map((x) => FileElement.fromJson(x))),
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
        "stats": stats == null ? null : stats!.toJson(),
        "files": files == null
            ? null
            : List<dynamic>.from(files!.map((x) => x.toJson())),
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

  CommitModelAuthor copyWith({
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
    this.author,
    this.committer,
    this.message,
    this.tree,
    this.url,
    this.commentCount,
    this.verification,
  });

  CommitAuthor? author;
  CommitAuthor? committer;
  String? message;
  Tree? tree;
  String? url;
  int? commentCount;
  Verification? verification;

  Commit copyWith({
    CommitAuthor? author,
    CommitAuthor? committer,
    String? message,
    Tree? tree,
    String? url,
    int? commentCount,
    Verification? verification,
  }) =>
      Commit(
        author: author ?? this.author,
        committer: committer ?? this.committer,
        message: message ?? this.message,
        tree: tree ?? this.tree,
        url: url ?? this.url,
        commentCount: commentCount ?? this.commentCount,
        verification: verification ?? this.verification,
      );

  factory Commit.fromRawJson(String str) => Commit.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Commit.fromJson(Map<String, dynamic> json) => Commit(
        author: json["author"] == null
            ? null
            : CommitAuthor.fromJson(json["author"]),
        committer: json["committer"] == null
            ? null
            : CommitAuthor.fromJson(json["committer"]),
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

class CommitAuthor {
  CommitAuthor({
    this.name,
    this.email,
    this.date,
  });

  String? name;
  String? email;
  DateTime? date;

  CommitAuthor copyWith({
    String? name,
    String? email,
    DateTime? date,
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
  dynamic signature;
  dynamic payload;

  Verification copyWith({
    bool? verified,
    String? reason,
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

class FileElement {
  FileElement({
    this.sha,
    this.filename,
    this.status,
    this.additions,
    this.deletions,
    this.changes,
    this.blobUrl,
    this.rawUrl,
    this.contentsUrl,
    this.patch,
    this.previousFilename,
  });

  String? sha;
  String? filename;
  CommitStatus? status;
  int? additions;
  int? deletions;
  int? changes;
  String? blobUrl;
  String? rawUrl;
  String? contentsUrl;
  String? patch;
  String? previousFilename;

  FileElement copyWith({
    String? sha,
    String? filename,
    CommitStatus? status,
    int? additions,
    int? deletions,
    int? changes,
    String? blobUrl,
    String? rawUrl,
    String? contentsUrl,
    String? patch,
    String? previousFilename,
  }) =>
      FileElement(
        sha: sha ?? this.sha,
        filename: filename ?? this.filename,
        status: status ?? this.status,
        additions: additions ?? this.additions,
        deletions: deletions ?? this.deletions,
        changes: changes ?? this.changes,
        blobUrl: blobUrl ?? this.blobUrl,
        rawUrl: rawUrl ?? this.rawUrl,
        contentsUrl: contentsUrl ?? this.contentsUrl,
        patch: patch ?? this.patch,
        previousFilename: previousFilename ?? this.previousFilename,
      );

  factory FileElement.fromRawJson(String str) =>
      FileElement.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FileElement.fromJson(Map<String, dynamic> json) => FileElement(
        sha: json["sha"] == null ? null : json["sha"],
        filename: json["filename"] == null ? null : json["filename"],
        status:
            json["status"] == null ? null : statusValues.map[json["status"]],
        additions: json["additions"] == null ? null : json["additions"],
        deletions: json["deletions"] == null ? null : json["deletions"],
        changes: json["changes"] == null ? null : json["changes"],
        blobUrl: json["blob_url"] == null ? null : json["blob_url"],
        rawUrl: json["raw_url"] == null ? null : json["raw_url"],
        contentsUrl: json["contents_url"] == null ? null : json["contents_url"],
        patch: json["patch"] == null ? null : json["patch"],
        previousFilename: json["previous_filename"] == null
            ? null
            : json["previous_filename"],
      );

  Map<String, dynamic> toJson() => {
        "sha": sha == null ? null : sha,
        "filename": filename == null ? null : filename,
        "status": status == null ? null : statusValues.reverse![status!],
        "additions": additions == null ? null : additions,
        "deletions": deletions == null ? null : deletions,
        "changes": changes == null ? null : changes,
        "blob_url": blobUrl == null ? null : blobUrl,
        "raw_url": rawUrl == null ? null : rawUrl,
        "contents_url": contentsUrl == null ? null : contentsUrl,
        "patch": patch == null ? null : patch,
        "previous_filename": previousFilename == null ? null : previousFilename,
      };
}

enum CommitStatus { MODIFIED, ADDED, RENAMED, REMOVED }

final statusValues = EnumValues({
  "added": CommitStatus.ADDED,
  "modified": CommitStatus.MODIFIED,
  "removed": CommitStatus.REMOVED,
  "renamed": CommitStatus.RENAMED
});

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

class Stats {
  Stats({
    this.total,
    this.additions,
    this.deletions,
  });

  int? total;
  int? additions;
  int? deletions;

  Stats copyWith({
    int? total,
    int? additions,
    int? deletions,
  }) =>
      Stats(
        total: total ?? this.total,
        additions: additions ?? this.additions,
        deletions: deletions ?? this.deletions,
      );

  factory Stats.fromRawJson(String str) => Stats.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Stats.fromJson(Map<String, dynamic> json) => Stats(
        total: json["total"] == null ? null : json["total"],
        additions: json["additions"] == null ? null : json["additions"],
        deletions: json["deletions"] == null ? null : json["deletions"],
      );

  Map<String, dynamic> toJson() => {
        "total": total == null ? null : total,
        "additions": additions == null ? null : additions,
        "deletions": deletions == null ? null : deletions,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
