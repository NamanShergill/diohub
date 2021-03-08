// To parse this JSON data, do
//
//     final blobModel = blobModelFromJson(jsonString);

import 'dart:convert';

class BlobModel {
  BlobModel({
    this.sha,
    this.nodeId,
    this.size,
    this.url,
    this.content,
    this.encoding,
  });

  String sha;
  String nodeId;
  int size;
  String url;
  String content;
  String encoding;

  BlobModel copyWith({
    String sha,
    String nodeId,
    int size,
    String url,
    String content,
    String encoding,
  }) =>
      BlobModel(
        sha: sha ?? this.sha,
        nodeId: nodeId ?? this.nodeId,
        size: size ?? this.size,
        url: url ?? this.url,
        content: content ?? this.content,
        encoding: encoding ?? this.encoding,
      );

  factory BlobModel.fromRawJson(String str) =>
      BlobModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BlobModel.fromJson(Map<String, dynamic> json) => BlobModel(
        sha: json["sha"] == null ? null : json["sha"],
        nodeId: json["node_id"] == null ? null : json["node_id"],
        size: json["size"] == null ? null : json["size"],
        url: json["url"] == null ? null : json["url"],
        content: json["content"] == null ? null : json["content"],
        encoding: json["encoding"] == null ? null : json["encoding"],
      );

  Map<String, dynamic> toJson() => {
        "sha": sha == null ? null : sha,
        "node_id": nodeId == null ? null : nodeId,
        "size": size == null ? null : size,
        "url": url == null ? null : url,
        "content": content == null ? null : content,
        "encoding": encoding == null ? null : encoding,
      };
}
