// To parse this JSON data, do
//
//     final pinnedReposModel = pinnedReposModelFromJson(jsonString);

import 'dart:convert';

class PinnedReposModel {
  PinnedReposModel({
    this.user,
  });

  User user;

  PinnedReposModel copyWith({
    User user,
  }) =>
      PinnedReposModel(
        user: user ?? this.user,
      );

  factory PinnedReposModel.fromRawJson(String str) =>
      PinnedReposModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PinnedReposModel.fromJson(Map<String, dynamic> json) =>
      PinnedReposModel(
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user == null ? null : user.toJson(),
      };
}

class User {
  User({
    this.pinnedItems,
  });

  PinnedItems pinnedItems;

  User copyWith({
    PinnedItems pinnedItems,
  }) =>
      User(
        pinnedItems: pinnedItems ?? this.pinnedItems,
      );

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        pinnedItems: json["pinnedItems"] == null
            ? null
            : PinnedItems.fromJson(json["pinnedItems"]),
      );

  Map<String, dynamic> toJson() => {
        "pinnedItems": pinnedItems == null ? null : pinnedItems.toJson(),
      };
}

class PinnedItems {
  PinnedItems({
    this.edges,
  });

  List<PinnedItemsEdge> edges;

  PinnedItems copyWith({
    List<PinnedItemsEdge> edges,
  }) =>
      PinnedItems(
        edges: edges ?? this.edges,
      );

  factory PinnedItems.fromRawJson(String str) =>
      PinnedItems.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PinnedItems.fromJson(Map<String, dynamic> json) => PinnedItems(
        edges: json["edges"] == null
            ? null
            : List<PinnedItemsEdge>.from(
                json["edges"].map((x) => PinnedItemsEdge.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "edges": edges == null
            ? null
            : List<dynamic>.from(edges.map((x) => x.toJson())),
      };
}

class PinnedItemsEdge {
  PinnedItemsEdge({
    this.node,
  });

  PurpleNode node;

  PinnedItemsEdge copyWith({
    PurpleNode node,
  }) =>
      PinnedItemsEdge(
        node: node ?? this.node,
      );

  factory PinnedItemsEdge.fromRawJson(String str) =>
      PinnedItemsEdge.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PinnedItemsEdge.fromJson(Map<String, dynamic> json) =>
      PinnedItemsEdge(
        node: json["node"] == null ? null : PurpleNode.fromJson(json["node"]),
      );

  Map<String, dynamic> toJson() => {
        "node": node == null ? null : node.toJson(),
      };
}

class PurpleNode {
  PurpleNode({
    this.name,
    this.description,
    this.stargazerCount,
    this.updatedAt,
    this.url,
    this.languages,
  });

  String name;
  String description;
  int stargazerCount;
  DateTime updatedAt;
  String url;
  Languages languages;

  PurpleNode copyWith({
    String name,
    String description,
    int stargazerCount,
    DateTime updatedAt,
    String url,
    Languages languages,
  }) =>
      PurpleNode(
        name: name ?? this.name,
        description: description ?? this.description,
        stargazerCount: stargazerCount ?? this.stargazerCount,
        updatedAt: updatedAt ?? this.updatedAt,
        url: url ?? this.url,
        languages: languages ?? this.languages,
      );

  factory PurpleNode.fromRawJson(String str) =>
      PurpleNode.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PurpleNode.fromJson(Map<String, dynamic> json) => PurpleNode(
        name: json["name"] == null ? null : json["name"],
        description: json["description"] == null ? null : json["description"],
        stargazerCount:
            json["stargazerCount"] == null ? null : json["stargazerCount"],
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        url: json["url"] == null ? null : json["url"],
        languages: json["languages"] == null
            ? null
            : Languages.fromJson(json["languages"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "description": description == null ? null : description,
        "stargazerCount": stargazerCount == null ? null : stargazerCount,
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
        "url": url == null ? null : url,
        "languages": languages == null ? null : languages.toJson(),
      };
}

class Languages {
  Languages({
    this.edges,
  });

  List<LanguagesEdge> edges;

  Languages copyWith({
    List<LanguagesEdge> edges,
  }) =>
      Languages(
        edges: edges ?? this.edges,
      );

  factory Languages.fromRawJson(String str) =>
      Languages.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Languages.fromJson(Map<String, dynamic> json) => Languages(
        edges: json["edges"] == null
            ? null
            : List<LanguagesEdge>.from(
                json["edges"].map((x) => LanguagesEdge.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "edges": edges == null
            ? null
            : List<dynamic>.from(edges.map((x) => x.toJson())),
      };
}

class LanguagesEdge {
  LanguagesEdge({
    this.node,
  });

  FluffyNode node;

  LanguagesEdge copyWith({
    FluffyNode node,
  }) =>
      LanguagesEdge(
        node: node ?? this.node,
      );

  factory LanguagesEdge.fromRawJson(String str) =>
      LanguagesEdge.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LanguagesEdge.fromJson(Map<String, dynamic> json) => LanguagesEdge(
        node: json["node"] == null ? null : FluffyNode.fromJson(json["node"]),
      );

  Map<String, dynamic> toJson() => {
        "node": node == null ? null : node.toJson(),
      };
}

class FluffyNode {
  FluffyNode({
    this.name,
  });

  String name;

  FluffyNode copyWith({
    String name,
  }) =>
      FluffyNode(
        name: name ?? this.name,
      );

  factory FluffyNode.fromRawJson(String str) =>
      FluffyNode.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FluffyNode.fromJson(Map<String, dynamic> json) => FluffyNode(
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
      };
}
