// To parse this JSON data, do
//
//     final codeTreeeModel = codeTreeeModelFromJson(jsonString);

import 'dart:convert';

import 'package:onehub/models/repositories/commit_list_model.dart';

class CodeTreeModel {
  CodeTreeModel({this.sha, this.url, this.tree, this.truncated, this.commit});

  String sha;
  String url;
  List<Tree> tree;
  bool truncated;
  CommitListModel commit;

  CodeTreeModel copyWith({
    String sha,
    String url,
    List<Tree> tree,
    bool truncated,
    CommitListModel commit,
  }) =>
      CodeTreeModel(
        sha: sha ?? this.sha,
        url: url ?? this.url,
        tree: tree ?? this.tree,
        truncated: truncated ?? this.truncated,
        commit: commit ?? this.commit,
      );

  factory CodeTreeModel.fromRawJson(String str) =>
      CodeTreeModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CodeTreeModel.fromJson(Map<String, dynamic> json) => CodeTreeModel(
        sha: json["sha"] == null ? null : json["sha"],
        url: json["url"] == null ? null : json["url"],
        tree: json["tree"] == null
            ? null
            : List<Tree>.from(json["tree"].map((x) => Tree.fromJson(x))),
        truncated: json["truncated"] == null ? null : json["truncated"],
      );

  Map<String, dynamic> toJson() => {
        "sha": sha == null ? null : sha,
        "url": url == null ? null : url,
        "tree": tree == null
            ? null
            : List<dynamic>.from(tree.map((x) => x.toJson())),
        "truncated": truncated == null ? null : truncated,
        "commit": commit == null ? null : commit.toJson(),
      };
}

class Tree {
  Tree({
    this.path,
    this.mode,
    this.type,
    this.sha,
    this.size,
    this.url,
  });

  String path;
  String mode;
  Type type;
  String sha;
  int size;
  String url;

  Tree copyWith({
    String path,
    String mode,
    Type type,
    String sha,
    int size,
    String url,
  }) =>
      Tree(
        path: path ?? this.path,
        mode: mode ?? this.mode,
        type: type ?? this.type,
        sha: sha ?? this.sha,
        size: size ?? this.size,
        url: url ?? this.url,
      );

  factory Tree.fromRawJson(String str) => Tree.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Tree.fromJson(Map<String, dynamic> json) => Tree(
        path: json["path"] == null ? null : json["path"],
        mode: json["mode"] == null ? null : json["mode"],
        type: json["type"] == null ? null : typeValues.map[json["type"]],
        sha: json["sha"] == null ? null : json["sha"],
        size: json["size"] == null ? null : json["size"],
        url: json["url"] == null ? null : json["url"],
      );

  Map<String, dynamic> toJson() => {
        "path": path == null ? null : path,
        "mode": mode == null ? null : mode,
        "type": type == null ? null : typeValues.reverse[type],
        "sha": sha == null ? null : sha,
        "size": size == null ? null : size,
        "url": url == null ? null : url,
      };
}

enum Type { BLOB, TREE }

final typeValues = EnumValues({"blob": Type.BLOB, "tree": Type.TREE});

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
