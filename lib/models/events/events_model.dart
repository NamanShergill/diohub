// @dart=2.9
// To parse this JSON data, do
//
//     final eventsModel = eventsModelFromJson(jsonString);

import 'dart:convert';

import 'package:onehub/models/issues/issue_model.dart';
import 'package:onehub/models/pull_requests/pull_request_model.dart';
import 'package:onehub/models/repositories/repository_model.dart';

class EventsModel {
  EventsModel({
    this.id,
    this.type,
    this.actor,
    this.repo,
    this.payload,
    this.public,
    this.createdAt,
    this.org,
  });

  String id;
  EventsType type;
  Actor actor;
  EventsModelRepo repo;
  Payload payload;
  bool public;
  DateTime createdAt;
  Actor org;

  EventsModel copyWith({
    String id,
    EventsType type,
    Actor actor,
    EventsModelRepo repo,
    Payload payload,
    bool public,
    DateTime createdAt,
    Actor org,
  }) =>
      EventsModel(
        id: id ?? this.id,
        type: type ?? this.type,
        actor: actor ?? this.actor,
        repo: repo ?? this.repo,
        payload: payload ?? this.payload,
        public: public ?? this.public,
        createdAt: createdAt ?? this.createdAt,
        org: org ?? this.org,
      );

  factory EventsModel.fromRawJson(String str) =>
      EventsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory EventsModel.fromJson(Map<String, dynamic> json) => EventsModel(
        id: json["id"] == null ? null : json["id"],
        type: json["type"] == null ? null : eventsValues.map[json["type"]],
        actor: json["actor"] == null ? null : Actor.fromJson(json["actor"]),
        repo: json["repo"] == null
            ? null
            : EventsModelRepo.fromJson(json["repo"]),
        payload:
            json["payload"] == null ? null : Payload.fromJson(json["payload"]),
        public: json["public"] == null ? null : json["public"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        org: json["org"] == null ? null : Actor.fromJson(json["org"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "type": type == null ? null : type,
        "actor": actor == null ? null : actor.toJson(),
        "repo": repo == null ? null : repo.toJson(),
        "payload": payload == null ? null : payload.toJson(),
        "public": public == null ? null : public,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "org": org == null ? null : org.toJson(),
      };
}

class Actor {
  Actor({
    this.id,
    this.login,
    this.displayLogin,
    this.gravatarId,
    this.url,
    this.avatarUrl,
  });

  int id;
  String login;
  String displayLogin;
  String gravatarId;
  String url;
  String avatarUrl;

  Actor copyWith({
    int id,
    String login,
    String displayLogin,
    String gravatarId,
    String url,
    String avatarUrl,
  }) =>
      Actor(
        id: id ?? this.id,
        login: login ?? this.login,
        displayLogin: displayLogin ?? this.displayLogin,
        gravatarId: gravatarId ?? this.gravatarId,
        url: url ?? this.url,
        avatarUrl: avatarUrl ?? this.avatarUrl,
      );

  factory Actor.fromRawJson(String str) => Actor.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Actor.fromJson(Map<String, dynamic> json) => Actor(
        id: json["id"] == null ? null : json["id"],
        login: json["login"] == null ? null : json["login"],
        displayLogin:
            json["display_login"] == null ? null : json["display_login"],
        gravatarId: json["gravatar_id"] == null ? null : json["gravatar_id"],
        url: json["url"] == null ? null : json["url"],
        avatarUrl: json["avatar_url"] == null ? null : json["avatar_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "login": login == null ? null : login,
        "display_login": displayLogin == null ? null : displayLogin,
        "gravatar_id": gravatarId == null ? null : gravatarId,
        "url": url == null ? null : url,
        "avatar_url": avatarUrl == null ? null : avatarUrl,
      };
}

class Payload {
  Payload({
    this.forkee,
    this.pushId,
    this.size,
    this.distinctSize,
    this.ref,
    this.head,
    this.before,
    this.commits,
    this.action,
    this.number,
    this.pullRequest,
    this.refType,
    this.masterBranch,
    this.description,
    this.pusherType,
    this.issue,
    this.comment,
    this.review,
    this.release,
  });

  RepositoryModel forkee;
  int pushId;
  int size;
  int distinctSize;
  String ref;
  String head;
  String before;
  List<Commit> commits;
  Action action;
  int number;
  PullRequestModel pullRequest;
  RefType refType;
  MasterBranch masterBranch;
  String description;
  PusherType pusherType;
  IssueModel issue;
  Comment comment;
  Review review;
  Release release;

  Payload copyWith({
    RepositoryModel forkee,
    int pushId,
    int size,
    int distinctSize,
    String ref,
    String head,
    String before,
    List<Commit> commits,
    Action action,
    int number,
    PullRequestModel pullRequest,
    RefType refType,
    MasterBranch masterBranch,
    String description,
    PusherType pusherType,
    IssueModel issue,
    Comment comment,
    Review review,
    Release release,
  }) =>
      Payload(
        forkee: forkee ?? this.forkee,
        pushId: pushId ?? this.pushId,
        size: size ?? this.size,
        distinctSize: distinctSize ?? this.distinctSize,
        ref: ref ?? this.ref,
        head: head ?? this.head,
        before: before ?? this.before,
        commits: commits ?? this.commits,
        action: action ?? this.action,
        number: number ?? this.number,
        pullRequest: pullRequest ?? this.pullRequest,
        refType: refType ?? this.refType,
        masterBranch: masterBranch ?? this.masterBranch,
        description: description ?? this.description,
        pusherType: pusherType ?? this.pusherType,
        issue: issue ?? this.issue,
        comment: comment ?? this.comment,
        review: review ?? this.review,
        release: release ?? this.release,
      );

  factory Payload.fromRawJson(String str) => Payload.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        forkee: json["forkee"] == null
            ? null
            : RepositoryModel.fromJson(json["forkee"]),
        pushId: json["push_id"] == null ? null : json["push_id"],
        size: json["size"] == null ? null : json["size"],
        distinctSize:
            json["distinct_size"] == null ? null : json["distinct_size"],
        ref: json["ref"] == null ? null : json["ref"],
        head: json["head"] == null ? null : json["head"],
        before: json["before"] == null ? null : json["before"],
        commits: json["commits"] == null
            ? null
            : List<Commit>.from(json["commits"].map((x) => Commit.fromJson(x))),
        action:
            json["action"] == null ? null : actionValues.map[json["action"]],
        number: json["number"] == null ? null : json["number"],
        pullRequest: json["pull_request"] == null
            ? null
            : PullRequestModel.fromJson(json["pull_request"]),
        refType: json["ref_type"] == null
            ? null
            : refTypeValues.map[json["ref_type"]],
        masterBranch: json["master_branch"] == null
            ? null
            : masterBranchValues.map[json["master_branch"]],
        description: json["description"] == null ? null : json["description"],
        pusherType: json["pusher_type"] == null
            ? null
            : pusherTypeValues.map[json["pusher_type"]],
        issue:
            json["issue"] == null ? null : IssueModel.fromJson(json["issue"]),
        comment:
            json["comment"] == null ? null : Comment.fromJson(json["comment"]),
        review: json["review"] == null ? null : Review.fromJson(json["review"]),
        release:
            json["release"] == null ? null : Release.fromJson(json["release"]),
      );

  Map<String, dynamic> toJson() => {
        "forkee": forkee == null ? null : forkee.toJson(),
        "push_id": pushId == null ? null : pushId,
        "size": size == null ? null : size,
        "distinct_size": distinctSize == null ? null : distinctSize,
        "ref": ref == null ? null : ref,
        "head": head == null ? null : head,
        "before": before == null ? null : before,
        "commits": commits == null
            ? null
            : List<dynamic>.from(commits.map((x) => x.toJson())),
        "action": action == null ? null : actionValues.reverse[action],
        "number": number == null ? null : number,
        "pull_request": pullRequest == null ? null : pullRequest.toJson(),
        "ref_type": refType == null ? null : refTypeValues.reverse[refType],
        "master_branch": masterBranch == null
            ? null
            : masterBranchValues.reverse[masterBranch],
        "description": description == null ? null : description,
        "pusher_type":
            pusherType == null ? null : pusherTypeValues.reverse[pusherType],
        "issue": issue == null ? null : issue.toJson(),
        "comment": comment == null ? null : comment.toJson(),
        "review": review == null ? null : review.toJson(),
        "release": release == null ? null : release.toJson(),
      };
}

enum Action { OPENED, STARTED, CREATED, CLOSED, PUBLISHED }

final actionValues = EnumValues({
  "closed": Action.CLOSED,
  "created": Action.CREATED,
  "opened": Action.OPENED,
  "published": Action.PUBLISHED,
  "started": Action.STARTED
});

class Comment {
  Comment({
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
    this.pullRequestReviewId,
    this.diffHunk,
    this.path,
    this.position,
    this.originalPosition,
    this.commitId,
    this.originalCommitId,
    this.pullRequestUrl,
    this.links,
    this.startLine,
    this.originalStartLine,
    this.startSide,
    this.line,
    this.originalLine,
    this.side,
    this.inReplyToId,
  });

  String url;
  String htmlUrl;
  String issueUrl;
  int id;
  String nodeId;
  User user;
  DateTime createdAt;
  DateTime updatedAt;
  String authorAssociation;
  String body;
  dynamic performedViaGithubApp;
  int pullRequestReviewId;
  String diffHunk;
  String path;
  int position;
  int originalPosition;
  String commitId;
  String originalCommitId;
  String pullRequestUrl;
  CommentLinks links;
  dynamic startLine;
  dynamic originalStartLine;
  dynamic startSide;
  int line;
  int originalLine;
  String side;
  int inReplyToId;

  Comment copyWith({
    String url,
    String htmlUrl,
    String issueUrl,
    int id,
    String nodeId,
    User user,
    DateTime createdAt,
    DateTime updatedAt,
    String authorAssociation,
    String body,
    dynamic performedViaGithubApp,
    int pullRequestReviewId,
    String diffHunk,
    String path,
    int position,
    int originalPosition,
    String commitId,
    String originalCommitId,
    String pullRequestUrl,
    CommentLinks links,
    dynamic startLine,
    dynamic originalStartLine,
    dynamic startSide,
    int line,
    int originalLine,
    String side,
    int inReplyToId,
  }) =>
      Comment(
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
        pullRequestReviewId: pullRequestReviewId ?? this.pullRequestReviewId,
        diffHunk: diffHunk ?? this.diffHunk,
        path: path ?? this.path,
        position: position ?? this.position,
        originalPosition: originalPosition ?? this.originalPosition,
        commitId: commitId ?? this.commitId,
        originalCommitId: originalCommitId ?? this.originalCommitId,
        pullRequestUrl: pullRequestUrl ?? this.pullRequestUrl,
        links: links ?? this.links,
        startLine: startLine ?? this.startLine,
        originalStartLine: originalStartLine ?? this.originalStartLine,
        startSide: startSide ?? this.startSide,
        line: line ?? this.line,
        originalLine: originalLine ?? this.originalLine,
        side: side ?? this.side,
        inReplyToId: inReplyToId ?? this.inReplyToId,
      );

  factory Comment.fromRawJson(String str) => Comment.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        url: json["url"] == null ? null : json["url"],
        htmlUrl: json["html_url"] == null ? null : json["html_url"],
        issueUrl: json["issue_url"] == null ? null : json["issue_url"],
        id: json["id"] == null ? null : json["id"],
        nodeId: json["node_id"] == null ? null : json["node_id"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        authorAssociation: json["author_association"] == null
            ? null
            : json["author_association"],
        body: json["body"] == null ? null : json["body"],
        performedViaGithubApp: json["performed_via_github_app"],
        pullRequestReviewId: json["pull_request_review_id"] == null
            ? null
            : json["pull_request_review_id"],
        diffHunk: json["diff_hunk"] == null ? null : json["diff_hunk"],
        path: json["path"] == null ? null : json["path"],
        position: json["position"] == null ? null : json["position"],
        originalPosition: json["original_position"] == null
            ? null
            : json["original_position"],
        commitId: json["commit_id"] == null ? null : json["commit_id"],
        originalCommitId: json["original_commit_id"] == null
            ? null
            : json["original_commit_id"],
        pullRequestUrl:
            json["pull_request_url"] == null ? null : json["pull_request_url"],
        links: json["_links"] == null
            ? null
            : CommentLinks.fromJson(json["_links"]),
        startLine: json["start_line"],
        originalStartLine: json["original_start_line"],
        startSide: json["start_side"],
        line: json["line"] == null ? null : json["line"],
        originalLine:
            json["original_line"] == null ? null : json["original_line"],
        side: json["side"] == null ? null : json["side"],
        inReplyToId:
            json["in_reply_to_id"] == null ? null : json["in_reply_to_id"],
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
        "author_association":
            authorAssociation == null ? null : authorAssociation,
        "body": body == null ? null : body,
        "performed_via_github_app": performedViaGithubApp,
        "pull_request_review_id":
            pullRequestReviewId == null ? null : pullRequestReviewId,
        "diff_hunk": diffHunk == null ? null : diffHunk,
        "path": path == null ? null : path,
        "position": position == null ? null : position,
        "original_position": originalPosition == null ? null : originalPosition,
        "commit_id": commitId == null ? null : commitId,
        "original_commit_id":
            originalCommitId == null ? null : originalCommitId,
        "pull_request_url": pullRequestUrl == null ? null : pullRequestUrl,
        "_links": links == null ? null : links.toJson(),
        "start_line": startLine,
        "original_start_line": originalStartLine,
        "start_side": startSide,
        "line": line == null ? null : line,
        "original_line": originalLine == null ? null : originalLine,
        "side": side == null ? null : side,
        "in_reply_to_id": inReplyToId == null ? null : inReplyToId,
      };
}

class CommentLinks {
  CommentLinks({
    this.self,
    this.html,
    this.pullRequest,
  });

  Html self;
  Html html;
  Html pullRequest;

  CommentLinks copyWith({
    Html self,
    Html html,
    Html pullRequest,
  }) =>
      CommentLinks(
        self: self ?? this.self,
        html: html ?? this.html,
        pullRequest: pullRequest ?? this.pullRequest,
      );

  factory CommentLinks.fromRawJson(String str) =>
      CommentLinks.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CommentLinks.fromJson(Map<String, dynamic> json) => CommentLinks(
        self: json["self"] == null ? null : Html.fromJson(json["self"]),
        html: json["html"] == null ? null : Html.fromJson(json["html"]),
        pullRequest: json["pull_request"] == null
            ? null
            : Html.fromJson(json["pull_request"]),
      );

  Map<String, dynamic> toJson() => {
        "self": self == null ? null : self.toJson(),
        "html": html == null ? null : html.toJson(),
        "pull_request": pullRequest == null ? null : pullRequest.toJson(),
      };
}

class Html {
  Html({
    this.href,
  });

  String href;

  Html copyWith({
    String href,
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
  Type type;
  bool siteAdmin;

  User copyWith({
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
    Type type,
    bool siteAdmin,
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
        type: json["type"] == null ? null : typeValues.map[json["type"]],
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
        "type": type == null ? null : typeValues.reverse[type],
        "site_admin": siteAdmin == null ? null : siteAdmin,
      };
}

enum Type { BOT, USER, ORGANIZATION }

final typeValues = EnumValues(
    {"Bot": Type.BOT, "Organization": Type.ORGANIZATION, "User": Type.USER});

class Commit {
  Commit({
    this.sha,
    this.author,
    this.message,
    this.distinct,
    this.url,
  });

  String sha;
  Author author;
  String message;
  bool distinct;
  String url;

  Commit copyWith({
    String sha,
    Author author,
    String message,
    bool distinct,
    String url,
  }) =>
      Commit(
        sha: sha ?? this.sha,
        author: author ?? this.author,
        message: message ?? this.message,
        distinct: distinct ?? this.distinct,
        url: url ?? this.url,
      );

  factory Commit.fromRawJson(String str) => Commit.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Commit.fromJson(Map<String, dynamic> json) => Commit(
        sha: json["sha"] == null ? null : json["sha"],
        author: json["author"] == null ? null : Author.fromJson(json["author"]),
        message: json["message"] == null ? null : json["message"],
        distinct: json["distinct"] == null ? null : json["distinct"],
        url: json["url"] == null ? null : json["url"],
      );

  Map<String, dynamic> toJson() => {
        "sha": sha == null ? null : sha,
        "author": author == null ? null : author.toJson(),
        "message": message == null ? null : message,
        "distinct": distinct == null ? null : distinct,
        "url": url == null ? null : url,
      };
}

class Author {
  Author({
    this.email,
    this.name,
    this.date,
  });

  String email;
  String name;
  DateTime date;

  Author copyWith({
    String email,
    String name,
    DateTime date,
  }) =>
      Author(
        email: email ?? this.email,
        name: name ?? this.name,
        date: date ?? this.date,
      );

  factory Author.fromRawJson(String str) => Author.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        email: json["email"] == null ? null : json["email"],
        name: json["name"] == null ? null : json["name"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "email": email == null ? null : email,
        "name": name == null ? null : name,
        "date": date == null ? null : date,
      };
}

enum MasterBranch { MASTER, MAIN, DEVELOP }

final masterBranchValues = EnumValues({
  "develop": MasterBranch.DEVELOP,
  "main": MasterBranch.MAIN,
  "master": MasterBranch.MASTER
});

class License {
  License({
    this.key,
    this.name,
    this.spdxId,
    this.url,
    this.nodeId,
  });

  Key key;
  Name name;
  SpdxId spdxId;
  String url;
  NodeId nodeId;

  License copyWith({
    Key key,
    Name name,
    SpdxId spdxId,
    String url,
    NodeId nodeId,
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
        name: json["name"] == null ? null : nameValues.map[json["name"]],
        spdxId:
            json["spdx_id"] == null ? null : spdxIdValues.map[json["spdx_id"]],
        url: json["url"] == null ? null : json["url"],
        nodeId:
            json["node_id"] == null ? null : nodeIdValues.map[json["node_id"]],
      );

  Map<String, dynamic> toJson() => {
        "key": key == null ? null : keyValues.reverse[key],
        "name": name == null ? null : nameValues.reverse[name],
        "spdx_id": spdxId == null ? null : spdxIdValues.reverse[spdxId],
        "url": url == null ? null : url,
        "node_id": nodeId == null ? null : nodeIdValues.reverse[nodeId],
      };
}

enum Key { MIT, AGPL_30, APACHE_20, GPL_30, MPL_20, OTHER }

final keyValues = EnumValues({
  "agpl-3.0": Key.AGPL_30,
  "apache-2.0": Key.APACHE_20,
  "gpl-3.0": Key.GPL_30,
  "mit": Key.MIT,
  "mpl-2.0": Key.MPL_20,
  "other": Key.OTHER
});

enum Name {
  MIT_LICENSE,
  GNU_AFFERO_GENERAL_PUBLIC_LICENSE_V3_0,
  APACHE_LICENSE_20,
  GNU_GENERAL_PUBLIC_LICENSE_V3_0,
  MOZILLA_PUBLIC_LICENSE_20,
  OTHER
}

final nameValues = EnumValues({
  "Apache License 2.0": Name.APACHE_LICENSE_20,
  "GNU Affero General Public License v3.0":
      Name.GNU_AFFERO_GENERAL_PUBLIC_LICENSE_V3_0,
  "GNU General Public License v3.0": Name.GNU_GENERAL_PUBLIC_LICENSE_V3_0,
  "MIT License": Name.MIT_LICENSE,
  "Mozilla Public License 2.0": Name.MOZILLA_PUBLIC_LICENSE_20,
  "Other": Name.OTHER
});

enum NodeId {
  M_DC6_T_GLJ_ZW5_Z_ZT_EZ,
  M_DC6_T_GLJ_ZW5_Z_ZTE,
  M_DC6_T_GLJ_ZW5_Z_ZTI,
  M_DC6_T_GLJ_ZW5_Z_Z_TK,
  M_DC6_T_GLJ_ZW5_Z_ZTE0,
  M_DC6_T_GLJ_ZW5_Z_ZTA
}

final nodeIdValues = EnumValues({
  "MDc6TGljZW5zZTA=": NodeId.M_DC6_T_GLJ_ZW5_Z_ZTA,
  "MDc6TGljZW5zZTE=": NodeId.M_DC6_T_GLJ_ZW5_Z_ZTE,
  "MDc6TGljZW5zZTE0": NodeId.M_DC6_T_GLJ_ZW5_Z_ZTE0,
  "MDc6TGljZW5zZTI=": NodeId.M_DC6_T_GLJ_ZW5_Z_ZTI,
  "MDc6TGljZW5zZTEz": NodeId.M_DC6_T_GLJ_ZW5_Z_ZT_EZ,
  "MDc6TGljZW5zZTk=": NodeId.M_DC6_T_GLJ_ZW5_Z_Z_TK
});

enum SpdxId { MIT, AGPL_30, APACHE_20, GPL_30, MPL_20, NOASSERTION }

final spdxIdValues = EnumValues({
  "AGPL-3.0": SpdxId.AGPL_30,
  "Apache-2.0": SpdxId.APACHE_20,
  "GPL-3.0": SpdxId.GPL_30,
  "MIT": SpdxId.MIT,
  "MPL-2.0": SpdxId.MPL_20,
  "NOASSERTION": SpdxId.NOASSERTION
});

class IssuePullRequest {
  IssuePullRequest({
    this.url,
    this.htmlUrl,
    this.diffUrl,
    this.patchUrl,
  });

  String url;
  String htmlUrl;
  String diffUrl;
  String patchUrl;

  IssuePullRequest copyWith({
    String url,
    String htmlUrl,
    String diffUrl,
    String patchUrl,
  }) =>
      IssuePullRequest(
        url: url ?? this.url,
        htmlUrl: htmlUrl ?? this.htmlUrl,
        diffUrl: diffUrl ?? this.diffUrl,
        patchUrl: patchUrl ?? this.patchUrl,
      );

  factory IssuePullRequest.fromRawJson(String str) =>
      IssuePullRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory IssuePullRequest.fromJson(Map<String, dynamic> json) =>
      IssuePullRequest(
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

enum State { OPEN, CLOSED }

final stateValues = EnumValues({"closed": State.CLOSED, "open": State.OPEN});

class Base {
  Base({
    this.label,
    this.ref,
    this.sha,
    this.user,
    this.repo,
  });

  String label;
  String ref;
  String sha;
  User user;
  BaseRepo repo;

  Base copyWith({
    String label,
    String ref,
    String sha,
    User user,
    BaseRepo repo,
  }) =>
      Base(
        label: label ?? this.label,
        ref: ref ?? this.ref,
        sha: sha ?? this.sha,
        user: user ?? this.user,
        repo: repo ?? this.repo,
      );

  factory Base.fromRawJson(String str) => Base.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Base.fromJson(Map<String, dynamic> json) => Base(
        label: json["label"] == null ? null : json["label"],
        ref: json["ref"] == null ? null : json["ref"],
        sha: json["sha"] == null ? null : json["sha"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        repo: json["repo"] == null ? null : BaseRepo.fromJson(json["repo"]),
      );

  Map<String, dynamic> toJson() => {
        "label": label == null ? null : label,
        "ref": ref == null ? null : ref,
        "sha": sha == null ? null : sha,
        "user": user == null ? null : user.toJson(),
        "repo": repo == null ? null : repo.toJson(),
      };
}

class BaseRepo {
  BaseRepo({
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
  });

  int id;
  String nodeId;
  String name;
  String fullName;
  bool private;
  User owner;
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
  MasterBranch defaultBranch;

  BaseRepo copyWith({
    int id,
    String nodeId,
    String name,
    String fullName,
    bool private,
    User owner,
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
    MasterBranch defaultBranch,
  }) =>
      BaseRepo(
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
      );

  factory BaseRepo.fromRawJson(String str) =>
      BaseRepo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BaseRepo.fromJson(Map<String, dynamic> json) => BaseRepo(
        id: json["id"] == null ? null : json["id"],
        nodeId: json["node_id"] == null ? null : json["node_id"],
        name: json["name"] == null ? null : json["name"],
        fullName: json["full_name"] == null ? null : json["full_name"],
        private: json["private"] == null ? null : json["private"],
        owner: json["owner"] == null ? null : User.fromJson(json["owner"]),
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
        defaultBranch: json["default_branch"] == null
            ? null
            : masterBranchValues.map[json["default_branch"]],
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
        "default_branch": defaultBranch == null
            ? null
            : masterBranchValues.reverse[defaultBranch],
      };
}

class PullRequestLinks {
  PullRequestLinks({
    this.self,
    this.html,
    this.issue,
    this.comments,
    this.reviewComments,
    this.reviewComment,
    this.commits,
    this.statuses,
  });

  Html self;
  Html html;
  Html issue;
  Html comments;
  Html reviewComments;
  Html reviewComment;
  Html commits;
  Html statuses;

  PullRequestLinks copyWith({
    Html self,
    Html html,
    Html issue,
    Html comments,
    Html reviewComments,
    Html reviewComment,
    Html commits,
    Html statuses,
  }) =>
      PullRequestLinks(
        self: self ?? this.self,
        html: html ?? this.html,
        issue: issue ?? this.issue,
        comments: comments ?? this.comments,
        reviewComments: reviewComments ?? this.reviewComments,
        reviewComment: reviewComment ?? this.reviewComment,
        commits: commits ?? this.commits,
        statuses: statuses ?? this.statuses,
      );

  factory PullRequestLinks.fromRawJson(String str) =>
      PullRequestLinks.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PullRequestLinks.fromJson(Map<String, dynamic> json) =>
      PullRequestLinks(
        self: json["self"] == null ? null : Html.fromJson(json["self"]),
        html: json["html"] == null ? null : Html.fromJson(json["html"]),
        issue: json["issue"] == null ? null : Html.fromJson(json["issue"]),
        comments:
            json["comments"] == null ? null : Html.fromJson(json["comments"]),
        reviewComments: json["review_comments"] == null
            ? null
            : Html.fromJson(json["review_comments"]),
        reviewComment: json["review_comment"] == null
            ? null
            : Html.fromJson(json["review_comment"]),
        commits:
            json["commits"] == null ? null : Html.fromJson(json["commits"]),
        statuses:
            json["statuses"] == null ? null : Html.fromJson(json["statuses"]),
      );

  Map<String, dynamic> toJson() => {
        "self": self == null ? null : self.toJson(),
        "html": html == null ? null : html.toJson(),
        "issue": issue == null ? null : issue.toJson(),
        "comments": comments == null ? null : comments.toJson(),
        "review_comments":
            reviewComments == null ? null : reviewComments.toJson(),
        "review_comment": reviewComment == null ? null : reviewComment.toJson(),
        "commits": commits == null ? null : commits.toJson(),
        "statuses": statuses == null ? null : statuses.toJson(),
      };
}

enum MergeableState { UNKNOWN, CLEAN }

final mergeableStateValues = EnumValues(
    {"clean": MergeableState.CLEAN, "unknown": MergeableState.UNKNOWN});

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
  User creator;
  int openIssues;
  int closedIssues;
  State state;
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
    User creator,
    int openIssues,
    int closedIssues,
    State state,
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
            json["creator"] == null ? null : User.fromJson(json["creator"]),
        openIssues: json["open_issues"] == null ? null : json["open_issues"],
        closedIssues:
            json["closed_issues"] == null ? null : json["closed_issues"],
        state: json["state"] == null ? null : stateValues.map[json["state"]],
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
        "state": state == null ? null : stateValues.reverse[state],
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "due_on": dueOn == null ? null : dueOn.toIso8601String(),
        "closed_at": closedAt,
      };
}

enum PusherType { USER }

final pusherTypeValues = EnumValues({"user": PusherType.USER});

enum RefType { BRANCH, REPOSITORY, TAG }

final refTypeValues = EnumValues({
  "branch": RefType.BRANCH,
  "repository": RefType.REPOSITORY,
  "tag": RefType.TAG
});

class Release {
  Release({
    this.url,
    this.assetsUrl,
    this.uploadUrl,
    this.htmlUrl,
    this.id,
    this.author,
    this.nodeId,
    this.tagName,
    this.targetCommitish,
    this.name,
    this.draft,
    this.prerelease,
    this.createdAt,
    this.publishedAt,
    this.assets,
    this.tarballUrl,
    this.zipballUrl,
    this.body,
  });

  String url;
  String assetsUrl;
  String uploadUrl;
  String htmlUrl;
  int id;
  User author;
  String nodeId;
  String tagName;
  MasterBranch targetCommitish;
  String name;
  bool draft;
  bool prerelease;
  DateTime createdAt;
  DateTime publishedAt;
  List<dynamic> assets;
  String tarballUrl;
  String zipballUrl;
  String body;

  Release copyWith({
    String url,
    String assetsUrl,
    String uploadUrl,
    String htmlUrl,
    int id,
    User author,
    String nodeId,
    String tagName,
    MasterBranch targetCommitish,
    String name,
    bool draft,
    bool prerelease,
    DateTime createdAt,
    DateTime publishedAt,
    List<dynamic> assets,
    String tarballUrl,
    String zipballUrl,
    String body,
  }) =>
      Release(
        url: url ?? this.url,
        assetsUrl: assetsUrl ?? this.assetsUrl,
        uploadUrl: uploadUrl ?? this.uploadUrl,
        htmlUrl: htmlUrl ?? this.htmlUrl,
        id: id ?? this.id,
        author: author ?? this.author,
        nodeId: nodeId ?? this.nodeId,
        tagName: tagName ?? this.tagName,
        targetCommitish: targetCommitish ?? this.targetCommitish,
        name: name ?? this.name,
        draft: draft ?? this.draft,
        prerelease: prerelease ?? this.prerelease,
        createdAt: createdAt ?? this.createdAt,
        publishedAt: publishedAt ?? this.publishedAt,
        assets: assets ?? this.assets,
        tarballUrl: tarballUrl ?? this.tarballUrl,
        zipballUrl: zipballUrl ?? this.zipballUrl,
        body: body ?? this.body,
      );

  factory Release.fromRawJson(String str) => Release.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Release.fromJson(Map<String, dynamic> json) => Release(
        url: json["url"] == null ? null : json["url"],
        assetsUrl: json["assets_url"] == null ? null : json["assets_url"],
        uploadUrl: json["upload_url"] == null ? null : json["upload_url"],
        htmlUrl: json["html_url"] == null ? null : json["html_url"],
        id: json["id"] == null ? null : json["id"],
        author: json["author"] == null ? null : User.fromJson(json["author"]),
        nodeId: json["node_id"] == null ? null : json["node_id"],
        tagName: json["tag_name"] == null ? null : json["tag_name"],
        targetCommitish: json["target_commitish"] == null
            ? null
            : masterBranchValues.map[json["target_commitish"]],
        name: json["name"] == null ? null : json["name"],
        draft: json["draft"] == null ? null : json["draft"],
        prerelease: json["prerelease"] == null ? null : json["prerelease"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        publishedAt: json["published_at"] == null
            ? null
            : DateTime.parse(json["published_at"]),
        assets: json["assets"] == null
            ? null
            : List<dynamic>.from(json["assets"].map((x) => x)),
        tarballUrl: json["tarball_url"] == null ? null : json["tarball_url"],
        zipballUrl: json["zipball_url"] == null ? null : json["zipball_url"],
        body: json["body"] == null ? null : json["body"],
      );

  Map<String, dynamic> toJson() => {
        "url": url == null ? null : url,
        "assets_url": assetsUrl == null ? null : assetsUrl,
        "upload_url": uploadUrl == null ? null : uploadUrl,
        "html_url": htmlUrl == null ? null : htmlUrl,
        "id": id == null ? null : id,
        "author": author == null ? null : author.toJson(),
        "node_id": nodeId == null ? null : nodeId,
        "tag_name": tagName == null ? null : tagName,
        "target_commitish": targetCommitish == null
            ? null
            : masterBranchValues.reverse[targetCommitish],
        "name": name == null ? null : name,
        "draft": draft == null ? null : draft,
        "prerelease": prerelease == null ? null : prerelease,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "published_at":
            publishedAt == null ? null : publishedAt.toIso8601String(),
        "assets":
            assets == null ? null : List<dynamic>.from(assets.map((x) => x)),
        "tarball_url": tarballUrl == null ? null : tarballUrl,
        "zipball_url": zipballUrl == null ? null : zipballUrl,
        "body": body == null ? null : body,
      };
}

class Review {
  Review({
    this.id,
    this.nodeId,
    this.user,
    this.body,
    this.commitId,
    this.submittedAt,
    this.state,
    this.htmlUrl,
    this.pullRequestUrl,
    this.authorAssociation,
    this.links,
  });

  int id;
  String nodeId;
  User user;
  String body;
  String commitId;
  DateTime submittedAt;
  String state;
  String htmlUrl;
  String pullRequestUrl;
  String authorAssociation;
  ReviewLinks links;

  Review copyWith({
    int id,
    String nodeId,
    User user,
    String body,
    String commitId,
    DateTime submittedAt,
    String state,
    String htmlUrl,
    String pullRequestUrl,
    String authorAssociation,
    ReviewLinks links,
  }) =>
      Review(
        id: id ?? this.id,
        nodeId: nodeId ?? this.nodeId,
        user: user ?? this.user,
        body: body ?? this.body,
        commitId: commitId ?? this.commitId,
        submittedAt: submittedAt ?? this.submittedAt,
        state: state ?? this.state,
        htmlUrl: htmlUrl ?? this.htmlUrl,
        pullRequestUrl: pullRequestUrl ?? this.pullRequestUrl,
        authorAssociation: authorAssociation ?? this.authorAssociation,
        links: links ?? this.links,
      );

  factory Review.fromRawJson(String str) => Review.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        id: json["id"] == null ? null : json["id"],
        nodeId: json["node_id"] == null ? null : json["node_id"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        body: json["body"] == null ? null : json["body"],
        commitId: json["commit_id"] == null ? null : json["commit_id"],
        submittedAt: json["submitted_at"] == null
            ? null
            : DateTime.parse(json["submitted_at"]),
        state: json["state"] == null ? null : json["state"],
        htmlUrl: json["html_url"] == null ? null : json["html_url"],
        pullRequestUrl:
            json["pull_request_url"] == null ? null : json["pull_request_url"],
        authorAssociation: json["author_association"] == null
            ? null
            : json["author_association"],
        links: json["_links"] == null
            ? null
            : ReviewLinks.fromJson(json["_links"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "node_id": nodeId == null ? null : nodeId,
        "user": user == null ? null : user.toJson(),
        "body": body == null ? null : body,
        "commit_id": commitId == null ? null : commitId,
        "submitted_at":
            submittedAt == null ? null : submittedAt.toIso8601String(),
        "state": state == null ? null : state,
        "html_url": htmlUrl == null ? null : htmlUrl,
        "pull_request_url": pullRequestUrl == null ? null : pullRequestUrl,
        "author_association":
            authorAssociation == null ? null : authorAssociation,
        "_links": links == null ? null : links.toJson(),
      };
}

class ReviewLinks {
  ReviewLinks({
    this.html,
    this.pullRequest,
  });

  Html html;
  Html pullRequest;

  ReviewLinks copyWith({
    Html html,
    Html pullRequest,
  }) =>
      ReviewLinks(
        html: html ?? this.html,
        pullRequest: pullRequest ?? this.pullRequest,
      );

  factory ReviewLinks.fromRawJson(String str) =>
      ReviewLinks.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ReviewLinks.fromJson(Map<String, dynamic> json) => ReviewLinks(
        html: json["html"] == null ? null : Html.fromJson(json["html"]),
        pullRequest: json["pull_request"] == null
            ? null
            : Html.fromJson(json["pull_request"]),
      );

  Map<String, dynamic> toJson() => {
        "html": html == null ? null : html.toJson(),
        "pull_request": pullRequest == null ? null : pullRequest.toJson(),
      };
}

class EventsModelRepo {
  EventsModelRepo({
    this.id,
    this.name,
    this.url,
  });

  int id;
  String name;
  String url;

  EventsModelRepo copyWith({
    int id,
    String name,
    String url,
  }) =>
      EventsModelRepo(
        id: id ?? this.id,
        name: name ?? this.name,
        url: url ?? this.url,
      );

  factory EventsModelRepo.fromRawJson(String str) =>
      EventsModelRepo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory EventsModelRepo.fromJson(Map<String, dynamic> json) =>
      EventsModelRepo(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        url: json["url"] == null ? null : json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "url": url == null ? null : url,
      };
}

// Ref: https://docs.github.com/en/developers/webhooks-and-events/github-event-types
enum EventsType {
  CommitCommentEvent,
  CreateEvent,
  DeleteEvent,
  ForkEvent,
  GollumEvent,
  IssueCommentEvent,
  IssuesEvent,
  MemberEvent,
  PublicEvent,
  PullRequestEvent,
  PullRequestReviewCommentEvent,
  PushEvent,
  ReleaseEvent,
  SponsorshipEvent,
  WatchEvent,
  Undefined
}

final eventsValues = EnumValues({
  "CommitCommentEvent": EventsType.CommitCommentEvent,
  "CreateEvent": EventsType.CreateEvent,
  "DeleteEvent": EventsType.DeleteEvent,
  "ForkEvent": EventsType.ForkEvent,
  "GollumEvent": EventsType.GollumEvent,
  "IssueCommentEvent": EventsType.IssueCommentEvent,
  "IssuesEvent": EventsType.IssuesEvent,
  "MemberEvent": EventsType.MemberEvent,
  "PublicEvent": EventsType.PublicEvent,
  "PullRequestEvent": EventsType.PullRequestEvent,
  "PullRequestReviewCommentEvent": EventsType.PullRequestReviewCommentEvent,
  "PushEvent": EventsType.PushEvent,
  "ReleaseEvent": EventsType.ReleaseEvent,
  "WatchEvent": EventsType.WatchEvent,
  "Undefined": EventsType.Undefined,
});

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
