// To parse this JSON data, do
//
//     final repositoryReadmeModel = repositoryReadmeModelFromJson(jsonString);

import 'dart:convert';

import 'package:markdown/markdown.dart';
import 'package:onehub/utils/parse_base64.dart';

class RepositoryReadmeModel {
  RepositoryReadmeModel({
    this.name,
    this.path,
    this.sha,
    this.size,
    this.url,
    this.htmlUrl,
    this.gitUrl,
    this.downloadUrl,
    this.type,
    this.content,
    this.encoding,
    this.links,
  });

  String name;
  String path;
  String sha;
  int size;
  String url;
  String htmlUrl;
  String gitUrl;
  String downloadUrl;
  String type;
  String content;
  String encoding;
  Links links;

  RepositoryReadmeModel copyWith({
    String name,
    String path,
    String sha,
    int size,
    String url,
    String htmlUrl,
    String gitUrl,
    String downloadUrl,
    String type,
    String content,
    String encoding,
    Links links,
  }) =>
      RepositoryReadmeModel(
        name: name ?? this.name,
        path: path ?? this.path,
        sha: sha ?? this.sha,
        size: size ?? this.size,
        url: url ?? this.url,
        htmlUrl: htmlUrl ?? this.htmlUrl,
        gitUrl: gitUrl ?? this.gitUrl,
        downloadUrl: downloadUrl ?? this.downloadUrl,
        type: type ?? this.type,
        content: content ?? this.content,
        encoding: encoding ?? this.encoding,
        links: links ?? this.links,
      );

  factory RepositoryReadmeModel.fromRawJson(String str) =>
      RepositoryReadmeModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RepositoryReadmeModel.fromJson(Map<String, dynamic> json) =>
      RepositoryReadmeModel(
        name: json["name"] == null ? null : json["name"],
        path: json["path"] == null ? null : json["path"],
        sha: json["sha"] == null ? null : json["sha"],
        size: json["size"] == null ? null : json["size"],
        url: json["url"] == null ? null : json["url"],
        htmlUrl: json["html_url"] == null ? null : json["html_url"],
        gitUrl: json["git_url"] == null ? null : json["git_url"],
        downloadUrl: json["download_url"] == null ? null : json["download_url"],
        type: json["type"] == null ? null : json["type"],
        content: json["content"] == null ? null : getContent(json["content"]),
        encoding: json["encoding"] == null ? null : json["encoding"],
        links: json["_links"] == null ? null : Links.fromJson(json["_links"]),
      );

  // Todo: Decide where I want this to get parsed.
  static String getContent(String source) {
    List<String> listTemp = parseBase64(source, splitAtLineBreaks: false);
    final content = markdownToHtml(listTemp.join());
    return content;
  }

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "path": path == null ? null : path,
        "sha": sha == null ? null : sha,
        "size": size == null ? null : size,
        "url": url == null ? null : url,
        "html_url": htmlUrl == null ? null : htmlUrl,
        "git_url": gitUrl == null ? null : gitUrl,
        "download_url": downloadUrl == null ? null : downloadUrl,
        "type": type == null ? null : type,
        "content": content == null ? null : content,
        "encoding": encoding == null ? null : encoding,
        "_links": links == null ? null : links.toJson(),
      };
}

class Links {
  Links({
    this.self,
    this.git,
    this.html,
  });

  String self;
  String git;
  String html;

  Links copyWith({
    String self,
    String git,
    String html,
  }) =>
      Links(
        self: self ?? this.self,
        git: git ?? this.git,
        html: html ?? this.html,
      );

  factory Links.fromRawJson(String str) => Links.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: json["self"] == null ? null : json["self"],
        git: json["git"] == null ? null : json["git"],
        html: json["html"] == null ? null : json["html"],
      );

  Map<String, dynamic> toJson() => {
        "self": self == null ? null : self,
        "git": git == null ? null : git,
        "html": html == null ? null : html,
      };
}
