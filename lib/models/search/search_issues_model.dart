// ignore_for_file: type=lint
// To parse this JSON data, do
//
//     final searchIssuesModel = searchIssuesModelFromJson(jsonString);

import 'dart:convert';

import 'package:diohub/models/issues/issue_model.dart';

class SearchIssuesModel {
  SearchIssuesModel({
    this.totalCount,
    this.incompleteResults,
    this.items,
  });

  int? totalCount;
  bool? incompleteResults;
  List<IssueModel>? items;

  SearchIssuesModel copyWith({
    int? totalCount,
    bool? incompleteResults,
    List<IssueModel>? items,
  }) =>
      SearchIssuesModel(
        totalCount: totalCount ?? this.totalCount,
        incompleteResults: incompleteResults ?? this.incompleteResults,
        items: items ?? this.items,
      );

  factory SearchIssuesModel.fromRawJson(String str) =>
      SearchIssuesModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SearchIssuesModel.fromJson(Map<String, dynamic> json) =>
      SearchIssuesModel(
        totalCount: json["total_count"] == null ? null : json["total_count"],
        incompleteResults: json["incomplete_results"] == null
            ? null
            : json["incomplete_results"],
        items: json["items"] == null
            ? null
            : List<IssueModel>.from(
                json["items"].map((x) => IssueModel.fromJson(x))),
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
