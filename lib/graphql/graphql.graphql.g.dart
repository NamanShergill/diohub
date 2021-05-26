// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.12

part of 'graphql.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchMentionUsers$Query$Search$Edges$Node$User
    _$SearchMentionUsers$Query$Search$Edges$Node$UserFromJson(
        Map<String, dynamic> json) {
  return SearchMentionUsers$Query$Search$Edges$Node$User()
    ..$$typename = json['__typename'] as String?
    ..login = json['login'] as String
    ..avatarUrl = Uri.parse(json['avatarUrl'] as String);
}

Map<String, dynamic> _$SearchMentionUsers$Query$Search$Edges$Node$UserToJson(
        SearchMentionUsers$Query$Search$Edges$Node$User instance) =>
    <String, dynamic>{
      '__typename': instance.$$typename,
      'login': instance.login,
      'avatarUrl': instance.avatarUrl.toString(),
    };

SearchMentionUsers$Query$Search$Edges$Node$Organization
    _$SearchMentionUsers$Query$Search$Edges$Node$OrganizationFromJson(
        Map<String, dynamic> json) {
  return SearchMentionUsers$Query$Search$Edges$Node$Organization()
    ..$$typename = json['__typename'] as String?
    ..login = json['login'] as String
    ..avatarUrl = Uri.parse(json['avatarUrl'] as String);
}

Map<String, dynamic>
    _$SearchMentionUsers$Query$Search$Edges$Node$OrganizationToJson(
            SearchMentionUsers$Query$Search$Edges$Node$Organization instance) =>
        <String, dynamic>{
          '__typename': instance.$$typename,
          'login': instance.login,
          'avatarUrl': instance.avatarUrl.toString(),
        };

