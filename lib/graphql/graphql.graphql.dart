// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart = 2.12

import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'graphql.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class SearchMentionUsers$Query$Search$Edges$Node$User
    extends SearchMentionUsers$Query$Search$Edges$Node with EquatableMixin {
  SearchMentionUsers$Query$Search$Edges$Node$User();

  factory SearchMentionUsers$Query$Search$Edges$Node$User.fromJson(
          Map<String, dynamic> json) =>
      _$SearchMentionUsers$Query$Search$Edges$Node$UserFromJson(json);

  late String login;

  late Uri avatarUrl;

  @override
  List<Object?> get props => [login, avatarUrl];
  Map<String, dynamic> toJson() =>
      _$SearchMentionUsers$Query$Search$Edges$Node$UserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SearchMentionUsers$Query$Search$Edges$Node$Organization
    extends SearchMentionUsers$Query$Search$Edges$Node with EquatableMixin {
  SearchMentionUsers$Query$Search$Edges$Node$Organization();

  factory SearchMentionUsers$Query$Search$Edges$Node$Organization.fromJson(
          Map<String, dynamic> json) =>
      _$SearchMentionUsers$Query$Search$Edges$Node$OrganizationFromJson(json);

  late String login;

  late Uri avatarUrl;

  @override
  List<Object?> get props => [login, avatarUrl];
  Map<String, dynamic> toJson() =>
      _$SearchMentionUsers$Query$Search$Edges$Node$OrganizationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SearchMentionUsers$Query$Search$Edges$Node extends JsonSerializable
    with EquatableMixin {
  SearchMentionUsers$Query$Search$Edges$Node();

  factory SearchMentionUsers$Query$Search$Edges$Node.fromJson(
      Map<String, dynamic> json) {
    switch (json['__typename'].toString()) {
      case r'User':
        return SearchMentionUsers$Query$Search$Edges$Node$User.fromJson(json);
      case r'Organization':
        return SearchMentionUsers$Query$Search$Edges$Node$Organization.fromJson(
            json);
      default:
    }
    return _$SearchMentionUsers$Query$Search$Edges$NodeFromJson(json);
  }

  @JsonKey(name: '__typename')
  String? $$typename;

  @override
  List<Object?> get props => [$$typename];
  Map<String, dynamic> toJson() {
    switch ($$typename) {
      case r'User':
        return (this as SearchMentionUsers$Query$Search$Edges$Node$User)
            .toJson();
      case r'Organization':
        return (this as SearchMentionUsers$Query$Search$Edges$Node$Organization)
            .toJson();
      default:
    }
    return _$SearchMentionUsers$Query$Search$Edges$NodeToJson(this);
  }
}

@JsonSerializable(explicitToJson: true)
class SearchMentionUsers$Query$Search$Edges extends JsonSerializable
    with EquatableMixin {
  SearchMentionUsers$Query$Search$Edges();

  factory SearchMentionUsers$Query$Search$Edges.fromJson(
          Map<String, dynamic> json) =>
      _$SearchMentionUsers$Query$Search$EdgesFromJson(json);

  SearchMentionUsers$Query$Search$Edges$Node? node;

  late String cursor;

  @override
  List<Object?> get props => [node, cursor];
  Map<String, dynamic> toJson() =>
      _$SearchMentionUsers$Query$Search$EdgesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SearchMentionUsers$Query$Search extends JsonSerializable
    with EquatableMixin {
  SearchMentionUsers$Query$Search();

  factory SearchMentionUsers$Query$Search.fromJson(Map<String, dynamic> json) =>
      _$SearchMentionUsers$Query$SearchFromJson(json);

  List<SearchMentionUsers$Query$Search$Edges?>? edges;

  @override
  List<Object?> get props => [edges];
  Map<String, dynamic> toJson() =>
      _$SearchMentionUsers$Query$SearchToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SearchMentionUsers$Query extends JsonSerializable with EquatableMixin {
  SearchMentionUsers$Query();

  factory SearchMentionUsers$Query.fromJson(Map<String, dynamic> json) =>
      _$SearchMentionUsers$QueryFromJson(json);

  late SearchMentionUsers$Query$Search search;

  @override
  List<Object?> get props => [search];
  Map<String, dynamic> toJson() => _$SearchMentionUsers$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$Languages$Edges$Node
    extends JsonSerializable with EquatableMixin {
  GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$Languages$Edges$Node();

  factory GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$Languages$Edges$Node.fromJson(
          Map<String, dynamic> json) =>
      _$GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$Languages$Edges$NodeFromJson(
          json);

  late String name;

  @override
  List<Object?> get props => [name];
  Map<String, dynamic> toJson() =>
      _$GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$Languages$Edges$NodeToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$Languages$Edges
    extends JsonSerializable with EquatableMixin {
  GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$Languages$Edges();

  factory GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$Languages$Edges.fromJson(
          Map<String, dynamic> json) =>
      _$GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$Languages$EdgesFromJson(
          json);

  late GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$Languages$Edges$Node
      node;

  @override
  List<Object?> get props => [node];
  Map<String, dynamic> toJson() =>
      _$GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$Languages$EdgesToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$Languages
    extends JsonSerializable with EquatableMixin {
  GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$Languages();

  factory GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$Languages.fromJson(
          Map<String, dynamic> json) =>
      _$GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$LanguagesFromJson(
          json);

  List<GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$Languages$Edges?>?
      edges;

  @override
  List<Object?> get props => [edges];
  Map<String, dynamic> toJson() =>
      _$GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$LanguagesToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository
    extends GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node
    with EquatableMixin {
  GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository();

  factory GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository.fromJson(
          Map<String, dynamic> json) =>
      _$GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$RepositoryFromJson(
          json);

  late String name;

  String? description;

  late int stargazerCount;

  late DateTime updatedAt;

  late Uri url;

  GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$Languages?
      languages;

  @override
  List<Object?> get props =>
      [name, description, stargazerCount, updatedAt, url, languages];
  Map<String, dynamic> toJson() =>
      _$GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$RepositoryToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node
    extends JsonSerializable with EquatableMixin {
  GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node();

  factory GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node.fromJson(
      Map<String, dynamic> json) {
    switch (json['__typename'].toString()) {
      case r'Repository':
        return GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository
            .fromJson(json);
      default:
    }
    return _$GetUserPinnedRepos$Query$User$PinnedItems$Edges$NodeFromJson(json);
  }

  @JsonKey(name: '__typename')
  String? $$typename;

  @override
  List<Object?> get props => [$$typename];
  Map<String, dynamic> toJson() {
    switch ($$typename) {
      case r'Repository':
        return (this
                as GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository)
            .toJson();
      default:
    }
    return _$GetUserPinnedRepos$Query$User$PinnedItems$Edges$NodeToJson(this);
  }
}

@JsonSerializable(explicitToJson: true)
class GetUserPinnedRepos$Query$User$PinnedItems$Edges extends JsonSerializable
    with EquatableMixin {
  GetUserPinnedRepos$Query$User$PinnedItems$Edges();

  factory GetUserPinnedRepos$Query$User$PinnedItems$Edges.fromJson(
          Map<String, dynamic> json) =>
      _$GetUserPinnedRepos$Query$User$PinnedItems$EdgesFromJson(json);

  GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node? node;

  @override
  List<Object?> get props => [node];
  Map<String, dynamic> toJson() =>
      _$GetUserPinnedRepos$Query$User$PinnedItems$EdgesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetUserPinnedRepos$Query$User$PinnedItems extends JsonSerializable
    with EquatableMixin {
  GetUserPinnedRepos$Query$User$PinnedItems();

  factory GetUserPinnedRepos$Query$User$PinnedItems.fromJson(
          Map<String, dynamic> json) =>
      _$GetUserPinnedRepos$Query$User$PinnedItemsFromJson(json);

  List<GetUserPinnedRepos$Query$User$PinnedItems$Edges?>? edges;

  @override
  List<Object?> get props => [edges];
  Map<String, dynamic> toJson() =>
      _$GetUserPinnedRepos$Query$User$PinnedItemsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetUserPinnedRepos$Query$User extends JsonSerializable
    with EquatableMixin {
  GetUserPinnedRepos$Query$User();

  factory GetUserPinnedRepos$Query$User.fromJson(Map<String, dynamic> json) =>
      _$GetUserPinnedRepos$Query$UserFromJson(json);

  late GetUserPinnedRepos$Query$User$PinnedItems pinnedItems;

  @override
  List<Object?> get props => [pinnedItems];
  Map<String, dynamic> toJson() => _$GetUserPinnedRepos$Query$UserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetUserPinnedRepos$Query extends JsonSerializable with EquatableMixin {
  GetUserPinnedRepos$Query();

  factory GetUserPinnedRepos$Query.fromJson(Map<String, dynamic> json) =>
      _$GetUserPinnedRepos$QueryFromJson(json);

  GetUserPinnedRepos$Query$User? user;

  @override
  List<Object?> get props => [user];
  Map<String, dynamic> toJson() => _$GetUserPinnedRepos$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class IssueTemplates$Query$Repository$IssueTemplates extends JsonSerializable
    with EquatableMixin {
  IssueTemplates$Query$Repository$IssueTemplates();

  factory IssueTemplates$Query$Repository$IssueTemplates.fromJson(
          Map<String, dynamic> json) =>
      _$IssueTemplates$Query$Repository$IssueTemplatesFromJson(json);

  late String name;

  String? title;

  String? body;

  String? about;

  @override
  List<Object?> get props => [name, title, body, about];
  Map<String, dynamic> toJson() =>
      _$IssueTemplates$Query$Repository$IssueTemplatesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class IssueTemplates$Query$Repository extends JsonSerializable
    with EquatableMixin {
  IssueTemplates$Query$Repository();

  factory IssueTemplates$Query$Repository.fromJson(Map<String, dynamic> json) =>
      _$IssueTemplates$Query$RepositoryFromJson(json);

  List<IssueTemplates$Query$Repository$IssueTemplates>? issueTemplates;

  @override
  List<Object?> get props => [issueTemplates];
  Map<String, dynamic> toJson() =>
      _$IssueTemplates$Query$RepositoryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class IssueTemplates$Query extends JsonSerializable with EquatableMixin {
  IssueTemplates$Query();

  factory IssueTemplates$Query.fromJson(Map<String, dynamic> json) =>
      _$IssueTemplates$QueryFromJson(json);

  IssueTemplates$Query$Repository? repository;

  @override
  List<Object?> get props => [repository];
  Map<String, dynamic> toJson() => _$IssueTemplates$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SearchMentionUsersArguments extends JsonSerializable with EquatableMixin {
  SearchMentionUsersArguments({required this.query, this.after});

  @override
  factory SearchMentionUsersArguments.fromJson(Map<String, dynamic> json) =>
      _$SearchMentionUsersArgumentsFromJson(json);

  late String query;

  final String? after;

  @override
  List<Object?> get props => [query, after];
  @override
  Map<String, dynamic> toJson() => _$SearchMentionUsersArgumentsToJson(this);
}

final SEARCH_MENTION_USERS_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'searchMentionUsers'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'query')),
            type:
                NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: []),
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'after')),
            type: NamedTypeNode(
                name: NameNode(value: 'String'), isNonNull: false),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'search'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'query'),
                  value: VariableNode(name: NameNode(value: 'query'))),
              ArgumentNode(
                  name: NameNode(value: 'type'),
                  value: EnumValueNode(name: NameNode(value: 'USER'))),
              ArgumentNode(
                  name: NameNode(value: 'first'),
                  value: IntValueNode(value: '20')),
              ArgumentNode(
                  name: NameNode(value: 'after'),
                  value: VariableNode(name: NameNode(value: 'after')))
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'edges'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FieldNode(
                        name: NameNode(value: 'node'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: SelectionSetNode(selections: [
                          FieldNode(
                              name: NameNode(value: '__typename'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null),
                          InlineFragmentNode(
                              typeCondition: TypeConditionNode(
                                  on: NamedTypeNode(
                                      name: NameNode(value: 'User'),
                                      isNonNull: false)),
                              directives: [],
                              selectionSet: SelectionSetNode(selections: [
                                FieldNode(
                                    name: NameNode(value: 'login'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null),
                                FieldNode(
                                    name: NameNode(value: 'avatarUrl'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null)
                              ])),
                          InlineFragmentNode(
                              typeCondition: TypeConditionNode(
                                  on: NamedTypeNode(
                                      name: NameNode(value: 'Organization'),
                                      isNonNull: false)),
                              directives: [],
                              selectionSet: SelectionSetNode(selections: [
                                FieldNode(
                                    name: NameNode(value: 'login'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null),
                                FieldNode(
                                    name: NameNode(value: 'avatarUrl'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null)
                              ]))
                        ])),
                    FieldNode(
                        name: NameNode(value: 'cursor'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null)
                  ]))
            ]))
      ]))
]);

class SearchMentionUsersQuery extends GraphQLQuery<SearchMentionUsers$Query,
    SearchMentionUsersArguments> {
  SearchMentionUsersQuery({required this.variables});

  @override
  final DocumentNode document = SEARCH_MENTION_USERS_QUERY_DOCUMENT;

  @override
  final String operationName = 'searchMentionUsers';

  @override
  final SearchMentionUsersArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  SearchMentionUsers$Query parse(Map<String, dynamic> json) =>
      SearchMentionUsers$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class GetUserPinnedReposArguments extends JsonSerializable with EquatableMixin {
  GetUserPinnedReposArguments({required this.user});

  @override
  factory GetUserPinnedReposArguments.fromJson(Map<String, dynamic> json) =>
      _$GetUserPinnedReposArgumentsFromJson(json);

  late String user;

  @override
  List<Object?> get props => [user];
  @override
  Map<String, dynamic> toJson() => _$GetUserPinnedReposArgumentsToJson(this);
}

final GET_USER_PINNED_REPOS_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'getUserPinnedRepos'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'user')),
            type:
                NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'user'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'login'),
                  value: VariableNode(name: NameNode(value: 'user')))
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'pinnedItems'),
                  alias: null,
                  arguments: [
                    ArgumentNode(
                        name: NameNode(value: 'first'),
                        value: IntValueNode(value: '6')),
                    ArgumentNode(
                        name: NameNode(value: 'types'),
                        value: ListValueNode(values: [
                          EnumValueNode(name: NameNode(value: 'REPOSITORY'))
                        ]))
                  ],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FieldNode(
                        name: NameNode(value: 'edges'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: SelectionSetNode(selections: [
                          FieldNode(
                              name: NameNode(value: 'node'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: SelectionSetNode(selections: [
                                FieldNode(
                                    name: NameNode(value: '__typename'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null),
                                InlineFragmentNode(
                                    typeCondition: TypeConditionNode(
                                        on: NamedTypeNode(
                                            name: NameNode(value: 'Repository'),
                                            isNonNull: false)),
                                    directives: [],
                                    selectionSet: SelectionSetNode(selections: [
                                      FieldNode(
                                          name: NameNode(value: 'name'),
                                          alias: null,
                                          arguments: [],
                                          directives: [],
                                          selectionSet: null),
                                      FieldNode(
                                          name: NameNode(value: 'description'),
                                          alias: null,
                                          arguments: [],
                                          directives: [],
                                          selectionSet: null),
                                      FieldNode(
                                          name:
                                              NameNode(value: 'stargazerCount'),
                                          alias: null,
                                          arguments: [],
                                          directives: [],
                                          selectionSet: null),
                                      FieldNode(
                                          name: NameNode(value: 'updatedAt'),
                                          alias: null,
                                          arguments: [],
                                          directives: [],
                                          selectionSet: null),
                                      FieldNode(
                                          name: NameNode(value: 'url'),
                                          alias: null,
                                          arguments: [],
                                          directives: [],
                                          selectionSet: null),
                                      FieldNode(
                                          name: NameNode(value: 'languages'),
                                          alias: null,
                                          arguments: [
                                            ArgumentNode(
                                                name:
                                                    NameNode(value: 'orderBy'),
                                                value: ObjectValueNode(fields: [
                                                  ObjectFieldNode(
                                                      name: NameNode(
                                                          value: 'direction'),
                                                      value: EnumValueNode(
                                                          name: NameNode(
                                                              value: 'DESC'))),
                                                  ObjectFieldNode(
                                                      name: NameNode(
                                                          value: 'field'),
                                                      value: EnumValueNode(
                                                          name: NameNode(
                                                              value: 'SIZE')))
                                                ])),
                                            ArgumentNode(
                                                name: NameNode(value: 'first'),
                                                value: IntValueNode(value: '1'))
                                          ],
                                          directives: [],
                                          selectionSet:
                                              SelectionSetNode(selections: [
                                            FieldNode(
                                                name: NameNode(value: 'edges'),
                                                alias: null,
                                                arguments: [],
                                                directives: [],
                                                selectionSet: SelectionSetNode(
                                                    selections: [
                                                      FieldNode(
                                                          name: NameNode(
                                                              value: 'node'),
                                                          alias: null,
                                                          arguments: [],
                                                          directives: [],
                                                          selectionSet:
                                                              SelectionSetNode(
                                                                  selections: [
                                                                FieldNode(
                                                                    name: NameNode(
                                                                        value:
                                                                            'name'),
                                                                    alias: null,
                                                                    arguments: [],
                                                                    directives: [],
                                                                    selectionSet:
                                                                        null)
                                                              ]))
                                                    ]))
                                          ]))
                                    ]))
                              ]))
                        ]))
                  ]))
            ]))
      ]))
]);

