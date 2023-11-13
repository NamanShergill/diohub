// To parse this JSON data, do
//
//     final issuesTimelineEventModel = issuesTimelineEventModelFromJson(jsonString);
// ignore_for_file: type=lint

import 'dart:convert';

import 'package:diohub/models/commits/commit_model.dart';
import 'package:diohub/models/events/events_model.dart';
import 'package:diohub/models/users/user_info_model.dart';

import 'issue_model.dart';

class TimelineEventModel {
  TimelineEventModel(
      {this.id,
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
      this.label,
      this.authorAssociation,
      this.body,
      this.source,
      this.sha,
      this.author,
      this.parents,
      this.committer,
      this.tree,
      this.message,
      this.pullRequestUrl});

  String? sha;
  int? id;
  String? nodeId;
  String? url;
  String? htmlUrl;
  Author? author;
  Tree? tree;
  Author? committer;
  String? message;
  List<Parent>? parents;
  UserInfoModel? actor;
  Event? event;
  String? commitId;
  dynamic commitUrl;
  DateTime? createdAt;
  dynamic performedViaGithubApp;
  Rename? rename;
  UserInfoModel? assignee;
  String? issueUrl;
  UserInfoModel? user;
  DateTime? updatedAt;
  AuthorAssociation? authorAssociation;
  String? body;
  Source? source;
  String? pullRequestUrl;
  Label? label;

  TimelineEventModel copyWith({
    int? id,
    String? nodeId,
    String? url,
    UserInfoModel? actor,
    Event? event,
    dynamic commitId,
    dynamic commitUrl,
    DateTime? createdAt,
    dynamic performedViaGithubApp,
    Rename? rename,
    UserInfoModel? assignee,
    String? htmlUrl,
    String? issueUrl,
    UserInfoModel? user,
    DateTime? updatedAt,
    AuthorAssociation? authorAssociation,
    String? body,
    Source? source,
  }) =>
      TimelineEventModel(
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

  factory TimelineEventModel.fromRawJson(String str) =>
      TimelineEventModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TimelineEventModel.fromJson(Map<String, dynamic> json) =>
      TimelineEventModel(
        id: json["id"] == null ? null : json["id"],
        nodeId: json["node_id"] == null ? null : json["node_id"],
        url: json["url"] == null ? null : json["url"],
        actor: json["actor"] == null
            ? null
            : UserInfoModel.fromJson(json["actor"]),
        event: json["event"] == null ? null : eventValues.map[json["event"]],
        label: json["label"] == null ? null : Label.fromJson(json["label"]),
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
        sha: json["sha"] == null ? null : json["sha"],
        author: json["author"] == null ? null : Author.fromJson(json["author"]),
        committer: json["committer"] == null
            ? null
            : Author.fromJson(json["committer"]),
        message: json["message"] == null ? null : json["message"],
        parents: json["parents"] == null
            ? null
            : List<Parent>.from(json["parents"].map((x) => Parent.fromJson(x))),
        pullRequestUrl:
            json["pull_request_url"] == null ? null : json["pull_request_url"],
        tree: json["tree"] == null ? null : Tree.fromJson(json["tree"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "node_id": nodeId == null ? null : nodeId,
        "url": url == null ? null : url,
        "actor": actor == null ? null : actor!.toJson(),
        "event": event == null ? null : eventValues.reverse![event!],
        "commit_id": commitId,
        "commit_url": commitUrl,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "performed_via_github_app": performedViaGithubApp,
        "rename": rename == null ? null : rename!.toJson(),
        "assignee": assignee == null ? null : assignee!.toJson(),
        "html_url": htmlUrl == null ? null : htmlUrl,
        "issue_url": issueUrl == null ? null : issueUrl,
        "user": user == null ? null : user!.toJson(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "author_association": authorAssociation == null
            ? null
            : authorAssociationValues.reverse![authorAssociation!],
        "body": body == null ? null : body,
        "source": source == null ? null : source!.toJson(),
      };
}

enum ActorType { USER, ORGANIZATION }

final actorTypeValues = EnumValues(
    {"Organization": ActorType.ORGANIZATION, "User": ActorType.USER});

enum AuthorAssociation { CONTRIBUTOR, MEMBER, NONE, COLLABORATOR, OWNER }

final authorAssociationValues = EnumValues({
  "COLLABORATOR": AuthorAssociation.COLLABORATOR,
  "CONTRIBUTOR": AuthorAssociation.CONTRIBUTOR,
  "MEMBER": AuthorAssociation.MEMBER,
  "NONE": AuthorAssociation.NONE,
  "OWNER": AuthorAssociation.OWNER,
});

enum Event {
  added_to_project,
  assigned,
  automatic_base_change_failed,
  automatic_base_change_succeeded,
  base_ref_changed,
  closed,
  commented,
  commit_commented,

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
  "commit-commented": Event.commit_commented,
});

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

class Source {
  Source({
    this.type,
    this.issue,
  });

  String? type;
  IssueModel? issue;

  Source copyWith({
    String? type,
    IssueModel? issue,
  }) =>
      Source(
        type: type ?? this.type,
        issue: issue ?? this.issue,
      );

  factory Source.fromRawJson(String str) => Source.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        type: json["type"] == null ? null : json["type"],
        issue:
            json["issue"] == null ? null : IssueModel.fromJson(json["issue"]),
      );

  Map<String, dynamic> toJson() => {
        "type": type == null ? null : type,
        "issue": issue == null ? null : issue!.toJson(),
      };
}

class PullRequest {
  PullRequest({
    this.url,
    this.htmlUrl,
    this.diffUrl,
    this.patchUrl,
  });

  String? url;
  String? htmlUrl;
  String? diffUrl;
  String? patchUrl;

  PullRequest copyWith({
    String? url,
    String? htmlUrl,
    String? diffUrl,
    String? patchUrl,
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

class License {
  License({
    this.key,
    this.name,
    this.spdxId,
    this.url,
    this.nodeId,
  });

  String? key;
  String? name;
  String? spdxId;
  String? url;
  String? nodeId;

  License copyWith({
    String? key,
    String? name,
    String? spdxId,
    String? url,
    String? nodeId,
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

  bool? admin;
  bool? push;
  bool? pull;

  Permissions copyWith({
    bool? admin,
    bool? push,
    bool? pull,
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
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
