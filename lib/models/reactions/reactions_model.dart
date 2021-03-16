// To parse this JSON data, do
//
//     final reactionsModel = reactionsModelFromJson(jsonString);

import 'dart:convert';

import 'package:onehub/models/users/user_info_model.dart';

class ReactionsModel {
  ReactionsModel({
    this.id,
    this.nodeId,
    this.user,
    this.content,
    this.createdAt,
  });

  int id;
  String nodeId;
  UserInfoModel user;
  String content;
  DateTime createdAt;

  ReactionsModel copyWith({
    int id,
    String nodeId,
    UserInfoModel user,
    String content,
    DateTime createdAt,
  }) =>
      ReactionsModel(
        id: id ?? this.id,
        nodeId: nodeId ?? this.nodeId,
        user: user ?? this.user,
        content: content ?? this.content,
        createdAt: createdAt ?? this.createdAt,
      );

  factory ReactionsModel.fromRawJson(String str) =>
      ReactionsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ReactionsModel.fromJson(Map<String, dynamic> json) => ReactionsModel(
        id: json["id"] == null ? null : json["id"],
        nodeId: json["node_id"] == null ? null : json["node_id"],
        user:
            json["user"] == null ? null : UserInfoModel.fromJson(json["user"]),
        content: json["content"] == null ? null : json["content"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "node_id": nodeId == null ? null : nodeId,
        "user": user == null ? null : user.toJson(),
        "content": content == null ? null : content,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
      };
}