SearchMentionUsers$Query$Search$Edges$Node
    _$SearchMentionUsers$Query$Search$Edges$NodeFromJson(
        Map<String, dynamic> json) {
  return SearchMentionUsers$Query$Search$Edges$Node()
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic> _$SearchMentionUsers$Query$Search$Edges$NodeToJson(
        SearchMentionUsers$Query$Search$Edges$Node instance) =>
    <String, dynamic>{
      '__typename': instance.$$typename,
    };

SearchMentionUsers$Query$Search$Edges
    _$SearchMentionUsers$Query$Search$EdgesFromJson(Map<String, dynamic> json) {
  return SearchMentionUsers$Query$Search$Edges()
    ..node = json['node'] == null
        ? null
        : SearchMentionUsers$Query$Search$Edges$Node.fromJson(
            json['node'] as Map<String, dynamic>)
    ..cursor = json['cursor'] as String;
}

Map<String, dynamic> _$SearchMentionUsers$Query$Search$EdgesToJson(
        SearchMentionUsers$Query$Search$Edges instance) =>
    <String, dynamic>{
      'node': instance.node?.toJson(),
      'cursor': instance.cursor,
    };

SearchMentionUsers$Query$Search _$SearchMentionUsers$Query$SearchFromJson(
    Map<String, dynamic> json) {
  return SearchMentionUsers$Query$Search()
    ..edges = (json['edges'] as List<dynamic>?)
        ?.map((e) => e == null
            ? null
            : SearchMentionUsers$Query$Search$Edges.fromJson(
                e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$SearchMentionUsers$Query$SearchToJson(
        SearchMentionUsers$Query$Search instance) =>
    <String, dynamic>{
      'edges': instance.edges?.map((e) => e?.toJson()).toList(),
    };

SearchMentionUsers$Query _$SearchMentionUsers$QueryFromJson(
    Map<String, dynamic> json) {
  return SearchMentionUsers$Query()
    ..search = SearchMentionUsers$Query$Search.fromJson(
        json['search'] as Map<String, dynamic>);
}

Map<String, dynamic> _$SearchMentionUsers$QueryToJson(
        SearchMentionUsers$Query instance) =>
    <String, dynamic>{
      'search': instance.search.toJson(),
    };

GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$Languages$Edges$Node
    _$GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$Languages$Edges$NodeFromJson(
        Map<String, dynamic> json) {
  return GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$Languages$Edges$Node()
    ..name = json['name'] as String;
}

Map<String, dynamic>
    _$GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$Languages$Edges$NodeToJson(
            GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$Languages$Edges$Node
                instance) =>
        <String, dynamic>{
          'name': instance.name,
        };

GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$Languages$Edges
    _$GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$Languages$EdgesFromJson(
        Map<String, dynamic> json) {
  return GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$Languages$Edges()
    ..node =
        GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$Languages$Edges$Node
            .fromJson(json['node'] as Map<String, dynamic>);
}

Map<String, dynamic>
    _$GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$Languages$EdgesToJson(
            GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$Languages$Edges
                instance) =>
        <String, dynamic>{
          'node': instance.node.toJson(),
        };

GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$Languages
    _$GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$LanguagesFromJson(
        Map<String, dynamic> json) {
  return GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$Languages()
    ..edges = (json['edges'] as List<dynamic>?)
        ?.map((e) => e == null
            ? null
            : GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$Languages$Edges
                .fromJson(e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic>
    _$GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$LanguagesToJson(
            GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$Languages
                instance) =>
        <String, dynamic>{
          'edges': instance.edges?.map((e) => e?.toJson()).toList(),
        };

GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository
    _$GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$RepositoryFromJson(
        Map<String, dynamic> json) {
  return GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository()
    ..$$typename = json['__typename'] as String?
    ..name = json['name'] as String
    ..description = json['description'] as String?
    ..stargazerCount = json['stargazerCount'] as int
    ..updatedAt = DateTime.parse(json['updatedAt'] as String)
    ..url = Uri.parse(json['url'] as String)
    ..languages = json['languages'] == null
        ? null
        : GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$Languages
            .fromJson(json['languages'] as Map<String, dynamic>);
}

Map<String, dynamic>
    _$GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$RepositoryToJson(
            GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository
                instance) =>
        <String, dynamic>{
          '__typename': instance.$$typename,
          'name': instance.name,
          'description': instance.description,
          'stargazerCount': instance.stargazerCount,
          'updatedAt': instance.updatedAt.toIso8601String(),
          'url': instance.url.toString(),
          'languages': instance.languages?.toJson(),
        };

GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node
    _$GetUserPinnedRepos$Query$User$PinnedItems$Edges$NodeFromJson(
        Map<String, dynamic> json) {
  return GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node()
    ..$$typename = json['__typename'] as String?;
}

Map<String, dynamic>
    _$GetUserPinnedRepos$Query$User$PinnedItems$Edges$NodeToJson(
            GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node instance) =>
        <String, dynamic>{
          '__typename': instance.$$typename,
        };

GetUserPinnedRepos$Query$User$PinnedItems$Edges
    _$GetUserPinnedRepos$Query$User$PinnedItems$EdgesFromJson(
        Map<String, dynamic> json) {
  return GetUserPinnedRepos$Query$User$PinnedItems$Edges()
    ..node = json['node'] == null
        ? null
        : GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node.fromJson(
            json['node'] as Map<String, dynamic>);
}

Map<String, dynamic> _$GetUserPinnedRepos$Query$User$PinnedItems$EdgesToJson(
        GetUserPinnedRepos$Query$User$PinnedItems$Edges instance) =>
    <String, dynamic>{
      'node': instance.node?.toJson(),
    };

GetUserPinnedRepos$Query$User$PinnedItems
    _$GetUserPinnedRepos$Query$User$PinnedItemsFromJson(
        Map<String, dynamic> json) {
  return GetUserPinnedRepos$Query$User$PinnedItems()
    ..edges = (json['edges'] as List<dynamic>?)
        ?.map((e) => e == null
            ? null
            : GetUserPinnedRepos$Query$User$PinnedItems$Edges.fromJson(
                e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$GetUserPinnedRepos$Query$User$PinnedItemsToJson(
        GetUserPinnedRepos$Query$User$PinnedItems instance) =>
    <String, dynamic>{
      'edges': instance.edges?.map((e) => e?.toJson()).toList(),
    };

GetUserPinnedRepos$Query$User _$GetUserPinnedRepos$Query$UserFromJson(
    Map<String, dynamic> json) {
  return GetUserPinnedRepos$Query$User()
    ..pinnedItems = GetUserPinnedRepos$Query$User$PinnedItems.fromJson(
        json['pinnedItems'] as Map<String, dynamic>);
}

Map<String, dynamic> _$GetUserPinnedRepos$Query$UserToJson(
        GetUserPinnedRepos$Query$User instance) =>
    <String, dynamic>{
      'pinnedItems': instance.pinnedItems.toJson(),
    };

GetUserPinnedRepos$Query _$GetUserPinnedRepos$QueryFromJson(
    Map<String, dynamic> json) {
  return GetUserPinnedRepos$Query()
    ..user = json['user'] == null
        ? null
        : GetUserPinnedRepos$Query$User.fromJson(
            json['user'] as Map<String, dynamic>);
}

Map<String, dynamic> _$GetUserPinnedRepos$QueryToJson(
        GetUserPinnedRepos$Query instance) =>
    <String, dynamic>{
      'user': instance.user?.toJson(),
    };

SearchMentionUsersArguments _$SearchMentionUsersArgumentsFromJson(
    Map<String, dynamic> json) {
  return SearchMentionUsersArguments(
    query: json['query'] as String,
    after: json['after'] as String?,
  );
}

Map<String, dynamic> _$SearchMentionUsersArgumentsToJson(
        SearchMentionUsersArguments instance) =>
    <String, dynamic>{
      'query': instance.query,
      'after': instance.after,
    };

GetUserPinnedReposArguments _$GetUserPinnedReposArgumentsFromJson(
    Map<String, dynamic> json) {
  return GetUserPinnedReposArguments(
    user: json['user'] as String,
  );
}

Map<String, dynamic> _$GetUserPinnedReposArgumentsToJson(
        GetUserPinnedReposArguments instance) =>
    <String, dynamic>{
      'user': instance.user,
    };
