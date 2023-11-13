// To parse this JSON data, do
//
//     final repoBranchListModel = repoBranchListModelFromJson(jsonString);
// ignore_for_file: type=lint

import 'dart:convert';

class RepoBranchListItemModel {
  RepoBranchListItemModel({
    this.name,
    this.commit,
    this.protected,
  });

  String? name;
  Commit? commit;
  bool? protected;

  RepoBranchListItemModel copyWith({
    String? name,
    Commit? commit,
    bool? protected,
  }) =>
      RepoBranchListItemModel(
        name: name ?? this.name,
        commit: commit ?? this.commit,
        protected: protected ?? this.protected,
      );

  factory RepoBranchListItemModel.fromRawJson(String str) =>
      RepoBranchListItemModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RepoBranchListItemModel.fromJson(Map<String, dynamic> json) =>
      RepoBranchListItemModel(
        name: json["name"] == null ? null : json["name"],
        commit: json["commit"] == null ? null : Commit.fromJson(json["commit"]),
        protected: json["protected"] == null ? null : json["protected"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "commit": commit == null ? null : commit!.toJson(),
        "protected": protected == null ? null : protected,
      };
}

class Commit {
  Commit({
    this.sha,
    this.url,
  });

  String? sha;
  String? url;

  Commit copyWith({
    String? sha,
    String? url,
  }) =>
      Commit(
        sha: sha ?? this.sha,
        url: url ?? this.url,
      );

  factory Commit.fromRawJson(String str) => Commit.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Commit.fromJson(Map<String, dynamic> json) => Commit(
        sha: json["sha"] == null ? null : json["sha"],
        url: json["url"] == null ? null : json["url"],
      );

  Map<String, dynamic> toJson() => {
        "sha": sha == null ? null : sha,
        "url": url == null ? null : url,
      };
}
