// To parse this JSON data, do
//
//     final searchReposModel = searchReposModelFromJson(jsonString);

import 'dart:convert';

import 'package:diohub/models/repositories/repository_model.dart';

class SearchReposModel {
  SearchReposModel({
    this.totalCount,
    this.incompleteResults,
    this.items,
  });

  int? totalCount;
  bool? incompleteResults;
  List<RepositoryModel>? items;

  SearchReposModel copyWith({
    int? totalCount,
    bool? incompleteResults,
    List<RepositoryModel>? items,
  }) =>
      SearchReposModel(
        totalCount: totalCount ?? this.totalCount,
        incompleteResults: incompleteResults ?? this.incompleteResults,
        items: items ?? this.items,
      );

  factory SearchReposModel.fromRawJson(String str) =>
      SearchReposModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SearchReposModel.fromJson(Map<String, dynamic> json) =>
      SearchReposModel(
        totalCount: json["total_count"] == null ? null : json["total_count"],
        incompleteResults: json["incomplete_results"] == null
            ? null
            : json["incomplete_results"],
        items: json["items"] == null
            ? null
            : List<RepositoryModel>.from(
                json["items"].map((x) => RepositoryModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total_count": totalCount == null ? null : totalCount,
        "incomplete_results":
            incompleteResults == null ? null : incompleteResults,
        "items": items == null
            ? null
            : List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}
