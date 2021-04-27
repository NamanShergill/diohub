// To parse this JSON data, do
//
//     final issueCommentsModel = issueCommentsModelFromJson(jsonString);

import 'dart:convert';

import 'package:dio_hub/models/issues/issue_timeline_event_model.dart';
import 'package:dio_hub/models/users/user_info_model.dart';

class IssueCommentsModel {
  IssueCommentsModel({
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
  });

  String? url;
  String? htmlUrl;
  String? issueUrl;
  int? id;
  String? nodeId;
  UserInfoModel? user;
  DateTime? createdAt;
  DateTime? updatedAt;
  AuthorAssociation? authorAssociation;
  String? body;
  dynamic performedViaGithubApp;

  IssueCommentsModel copyWith({
    String? url,
    String? htmlUrl,
    String? issueUrl,
    int? id,
    String? nodeId,
    UserInfoModel? user,
    DateTime? createdAt,
    DateTime? updatedAt,
    AuthorAssociation? authorAssociation,
    String? body,
    dynamic performedViaGithubApp,
  }) =>
      IssueCommentsModel(
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
      );

  factory IssueCommentsModel.fromRawJson(String str) =>
      IssueCommentsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory IssueCommentsModel.fromJson(Map<String, dynamic> json) =>
      IssueCommentsModel(
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
      );

  Map<String, dynamic> toJson() => {
        "url": url == null ? null : url,
        "html_url": htmlUrl == null ? null : htmlUrl,
        "issue_url": issueUrl == null ? null : issueUrl,
        "id": id == null ? null : id,
        "node_id": nodeId == null ? null : nodeId,
        "user": user == null ? null : user!.toJson(),
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "author_association": authorAssociation == null
            ? null
            : authorAssociationValues.reverse![authorAssociation!],
        "body": body == null ? null : body,
        "performed_via_github_app": performedViaGithubApp,
      };
}

enum Type { USER }

final typeValues = EnumValues({"User": Type.USER});

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
