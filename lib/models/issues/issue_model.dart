// To parse this JSON data, do
//
//     final issueModel = issueModelFromJson(jsonString);

import 'dart:convert';

import 'package:diohub/models/issues/issue_timeline_event_model.dart';
import 'package:diohub/models/repositories/repository_model.dart';
import 'package:diohub/models/users/user_info_model.dart';

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
    this.repository,
    this.body,
    this.closedBy,
    this.timelineUrl,
    this.bodyHtml,
    this.performedViaGithubApp,
    this.pullRequest,
  });

  String? url;
  String? repositoryUrl;
  String? labelsUrl;
  String? commentsUrl;
  String? eventsUrl;
  String? htmlUrl;
  int? id;
  String? bodyHtml;
  UserInfoModel? closedBy;

  String? nodeId;
  int? number;
  String? title;
  UserInfoModel? user;
  List<Label>? labels;
  IssueState? state;
  bool? locked;
  UserInfoModel? assignee;
  List<UserInfoModel>? assignees;
  dynamic milestone;
  int? comments;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? closedAt;
  AuthorAssociation? authorAssociation;
  dynamic activeLockReason;
  RepositoryModel? repository;
  String? body;
  String? timelineUrl;
  dynamic performedViaGithubApp;
  PullRequest? pullRequest;

  IssueModel copyWith({
    String? url,
    String? repositoryUrl,
    String? labelsUrl,
    String? commentsUrl,
    String? eventsUrl,
    String? htmlUrl,
    int? id,
    String? nodeId,
    int? number,
    String? title,
    UserInfoModel? closedBy,
    UserInfoModel? user,
    List<Label>? labels,
    IssueState? state,
    bool? locked,
    UserInfoModel? assignee,
    List<UserInfoModel>? assignees,
    dynamic milestone,
    int? comments,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? closedAt,
    AuthorAssociation? authorAssociation,
    dynamic activeLockReason,
    RepositoryModel? repository,
    String? body,
    String? timelineUrl,
    dynamic performedViaGithubApp,
    PullRequest? pullRequest,
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
        closedBy: closedBy ?? this.closedBy,
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
        bodyHtml: json['body_html'],
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
        closedBy: json["closed_by"] == null
            ? null
            : UserInfoModel.fromJson(json["closed_by"]),
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
            : RepositoryModel.fromJson(json["repository"]),
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
        "body_html": bodyHtml,
        "html_url": htmlUrl == null ? null : htmlUrl,
        "id": id == null ? null : id,
        "node_id": nodeId == null ? null : nodeId,
        "number": number == null ? null : number,
        "title": title == null ? null : title,
        "user": user == null ? null : user!.toJson(),
        "closed_by": closedBy == null ? null : closedBy!.toJson(),
        "labels": labels == null
            ? null
            : List<dynamic>.from(labels!.map((x) => x.toJson())),
        "state": state == null ? null : stateValues.reverse![state!],
        "locked": locked == null ? null : locked,
        "assignee": assignee == null ? null : assignee!.toJson(),
        "assignees": assignees == null
            ? null
            : List<dynamic>.from(assignees!.map((x) => x.toJson())),
        "milestone": milestone,
        "comments": comments == null ? null : comments,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "closed_at": closedAt == null ? null : closedAt!.toIso8601String(),
        "author_association": authorAssociation == null
            ? null
            : authorAssociationValues.reverse![authorAssociation!],
        "active_lock_reason": activeLockReason,
        "repository": repository == null ? null : repository!.toJson(),
        "body": body == null ? null : body,
        "timeline_url": timelineUrl == null ? null : timelineUrl,
        "performed_via_github_app": performedViaGithubApp,
        "pull_request": pullRequest == null ? null : pullRequest!.toJson(),
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

  int? id;
  String? nodeId;
  String? url;
  String? name;
  String? color;
  bool? labelDefault;
  String? description;

  Label copyWith({
    int? id,
    String? nodeId,
    String? url,
    String? name,
    String? color,
    bool? labelDefault,
    String? description,
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

  String? url;
  String? htmlUrl;
  String? labelsUrl;
  int? id;
  String? nodeId;
  int? number;
  String? title;
  String? description;
  UserInfoModel? creator;
  int? openIssues;
  int? closedIssues;
  IssueState? state;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? dueOn;
  dynamic closedAt;

  Milestone copyWith({
    String? url,
    String? htmlUrl,
    String? labelsUrl,
    int? id,
    String? nodeId,
    int? number,
    String? title,
    String? description,
    UserInfoModel? creator,
    int? openIssues,
    int? closedIssues,
    IssueState? state,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? dueOn,
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
        creator: json["creator"] == null
            ? null
            : UserInfoModel.fromJson(json["creator"]),
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
        "creator": creator == null ? null : creator!.toJson(),
        "open_issues": openIssues == null ? null : openIssues,
        "closed_issues": closedIssues == null ? null : closedIssues,
        "state": state == null ? null : stateValues.reverse![state!],
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "due_on": dueOn == null ? null : dueOn!.toIso8601String(),
        "closed_at": closedAt,
      };
}

enum IssueState { CLOSED, OPEN, REOPENED }

final stateValues = EnumValues({
  "closed": IssueState.CLOSED,
  "open": IssueState.OPEN,
  "reopened": IssueState.REOPENED
});

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
