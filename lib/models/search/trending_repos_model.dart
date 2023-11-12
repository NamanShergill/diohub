// To parse this JSON data, do
//
//     final trendingReposModel = trendingReposModelFromJson(jsonString);

import 'dart:convert';

class TrendingReposModel {
  TrendingReposModel({
    this.author,
    this.name,
    this.avatar,
    this.url,
    this.description,
    this.language,
    this.languageColor,
    this.stars,
    this.forks,
    this.currentPeriodStars,
    this.builtBy,
  });

  String? author;
  String? name;
  String? avatar;
  String? url;
  String? description;
  String? language;
  String? languageColor;
  int? stars;
  int? forks;
  int? currentPeriodStars;
  List<BuiltBy>? builtBy;

  TrendingReposModel copyWith({
    String? author,
    String? name,
    String? avatar,
    String? url,
    String? description,
    String? language,
    String? languageColor,
    int? stars,
    int? forks,
    int? currentPeriodStars,
    List<BuiltBy>? builtBy,
  }) =>
      TrendingReposModel(
        author: author ?? this.author,
        name: name ?? this.name,
        avatar: avatar ?? this.avatar,
        url: url ?? this.url,
        description: description ?? this.description,
        language: language ?? this.language,
        languageColor: languageColor ?? this.languageColor,
        stars: stars ?? this.stars,
        forks: forks ?? this.forks,
        currentPeriodStars: currentPeriodStars ?? this.currentPeriodStars,
        builtBy: builtBy ?? this.builtBy,
      );

  factory TrendingReposModel.fromRawJson(String str) =>
      TrendingReposModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TrendingReposModel.fromJson(Map<String, dynamic> json) =>
      TrendingReposModel(
        author: json["author"] == null ? null : json["author"],
        name: json["name"] == null ? null : json["name"],
        avatar: json["avatar"] == null ? null : json["avatar"],
        url: json["url"] == null ? null : json["url"],
        description: json["description"] == null ? null : json["description"],
        language: json["language"] == null ? null : json["language"],
        languageColor:
            json["languageColor"] == null ? null : json["languageColor"],
        stars: json["stars"] == null ? null : json["stars"],
        forks: json["forks"] == null ? null : json["forks"],
        currentPeriodStars: json["currentPeriodStars"] == null
            ? null
            : json["currentPeriodStars"],
        builtBy: json["builtBy"] == null
            ? null
            : List<BuiltBy>.from(
                json["builtBy"].map((x) => BuiltBy.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "author": author == null ? null : author,
        "name": name == null ? null : name,
        "avatar": avatar == null ? null : avatar,
        "url": url == null ? null : url,
        "description": description == null ? null : description,
        "language": language == null ? null : language,
        "languageColor": languageColor == null ? null : languageColor,
        "stars": stars == null ? null : stars,
        "forks": forks == null ? null : forks,
        "currentPeriodStars":
            currentPeriodStars == null ? null : currentPeriodStars,
        "builtBy": builtBy == null
            ? null
            : List<dynamic>.from(builtBy!.map((x) => x.toJson())),
      };
}

class BuiltBy {
  BuiltBy({
    this.href,
    this.avatar,
    this.username,
  });

  String? href;
  String? avatar;
  String? username;

  BuiltBy copyWith({
    String? href,
    String? avatar,
    String? username,
  }) =>
      BuiltBy(
        href: href ?? this.href,
        avatar: avatar ?? this.avatar,
        username: username ?? this.username,
      );

  factory BuiltBy.fromRawJson(String str) => BuiltBy.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BuiltBy.fromJson(Map<String, dynamic> json) => BuiltBy(
        href: json["href"] == null ? null : json["href"],
        avatar: json["avatar"] == null ? null : json["avatar"],
        username: json["username"] == null ? null : json["username"],
      );

  Map<String, dynamic> toJson() => {
        "href": href == null ? null : href,
        "avatar": avatar == null ? null : avatar,
        "username": username == null ? null : username,
      };
}
