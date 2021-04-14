// @dart=2.9
// To parse this JSON data, do
//
//     final searchUsersGraphQlModel = searchUsersGraphQlModelFromJson(jsonString);

import 'dart:convert';

class SearchUsersGraphQlModel {
  SearchUsersGraphQlModel({
    this.search,
  });

  Search search;

  SearchUsersGraphQlModel copyWith({
    Search search,
  }) =>
      SearchUsersGraphQlModel(
        search: search ?? this.search,
      );

  factory SearchUsersGraphQlModel.fromRawJson(String str) =>
      SearchUsersGraphQlModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SearchUsersGraphQlModel.fromJson(Map<String, dynamic> json) =>
      SearchUsersGraphQlModel(
        search: json["search"] == null ? null : Search.fromJson(json["search"]),
      );

  Map<String, dynamic> toJson() => {
        "search": search == null ? null : search.toJson(),
      };
}

class Search {
  Search({
    this.edges,
  });

  List<UserEdge> edges;

  Search copyWith({
    List<UserEdge> edges,
  }) =>
      Search(
        edges: edges ?? this.edges,
      );

  factory Search.fromRawJson(String str) => Search.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Search.fromJson(Map<String, dynamic> json) => Search(
        edges: json["edges"] == null
            ? null
            : List<UserEdge>.from(
                json["edges"].map((x) => UserEdge.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "edges": edges == null
            ? null
            : List<dynamic>.from(edges.map((x) => x.toJson())),
      };
}

class UserEdge {
  UserEdge({
    this.node,
    this.cursor,
  });

  Node node;
  String cursor;

  UserEdge copyWith({
    Node node,
    String cursor,
  }) =>
      UserEdge(
        node: node ?? this.node,
        cursor: cursor ?? this.cursor,
      );

  factory UserEdge.fromRawJson(String str) =>
      UserEdge.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserEdge.fromJson(Map<String, dynamic> json) => UserEdge(
        node: json["node"] == null ? null : Node.fromJson(json["node"]),
        cursor: json["cursor"] == null ? null : json["cursor"],
      );

  Map<String, dynamic> toJson() => {
        "node": node == null ? null : node.toJson(),
        "cursor": cursor == null ? null : cursor,
      };
}

class Node {
  Node({
    this.login,
    this.avatarUrl,
  });

  String login;
  String avatarUrl;

  Node copyWith({
    String login,
    String avatarUrl,
  }) =>
      Node(
        login: login ?? this.login,
        avatarUrl: avatarUrl ?? this.avatarUrl,
      );

  factory Node.fromRawJson(String str) => Node.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Node.fromJson(Map<String, dynamic> json) => Node(
        login: json["login"] == null ? null : json["login"],
        avatarUrl: json["avatarUrl"] == null ? null : json["avatarUrl"],
      );

  Map<String, dynamic> toJson() => {
        "login": login == null ? null : login,
        "avatarUrl": avatarUrl == null ? null : avatarUrl,
      };
}