class GetUserPinnedReposQuery extends GraphQLQuery<GetUserPinnedRepos$Query,
    GetUserPinnedReposArguments> {
  GetUserPinnedReposQuery({required this.variables});

  @override
  final DocumentNode document = GET_USER_PINNED_REPOS_QUERY_DOCUMENT;

  @override
  final String operationName = 'getUserPinnedRepos';

  @override
  final GetUserPinnedReposArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  GetUserPinnedRepos$Query parse(Map<String, dynamic> json) =>
      GetUserPinnedRepos$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class IssueTemplatesArguments extends JsonSerializable with EquatableMixin {
  IssueTemplatesArguments({required this.name, required this.owner});

  @override
  factory IssueTemplatesArguments.fromJson(Map<String, dynamic> json) =>
      _$IssueTemplatesArgumentsFromJson(json);

  late String name;

  late String owner;

  @override
  List<Object?> get props => [name, owner];
  @override
  Map<String, dynamic> toJson() => _$IssueTemplatesArgumentsToJson(this);
}

final ISSUE_TEMPLATES_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'issueTemplates'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'name')),
            type:
                NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: []),
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'owner')),
            type:
                NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'repository'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'name'),
                  value: VariableNode(name: NameNode(value: 'name'))),
              ArgumentNode(
                  name: NameNode(value: 'owner'),
                  value: VariableNode(name: NameNode(value: 'owner')))
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'issueTemplates'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FieldNode(
                        name: NameNode(value: 'name'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: 'title'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: 'body'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: 'about'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null)
                  ]))
            ]))
      ]))
]);

class IssueTemplatesQuery
    extends GraphQLQuery<IssueTemplates$Query, IssueTemplatesArguments> {
  IssueTemplatesQuery({required this.variables});

  @override
  final DocumentNode document = ISSUE_TEMPLATES_QUERY_DOCUMENT;

  @override
  final String operationName = 'issueTemplates';

  @override
  final IssueTemplatesArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  IssueTemplates$Query parse(Map<String, dynamic> json) =>
      IssueTemplates$Query.fromJson(json);
}
