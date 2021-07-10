// To parse this JSON data, do
//
//     final searchUsersModel = searchUsersModelFromJson(jsonString);

import 'dart:convert';

import 'package:dio_hub/models/users/user_info_model.dart';

class SearchUsersModel {
  SearchUsersModel({
    this.totalCount,
    this.incompleteResults,
    this.items,
  });

  int? totalCount;
  bool? incompleteResults;
  List<UserInfoModel>? items;

  SearchUsersModel copyWith({
    int? totalCount,
    bool? incompleteResults,
    List<UserInfoModel>? items,
  }) =>
      SearchUsersModel(
        totalCount: totalCount ?? this.totalCount,
        incompleteResults: incompleteResults ?? this.incompleteResults,
        items: items ?? this.items,
      );

  factory SearchUsersModel.fromRawJson(String str) =>
      SearchUsersModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SearchUsersModel.fromJson(Map<String, dynamic> json) =>
      SearchUsersModel(
        totalCount: json["total_count"] == null ? null : json["total_count"],
        incompleteResults: json["incomplete_results"] == null
            ? null
            : json["incomplete_results"],
        items: json["items"] == null
            ? null
            : List<UserInfoModel>.from(
                json["items"].map((x) => UserInfoModel.fromJson(x))),
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
