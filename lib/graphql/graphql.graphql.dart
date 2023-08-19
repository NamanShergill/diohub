// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: always_require_non_null_named_parameters, annotate_overrides, avoid_function_literals_in_foreach_calls, avoid_init_to_null, avoid_null_checks_in_equality_operators, avoid_renaming_method_parameters, avoid_return_types_on_setters, avoid_returning_null_for_void, avoid_single_cascade_in_expression_statements, constant_identifier_names, control_flow_in_finally, empty_constructor_bodies, empty_statements, exhaustive_cases, implementation_imports, library_names, library_prefixes, null_closures, overridden_fields, package_names, prefer_adjacent_string_concatenation, prefer_collection_literals, prefer_conditional_assignment, prefer_contains, prefer_equal_for_default_values, prefer_final_fields, prefer_for_elements_to_map_fromIterable, prefer_function_declarations_over_variables, prefer_if_null_operators, prefer_initializing_formals, prefer_inlined_adds, prefer_is_not_operator, prefer_null_aware_operators, prefer_spread_collections, prefer_void_to_null, recursive_getters, slash_for_doc_comments, type_init_formals, unnecessary_brace_in_string_interps, unnecessary_const, unnecessary_getters_setters, unnecessary_new, unnecessary_null_in_if_null_operators, unnecessary_string_escapes, unnecessary_string_interpolations, unnecessary_this, use_function_type_syntax_for_parameters, use_rethrow_when_possible, valid_regexps, always_use_package_imports, avoid_relative_lib_imports, always_declare_return_types, avoid_double_and_int_checks, avoid_empty_else, avoid_print, avoid_private_typedef_functions, avoid_setters_without_getters, avoid_shadowing_type_parameters, avoid_slow_async_io, avoid_types_as_parameter_names, avoid_unused_constructor_parameters, await_only_futures, camel_case_extensions, camel_case_types, cancel_subscriptions, curly_braces_in_flow_control_structures, directives_ordering, file_names, flutter_style_todos, list_remove_unrelated_type, no_duplicate_case_values, non_constant_identifier_names, no_adjacent_strings_in_list, one_member_abstracts, only_throw_errors, package_api_docs, parameter_assignments, prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_const_declarations, prefer_const_literals_to_create_immutables, prefer_constructors_over_static_methods, prefer_asserts_with_message, prefer_asserts_in_initializer_lists, package_prefixed_library_names, prefer_final_in_for_each, prefer_final_locals, provide_deprecation_message, prefer_foreach, prefer_is_empty, prefer_is_not_empty, prefer_typing_uninitialized_variables, sort_child_properties_last, sort_constructors_first, use_setters_to_change_properties, use_string_buffers, sort_pub_dependencies, sort_unnamed_constructors_first, throw_in_finally, type_annotate_public_apis, unnecessary_await_in_return, unnecessary_lambdas, unnecessary_null_aware_assignments, unnecessary_overrides, unnecessary_parenthesis, unnecessary_statements, unrelated_type_equality_checks, unsafe_html, use_full_hex_values_for_flutter_colors, use_to_and_as_if_applicable, void_checks, always_put_control_body_on_new_line, avoid_bool_literals_in_conditional_expressions, avoid_catching_errors, avoid_field_initializers_in_const_classes, hash_and_equals, literal_only_boolean_expressions, join_return_with_assignment, invariant_booleans, avoid_classes_with_only_static_members, avoid_equals_and_hash_code_on_mutable_classes, avoid_positional_boolean_parameters, avoid_returning_null, avoid_returning_this, avoid_returning_null_for_future, avoid_types_on_closure_parameters, omit_local_variable_types, prefer_generic_function_type_aliases, prefer_interpolation_to_compose_strings, prefer_iterable_whereType, prefer_mixin, prefer_single_quotes, iterable_contains_unrelated_type, empty_catches, avoid_catches_without_on_clauses, lines_longer_than_80_chars

import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'graphql.graphql.g.dart';

mixin ProjectMixin {
  late String name;
  late String id;
  int? databaseId;
  late DateTime updatedAt;
  late int number;
  late String bodyHTML;
  String? body;
  late bool closed;
  late ProjectMixin$Progress progress;
}
mixin IssueMixin {
  late Uri url;
  late String title;
  late int number;
  @JsonKey(unknownEnumValue: IssueState.artemisUnknown)
  late IssueState issueState;
  late IssueMixin$Repository repository;
}
mixin AddedToProjectMixin {
  late String id;
  late DateTime createdAt;
  AddedToProjectMixin$Actor? actor;
  late String projectColumnName;
  AddedToProjectMixin$Project? project;
}
mixin ActorMixin {
  late Uri avatarUrl;
  late String login;
}
mixin AssignedMixin {
  late String id;
  late DateTime createdAt;
  AssignedMixin$Actor? actor;
  AssignedMixin$Assignee? assignee;
}
mixin ClosedMixin {
  late String id;
  late DateTime createdAt;
  ClosedMixin$Actor? actor;
}
mixin CrossReferenceMixin {
  late String id;
  late DateTime createdAt;
  CrossReferenceMixin$Actor? actor;
  late CrossReferenceMixin$Source source;
  late bool isCrossRepository;
}
mixin PullRequestMixin {
  late Uri url;
  late String title;
  late int number;
  @JsonKey(unknownEnumValue: PullRequestState.artemisUnknown)
  late PullRequestState pullState;
  late PullRequestMixin$Repository repository;
}
mixin DeMileStonedMixin {
  late String id;
  late DateTime createdAt;
  DeMileStonedMixin$Actor? actor;
  late String milestoneTitle;
}
mixin IssueCommentMixin {
  late String id;
  IssueCommentMixin$Author? author;
  late DateTime createdAt;
  @JsonKey(unknownEnumValue: CommentAuthorAssociation.artemisUnknown)
  late CommentAuthorAssociation authorAssociation;
  late String body;
  late String bodyHTML;
  DateTime? lastEditedAt;
  late bool isMinimized;
  String? minimizedReason;
  List<IssueCommentMixin$ReactionGroups>? reactionGroups;
  late bool viewerCanMinimize;
  late bool viewerCanDelete;
  late bool viewerCanUpdate;
  late bool viewerDidAuthor;
  @JsonKey(unknownEnumValue: CommentCannotUpdateReason.artemisUnknown)
  late List<CommentCannotUpdateReason> viewerCannotUpdateReasons;
  late bool viewerCanReact;
}
mixin ReactionGroupsMixin {
  @JsonKey(unknownEnumValue: ReactionContent.artemisUnknown)
  late ReactionContent content;
  late bool viewerHasReacted;
  late ReactionGroupsMixin$Reactors reactors;
  late ReactionGroupsMixin$Subject subject;
}
mixin LabeledMixin {
  late String id;
  late DateTime createdAt;
  LabeledMixin$Actor? actor;
  late LabeledMixin$Label label;
}
mixin LabelMixin {
  late String color;
  late String name;
}
mixin LockedMixin {
  late String id;
  late DateTime createdAt;
  LockedMixin$Actor? actor;
  @JsonKey(unknownEnumValue: LockReason.artemisUnknown)
  LockReason? lockReason;
}
mixin MarkedAsDuplicateMixin {
  late String id;
  late DateTime createdAt;
  MarkedAsDuplicateMixin$Actor? actor;
  late bool isCrossRepository;
  MarkedAsDuplicateMixin$Canonical? canonical;
}
mixin MileStonedMixin {
  late String id;
  late DateTime createdAt;
  MileStonedMixin$Actor? actor;
  late String milestoneTitle;
}
mixin MovedColumnsInProjectMixin {
  late String id;
  late DateTime createdAt;
  MovedColumnsInProjectMixin$Actor? actor;
  late String previousProjectColumnName;
  late String projectColumnName;
  MovedColumnsInProjectMixin$Project? project;
}
mixin PinnedMixin {
  late String id;
  late DateTime createdAt;
  PinnedMixin$Actor? actor;
}
mixin RemovedFromProjectMixin {
  late String id;
  late DateTime createdAt;
  RemovedFromProjectMixin$Actor? actor;
  RemovedFromProjectMixin$Project? project;
  late String projectColumnName;
}
mixin RenamedTitleMixin {
  late String id;
  late DateTime createdAt;
  RenamedTitleMixin$Actor? actor;
  late String previousTitle;
  late String currentTitle;
}
mixin ReopenedMixin {
  late String id;
  late DateTime createdAt;
  ReopenedMixin$Actor? actor;
}
mixin UnassignedMixin {
  late String id;
  late DateTime createdAt;
  UnassignedMixin$Actor? actor;
  UnassignedMixin$Assignee? assignee;
}
mixin UnlabeledMixin {
  late String id;
  late DateTime createdAt;
  UnlabeledMixin$Actor? actor;
  late UnlabeledMixin$Label label;
}
mixin UnlockedMixin {
  late String id;
  late DateTime createdAt;
  UnlockedMixin$Actor? actor;
}
mixin UnmarkedAsDuplicateMixin {
  late String id;
  late DateTime createdAt;
  UnmarkedAsDuplicateMixin$Actor? actor;
  late bool isCrossRepository;
  UnmarkedAsDuplicateMixin$Canonical? canonical;
}
mixin UnpinnedMixin {
  late String id;
  late DateTime createdAt;
  UnpinnedMixin$Actor? actor;
}
mixin BaseRefChangedMixin {
  late String id;
  late DateTime createdAt;
  BaseRefChangedMixin$Actor? actor;
  late String currentRefName;
  late String previousRefName;
}
mixin BaseRefDeletedMixin {
  late String id;
  late DateTime createdAt;
  BaseRefDeletedMixin$Actor? actor;
  String? baseRefName;
}
mixin BaseRefForcePushedMixin {
  late String id;
  late DateTime createdAt;
  BaseRefForcePushedMixin$BeforeCommit? beforeCommit;
  BaseRefForcePushedMixin$AfterCommit? afterCommit;
  BaseRefForcePushedMixin$Ref? ref;
  BaseRefForcePushedMixin$Actor? actor;
}
mixin ConvertedToDraftMixin {
  late String id;
  late DateTime createdAt;
  ConvertedToDraftMixin$Actor? actor;
}
mixin HeadRefDeletedMixin {
  late String id;
  late DateTime createdAt;
  HeadRefDeletedMixin$Actor? actor;
  late String headRefName;
}
mixin HeadRefForcePushedMixin {
  late String id;
  late DateTime createdAt;
  HeadRefForcePushedMixin$BeforeCommit? beforeCommit;
  HeadRefForcePushedMixin$AfterCommit? afterCommit;
  HeadRefForcePushedMixin$Ref? ref;
  HeadRefForcePushedMixin$Actor? actor;
}
mixin HeadRefRestoredMixin {
  late String id;
  late DateTime createdAt;
  HeadRefRestoredMixin$Actor? actor;
}
mixin MergedMixin {
  late String id;
  late DateTime createdAt;
  MergedMixin$Actor? actor;
  late String mergeRefName;
}
mixin PullRequestCommitMixin {
  late String id;
  late PullRequestCommitMixin$Commit commit;
}
mixin CommitMixin {
  late int additions;
  late DateTime authoredDate;
  late String oid;
  late String message;
  late Uri commitUrl;
  late String messageHeadline;
  CommitMixin$Author? author;
}
mixin PullRequestReviewMixin {
  late String id;
  PullRequestReviewMixin$Author? author;
  late DateTime createdAt;
  @JsonKey(unknownEnumValue: CommentAuthorAssociation.artemisUnknown)
  late CommentAuthorAssociation authorAssociation;
  late String body;
  late String bodyHTML;
  DateTime? lastEditedAt;
  @JsonKey(unknownEnumValue: PullRequestReviewState.artemisUnknown)
  late PullRequestReviewState state;
  late PullRequestReviewMixin$Comments comments;
  List<PullRequestReviewMixin$ReactionGroups>? reactionGroups;
  late bool viewerCanDelete;
  late bool viewerCanUpdate;
  late bool viewerDidAuthor;
  @JsonKey(unknownEnumValue: CommentCannotUpdateReason.artemisUnknown)
  late List<CommentCannotUpdateReason> viewerCannotUpdateReasons;
  late bool viewerCanReact;
}
mixin ReadyForReviewMixin {
  late String id;
  late DateTime createdAt;
  ReadyForReviewMixin$Actor? actor;
}
mixin ReviewDismissedMixin {
  late String id;
  late DateTime createdAt;
  ReviewDismissedMixin$Actor? actor;
  String? dismissalMessage;
  String? dismissalMessageHTML;
  @JsonKey(unknownEnumValue: PullRequestReviewState.artemisUnknown)
  late PullRequestReviewState previousReviewState;
}
mixin ReviewRequestedMixin {
  late String id;
  late DateTime createdAt;
  ReviewRequestedMixin$Actor? actor;
  ReviewRequestedMixin$RequestedReviewer? requestedReviewer;
}
mixin PRReviewCommentsMixin {
  late PRReviewCommentsMixin$Comments comments;
}
mixin PullRequestReviewCommentMixin {
  late String id;
  int? databaseId;
  PullRequestReviewCommentMixin$Author? author;
  late DateTime createdAt;
  @JsonKey(unknownEnumValue: CommentAuthorAssociation.artemisUnknown)
  late CommentAuthorAssociation authorAssociation;
  late String body;
  late String bodyHTML;
  DateTime? lastEditedAt;
  @JsonKey(unknownEnumValue: PullRequestReviewCommentState.artemisUnknown)
  late PullRequestReviewCommentState state;
  late String diffHunk;
  late bool outdated;
  late bool isMinimized;
  PullRequestReviewCommentMixin$ReplyTo? replyTo;
  late String path;
  List<PullRequestReviewCommentMixin$ReactionGroups>? reactionGroups;
  late bool viewerCanDelete;
  late bool viewerCanUpdate;
  late bool viewerDidAuthor;
  @JsonKey(unknownEnumValue: CommentCannotUpdateReason.artemisUnknown)
  late List<CommentCannotUpdateReason> viewerCannotUpdateReasons;
  late bool viewerCanReact;
  late bool viewerCanMinimize;
  late PullRequestReviewCommentMixin$PullRequest pullRequest;
  late PullRequestReviewCommentMixin$Repository repository;
}
mixin IssueInfoMixin {
  late String id;
  @JsonKey(unknownEnumValue: LockReason.artemisUnknown)
  LockReason? activeLockReason;
  late IssueInfoMixin$Assignees assignees;
  IssueInfoMixin$Author? author;
  late IssueInfoMixin$Participants participants;
  @JsonKey(unknownEnumValue: CommentAuthorAssociation.artemisUnknown)
  late CommentAuthorAssociation authorAssociation;
  late String bodyHTML;
  late String body;
  late bool closed;
  DateTime? closedAt;
  late DateTime createdAt;
  late IssueInfoMixin$Comments comments;
  IssueInfoMixin$UserContentEdits? userContentEdits;
  late bool includesCreatedEdit;
  bool? isPinned;
  IssueInfoMixin$Labels? labels;
  late bool locked;
  late int number;
  List<IssueInfoMixin$ReactionGroups>? reactionGroups;
  late IssueInfoMixin$Repository repository;
  @JsonKey(unknownEnumValue: IssueState.artemisUnknown)
  late IssueState state;
  late String titleHTML;
  late IssueInfoMixin$TimelineItems timelineItems;
  late Uri url;
  late bool viewerCanReact;
  late bool viewerCanUpdate;
}
mixin AssigneeInfoMixin {
  late int totalCount;
  List<AssigneeInfoMixin$Edges?>? edges;
}
mixin RepoInfoMixin {
  late String name;
  late RepoInfoMixin$Owner owner;
}
mixin PullInfoMixin {
  @JsonKey(unknownEnumValue: LockReason.artemisUnknown)
  LockReason? activeLockReason;
  late PullInfoMixin$Assignees assignees;
  PullInfoMixin$Author? author;
  @JsonKey(unknownEnumValue: CommentAuthorAssociation.artemisUnknown)
  late CommentAuthorAssociation authorAssociation;
  late String bodyHTML;
  late String body;
  late bool closed;
  DateTime? closedAt;
  late DateTime createdAt;
  late PullInfoMixin$Comments comments;
  PullInfoMixin$Labels? labels;
  late bool locked;
  late int number;
  List<PullInfoMixin$ReactionGroups>? reactionGroups;
  late PullInfoMixin$Repository repository;
  @JsonKey(unknownEnumValue: PullRequestState.artemisUnknown)
  late PullRequestState state;
  late PullInfoMixin$TimelineItems timelineItems;
  late String titleHTML;
  late Uri url;
  PullInfoMixin$UserContentEdits? userContentEdits;
  late bool includesCreatedEdit;
  late bool viewerCanReact;
  late int additions;
  late int deletions;
  PullInfoMixin$BaseRef? baseRef;
  PullInfoMixin$HeadRef? headRef;
  late int changedFiles;
  PullInfoMixin$ClosingIssuesReferences? closingIssuesReferences;
  late PullInfoMixin$Commits commits;
  late bool isCrossRepository;
  late bool merged;
  @JsonKey(unknownEnumValue: PullRequestReviewDecision.artemisUnknown)
  PullRequestReviewDecision? reviewDecision;
  late bool viewerCanUpdate;
}
mixin ReactorsGroupMixin {
  @JsonKey(unknownEnumValue: ReactionContent.artemisUnknown)
  late ReactionContent content;
  late ReactorsGroupMixin$Reactors reactors;
}
mixin AssigneeUserListMixin {
  late AssigneeUserListMixin$Assignees assignees;
}

@JsonSerializable(explicitToJson: true)
class GetRepoProjects$Query$Repository$Projects$Edges$Node
    extends JsonSerializable with EquatableMixin, ProjectMixin {
  GetRepoProjects$Query$Repository$Projects$Edges$Node();

  factory GetRepoProjects$Query$Repository$Projects$Edges$Node.fromJson(
          Map<String, dynamic> json) =>
      _$GetRepoProjects$Query$Repository$Projects$Edges$NodeFromJson(json);

  @override
  List<Object?> get props => [
        name,
        id,
        databaseId,
        updatedAt,
        number,
        bodyHTML,
        body,
        closed,
        progress
      ];
  @override
  Map<String, dynamic> toJson() =>
      _$GetRepoProjects$Query$Repository$Projects$Edges$NodeToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetRepoProjects$Query$Repository$Projects$Edges extends JsonSerializable
    with EquatableMixin {
  GetRepoProjects$Query$Repository$Projects$Edges();

  factory GetRepoProjects$Query$Repository$Projects$Edges.fromJson(
          Map<String, dynamic> json) =>
      _$GetRepoProjects$Query$Repository$Projects$EdgesFromJson(json);

  late String cursor;

  GetRepoProjects$Query$Repository$Projects$Edges$Node? node;

  @override
  List<Object?> get props => [cursor, node];
  @override
  Map<String, dynamic> toJson() =>
      _$GetRepoProjects$Query$Repository$Projects$EdgesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetRepoProjects$Query$Repository$Projects extends JsonSerializable
    with EquatableMixin {
  GetRepoProjects$Query$Repository$Projects();

  factory GetRepoProjects$Query$Repository$Projects.fromJson(
          Map<String, dynamic> json) =>
      _$GetRepoProjects$Query$Repository$ProjectsFromJson(json);

  late int totalCount;

  List<GetRepoProjects$Query$Repository$Projects$Edges?>? edges;

  @override
  List<Object?> get props => [totalCount, edges];
  @override
  Map<String, dynamic> toJson() =>
      _$GetRepoProjects$Query$Repository$ProjectsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetRepoProjects$Query$Repository extends JsonSerializable
    with EquatableMixin {
  GetRepoProjects$Query$Repository();

  factory GetRepoProjects$Query$Repository.fromJson(
          Map<String, dynamic> json) =>
      _$GetRepoProjects$Query$RepositoryFromJson(json);

  late GetRepoProjects$Query$Repository$Projects projects;

  @override
  List<Object?> get props => [projects];
  @override
  Map<String, dynamic> toJson() =>
      _$GetRepoProjects$Query$RepositoryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetRepoProjects$Query extends JsonSerializable with EquatableMixin {
  GetRepoProjects$Query();

  factory GetRepoProjects$Query.fromJson(Map<String, dynamic> json) =>
      _$GetRepoProjects$QueryFromJson(json);

  GetRepoProjects$Query$Repository? repository;

  @override
  List<Object?> get props => [repository];
  @override
  Map<String, dynamic> toJson() => _$GetRepoProjects$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ProjectMixin$Progress extends JsonSerializable with EquatableMixin {
  ProjectMixin$Progress();

  factory ProjectMixin$Progress.fromJson(Map<String, dynamic> json) =>
      _$ProjectMixin$ProgressFromJson(json);

  late double donePercentage;

  @override
  List<Object?> get props => [donePercentage];
  @override
  Map<String, dynamic> toJson() => _$ProjectMixin$ProgressToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetProjectInfo$Query$Node$Project extends GetProjectInfo$Query$Node
    with EquatableMixin, ProjectMixin {
  GetProjectInfo$Query$Node$Project();

  factory GetProjectInfo$Query$Node$Project.fromJson(
          Map<String, dynamic> json) =>
      _$GetProjectInfo$Query$Node$ProjectFromJson(json);

  @override
  List<Object?> get props => [
        name,
        id,
        databaseId,
        updatedAt,
        number,
        bodyHTML,
        body,
        closed,
        progress
      ];
  @override
  Map<String, dynamic> toJson() =>
      _$GetProjectInfo$Query$Node$ProjectToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetProjectInfo$Query$Node extends JsonSerializable with EquatableMixin {
  GetProjectInfo$Query$Node();

  factory GetProjectInfo$Query$Node.fromJson(Map<String, dynamic> json) {
    switch (json['__typename'].toString()) {
      case r'Project':
        return GetProjectInfo$Query$Node$Project.fromJson(json);
      default:
    }
    return _$GetProjectInfo$Query$NodeFromJson(json);
  }

  @JsonKey(name: '__typename')
  String? $$typename;

  @override
  List<Object?> get props => [$$typename];
  @override
  Map<String, dynamic> toJson() {
    switch ($$typename) {
      case r'Project':
        return (this as GetProjectInfo$Query$Node$Project).toJson();
      default:
    }
    return _$GetProjectInfo$Query$NodeToJson(this);
  }
}

@JsonSerializable(explicitToJson: true)
class GetProjectInfo$Query extends JsonSerializable with EquatableMixin {
  GetProjectInfo$Query();

  factory GetProjectInfo$Query.fromJson(Map<String, dynamic> json) =>
      _$GetProjectInfo$QueryFromJson(json);

  GetProjectInfo$Query$Node? node;

  @override
  List<Object?> get props => [node];
  @override
  Map<String, dynamic> toJson() => _$GetProjectInfo$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetProjectColumns$Query$Node$Project$Columns$Edges$Node
    extends JsonSerializable with EquatableMixin {
  GetProjectColumns$Query$Node$Project$Columns$Edges$Node();

  factory GetProjectColumns$Query$Node$Project$Columns$Edges$Node.fromJson(
          Map<String, dynamic> json) =>
      _$GetProjectColumns$Query$Node$Project$Columns$Edges$NodeFromJson(json);

  late String name;

  late String id;

  late DateTime updatedAt;

  @override
  List<Object?> get props => [name, id, updatedAt];
  @override
  Map<String, dynamic> toJson() =>
      _$GetProjectColumns$Query$Node$Project$Columns$Edges$NodeToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetProjectColumns$Query$Node$Project$Columns$Edges
    extends JsonSerializable with EquatableMixin {
  GetProjectColumns$Query$Node$Project$Columns$Edges();

  factory GetProjectColumns$Query$Node$Project$Columns$Edges.fromJson(
          Map<String, dynamic> json) =>
      _$GetProjectColumns$Query$Node$Project$Columns$EdgesFromJson(json);

  late String cursor;

  GetProjectColumns$Query$Node$Project$Columns$Edges$Node? node;

  @override
  List<Object?> get props => [cursor, node];
  @override
  Map<String, dynamic> toJson() =>
      _$GetProjectColumns$Query$Node$Project$Columns$EdgesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetProjectColumns$Query$Node$Project$Columns extends JsonSerializable
    with EquatableMixin {
  GetProjectColumns$Query$Node$Project$Columns();

  factory GetProjectColumns$Query$Node$Project$Columns.fromJson(
          Map<String, dynamic> json) =>
      _$GetProjectColumns$Query$Node$Project$ColumnsFromJson(json);

  late int totalCount;

  List<GetProjectColumns$Query$Node$Project$Columns$Edges?>? edges;

  @override
  List<Object?> get props => [totalCount, edges];
  @override
  Map<String, dynamic> toJson() =>
      _$GetProjectColumns$Query$Node$Project$ColumnsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetProjectColumns$Query$Node$Project extends GetProjectColumns$Query$Node
    with EquatableMixin {
  GetProjectColumns$Query$Node$Project();

  factory GetProjectColumns$Query$Node$Project.fromJson(
          Map<String, dynamic> json) =>
      _$GetProjectColumns$Query$Node$ProjectFromJson(json);

  late GetProjectColumns$Query$Node$Project$Columns columns;

  @override
  List<Object?> get props => [columns];
  @override
  Map<String, dynamic> toJson() =>
      _$GetProjectColumns$Query$Node$ProjectToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetProjectColumns$Query$Node extends JsonSerializable
    with EquatableMixin {
  GetProjectColumns$Query$Node();

  factory GetProjectColumns$Query$Node.fromJson(Map<String, dynamic> json) {
    switch (json['__typename'].toString()) {
      case r'Project':
        return GetProjectColumns$Query$Node$Project.fromJson(json);
      default:
    }
    return _$GetProjectColumns$Query$NodeFromJson(json);
  }

  @JsonKey(name: '__typename')
  String? $$typename;

  @override
  List<Object?> get props => [$$typename];
  @override
  Map<String, dynamic> toJson() {
    switch ($$typename) {
      case r'Project':
        return (this as GetProjectColumns$Query$Node$Project).toJson();
      default:
    }
    return _$GetProjectColumns$Query$NodeToJson(this);
  }
}

@JsonSerializable(explicitToJson: true)
class GetProjectColumns$Query extends JsonSerializable with EquatableMixin {
  GetProjectColumns$Query();

  factory GetProjectColumns$Query.fromJson(Map<String, dynamic> json) =>
      _$GetProjectColumns$QueryFromJson(json);

  GetProjectColumns$Query$Node? node;

  @override
  List<Object?> get props => [node];
  @override
  Map<String, dynamic> toJson() => _$GetProjectColumns$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetProjectColumnCards$Query$Node$ProjectColumn$Cards$Edges$Node$Content$Issue
    extends GetProjectColumnCards$Query$Node$ProjectColumn$Cards$Edges$Node$Content
    with EquatableMixin {
  GetProjectColumnCards$Query$Node$ProjectColumn$Cards$Edges$Node$Content$Issue();

  factory GetProjectColumnCards$Query$Node$ProjectColumn$Cards$Edges$Node$Content$Issue.fromJson(
          Map<String, dynamic> json) =>
      _$GetProjectColumnCards$Query$Node$ProjectColumn$Cards$Edges$Node$Content$IssueFromJson(
          json);

  late String bodyHTML;

  late String title;

  late int number;

  @override
  List<Object?> get props => [bodyHTML, title, number];
  @override
  Map<String, dynamic> toJson() =>
      _$GetProjectColumnCards$Query$Node$ProjectColumn$Cards$Edges$Node$Content$IssueToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetProjectColumnCards$Query$Node$ProjectColumn$Cards$Edges$Node$Content
    extends JsonSerializable with EquatableMixin {
  GetProjectColumnCards$Query$Node$ProjectColumn$Cards$Edges$Node$Content();

  factory GetProjectColumnCards$Query$Node$ProjectColumn$Cards$Edges$Node$Content.fromJson(
      Map<String, dynamic> json) {
    switch (json['__typename'].toString()) {
      case r'Issue':
        return GetProjectColumnCards$Query$Node$ProjectColumn$Cards$Edges$Node$Content$Issue
            .fromJson(json);
      default:
    }
    return _$GetProjectColumnCards$Query$Node$ProjectColumn$Cards$Edges$Node$ContentFromJson(
        json);
  }

  @JsonKey(name: '__typename')
  String? $$typename;

  @override
  List<Object?> get props => [$$typename];
  @override
  Map<String, dynamic> toJson() {
    switch ($$typename) {
      case r'Issue':
        return (this
                as GetProjectColumnCards$Query$Node$ProjectColumn$Cards$Edges$Node$Content$Issue)
            .toJson();
      default:
    }
    return _$GetProjectColumnCards$Query$Node$ProjectColumn$Cards$Edges$Node$ContentToJson(
        this);
  }
}

@JsonSerializable(explicitToJson: true)
class GetProjectColumnCards$Query$Node$ProjectColumn$Cards$Edges$Node
    extends JsonSerializable with EquatableMixin {
  GetProjectColumnCards$Query$Node$ProjectColumn$Cards$Edges$Node();

  factory GetProjectColumnCards$Query$Node$ProjectColumn$Cards$Edges$Node.fromJson(
          Map<String, dynamic> json) =>
      _$GetProjectColumnCards$Query$Node$ProjectColumn$Cards$Edges$NodeFromJson(
          json);

  String? note;

  GetProjectColumnCards$Query$Node$ProjectColumn$Cards$Edges$Node$Content?
      content;

  @override
  List<Object?> get props => [note, content];
  @override
  Map<String, dynamic> toJson() =>
      _$GetProjectColumnCards$Query$Node$ProjectColumn$Cards$Edges$NodeToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetProjectColumnCards$Query$Node$ProjectColumn$Cards$Edges
    extends JsonSerializable with EquatableMixin {
  GetProjectColumnCards$Query$Node$ProjectColumn$Cards$Edges();

  factory GetProjectColumnCards$Query$Node$ProjectColumn$Cards$Edges.fromJson(
          Map<String, dynamic> json) =>
      _$GetProjectColumnCards$Query$Node$ProjectColumn$Cards$EdgesFromJson(
          json);

  late String cursor;

  GetProjectColumnCards$Query$Node$ProjectColumn$Cards$Edges$Node? node;

  @override
  List<Object?> get props => [cursor, node];
  @override
  Map<String, dynamic> toJson() =>
      _$GetProjectColumnCards$Query$Node$ProjectColumn$Cards$EdgesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetProjectColumnCards$Query$Node$ProjectColumn$Cards
    extends JsonSerializable with EquatableMixin {
  GetProjectColumnCards$Query$Node$ProjectColumn$Cards();

  factory GetProjectColumnCards$Query$Node$ProjectColumn$Cards.fromJson(
          Map<String, dynamic> json) =>
      _$GetProjectColumnCards$Query$Node$ProjectColumn$CardsFromJson(json);

  late int totalCount;

  List<GetProjectColumnCards$Query$Node$ProjectColumn$Cards$Edges?>? edges;

  @override
  List<Object?> get props => [totalCount, edges];
  @override
  Map<String, dynamic> toJson() =>
      _$GetProjectColumnCards$Query$Node$ProjectColumn$CardsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetProjectColumnCards$Query$Node$ProjectColumn
    extends GetProjectColumnCards$Query$Node with EquatableMixin {
  GetProjectColumnCards$Query$Node$ProjectColumn();

  factory GetProjectColumnCards$Query$Node$ProjectColumn.fromJson(
          Map<String, dynamic> json) =>
      _$GetProjectColumnCards$Query$Node$ProjectColumnFromJson(json);

  late GetProjectColumnCards$Query$Node$ProjectColumn$Cards cards;

  @override
  List<Object?> get props => [cards];
  @override
  Map<String, dynamic> toJson() =>
      _$GetProjectColumnCards$Query$Node$ProjectColumnToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetProjectColumnCards$Query$Node extends JsonSerializable
    with EquatableMixin {
  GetProjectColumnCards$Query$Node();

  factory GetProjectColumnCards$Query$Node.fromJson(Map<String, dynamic> json) {
    switch (json['__typename'].toString()) {
      case r'ProjectColumn':
        return GetProjectColumnCards$Query$Node$ProjectColumn.fromJson(json);
      default:
    }
    return _$GetProjectColumnCards$Query$NodeFromJson(json);
  }

  @JsonKey(name: '__typename')
  String? $$typename;

  @override
  List<Object?> get props => [$$typename];
  @override
  Map<String, dynamic> toJson() {
    switch ($$typename) {
      case r'ProjectColumn':
        return (this as GetProjectColumnCards$Query$Node$ProjectColumn)
            .toJson();
      default:
    }
    return _$GetProjectColumnCards$Query$NodeToJson(this);
  }
}

@JsonSerializable(explicitToJson: true)
class GetProjectColumnCards$Query extends JsonSerializable with EquatableMixin {
  GetProjectColumnCards$Query();

  factory GetProjectColumnCards$Query.fromJson(Map<String, dynamic> json) =>
      _$GetProjectColumnCards$QueryFromJson(json);

  GetProjectColumnCards$Query$Node? node;

  @override
  List<Object?> get props => [node];
  @override
  Map<String, dynamic> toJson() => _$GetProjectColumnCards$QueryToJson(this);
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
  @override
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
  @override
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
  @override
  Map<String, dynamic> toJson() => _$IssueTemplates$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PinnedIssues$Query$Repository$PinnedIssues$Nodes$Issue
    extends JsonSerializable with EquatableMixin, IssueMixin {
  PinnedIssues$Query$Repository$PinnedIssues$Nodes$Issue();

  factory PinnedIssues$Query$Repository$PinnedIssues$Nodes$Issue.fromJson(
          Map<String, dynamic> json) =>
      _$PinnedIssues$Query$Repository$PinnedIssues$Nodes$IssueFromJson(json);

  @override
  List<Object?> get props => [url, title, number, issueState, repository];
  @override
  Map<String, dynamic> toJson() =>
      _$PinnedIssues$Query$Repository$PinnedIssues$Nodes$IssueToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PinnedIssues$Query$Repository$PinnedIssues$Nodes extends JsonSerializable
    with EquatableMixin {
  PinnedIssues$Query$Repository$PinnedIssues$Nodes();

  factory PinnedIssues$Query$Repository$PinnedIssues$Nodes.fromJson(
          Map<String, dynamic> json) =>
      _$PinnedIssues$Query$Repository$PinnedIssues$NodesFromJson(json);

  late PinnedIssues$Query$Repository$PinnedIssues$Nodes$Issue issue;

  @override
  List<Object?> get props => [issue];
  @override
  Map<String, dynamic> toJson() =>
      _$PinnedIssues$Query$Repository$PinnedIssues$NodesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PinnedIssues$Query$Repository$PinnedIssues extends JsonSerializable
    with EquatableMixin {
  PinnedIssues$Query$Repository$PinnedIssues();

  factory PinnedIssues$Query$Repository$PinnedIssues.fromJson(
          Map<String, dynamic> json) =>
      _$PinnedIssues$Query$Repository$PinnedIssuesFromJson(json);

  late int totalCount;

  List<PinnedIssues$Query$Repository$PinnedIssues$Nodes?>? nodes;

  @override
  List<Object?> get props => [totalCount, nodes];
  @override
  Map<String, dynamic> toJson() =>
      _$PinnedIssues$Query$Repository$PinnedIssuesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PinnedIssues$Query$Repository extends JsonSerializable
    with EquatableMixin {
  PinnedIssues$Query$Repository();

  factory PinnedIssues$Query$Repository.fromJson(Map<String, dynamic> json) =>
      _$PinnedIssues$Query$RepositoryFromJson(json);

  PinnedIssues$Query$Repository$PinnedIssues? pinnedIssues;

  @override
  List<Object?> get props => [pinnedIssues];
  @override
  Map<String, dynamic> toJson() => _$PinnedIssues$Query$RepositoryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PinnedIssues$Query extends JsonSerializable with EquatableMixin {
  PinnedIssues$Query();

  factory PinnedIssues$Query.fromJson(Map<String, dynamic> json) =>
      _$PinnedIssues$QueryFromJson(json);

  PinnedIssues$Query$Repository? repository;

  @override
  List<Object?> get props => [repository];
  @override
  Map<String, dynamic> toJson() => _$PinnedIssues$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class IssueMixin$Repository extends JsonSerializable with EquatableMixin {
  IssueMixin$Repository();

  factory IssueMixin$Repository.fromJson(Map<String, dynamic> json) =>
      _$IssueMixin$RepositoryFromJson(json);

  late String name;

  late String nameWithOwner;

  @override
  List<Object?> get props => [name, nameWithOwner];
  @override
  Map<String, dynamic> toJson() => _$IssueMixin$RepositoryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class HasStarred$Query$Repository extends JsonSerializable with EquatableMixin {
  HasStarred$Query$Repository();

  factory HasStarred$Query$Repository.fromJson(Map<String, dynamic> json) =>
      _$HasStarred$Query$RepositoryFromJson(json);

  late bool viewerHasStarred;

  late int stargazerCount;

  @override
  List<Object?> get props => [viewerHasStarred, stargazerCount];
  @override
  Map<String, dynamic> toJson() => _$HasStarred$Query$RepositoryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class HasStarred$Query extends JsonSerializable with EquatableMixin {
  HasStarred$Query();

  factory HasStarred$Query.fromJson(Map<String, dynamic> json) =>
      _$HasStarred$QueryFromJson(json);

  HasStarred$Query$Repository? repository;

  @override
  List<Object?> get props => [repository];
  @override
  Map<String, dynamic> toJson() => _$HasStarred$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class HasWatched$Query$Repository$Watchers extends JsonSerializable
    with EquatableMixin {
  HasWatched$Query$Repository$Watchers();

  factory HasWatched$Query$Repository$Watchers.fromJson(
          Map<String, dynamic> json) =>
      _$HasWatched$Query$Repository$WatchersFromJson(json);

  late int totalCount;

  @override
  List<Object?> get props => [totalCount];
  @override
  Map<String, dynamic> toJson() =>
      _$HasWatched$Query$Repository$WatchersToJson(this);
}

@JsonSerializable(explicitToJson: true)
class HasWatched$Query$Repository extends JsonSerializable with EquatableMixin {
  HasWatched$Query$Repository();

  factory HasWatched$Query$Repository.fromJson(Map<String, dynamic> json) =>
      _$HasWatched$Query$RepositoryFromJson(json);

  @JsonKey(unknownEnumValue: SubscriptionState.artemisUnknown)
  SubscriptionState? viewerSubscription;

  late bool viewerCanSubscribe;

  late HasWatched$Query$Repository$Watchers watchers;

  @override
  List<Object?> get props => [viewerSubscription, viewerCanSubscribe, watchers];
  @override
  Map<String, dynamic> toJson() => _$HasWatched$Query$RepositoryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class HasWatched$Query extends JsonSerializable with EquatableMixin {
  HasWatched$Query();

  factory HasWatched$Query.fromJson(Map<String, dynamic> json) =>
      _$HasWatched$QueryFromJson(json);

  HasWatched$Query$Repository? repository;

  @override
  List<Object?> get props => [repository];
  @override
  Map<String, dynamic> toJson() => _$HasWatched$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetViewerOrgs$Query$Viewer$Organizations$Edges$Node
    extends JsonSerializable with EquatableMixin {
  GetViewerOrgs$Query$Viewer$Organizations$Edges$Node();

  factory GetViewerOrgs$Query$Viewer$Organizations$Edges$Node.fromJson(
          Map<String, dynamic> json) =>
      _$GetViewerOrgs$Query$Viewer$Organizations$Edges$NodeFromJson(json);

  late Uri avatarUrl;

  late String login;

  @override
  List<Object?> get props => [avatarUrl, login];
  @override
  Map<String, dynamic> toJson() =>
      _$GetViewerOrgs$Query$Viewer$Organizations$Edges$NodeToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetViewerOrgs$Query$Viewer$Organizations$Edges extends JsonSerializable
    with EquatableMixin {
  GetViewerOrgs$Query$Viewer$Organizations$Edges();

  factory GetViewerOrgs$Query$Viewer$Organizations$Edges.fromJson(
          Map<String, dynamic> json) =>
      _$GetViewerOrgs$Query$Viewer$Organizations$EdgesFromJson(json);

  late String cursor;

  GetViewerOrgs$Query$Viewer$Organizations$Edges$Node? node;

  @override
  List<Object?> get props => [cursor, node];
  @override
  Map<String, dynamic> toJson() =>
      _$GetViewerOrgs$Query$Viewer$Organizations$EdgesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetViewerOrgs$Query$Viewer$Organizations extends JsonSerializable
    with EquatableMixin {
  GetViewerOrgs$Query$Viewer$Organizations();

  factory GetViewerOrgs$Query$Viewer$Organizations.fromJson(
          Map<String, dynamic> json) =>
      _$GetViewerOrgs$Query$Viewer$OrganizationsFromJson(json);

  List<GetViewerOrgs$Query$Viewer$Organizations$Edges?>? edges;

  @override
  List<Object?> get props => [edges];
  @override
  Map<String, dynamic> toJson() =>
      _$GetViewerOrgs$Query$Viewer$OrganizationsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetViewerOrgs$Query$Viewer extends JsonSerializable with EquatableMixin {
  GetViewerOrgs$Query$Viewer();

  factory GetViewerOrgs$Query$Viewer.fromJson(Map<String, dynamic> json) =>
      _$GetViewerOrgs$Query$ViewerFromJson(json);

  late GetViewerOrgs$Query$Viewer$Organizations organizations;

  @override
  List<Object?> get props => [organizations];
  @override
  Map<String, dynamic> toJson() => _$GetViewerOrgs$Query$ViewerToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetViewerOrgs$Query extends JsonSerializable with EquatableMixin {
  GetViewerOrgs$Query();

  factory GetViewerOrgs$Query.fromJson(Map<String, dynamic> json) =>
      _$GetViewerOrgs$QueryFromJson(json);

  late GetViewerOrgs$Query$Viewer viewer;

  @override
  List<Object?> get props => [viewer];
  @override
  Map<String, dynamic> toJson() => _$GetViewerOrgs$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$AddedToProjectEvent
    extends GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node
    with EquatableMixin, AddedToProjectMixin {
  GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$AddedToProjectEvent();

  factory GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$AddedToProjectEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$AddedToProjectEventFromJson(
          json);

  @override
  List<Object?> get props => [id, createdAt, actor, projectColumnName, project];
  @override
  Map<String, dynamic> toJson() =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$AddedToProjectEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$AssignedEvent
    extends GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node
    with EquatableMixin, AssignedMixin {
  GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$AssignedEvent();

  factory GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$AssignedEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$AssignedEventFromJson(
          json);

  @override
  List<Object?> get props => [id, createdAt, actor, assignee];
  @override
  Map<String, dynamic> toJson() =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$AssignedEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$ClosedEvent
    extends GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node
    with EquatableMixin, ClosedMixin {
  GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$ClosedEvent();

  factory GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$ClosedEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$ClosedEventFromJson(
          json);

  @override
  List<Object?> get props => [id, createdAt, actor];
  @override
  Map<String, dynamic> toJson() =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$ClosedEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$CrossReferencedEvent
    extends GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node
    with EquatableMixin, CrossReferenceMixin {
  GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$CrossReferencedEvent();

  factory GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$CrossReferencedEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$CrossReferencedEventFromJson(
          json);

  @override
  List<Object?> get props => [id, createdAt, actor, source, isCrossRepository];
  @override
  Map<String, dynamic> toJson() =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$CrossReferencedEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$DemilestonedEvent
    extends GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node
    with EquatableMixin, DeMileStonedMixin {
  GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$DemilestonedEvent();

  factory GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$DemilestonedEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$DemilestonedEventFromJson(
          json);

  @override
  List<Object?> get props => [id, createdAt, actor, milestoneTitle];
  @override
  Map<String, dynamic> toJson() =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$DemilestonedEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$IssueComment
    extends GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node
    with EquatableMixin, IssueCommentMixin {
  GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$IssueComment();

  factory GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$IssueComment.fromJson(
          Map<String, dynamic> json) =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$IssueCommentFromJson(
          json);

  @override
  List<Object?> get props => [
        id,
        author,
        createdAt,
        authorAssociation,
        body,
        bodyHTML,
        lastEditedAt,
        isMinimized,
        minimizedReason,
        reactionGroups,
        viewerCanMinimize,
        viewerCanDelete,
        viewerCanUpdate,
        viewerDidAuthor,
        viewerCannotUpdateReasons,
        viewerCanReact
      ];
  @override
  Map<String, dynamic> toJson() =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$IssueCommentToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$LabeledEvent
    extends GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node
    with EquatableMixin, LabeledMixin {
  GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$LabeledEvent();

  factory GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$LabeledEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$LabeledEventFromJson(
          json);

  @override
  List<Object?> get props => [id, createdAt, actor, label];
  @override
  Map<String, dynamic> toJson() =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$LabeledEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$LockedEvent
    extends GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node
    with EquatableMixin, LockedMixin {
  GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$LockedEvent();

  factory GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$LockedEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$LockedEventFromJson(
          json);

  @override
  List<Object?> get props => [id, createdAt, actor, lockReason];
  @override
  Map<String, dynamic> toJson() =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$LockedEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$MarkedAsDuplicateEvent
    extends GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node
    with EquatableMixin, MarkedAsDuplicateMixin {
  GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$MarkedAsDuplicateEvent();

  factory GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$MarkedAsDuplicateEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$MarkedAsDuplicateEventFromJson(
          json);

  @override
  List<Object?> get props =>
      [id, createdAt, actor, isCrossRepository, canonical];
  @override
  Map<String, dynamic> toJson() =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$MarkedAsDuplicateEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$MilestonedEvent
    extends GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node
    with EquatableMixin, MileStonedMixin {
  GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$MilestonedEvent();

  factory GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$MilestonedEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$MilestonedEventFromJson(
          json);

  @override
  List<Object?> get props => [id, createdAt, actor, milestoneTitle];
  @override
  Map<String, dynamic> toJson() =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$MilestonedEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$MovedColumnsInProjectEvent
    extends GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node
    with EquatableMixin, MovedColumnsInProjectMixin {
  GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$MovedColumnsInProjectEvent();

  factory GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$MovedColumnsInProjectEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$MovedColumnsInProjectEventFromJson(
          json);

  @override
  List<Object?> get props => [
        id,
        createdAt,
        actor,
        previousProjectColumnName,
        projectColumnName,
        project
      ];
  @override
  Map<String, dynamic> toJson() =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$MovedColumnsInProjectEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$PinnedEvent
    extends GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node
    with EquatableMixin, PinnedMixin {
  GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$PinnedEvent();

  factory GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$PinnedEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$PinnedEventFromJson(
          json);

  @override
  List<Object?> get props => [id, createdAt, actor];
  @override
  Map<String, dynamic> toJson() =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$PinnedEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$RemovedFromProjectEvent
    extends GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node
    with EquatableMixin, RemovedFromProjectMixin {
  GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$RemovedFromProjectEvent();

  factory GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$RemovedFromProjectEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$RemovedFromProjectEventFromJson(
          json);

  @override
  List<Object?> get props => [id, createdAt, actor, project, projectColumnName];
  @override
  Map<String, dynamic> toJson() =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$RemovedFromProjectEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$RenamedTitleEvent
    extends GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node
    with EquatableMixin, RenamedTitleMixin {
  GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$RenamedTitleEvent();

  factory GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$RenamedTitleEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$RenamedTitleEventFromJson(
          json);

  @override
  List<Object?> get props =>
      [id, createdAt, actor, previousTitle, currentTitle];
  @override
  Map<String, dynamic> toJson() =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$RenamedTitleEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$ReopenedEvent
    extends GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node
    with EquatableMixin, ReopenedMixin {
  GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$ReopenedEvent();

  factory GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$ReopenedEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$ReopenedEventFromJson(
          json);

  @override
  List<Object?> get props => [id, createdAt, actor];
  @override
  Map<String, dynamic> toJson() =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$ReopenedEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$UnassignedEvent
    extends GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node
    with EquatableMixin, UnassignedMixin {
  GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$UnassignedEvent();

  factory GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$UnassignedEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$UnassignedEventFromJson(
          json);

  @override
  List<Object?> get props => [id, createdAt, actor, assignee];
  @override
  Map<String, dynamic> toJson() =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$UnassignedEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$UnlabeledEvent
    extends GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node
    with EquatableMixin, UnlabeledMixin {
  GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$UnlabeledEvent();

  factory GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$UnlabeledEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$UnlabeledEventFromJson(
          json);

  @override
  List<Object?> get props => [id, createdAt, actor, label];
  @override
  Map<String, dynamic> toJson() =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$UnlabeledEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$UnlockedEvent
    extends GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node
    with EquatableMixin, UnlockedMixin {
  GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$UnlockedEvent();

  factory GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$UnlockedEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$UnlockedEventFromJson(
          json);

  @override
  List<Object?> get props => [id, createdAt, actor];
  @override
  Map<String, dynamic> toJson() =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$UnlockedEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$UnmarkedAsDuplicateEvent
    extends GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node
    with EquatableMixin, UnmarkedAsDuplicateMixin {
  GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$UnmarkedAsDuplicateEvent();

  factory GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$UnmarkedAsDuplicateEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$UnmarkedAsDuplicateEventFromJson(
          json);

  @override
  List<Object?> get props =>
      [id, createdAt, actor, isCrossRepository, canonical];
  @override
  Map<String, dynamic> toJson() =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$UnmarkedAsDuplicateEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$UnpinnedEvent
    extends GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node
    with EquatableMixin, UnpinnedMixin {
  GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$UnpinnedEvent();

  factory GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$UnpinnedEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$UnpinnedEventFromJson(
          json);

  @override
  List<Object?> get props => [id, createdAt, actor];
  @override
  Map<String, dynamic> toJson() =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$UnpinnedEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node
    extends JsonSerializable with EquatableMixin {
  GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node();

  factory GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node.fromJson(
      Map<String, dynamic> json) {
    switch (json['__typename'].toString()) {
      case r'AddedToProjectEvent':
        return GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$AddedToProjectEvent
            .fromJson(json);
      case r'AssignedEvent':
        return GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$AssignedEvent
            .fromJson(json);
      case r'ClosedEvent':
        return GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$ClosedEvent
            .fromJson(json);
      case r'CrossReferencedEvent':
        return GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$CrossReferencedEvent
            .fromJson(json);
      case r'DemilestonedEvent':
        return GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$DemilestonedEvent
            .fromJson(json);
      case r'IssueComment':
        return GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$IssueComment
            .fromJson(json);
      case r'LabeledEvent':
        return GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$LabeledEvent
            .fromJson(json);
      case r'LockedEvent':
        return GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$LockedEvent
            .fromJson(json);
      case r'MarkedAsDuplicateEvent':
        return GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$MarkedAsDuplicateEvent
            .fromJson(json);
      case r'MilestonedEvent':
        return GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$MilestonedEvent
            .fromJson(json);
      case r'MovedColumnsInProjectEvent':
        return GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$MovedColumnsInProjectEvent
            .fromJson(json);
      case r'PinnedEvent':
        return GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$PinnedEvent
            .fromJson(json);
      case r'RemovedFromProjectEvent':
        return GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$RemovedFromProjectEvent
            .fromJson(json);
      case r'RenamedTitleEvent':
        return GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$RenamedTitleEvent
            .fromJson(json);
      case r'ReopenedEvent':
        return GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$ReopenedEvent
            .fromJson(json);
      case r'UnassignedEvent':
        return GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$UnassignedEvent
            .fromJson(json);
      case r'UnlabeledEvent':
        return GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$UnlabeledEvent
            .fromJson(json);
      case r'UnlockedEvent':
        return GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$UnlockedEvent
            .fromJson(json);
      case r'UnmarkedAsDuplicateEvent':
        return GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$UnmarkedAsDuplicateEvent
            .fromJson(json);
      case r'UnpinnedEvent':
        return GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$UnpinnedEvent
            .fromJson(json);
      default:
    }
    return _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$NodeFromJson(
        json);
  }

  @JsonKey(name: '__typename')
  String? $$typename;

  @override
  List<Object?> get props => [$$typename];
  @override
  Map<String, dynamic> toJson() {
    switch ($$typename) {
      case r'AddedToProjectEvent':
        return (this
                as GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$AddedToProjectEvent)
            .toJson();
      case r'AssignedEvent':
        return (this
                as GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$AssignedEvent)
            .toJson();
      case r'ClosedEvent':
        return (this
                as GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$ClosedEvent)
            .toJson();
      case r'CrossReferencedEvent':
        return (this
                as GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$CrossReferencedEvent)
            .toJson();
      case r'DemilestonedEvent':
        return (this
                as GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$DemilestonedEvent)
            .toJson();
      case r'IssueComment':
        return (this
                as GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$IssueComment)
            .toJson();
      case r'LabeledEvent':
        return (this
                as GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$LabeledEvent)
            .toJson();
      case r'LockedEvent':
        return (this
                as GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$LockedEvent)
            .toJson();
      case r'MarkedAsDuplicateEvent':
        return (this
                as GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$MarkedAsDuplicateEvent)
            .toJson();
      case r'MilestonedEvent':
        return (this
                as GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$MilestonedEvent)
            .toJson();
      case r'MovedColumnsInProjectEvent':
        return (this
                as GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$MovedColumnsInProjectEvent)
            .toJson();
      case r'PinnedEvent':
        return (this
                as GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$PinnedEvent)
            .toJson();
      case r'RemovedFromProjectEvent':
        return (this
                as GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$RemovedFromProjectEvent)
            .toJson();
      case r'RenamedTitleEvent':
        return (this
                as GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$RenamedTitleEvent)
            .toJson();
      case r'ReopenedEvent':
        return (this
                as GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$ReopenedEvent)
            .toJson();
      case r'UnassignedEvent':
        return (this
                as GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$UnassignedEvent)
            .toJson();
      case r'UnlabeledEvent':
        return (this
                as GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$UnlabeledEvent)
            .toJson();
      case r'UnlockedEvent':
        return (this
                as GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$UnlockedEvent)
            .toJson();
      case r'UnmarkedAsDuplicateEvent':
        return (this
                as GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$UnmarkedAsDuplicateEvent)
            .toJson();
      case r'UnpinnedEvent':
        return (this
                as GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node$UnpinnedEvent)
            .toJson();
      default:
    }
    return _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$NodeToJson(
        this);
  }
}

@JsonSerializable(explicitToJson: true)
class GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges
    extends JsonSerializable with EquatableMixin {
  GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges();

  factory GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges.fromJson(
          Map<String, dynamic> json) =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$EdgesFromJson(
          json);

  GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges$Node?
      node;

  late String cursor;

  @override
  List<Object?> get props => [node, cursor];
  @override
  Map<String, dynamic> toJson() =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$EdgesToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems
    extends JsonSerializable with EquatableMixin {
  GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems();

  factory GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems.fromJson(
          Map<String, dynamic> json) =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItemsFromJson(
          json);

  List<GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems$Edges?>?
      edges;

  @override
  List<Object?> get props => [edges];
  @override
  Map<String, dynamic> toJson() =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItemsToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetTimeline$Query$Repository$IssueOrPullRequest$Issue
    extends GetTimeline$Query$Repository$IssueOrPullRequest
    with EquatableMixin {
  GetTimeline$Query$Repository$IssueOrPullRequest$Issue();

  factory GetTimeline$Query$Repository$IssueOrPullRequest$Issue.fromJson(
          Map<String, dynamic> json) =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$IssueFromJson(json);

  late GetTimeline$Query$Repository$IssueOrPullRequest$Issue$TimelineItems
      timelineItems;

  @override
  List<Object?> get props => [timelineItems];
  @override
  Map<String, dynamic> toJson() =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$IssueToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$AddedToProjectEvent
    extends GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node
    with EquatableMixin, AddedToProjectMixin {
  GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$AddedToProjectEvent();

  factory GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$AddedToProjectEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$AddedToProjectEventFromJson(
          json);

  @override
  List<Object?> get props => [id, createdAt, actor, projectColumnName, project];
  @override
  Map<String, dynamic> toJson() =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$AddedToProjectEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$AssignedEvent
    extends GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node
    with EquatableMixin, AssignedMixin {
  GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$AssignedEvent();

  factory GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$AssignedEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$AssignedEventFromJson(
          json);

  @override
  List<Object?> get props => [id, createdAt, actor, assignee];
  @override
  Map<String, dynamic> toJson() =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$AssignedEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$BaseRefChangedEvent
    extends GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node
    with EquatableMixin, BaseRefChangedMixin {
  GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$BaseRefChangedEvent();

  factory GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$BaseRefChangedEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$BaseRefChangedEventFromJson(
          json);

  @override
  List<Object?> get props =>
      [id, createdAt, actor, currentRefName, previousRefName];
  @override
  Map<String, dynamic> toJson() =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$BaseRefChangedEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$BaseRefDeletedEvent
    extends GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node
    with EquatableMixin, BaseRefDeletedMixin {
  GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$BaseRefDeletedEvent();

  factory GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$BaseRefDeletedEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$BaseRefDeletedEventFromJson(
          json);

  @override
  List<Object?> get props => [id, createdAt, actor, baseRefName];
  @override
  Map<String, dynamic> toJson() =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$BaseRefDeletedEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$BaseRefForcePushedEvent
    extends GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node
    with EquatableMixin, BaseRefForcePushedMixin {
  GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$BaseRefForcePushedEvent();

  factory GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$BaseRefForcePushedEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$BaseRefForcePushedEventFromJson(
          json);

  @override
  List<Object?> get props =>
      [id, createdAt, beforeCommit, afterCommit, ref, actor];
  @override
  Map<String, dynamic> toJson() =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$BaseRefForcePushedEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$ClosedEvent
    extends GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node
    with EquatableMixin, ClosedMixin {
  GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$ClosedEvent();

  factory GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$ClosedEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$ClosedEventFromJson(
          json);

  @override
  List<Object?> get props => [id, createdAt, actor];
  @override
  Map<String, dynamic> toJson() =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$ClosedEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$ConvertToDraftEvent
    extends GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node
    with EquatableMixin, ConvertedToDraftMixin {
  GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$ConvertToDraftEvent();

  factory GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$ConvertToDraftEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$ConvertToDraftEventFromJson(
          json);

  @override
  List<Object?> get props => [id, createdAt, actor];
  @override
  Map<String, dynamic> toJson() =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$ConvertToDraftEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$CrossReferencedEvent
    extends GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node
    with EquatableMixin, CrossReferenceMixin {
  GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$CrossReferencedEvent();

  factory GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$CrossReferencedEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$CrossReferencedEventFromJson(
          json);

  @override
  List<Object?> get props => [id, createdAt, actor, source, isCrossRepository];
  @override
  Map<String, dynamic> toJson() =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$CrossReferencedEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$DemilestonedEvent
    extends GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node
    with EquatableMixin, DeMileStonedMixin {
  GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$DemilestonedEvent();

  factory GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$DemilestonedEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$DemilestonedEventFromJson(
          json);

  @override
  List<Object?> get props => [id, createdAt, actor, milestoneTitle];
  @override
  Map<String, dynamic> toJson() =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$DemilestonedEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$HeadRefDeletedEvent
    extends GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node
    with EquatableMixin, HeadRefDeletedMixin {
  GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$HeadRefDeletedEvent();

  factory GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$HeadRefDeletedEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$HeadRefDeletedEventFromJson(
          json);

  @override
  List<Object?> get props => [id, createdAt, actor, headRefName];
  @override
  Map<String, dynamic> toJson() =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$HeadRefDeletedEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$HeadRefForcePushedEvent
    extends GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node
    with EquatableMixin, HeadRefForcePushedMixin {
  GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$HeadRefForcePushedEvent();

  factory GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$HeadRefForcePushedEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$HeadRefForcePushedEventFromJson(
          json);

  @override
  List<Object?> get props =>
      [id, createdAt, beforeCommit, afterCommit, ref, actor];
  @override
  Map<String, dynamic> toJson() =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$HeadRefForcePushedEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$HeadRefRestoredEvent
    extends GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node
    with EquatableMixin, HeadRefRestoredMixin {
  GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$HeadRefRestoredEvent();

  factory GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$HeadRefRestoredEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$HeadRefRestoredEventFromJson(
          json);

  @override
  List<Object?> get props => [id, createdAt, actor];
  @override
  Map<String, dynamic> toJson() =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$HeadRefRestoredEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$IssueComment
    extends GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node
    with EquatableMixin, IssueCommentMixin {
  GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$IssueComment();

  factory GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$IssueComment.fromJson(
          Map<String, dynamic> json) =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$IssueCommentFromJson(
          json);

  @override
  List<Object?> get props => [
        id,
        author,
        createdAt,
        authorAssociation,
        body,
        bodyHTML,
        lastEditedAt,
        isMinimized,
        minimizedReason,
        reactionGroups,
        viewerCanMinimize,
        viewerCanDelete,
        viewerCanUpdate,
        viewerDidAuthor,
        viewerCannotUpdateReasons,
        viewerCanReact
      ];
  @override
  Map<String, dynamic> toJson() =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$IssueCommentToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$LabeledEvent
    extends GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node
    with EquatableMixin, LabeledMixin {
  GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$LabeledEvent();

  factory GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$LabeledEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$LabeledEventFromJson(
          json);

  @override
  List<Object?> get props => [id, createdAt, actor, label];
  @override
  Map<String, dynamic> toJson() =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$LabeledEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$LockedEvent
    extends GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node
    with EquatableMixin, LockedMixin {
  GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$LockedEvent();

  factory GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$LockedEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$LockedEventFromJson(
          json);

  @override
  List<Object?> get props => [id, createdAt, actor, lockReason];
  @override
  Map<String, dynamic> toJson() =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$LockedEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$MarkedAsDuplicateEvent
    extends GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node
    with EquatableMixin, MarkedAsDuplicateMixin {
  GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$MarkedAsDuplicateEvent();

  factory GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$MarkedAsDuplicateEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$MarkedAsDuplicateEventFromJson(
          json);

  @override
  List<Object?> get props =>
      [id, createdAt, actor, isCrossRepository, canonical];
  @override
  Map<String, dynamic> toJson() =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$MarkedAsDuplicateEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$MergedEvent
    extends GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node
    with EquatableMixin, MergedMixin {
  GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$MergedEvent();

  factory GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$MergedEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$MergedEventFromJson(
          json);

  @override
  List<Object?> get props => [id, createdAt, actor, mergeRefName];
  @override
  Map<String, dynamic> toJson() =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$MergedEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$MilestonedEvent
    extends GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node
    with EquatableMixin, MileStonedMixin {
  GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$MilestonedEvent();

  factory GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$MilestonedEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$MilestonedEventFromJson(
          json);

  @override
  List<Object?> get props => [id, createdAt, actor, milestoneTitle];
  @override
  Map<String, dynamic> toJson() =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$MilestonedEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$MovedColumnsInProjectEvent
    extends GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node
    with EquatableMixin, MovedColumnsInProjectMixin {
  GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$MovedColumnsInProjectEvent();

  factory GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$MovedColumnsInProjectEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$MovedColumnsInProjectEventFromJson(
          json);

  @override
  List<Object?> get props => [
        id,
        createdAt,
        actor,
        previousProjectColumnName,
        projectColumnName,
        project
      ];
  @override
  Map<String, dynamic> toJson() =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$MovedColumnsInProjectEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$PinnedEvent
    extends GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node
    with EquatableMixin, PinnedMixin {
  GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$PinnedEvent();

  factory GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$PinnedEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$PinnedEventFromJson(
          json);

  @override
  List<Object?> get props => [id, createdAt, actor];
  @override
  Map<String, dynamic> toJson() =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$PinnedEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$PullRequestCommit
    extends GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node
    with EquatableMixin, PullRequestCommitMixin {
  GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$PullRequestCommit();

  factory GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$PullRequestCommit.fromJson(
          Map<String, dynamic> json) =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$PullRequestCommitFromJson(
          json);

  @override
  List<Object?> get props => [id, commit];
  @override
  Map<String, dynamic> toJson() =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$PullRequestCommitToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$PullRequestCommitCommentThread
    extends GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node
    with EquatableMixin {
  GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$PullRequestCommitCommentThread();

  factory GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$PullRequestCommitCommentThread.fromJson(
          Map<String, dynamic> json) =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$PullRequestCommitCommentThreadFromJson(
          json);

  late String id;

  @override
  List<Object?> get props => [id];
  @override
  Map<String, dynamic> toJson() =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$PullRequestCommitCommentThreadToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$PullRequestReview
    extends GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node
    with EquatableMixin, PullRequestReviewMixin {
  GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$PullRequestReview();

  factory GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$PullRequestReview.fromJson(
          Map<String, dynamic> json) =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$PullRequestReviewFromJson(
          json);

  @override
  List<Object?> get props => [
        id,
        author,
        createdAt,
        authorAssociation,
        body,
        bodyHTML,
        lastEditedAt,
        state,
        comments,
        reactionGroups,
        viewerCanDelete,
        viewerCanUpdate,
        viewerDidAuthor,
        viewerCannotUpdateReasons,
        viewerCanReact
      ];
  @override
  Map<String, dynamic> toJson() =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$PullRequestReviewToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$PullRequestReviewThread
    extends GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node
    with EquatableMixin {
  GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$PullRequestReviewThread();

  factory GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$PullRequestReviewThread.fromJson(
          Map<String, dynamic> json) =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$PullRequestReviewThreadFromJson(
          json);

  late String id;

  @override
  List<Object?> get props => [id];
  @override
  Map<String, dynamic> toJson() =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$PullRequestReviewThreadToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$ReadyForReviewEvent
    extends GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node
    with EquatableMixin, ReadyForReviewMixin {
  GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$ReadyForReviewEvent();

  factory GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$ReadyForReviewEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$ReadyForReviewEventFromJson(
          json);

  @override
  List<Object?> get props => [id, createdAt, actor];
  @override
  Map<String, dynamic> toJson() =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$ReadyForReviewEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$RemovedFromProjectEvent
    extends GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node
    with EquatableMixin, RemovedFromProjectMixin {
  GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$RemovedFromProjectEvent();

  factory GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$RemovedFromProjectEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$RemovedFromProjectEventFromJson(
          json);

  @override
  List<Object?> get props => [id, createdAt, actor, project, projectColumnName];
  @override
  Map<String, dynamic> toJson() =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$RemovedFromProjectEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$RenamedTitleEvent
    extends GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node
    with EquatableMixin, RenamedTitleMixin {
  GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$RenamedTitleEvent();

  factory GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$RenamedTitleEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$RenamedTitleEventFromJson(
          json);

  @override
  List<Object?> get props =>
      [id, createdAt, actor, previousTitle, currentTitle];
  @override
  Map<String, dynamic> toJson() =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$RenamedTitleEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$ReopenedEvent
    extends GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node
    with EquatableMixin, ReopenedMixin {
  GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$ReopenedEvent();

  factory GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$ReopenedEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$ReopenedEventFromJson(
          json);

  @override
  List<Object?> get props => [id, createdAt, actor];
  @override
  Map<String, dynamic> toJson() =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$ReopenedEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$ReviewDismissedEvent
    extends GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node
    with EquatableMixin, ReviewDismissedMixin {
  GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$ReviewDismissedEvent();

  factory GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$ReviewDismissedEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$ReviewDismissedEventFromJson(
          json);

  @override
  List<Object?> get props => [
        id,
        createdAt,
        actor,
        dismissalMessage,
        dismissalMessageHTML,
        previousReviewState
      ];
  @override
  Map<String, dynamic> toJson() =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$ReviewDismissedEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$ReviewRequestedEvent
    extends GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node
    with EquatableMixin, ReviewRequestedMixin {
  GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$ReviewRequestedEvent();

  factory GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$ReviewRequestedEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$ReviewRequestedEventFromJson(
          json);

  @override
  List<Object?> get props => [id, createdAt, actor, requestedReviewer];
  @override
  Map<String, dynamic> toJson() =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$ReviewRequestedEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$UnassignedEvent
    extends GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node
    with EquatableMixin, UnassignedMixin {
  GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$UnassignedEvent();

  factory GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$UnassignedEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$UnassignedEventFromJson(
          json);

  @override
  List<Object?> get props => [id, createdAt, actor, assignee];
  @override
  Map<String, dynamic> toJson() =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$UnassignedEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$UnlabeledEvent
    extends GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node
    with EquatableMixin, UnlabeledMixin {
  GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$UnlabeledEvent();

  factory GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$UnlabeledEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$UnlabeledEventFromJson(
          json);

  @override
  List<Object?> get props => [id, createdAt, actor, label];
  @override
  Map<String, dynamic> toJson() =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$UnlabeledEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$UnlockedEvent
    extends GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node
    with EquatableMixin, UnlockedMixin {
  GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$UnlockedEvent();

  factory GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$UnlockedEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$UnlockedEventFromJson(
          json);

  @override
  List<Object?> get props => [id, createdAt, actor];
  @override
  Map<String, dynamic> toJson() =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$UnlockedEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$UnmarkedAsDuplicateEvent
    extends GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node
    with EquatableMixin, UnmarkedAsDuplicateMixin {
  GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$UnmarkedAsDuplicateEvent();

  factory GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$UnmarkedAsDuplicateEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$UnmarkedAsDuplicateEventFromJson(
          json);

  @override
  List<Object?> get props =>
      [id, createdAt, actor, isCrossRepository, canonical];
  @override
  Map<String, dynamic> toJson() =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$UnmarkedAsDuplicateEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$UnpinnedEvent
    extends GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node
    with EquatableMixin, UnpinnedMixin {
  GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$UnpinnedEvent();

  factory GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$UnpinnedEvent.fromJson(
          Map<String, dynamic> json) =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$UnpinnedEventFromJson(
          json);

  @override
  List<Object?> get props => [id, createdAt, actor];
  @override
  Map<String, dynamic> toJson() =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$UnpinnedEventToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node
    extends JsonSerializable with EquatableMixin {
  GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node();

  factory GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node.fromJson(
      Map<String, dynamic> json) {
    switch (json['__typename'].toString()) {
      case r'AddedToProjectEvent':
        return GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$AddedToProjectEvent
            .fromJson(json);
      case r'AssignedEvent':
        return GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$AssignedEvent
            .fromJson(json);
      case r'BaseRefChangedEvent':
        return GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$BaseRefChangedEvent
            .fromJson(json);
      case r'BaseRefDeletedEvent':
        return GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$BaseRefDeletedEvent
            .fromJson(json);
      case r'BaseRefForcePushedEvent':
        return GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$BaseRefForcePushedEvent
            .fromJson(json);
      case r'ClosedEvent':
        return GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$ClosedEvent
            .fromJson(json);
      case r'ConvertToDraftEvent':
        return GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$ConvertToDraftEvent
            .fromJson(json);
      case r'CrossReferencedEvent':
        return GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$CrossReferencedEvent
            .fromJson(json);
      case r'DemilestonedEvent':
        return GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$DemilestonedEvent
            .fromJson(json);
      case r'HeadRefDeletedEvent':
        return GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$HeadRefDeletedEvent
            .fromJson(json);
      case r'HeadRefForcePushedEvent':
        return GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$HeadRefForcePushedEvent
            .fromJson(json);
      case r'HeadRefRestoredEvent':
        return GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$HeadRefRestoredEvent
            .fromJson(json);
      case r'IssueComment':
        return GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$IssueComment
            .fromJson(json);
      case r'LabeledEvent':
        return GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$LabeledEvent
            .fromJson(json);
      case r'LockedEvent':
        return GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$LockedEvent
            .fromJson(json);
      case r'MarkedAsDuplicateEvent':
        return GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$MarkedAsDuplicateEvent
            .fromJson(json);
      case r'MergedEvent':
        return GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$MergedEvent
            .fromJson(json);
      case r'MilestonedEvent':
        return GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$MilestonedEvent
            .fromJson(json);
      case r'MovedColumnsInProjectEvent':
        return GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$MovedColumnsInProjectEvent
            .fromJson(json);
      case r'PinnedEvent':
        return GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$PinnedEvent
            .fromJson(json);
      case r'PullRequestCommit':
        return GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$PullRequestCommit
            .fromJson(json);
      case r'PullRequestCommitCommentThread':
        return GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$PullRequestCommitCommentThread
            .fromJson(json);
      case r'PullRequestReview':
        return GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$PullRequestReview
            .fromJson(json);
      case r'PullRequestReviewThread':
        return GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$PullRequestReviewThread
            .fromJson(json);
      case r'ReadyForReviewEvent':
        return GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$ReadyForReviewEvent
            .fromJson(json);
      case r'RemovedFromProjectEvent':
        return GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$RemovedFromProjectEvent
            .fromJson(json);
      case r'RenamedTitleEvent':
        return GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$RenamedTitleEvent
            .fromJson(json);
      case r'ReopenedEvent':
        return GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$ReopenedEvent
            .fromJson(json);
      case r'ReviewDismissedEvent':
        return GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$ReviewDismissedEvent
            .fromJson(json);
      case r'ReviewRequestedEvent':
        return GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$ReviewRequestedEvent
            .fromJson(json);
      case r'UnassignedEvent':
        return GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$UnassignedEvent
            .fromJson(json);
      case r'UnlabeledEvent':
        return GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$UnlabeledEvent
            .fromJson(json);
      case r'UnlockedEvent':
        return GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$UnlockedEvent
            .fromJson(json);
      case r'UnmarkedAsDuplicateEvent':
        return GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$UnmarkedAsDuplicateEvent
            .fromJson(json);
      case r'UnpinnedEvent':
        return GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$UnpinnedEvent
            .fromJson(json);
      default:
    }
    return _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$NodeFromJson(
        json);
  }

  @JsonKey(name: '__typename')
  String? $$typename;

  @override
  List<Object?> get props => [$$typename];
  @override
  Map<String, dynamic> toJson() {
    switch ($$typename) {
      case r'AddedToProjectEvent':
        return (this
                as GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$AddedToProjectEvent)
            .toJson();
      case r'AssignedEvent':
        return (this
                as GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$AssignedEvent)
            .toJson();
      case r'BaseRefChangedEvent':
        return (this
                as GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$BaseRefChangedEvent)
            .toJson();
      case r'BaseRefDeletedEvent':
        return (this
                as GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$BaseRefDeletedEvent)
            .toJson();
      case r'BaseRefForcePushedEvent':
        return (this
                as GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$BaseRefForcePushedEvent)
            .toJson();
      case r'ClosedEvent':
        return (this
                as GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$ClosedEvent)
            .toJson();
      case r'ConvertToDraftEvent':
        return (this
                as GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$ConvertToDraftEvent)
            .toJson();
      case r'CrossReferencedEvent':
        return (this
                as GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$CrossReferencedEvent)
            .toJson();
      case r'DemilestonedEvent':
        return (this
                as GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$DemilestonedEvent)
            .toJson();
      case r'HeadRefDeletedEvent':
        return (this
                as GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$HeadRefDeletedEvent)
            .toJson();
      case r'HeadRefForcePushedEvent':
        return (this
                as GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$HeadRefForcePushedEvent)
            .toJson();
      case r'HeadRefRestoredEvent':
        return (this
                as GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$HeadRefRestoredEvent)
            .toJson();
      case r'IssueComment':
        return (this
                as GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$IssueComment)
            .toJson();
      case r'LabeledEvent':
        return (this
                as GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$LabeledEvent)
            .toJson();
      case r'LockedEvent':
        return (this
                as GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$LockedEvent)
            .toJson();
      case r'MarkedAsDuplicateEvent':
        return (this
                as GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$MarkedAsDuplicateEvent)
            .toJson();
      case r'MergedEvent':
        return (this
                as GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$MergedEvent)
            .toJson();
      case r'MilestonedEvent':
        return (this
                as GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$MilestonedEvent)
            .toJson();
      case r'MovedColumnsInProjectEvent':
        return (this
                as GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$MovedColumnsInProjectEvent)
            .toJson();
      case r'PinnedEvent':
        return (this
                as GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$PinnedEvent)
            .toJson();
      case r'PullRequestCommit':
        return (this
                as GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$PullRequestCommit)
            .toJson();
      case r'PullRequestCommitCommentThread':
        return (this
                as GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$PullRequestCommitCommentThread)
            .toJson();
      case r'PullRequestReview':
        return (this
                as GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$PullRequestReview)
            .toJson();
      case r'PullRequestReviewThread':
        return (this
                as GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$PullRequestReviewThread)
            .toJson();
      case r'ReadyForReviewEvent':
        return (this
                as GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$ReadyForReviewEvent)
            .toJson();
      case r'RemovedFromProjectEvent':
        return (this
                as GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$RemovedFromProjectEvent)
            .toJson();
      case r'RenamedTitleEvent':
        return (this
                as GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$RenamedTitleEvent)
            .toJson();
      case r'ReopenedEvent':
        return (this
                as GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$ReopenedEvent)
            .toJson();
      case r'ReviewDismissedEvent':
        return (this
                as GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$ReviewDismissedEvent)
            .toJson();
      case r'ReviewRequestedEvent':
        return (this
                as GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$ReviewRequestedEvent)
            .toJson();
      case r'UnassignedEvent':
        return (this
                as GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$UnassignedEvent)
            .toJson();
      case r'UnlabeledEvent':
        return (this
                as GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$UnlabeledEvent)
            .toJson();
      case r'UnlockedEvent':
        return (this
                as GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$UnlockedEvent)
            .toJson();
      case r'UnmarkedAsDuplicateEvent':
        return (this
                as GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$UnmarkedAsDuplicateEvent)
            .toJson();
      case r'UnpinnedEvent':
        return (this
                as GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node$UnpinnedEvent)
            .toJson();
      default:
    }
    return _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$NodeToJson(
        this);
  }
}

@JsonSerializable(explicitToJson: true)
class GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges
    extends JsonSerializable with EquatableMixin {
  GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges();

  factory GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges.fromJson(
          Map<String, dynamic> json) =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$EdgesFromJson(
          json);

  GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges$Node?
      node;

  late String cursor;

  @override
  List<Object?> get props => [node, cursor];
  @override
  Map<String, dynamic> toJson() =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$EdgesToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems
    extends JsonSerializable with EquatableMixin {
  GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems();

  factory GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems.fromJson(
          Map<String, dynamic> json) =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItemsFromJson(
          json);

  List<GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems$Edges?>?
      edges;

  @override
  List<Object?> get props => [edges];
  @override
  Map<String, dynamic> toJson() =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItemsToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest
    extends GetTimeline$Query$Repository$IssueOrPullRequest
    with EquatableMixin {
  GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest();

  factory GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest.fromJson(
          Map<String, dynamic> json) =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequestFromJson(
          json);

  late GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest$TimelineItems
      timelineItems;

  @override
  List<Object?> get props => [timelineItems];
  @override
  Map<String, dynamic> toJson() =>
      _$GetTimeline$Query$Repository$IssueOrPullRequest$PullRequestToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetTimeline$Query$Repository$IssueOrPullRequest extends JsonSerializable
    with EquatableMixin {
  GetTimeline$Query$Repository$IssueOrPullRequest();

  factory GetTimeline$Query$Repository$IssueOrPullRequest.fromJson(
      Map<String, dynamic> json) {
    switch (json['__typename'].toString()) {
      case r'Issue':
        return GetTimeline$Query$Repository$IssueOrPullRequest$Issue.fromJson(
            json);
      case r'PullRequest':
        return GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest
            .fromJson(json);
      default:
    }
    return _$GetTimeline$Query$Repository$IssueOrPullRequestFromJson(json);
  }

  @JsonKey(name: '__typename')
  String? $$typename;

  @override
  List<Object?> get props => [$$typename];
  @override
  Map<String, dynamic> toJson() {
    switch ($$typename) {
      case r'Issue':
        return (this as GetTimeline$Query$Repository$IssueOrPullRequest$Issue)
            .toJson();
      case r'PullRequest':
        return (this
                as GetTimeline$Query$Repository$IssueOrPullRequest$PullRequest)
            .toJson();
      default:
    }
    return _$GetTimeline$Query$Repository$IssueOrPullRequestToJson(this);
  }
}

@JsonSerializable(explicitToJson: true)
class GetTimeline$Query$Repository extends JsonSerializable
    with EquatableMixin {
  GetTimeline$Query$Repository();

  factory GetTimeline$Query$Repository.fromJson(Map<String, dynamic> json) =>
      _$GetTimeline$Query$RepositoryFromJson(json);

  GetTimeline$Query$Repository$IssueOrPullRequest? issueOrPullRequest;

  @override
  List<Object?> get props => [issueOrPullRequest];
  @override
  Map<String, dynamic> toJson() => _$GetTimeline$Query$RepositoryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetTimeline$Query extends JsonSerializable with EquatableMixin {
  GetTimeline$Query();

  factory GetTimeline$Query.fromJson(Map<String, dynamic> json) =>
      _$GetTimeline$QueryFromJson(json);

  GetTimeline$Query$Repository? repository;

  @override
  List<Object?> get props => [repository];
  @override
  Map<String, dynamic> toJson() => _$GetTimeline$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AddedToProjectMixin$Actor extends JsonSerializable
    with EquatableMixin, ActorMixin {
  AddedToProjectMixin$Actor();

  factory AddedToProjectMixin$Actor.fromJson(Map<String, dynamic> json) =>
      _$AddedToProjectMixin$ActorFromJson(json);

  @override
  List<Object?> get props => [avatarUrl, login];
  @override
  Map<String, dynamic> toJson() => _$AddedToProjectMixin$ActorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AddedToProjectMixin$Project extends JsonSerializable with EquatableMixin {
  AddedToProjectMixin$Project();

  factory AddedToProjectMixin$Project.fromJson(Map<String, dynamic> json) =>
      _$AddedToProjectMixin$ProjectFromJson(json);

  late String name;

  @override
  List<Object?> get props => [name];
  @override
  Map<String, dynamic> toJson() => _$AddedToProjectMixin$ProjectToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AssignedMixin$Actor extends JsonSerializable
    with EquatableMixin, ActorMixin {
  AssignedMixin$Actor();

  factory AssignedMixin$Actor.fromJson(Map<String, dynamic> json) =>
      _$AssignedMixin$ActorFromJson(json);

  @override
  List<Object?> get props => [avatarUrl, login];
  @override
  Map<String, dynamic> toJson() => _$AssignedMixin$ActorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AssignedMixin$Assignee$User extends AssignedMixin$Assignee
    with EquatableMixin, ActorMixin {
  AssignedMixin$Assignee$User();

  factory AssignedMixin$Assignee$User.fromJson(Map<String, dynamic> json) =>
      _$AssignedMixin$Assignee$UserFromJson(json);

  @override
  List<Object?> get props => [avatarUrl, login];
  @override
  Map<String, dynamic> toJson() => _$AssignedMixin$Assignee$UserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AssignedMixin$Assignee$Bot extends AssignedMixin$Assignee
    with EquatableMixin, ActorMixin {
  AssignedMixin$Assignee$Bot();

  factory AssignedMixin$Assignee$Bot.fromJson(Map<String, dynamic> json) =>
      _$AssignedMixin$Assignee$BotFromJson(json);

  @override
  List<Object?> get props => [avatarUrl, login];
  @override
  Map<String, dynamic> toJson() => _$AssignedMixin$Assignee$BotToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AssignedMixin$Assignee$Mannequin extends AssignedMixin$Assignee
    with EquatableMixin, ActorMixin {
  AssignedMixin$Assignee$Mannequin();

  factory AssignedMixin$Assignee$Mannequin.fromJson(
          Map<String, dynamic> json) =>
      _$AssignedMixin$Assignee$MannequinFromJson(json);

  @override
  List<Object?> get props => [avatarUrl, login];
  @override
  Map<String, dynamic> toJson() =>
      _$AssignedMixin$Assignee$MannequinToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AssignedMixin$Assignee$Organization extends AssignedMixin$Assignee
    with EquatableMixin, ActorMixin {
  AssignedMixin$Assignee$Organization();

  factory AssignedMixin$Assignee$Organization.fromJson(
          Map<String, dynamic> json) =>
      _$AssignedMixin$Assignee$OrganizationFromJson(json);

  @override
  List<Object?> get props => [avatarUrl, login];
  @override
  Map<String, dynamic> toJson() =>
      _$AssignedMixin$Assignee$OrganizationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AssignedMixin$Assignee extends JsonSerializable with EquatableMixin {
  AssignedMixin$Assignee();

  factory AssignedMixin$Assignee.fromJson(Map<String, dynamic> json) {
    switch (json['__typename'].toString()) {
      case r'User':
        return AssignedMixin$Assignee$User.fromJson(json);
      case r'Bot':
        return AssignedMixin$Assignee$Bot.fromJson(json);
      case r'Mannequin':
        return AssignedMixin$Assignee$Mannequin.fromJson(json);
      case r'Organization':
        return AssignedMixin$Assignee$Organization.fromJson(json);
      default:
    }
    return _$AssignedMixin$AssigneeFromJson(json);
  }

  @JsonKey(name: '__typename')
  String? $$typename;

  @override
  List<Object?> get props => [$$typename];
  @override
  Map<String, dynamic> toJson() {
    switch ($$typename) {
      case r'User':
        return (this as AssignedMixin$Assignee$User).toJson();
      case r'Bot':
        return (this as AssignedMixin$Assignee$Bot).toJson();
      case r'Mannequin':
        return (this as AssignedMixin$Assignee$Mannequin).toJson();
      case r'Organization':
        return (this as AssignedMixin$Assignee$Organization).toJson();
      default:
    }
    return _$AssignedMixin$AssigneeToJson(this);
  }
}

@JsonSerializable(explicitToJson: true)
class ClosedMixin$Actor extends JsonSerializable
    with EquatableMixin, ActorMixin {
  ClosedMixin$Actor();

  factory ClosedMixin$Actor.fromJson(Map<String, dynamic> json) =>
      _$ClosedMixin$ActorFromJson(json);

  @override
  List<Object?> get props => [avatarUrl, login];
  @override
  Map<String, dynamic> toJson() => _$ClosedMixin$ActorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CrossReferenceMixin$Actor extends JsonSerializable
    with EquatableMixin, ActorMixin {
  CrossReferenceMixin$Actor();

  factory CrossReferenceMixin$Actor.fromJson(Map<String, dynamic> json) =>
      _$CrossReferenceMixin$ActorFromJson(json);

  @override
  List<Object?> get props => [avatarUrl, login];
  @override
  Map<String, dynamic> toJson() => _$CrossReferenceMixin$ActorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CrossReferenceMixin$Source$Issue extends CrossReferenceMixin$Source
    with EquatableMixin, IssueMixin {
  CrossReferenceMixin$Source$Issue();

  factory CrossReferenceMixin$Source$Issue.fromJson(
          Map<String, dynamic> json) =>
      _$CrossReferenceMixin$Source$IssueFromJson(json);

  @override
  List<Object?> get props => [url, title, number, issueState, repository];
  @override
  Map<String, dynamic> toJson() =>
      _$CrossReferenceMixin$Source$IssueToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CrossReferenceMixin$Source$PullRequest extends CrossReferenceMixin$Source
    with EquatableMixin, PullRequestMixin {
  CrossReferenceMixin$Source$PullRequest();

  factory CrossReferenceMixin$Source$PullRequest.fromJson(
          Map<String, dynamic> json) =>
      _$CrossReferenceMixin$Source$PullRequestFromJson(json);

  @override
  List<Object?> get props => [url, title, number, pullState, repository];
  @override
  Map<String, dynamic> toJson() =>
      _$CrossReferenceMixin$Source$PullRequestToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CrossReferenceMixin$Source extends JsonSerializable with EquatableMixin {
  CrossReferenceMixin$Source();

  factory CrossReferenceMixin$Source.fromJson(Map<String, dynamic> json) {
    switch (json['__typename'].toString()) {
      case r'Issue':
        return CrossReferenceMixin$Source$Issue.fromJson(json);
      case r'PullRequest':
        return CrossReferenceMixin$Source$PullRequest.fromJson(json);
      default:
    }
    return _$CrossReferenceMixin$SourceFromJson(json);
  }

  @JsonKey(name: '__typename')
  String? $$typename;

  @override
  List<Object?> get props => [$$typename];
  @override
  Map<String, dynamic> toJson() {
    switch ($$typename) {
      case r'Issue':
        return (this as CrossReferenceMixin$Source$Issue).toJson();
      case r'PullRequest':
        return (this as CrossReferenceMixin$Source$PullRequest).toJson();
      default:
    }
    return _$CrossReferenceMixin$SourceToJson(this);
  }
}

@JsonSerializable(explicitToJson: true)
class PullRequestMixin$Repository extends JsonSerializable with EquatableMixin {
  PullRequestMixin$Repository();

  factory PullRequestMixin$Repository.fromJson(Map<String, dynamic> json) =>
      _$PullRequestMixin$RepositoryFromJson(json);

  late String name;

  late String nameWithOwner;

  @override
  List<Object?> get props => [name, nameWithOwner];
  @override
  Map<String, dynamic> toJson() => _$PullRequestMixin$RepositoryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DeMileStonedMixin$Actor extends JsonSerializable
    with EquatableMixin, ActorMixin {
  DeMileStonedMixin$Actor();

  factory DeMileStonedMixin$Actor.fromJson(Map<String, dynamic> json) =>
      _$DeMileStonedMixin$ActorFromJson(json);

  @override
  List<Object?> get props => [avatarUrl, login];
  @override
  Map<String, dynamic> toJson() => _$DeMileStonedMixin$ActorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class IssueCommentMixin$Author extends JsonSerializable
    with EquatableMixin, ActorMixin {
  IssueCommentMixin$Author();

  factory IssueCommentMixin$Author.fromJson(Map<String, dynamic> json) =>
      _$IssueCommentMixin$AuthorFromJson(json);

  @override
  List<Object?> get props => [avatarUrl, login];
  @override
  Map<String, dynamic> toJson() => _$IssueCommentMixin$AuthorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class IssueCommentMixin$ReactionGroups extends JsonSerializable
    with EquatableMixin, ReactionGroupsMixin {
  IssueCommentMixin$ReactionGroups();

  factory IssueCommentMixin$ReactionGroups.fromJson(
          Map<String, dynamic> json) =>
      _$IssueCommentMixin$ReactionGroupsFromJson(json);

  @override
  List<Object?> get props => [content, viewerHasReacted, reactors, subject];
  @override
  Map<String, dynamic> toJson() =>
      _$IssueCommentMixin$ReactionGroupsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ReactionGroupsMixin$Reactors extends JsonSerializable
    with EquatableMixin {
  ReactionGroupsMixin$Reactors();

  factory ReactionGroupsMixin$Reactors.fromJson(Map<String, dynamic> json) =>
      _$ReactionGroupsMixin$ReactorsFromJson(json);

  late int totalCount;

  @override
  List<Object?> get props => [totalCount];
  @override
  Map<String, dynamic> toJson() => _$ReactionGroupsMixin$ReactorsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ReactionGroupsMixin$Subject extends JsonSerializable with EquatableMixin {
  ReactionGroupsMixin$Subject();

  factory ReactionGroupsMixin$Subject.fromJson(Map<String, dynamic> json) =>
      _$ReactionGroupsMixin$SubjectFromJson(json);

  late String id;

  @override
  List<Object?> get props => [id];
  @override
  Map<String, dynamic> toJson() => _$ReactionGroupsMixin$SubjectToJson(this);
}

@JsonSerializable(explicitToJson: true)
class LabeledMixin$Actor extends JsonSerializable
    with EquatableMixin, ActorMixin {
  LabeledMixin$Actor();

  factory LabeledMixin$Actor.fromJson(Map<String, dynamic> json) =>
      _$LabeledMixin$ActorFromJson(json);

  @override
  List<Object?> get props => [avatarUrl, login];
  @override
  Map<String, dynamic> toJson() => _$LabeledMixin$ActorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class LabeledMixin$Label extends JsonSerializable
    with EquatableMixin, LabelMixin {
  LabeledMixin$Label();

  factory LabeledMixin$Label.fromJson(Map<String, dynamic> json) =>
      _$LabeledMixin$LabelFromJson(json);

  @override
  List<Object?> get props => [color, name];
  @override
  Map<String, dynamic> toJson() => _$LabeledMixin$LabelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class LockedMixin$Actor extends JsonSerializable
    with EquatableMixin, ActorMixin {
  LockedMixin$Actor();

  factory LockedMixin$Actor.fromJson(Map<String, dynamic> json) =>
      _$LockedMixin$ActorFromJson(json);

  @override
  List<Object?> get props => [avatarUrl, login];
  @override
  Map<String, dynamic> toJson() => _$LockedMixin$ActorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class MarkedAsDuplicateMixin$Actor extends JsonSerializable
    with EquatableMixin, ActorMixin {
  MarkedAsDuplicateMixin$Actor();

  factory MarkedAsDuplicateMixin$Actor.fromJson(Map<String, dynamic> json) =>
      _$MarkedAsDuplicateMixin$ActorFromJson(json);

  @override
  List<Object?> get props => [avatarUrl, login];
  @override
  Map<String, dynamic> toJson() => _$MarkedAsDuplicateMixin$ActorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class MarkedAsDuplicateMixin$Canonical$Issue
    extends MarkedAsDuplicateMixin$Canonical with EquatableMixin, IssueMixin {
  MarkedAsDuplicateMixin$Canonical$Issue();

  factory MarkedAsDuplicateMixin$Canonical$Issue.fromJson(
          Map<String, dynamic> json) =>
      _$MarkedAsDuplicateMixin$Canonical$IssueFromJson(json);

  @override
  List<Object?> get props => [url, title, number, issueState, repository];
  @override
  Map<String, dynamic> toJson() =>
      _$MarkedAsDuplicateMixin$Canonical$IssueToJson(this);
}

@JsonSerializable(explicitToJson: true)
class MarkedAsDuplicateMixin$Canonical$PullRequest
    extends MarkedAsDuplicateMixin$Canonical
    with EquatableMixin, PullRequestMixin {
  MarkedAsDuplicateMixin$Canonical$PullRequest();

  factory MarkedAsDuplicateMixin$Canonical$PullRequest.fromJson(
          Map<String, dynamic> json) =>
      _$MarkedAsDuplicateMixin$Canonical$PullRequestFromJson(json);

  @override
  List<Object?> get props => [url, title, number, pullState, repository];
  @override
  Map<String, dynamic> toJson() =>
      _$MarkedAsDuplicateMixin$Canonical$PullRequestToJson(this);
}

@JsonSerializable(explicitToJson: true)
class MarkedAsDuplicateMixin$Canonical extends JsonSerializable
    with EquatableMixin {
  MarkedAsDuplicateMixin$Canonical();

  factory MarkedAsDuplicateMixin$Canonical.fromJson(Map<String, dynamic> json) {
    switch (json['__typename'].toString()) {
      case r'Issue':
        return MarkedAsDuplicateMixin$Canonical$Issue.fromJson(json);
      case r'PullRequest':
        return MarkedAsDuplicateMixin$Canonical$PullRequest.fromJson(json);
      default:
    }
    return _$MarkedAsDuplicateMixin$CanonicalFromJson(json);
  }

  @JsonKey(name: '__typename')
  String? $$typename;

  @override
  List<Object?> get props => [$$typename];
  @override
  Map<String, dynamic> toJson() {
    switch ($$typename) {
      case r'Issue':
        return (this as MarkedAsDuplicateMixin$Canonical$Issue).toJson();
      case r'PullRequest':
        return (this as MarkedAsDuplicateMixin$Canonical$PullRequest).toJson();
      default:
    }
    return _$MarkedAsDuplicateMixin$CanonicalToJson(this);
  }
}

@JsonSerializable(explicitToJson: true)
class MileStonedMixin$Actor extends JsonSerializable
    with EquatableMixin, ActorMixin {
  MileStonedMixin$Actor();

  factory MileStonedMixin$Actor.fromJson(Map<String, dynamic> json) =>
      _$MileStonedMixin$ActorFromJson(json);

  @override
  List<Object?> get props => [avatarUrl, login];
  @override
  Map<String, dynamic> toJson() => _$MileStonedMixin$ActorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class MovedColumnsInProjectMixin$Actor extends JsonSerializable
    with EquatableMixin, ActorMixin {
  MovedColumnsInProjectMixin$Actor();

  factory MovedColumnsInProjectMixin$Actor.fromJson(
          Map<String, dynamic> json) =>
      _$MovedColumnsInProjectMixin$ActorFromJson(json);

  @override
  List<Object?> get props => [avatarUrl, login];
  @override
  Map<String, dynamic> toJson() =>
      _$MovedColumnsInProjectMixin$ActorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class MovedColumnsInProjectMixin$Project extends JsonSerializable
    with EquatableMixin {
  MovedColumnsInProjectMixin$Project();

  factory MovedColumnsInProjectMixin$Project.fromJson(
          Map<String, dynamic> json) =>
      _$MovedColumnsInProjectMixin$ProjectFromJson(json);

  late String name;

  @override
  List<Object?> get props => [name];
  @override
  Map<String, dynamic> toJson() =>
      _$MovedColumnsInProjectMixin$ProjectToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PinnedMixin$Actor extends JsonSerializable
    with EquatableMixin, ActorMixin {
  PinnedMixin$Actor();

  factory PinnedMixin$Actor.fromJson(Map<String, dynamic> json) =>
      _$PinnedMixin$ActorFromJson(json);

  @override
  List<Object?> get props => [avatarUrl, login];
  @override
  Map<String, dynamic> toJson() => _$PinnedMixin$ActorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RemovedFromProjectMixin$Actor extends JsonSerializable
    with EquatableMixin, ActorMixin {
  RemovedFromProjectMixin$Actor();

  factory RemovedFromProjectMixin$Actor.fromJson(Map<String, dynamic> json) =>
      _$RemovedFromProjectMixin$ActorFromJson(json);

  @override
  List<Object?> get props => [avatarUrl, login];
  @override
  Map<String, dynamic> toJson() => _$RemovedFromProjectMixin$ActorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RemovedFromProjectMixin$Project extends JsonSerializable
    with EquatableMixin {
  RemovedFromProjectMixin$Project();

  factory RemovedFromProjectMixin$Project.fromJson(Map<String, dynamic> json) =>
      _$RemovedFromProjectMixin$ProjectFromJson(json);

  late String name;

  @override
  List<Object?> get props => [name];
  @override
  Map<String, dynamic> toJson() =>
      _$RemovedFromProjectMixin$ProjectToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RenamedTitleMixin$Actor extends JsonSerializable
    with EquatableMixin, ActorMixin {
  RenamedTitleMixin$Actor();

  factory RenamedTitleMixin$Actor.fromJson(Map<String, dynamic> json) =>
      _$RenamedTitleMixin$ActorFromJson(json);

  @override
  List<Object?> get props => [avatarUrl, login];
  @override
  Map<String, dynamic> toJson() => _$RenamedTitleMixin$ActorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ReopenedMixin$Actor extends JsonSerializable
    with EquatableMixin, ActorMixin {
  ReopenedMixin$Actor();

  factory ReopenedMixin$Actor.fromJson(Map<String, dynamic> json) =>
      _$ReopenedMixin$ActorFromJson(json);

  @override
  List<Object?> get props => [avatarUrl, login];
  @override
  Map<String, dynamic> toJson() => _$ReopenedMixin$ActorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UnassignedMixin$Actor extends JsonSerializable
    with EquatableMixin, ActorMixin {
  UnassignedMixin$Actor();

  factory UnassignedMixin$Actor.fromJson(Map<String, dynamic> json) =>
      _$UnassignedMixin$ActorFromJson(json);

  @override
  List<Object?> get props => [avatarUrl, login];
  @override
  Map<String, dynamic> toJson() => _$UnassignedMixin$ActorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UnassignedMixin$Assignee$User extends UnassignedMixin$Assignee
    with EquatableMixin, ActorMixin {
  UnassignedMixin$Assignee$User();

  factory UnassignedMixin$Assignee$User.fromJson(Map<String, dynamic> json) =>
      _$UnassignedMixin$Assignee$UserFromJson(json);

  @override
  List<Object?> get props => [avatarUrl, login];
  @override
  Map<String, dynamic> toJson() => _$UnassignedMixin$Assignee$UserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UnassignedMixin$Assignee$Bot extends UnassignedMixin$Assignee
    with EquatableMixin, ActorMixin {
  UnassignedMixin$Assignee$Bot();

  factory UnassignedMixin$Assignee$Bot.fromJson(Map<String, dynamic> json) =>
      _$UnassignedMixin$Assignee$BotFromJson(json);

  @override
  List<Object?> get props => [avatarUrl, login];
  @override
  Map<String, dynamic> toJson() => _$UnassignedMixin$Assignee$BotToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UnassignedMixin$Assignee$Mannequin extends UnassignedMixin$Assignee
    with EquatableMixin, ActorMixin {
  UnassignedMixin$Assignee$Mannequin();

  factory UnassignedMixin$Assignee$Mannequin.fromJson(
          Map<String, dynamic> json) =>
      _$UnassignedMixin$Assignee$MannequinFromJson(json);

  @override
  List<Object?> get props => [avatarUrl, login];
  @override
  Map<String, dynamic> toJson() =>
      _$UnassignedMixin$Assignee$MannequinToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UnassignedMixin$Assignee$Organization extends UnassignedMixin$Assignee
    with EquatableMixin, ActorMixin {
  UnassignedMixin$Assignee$Organization();

  factory UnassignedMixin$Assignee$Organization.fromJson(
          Map<String, dynamic> json) =>
      _$UnassignedMixin$Assignee$OrganizationFromJson(json);

  @override
  List<Object?> get props => [avatarUrl, login];
  @override
  Map<String, dynamic> toJson() =>
      _$UnassignedMixin$Assignee$OrganizationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UnassignedMixin$Assignee extends JsonSerializable with EquatableMixin {
  UnassignedMixin$Assignee();

  factory UnassignedMixin$Assignee.fromJson(Map<String, dynamic> json) {
    switch (json['__typename'].toString()) {
      case r'User':
        return UnassignedMixin$Assignee$User.fromJson(json);
      case r'Bot':
        return UnassignedMixin$Assignee$Bot.fromJson(json);
      case r'Mannequin':
        return UnassignedMixin$Assignee$Mannequin.fromJson(json);
      case r'Organization':
        return UnassignedMixin$Assignee$Organization.fromJson(json);
      default:
    }
    return _$UnassignedMixin$AssigneeFromJson(json);
  }

  @JsonKey(name: '__typename')
  String? $$typename;

  @override
  List<Object?> get props => [$$typename];
  @override
  Map<String, dynamic> toJson() {
    switch ($$typename) {
      case r'User':
        return (this as UnassignedMixin$Assignee$User).toJson();
      case r'Bot':
        return (this as UnassignedMixin$Assignee$Bot).toJson();
      case r'Mannequin':
        return (this as UnassignedMixin$Assignee$Mannequin).toJson();
      case r'Organization':
        return (this as UnassignedMixin$Assignee$Organization).toJson();
      default:
    }
    return _$UnassignedMixin$AssigneeToJson(this);
  }
}

@JsonSerializable(explicitToJson: true)
class UnlabeledMixin$Actor extends JsonSerializable
    with EquatableMixin, ActorMixin {
  UnlabeledMixin$Actor();

  factory UnlabeledMixin$Actor.fromJson(Map<String, dynamic> json) =>
      _$UnlabeledMixin$ActorFromJson(json);

  @override
  List<Object?> get props => [avatarUrl, login];
  @override
  Map<String, dynamic> toJson() => _$UnlabeledMixin$ActorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UnlabeledMixin$Label extends JsonSerializable
    with EquatableMixin, LabelMixin {
  UnlabeledMixin$Label();

  factory UnlabeledMixin$Label.fromJson(Map<String, dynamic> json) =>
      _$UnlabeledMixin$LabelFromJson(json);

  @override
  List<Object?> get props => [color, name];
  @override
  Map<String, dynamic> toJson() => _$UnlabeledMixin$LabelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UnlockedMixin$Actor extends JsonSerializable
    with EquatableMixin, ActorMixin {
  UnlockedMixin$Actor();

  factory UnlockedMixin$Actor.fromJson(Map<String, dynamic> json) =>
      _$UnlockedMixin$ActorFromJson(json);

  @override
  List<Object?> get props => [avatarUrl, login];
  @override
  Map<String, dynamic> toJson() => _$UnlockedMixin$ActorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UnmarkedAsDuplicateMixin$Actor extends JsonSerializable
    with EquatableMixin, ActorMixin {
  UnmarkedAsDuplicateMixin$Actor();

  factory UnmarkedAsDuplicateMixin$Actor.fromJson(Map<String, dynamic> json) =>
      _$UnmarkedAsDuplicateMixin$ActorFromJson(json);

  @override
  List<Object?> get props => [avatarUrl, login];
  @override
  Map<String, dynamic> toJson() => _$UnmarkedAsDuplicateMixin$ActorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UnmarkedAsDuplicateMixin$Canonical$Issue
    extends UnmarkedAsDuplicateMixin$Canonical with EquatableMixin, IssueMixin {
  UnmarkedAsDuplicateMixin$Canonical$Issue();

  factory UnmarkedAsDuplicateMixin$Canonical$Issue.fromJson(
          Map<String, dynamic> json) =>
      _$UnmarkedAsDuplicateMixin$Canonical$IssueFromJson(json);

  @override
  List<Object?> get props => [url, title, number, issueState, repository];
  @override
  Map<String, dynamic> toJson() =>
      _$UnmarkedAsDuplicateMixin$Canonical$IssueToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UnmarkedAsDuplicateMixin$Canonical$PullRequest
    extends UnmarkedAsDuplicateMixin$Canonical
    with EquatableMixin, PullRequestMixin {
  UnmarkedAsDuplicateMixin$Canonical$PullRequest();

  factory UnmarkedAsDuplicateMixin$Canonical$PullRequest.fromJson(
          Map<String, dynamic> json) =>
      _$UnmarkedAsDuplicateMixin$Canonical$PullRequestFromJson(json);

  @override
  List<Object?> get props => [url, title, number, pullState, repository];
  @override
  Map<String, dynamic> toJson() =>
      _$UnmarkedAsDuplicateMixin$Canonical$PullRequestToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UnmarkedAsDuplicateMixin$Canonical extends JsonSerializable
    with EquatableMixin {
  UnmarkedAsDuplicateMixin$Canonical();

  factory UnmarkedAsDuplicateMixin$Canonical.fromJson(
      Map<String, dynamic> json) {
    switch (json['__typename'].toString()) {
      case r'Issue':
        return UnmarkedAsDuplicateMixin$Canonical$Issue.fromJson(json);
      case r'PullRequest':
        return UnmarkedAsDuplicateMixin$Canonical$PullRequest.fromJson(json);
      default:
    }
    return _$UnmarkedAsDuplicateMixin$CanonicalFromJson(json);
  }

  @JsonKey(name: '__typename')
  String? $$typename;

  @override
  List<Object?> get props => [$$typename];
  @override
  Map<String, dynamic> toJson() {
    switch ($$typename) {
      case r'Issue':
        return (this as UnmarkedAsDuplicateMixin$Canonical$Issue).toJson();
      case r'PullRequest':
        return (this as UnmarkedAsDuplicateMixin$Canonical$PullRequest)
            .toJson();
      default:
    }
    return _$UnmarkedAsDuplicateMixin$CanonicalToJson(this);
  }
}

@JsonSerializable(explicitToJson: true)
class UnpinnedMixin$Actor extends JsonSerializable
    with EquatableMixin, ActorMixin {
  UnpinnedMixin$Actor();

  factory UnpinnedMixin$Actor.fromJson(Map<String, dynamic> json) =>
      _$UnpinnedMixin$ActorFromJson(json);

  @override
  List<Object?> get props => [avatarUrl, login];
  @override
  Map<String, dynamic> toJson() => _$UnpinnedMixin$ActorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class BaseRefChangedMixin$Actor extends JsonSerializable
    with EquatableMixin, ActorMixin {
  BaseRefChangedMixin$Actor();

  factory BaseRefChangedMixin$Actor.fromJson(Map<String, dynamic> json) =>
      _$BaseRefChangedMixin$ActorFromJson(json);

  @override
  List<Object?> get props => [avatarUrl, login];
  @override
  Map<String, dynamic> toJson() => _$BaseRefChangedMixin$ActorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class BaseRefDeletedMixin$Actor extends JsonSerializable
    with EquatableMixin, ActorMixin {
  BaseRefDeletedMixin$Actor();

  factory BaseRefDeletedMixin$Actor.fromJson(Map<String, dynamic> json) =>
      _$BaseRefDeletedMixin$ActorFromJson(json);

  @override
  List<Object?> get props => [avatarUrl, login];
  @override
  Map<String, dynamic> toJson() => _$BaseRefDeletedMixin$ActorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class BaseRefForcePushedMixin$BeforeCommit extends JsonSerializable
    with EquatableMixin {
  BaseRefForcePushedMixin$BeforeCommit();

  factory BaseRefForcePushedMixin$BeforeCommit.fromJson(
          Map<String, dynamic> json) =>
      _$BaseRefForcePushedMixin$BeforeCommitFromJson(json);

  late String abbreviatedOid;

  late Uri url;

  @override
  List<Object?> get props => [abbreviatedOid, url];
  @override
  Map<String, dynamic> toJson() =>
      _$BaseRefForcePushedMixin$BeforeCommitToJson(this);
}

@JsonSerializable(explicitToJson: true)
class BaseRefForcePushedMixin$AfterCommit extends JsonSerializable
    with EquatableMixin {
  BaseRefForcePushedMixin$AfterCommit();

  factory BaseRefForcePushedMixin$AfterCommit.fromJson(
          Map<String, dynamic> json) =>
      _$BaseRefForcePushedMixin$AfterCommitFromJson(json);

  late Uri url;

  late String abbreviatedOid;

  @override
  List<Object?> get props => [url, abbreviatedOid];
  @override
  Map<String, dynamic> toJson() =>
      _$BaseRefForcePushedMixin$AfterCommitToJson(this);
}

@JsonSerializable(explicitToJson: true)
class BaseRefForcePushedMixin$Ref extends JsonSerializable with EquatableMixin {
  BaseRefForcePushedMixin$Ref();

  factory BaseRefForcePushedMixin$Ref.fromJson(Map<String, dynamic> json) =>
      _$BaseRefForcePushedMixin$RefFromJson(json);

  late String name;

  @override
  List<Object?> get props => [name];
  @override
  Map<String, dynamic> toJson() => _$BaseRefForcePushedMixin$RefToJson(this);
}

@JsonSerializable(explicitToJson: true)
class BaseRefForcePushedMixin$Actor extends JsonSerializable
    with EquatableMixin, ActorMixin {
  BaseRefForcePushedMixin$Actor();

  factory BaseRefForcePushedMixin$Actor.fromJson(Map<String, dynamic> json) =>
      _$BaseRefForcePushedMixin$ActorFromJson(json);

  @override
  List<Object?> get props => [avatarUrl, login];
  @override
  Map<String, dynamic> toJson() => _$BaseRefForcePushedMixin$ActorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ConvertedToDraftMixin$Actor extends JsonSerializable
    with EquatableMixin, ActorMixin {
  ConvertedToDraftMixin$Actor();

  factory ConvertedToDraftMixin$Actor.fromJson(Map<String, dynamic> json) =>
      _$ConvertedToDraftMixin$ActorFromJson(json);

  @override
  List<Object?> get props => [avatarUrl, login];
  @override
  Map<String, dynamic> toJson() => _$ConvertedToDraftMixin$ActorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class HeadRefDeletedMixin$Actor extends JsonSerializable
    with EquatableMixin, ActorMixin {
  HeadRefDeletedMixin$Actor();

  factory HeadRefDeletedMixin$Actor.fromJson(Map<String, dynamic> json) =>
      _$HeadRefDeletedMixin$ActorFromJson(json);

  @override
  List<Object?> get props => [avatarUrl, login];
  @override
  Map<String, dynamic> toJson() => _$HeadRefDeletedMixin$ActorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class HeadRefForcePushedMixin$BeforeCommit extends JsonSerializable
    with EquatableMixin {
  HeadRefForcePushedMixin$BeforeCommit();

  factory HeadRefForcePushedMixin$BeforeCommit.fromJson(
          Map<String, dynamic> json) =>
      _$HeadRefForcePushedMixin$BeforeCommitFromJson(json);

  late String abbreviatedOid;

  late Uri url;

  @override
  List<Object?> get props => [abbreviatedOid, url];
  @override
  Map<String, dynamic> toJson() =>
      _$HeadRefForcePushedMixin$BeforeCommitToJson(this);
}

@JsonSerializable(explicitToJson: true)
class HeadRefForcePushedMixin$AfterCommit extends JsonSerializable
    with EquatableMixin {
  HeadRefForcePushedMixin$AfterCommit();

  factory HeadRefForcePushedMixin$AfterCommit.fromJson(
          Map<String, dynamic> json) =>
      _$HeadRefForcePushedMixin$AfterCommitFromJson(json);

  late Uri url;

  late String abbreviatedOid;

  @override
  List<Object?> get props => [url, abbreviatedOid];
  @override
  Map<String, dynamic> toJson() =>
      _$HeadRefForcePushedMixin$AfterCommitToJson(this);
}

@JsonSerializable(explicitToJson: true)
class HeadRefForcePushedMixin$Ref extends JsonSerializable with EquatableMixin {
  HeadRefForcePushedMixin$Ref();

  factory HeadRefForcePushedMixin$Ref.fromJson(Map<String, dynamic> json) =>
      _$HeadRefForcePushedMixin$RefFromJson(json);

  late String name;

  @override
  List<Object?> get props => [name];
  @override
  Map<String, dynamic> toJson() => _$HeadRefForcePushedMixin$RefToJson(this);
}

@JsonSerializable(explicitToJson: true)
class HeadRefForcePushedMixin$Actor extends JsonSerializable
    with EquatableMixin, ActorMixin {
  HeadRefForcePushedMixin$Actor();

  factory HeadRefForcePushedMixin$Actor.fromJson(Map<String, dynamic> json) =>
      _$HeadRefForcePushedMixin$ActorFromJson(json);

  @override
  List<Object?> get props => [avatarUrl, login];
  @override
  Map<String, dynamic> toJson() => _$HeadRefForcePushedMixin$ActorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class HeadRefRestoredMixin$Actor extends JsonSerializable
    with EquatableMixin, ActorMixin {
  HeadRefRestoredMixin$Actor();

  factory HeadRefRestoredMixin$Actor.fromJson(Map<String, dynamic> json) =>
      _$HeadRefRestoredMixin$ActorFromJson(json);

  @override
  List<Object?> get props => [avatarUrl, login];
  @override
  Map<String, dynamic> toJson() => _$HeadRefRestoredMixin$ActorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class MergedMixin$Actor extends JsonSerializable
    with EquatableMixin, ActorMixin {
  MergedMixin$Actor();

  factory MergedMixin$Actor.fromJson(Map<String, dynamic> json) =>
      _$MergedMixin$ActorFromJson(json);

  @override
  List<Object?> get props => [avatarUrl, login];
  @override
  Map<String, dynamic> toJson() => _$MergedMixin$ActorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PullRequestCommitMixin$Commit extends JsonSerializable
    with EquatableMixin, CommitMixin {
  PullRequestCommitMixin$Commit();

  factory PullRequestCommitMixin$Commit.fromJson(Map<String, dynamic> json) =>
      _$PullRequestCommitMixin$CommitFromJson(json);

  @override
  List<Object?> get props => [
        additions,
        authoredDate,
        oid,
        message,
        commitUrl,
        messageHeadline,
        author
      ];
  @override
  Map<String, dynamic> toJson() => _$PullRequestCommitMixin$CommitToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CommitMixin$Author$User extends JsonSerializable
    with EquatableMixin, ActorMixin {
  CommitMixin$Author$User();

  factory CommitMixin$Author$User.fromJson(Map<String, dynamic> json) =>
      _$CommitMixin$Author$UserFromJson(json);

  @override
  List<Object?> get props => [avatarUrl, login];
  @override
  Map<String, dynamic> toJson() => _$CommitMixin$Author$UserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CommitMixin$Author extends JsonSerializable with EquatableMixin {
  CommitMixin$Author();

  factory CommitMixin$Author.fromJson(Map<String, dynamic> json) =>
      _$CommitMixin$AuthorFromJson(json);

  late Uri avatarUrl;

  String? name;

  CommitMixin$Author$User? user;

  @override
  List<Object?> get props => [avatarUrl, name, user];
  @override
  Map<String, dynamic> toJson() => _$CommitMixin$AuthorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PullRequestReviewMixin$Author extends JsonSerializable
    with EquatableMixin, ActorMixin {
  PullRequestReviewMixin$Author();

  factory PullRequestReviewMixin$Author.fromJson(Map<String, dynamic> json) =>
      _$PullRequestReviewMixin$AuthorFromJson(json);

  @override
  List<Object?> get props => [avatarUrl, login];
  @override
  Map<String, dynamic> toJson() => _$PullRequestReviewMixin$AuthorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PullRequestReviewMixin$Comments extends JsonSerializable
    with EquatableMixin {
  PullRequestReviewMixin$Comments();

  factory PullRequestReviewMixin$Comments.fromJson(Map<String, dynamic> json) =>
      _$PullRequestReviewMixin$CommentsFromJson(json);

  late int totalCount;

  @override
  List<Object?> get props => [totalCount];
  @override
  Map<String, dynamic> toJson() =>
      _$PullRequestReviewMixin$CommentsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PullRequestReviewMixin$ReactionGroups extends JsonSerializable
    with EquatableMixin, ReactionGroupsMixin {
  PullRequestReviewMixin$ReactionGroups();

  factory PullRequestReviewMixin$ReactionGroups.fromJson(
          Map<String, dynamic> json) =>
      _$PullRequestReviewMixin$ReactionGroupsFromJson(json);

  @override
  List<Object?> get props => [content, viewerHasReacted, reactors, subject];
  @override
  Map<String, dynamic> toJson() =>
      _$PullRequestReviewMixin$ReactionGroupsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ReadyForReviewMixin$Actor extends JsonSerializable
    with EquatableMixin, ActorMixin {
  ReadyForReviewMixin$Actor();

  factory ReadyForReviewMixin$Actor.fromJson(Map<String, dynamic> json) =>
      _$ReadyForReviewMixin$ActorFromJson(json);

  @override
  List<Object?> get props => [avatarUrl, login];
  @override
  Map<String, dynamic> toJson() => _$ReadyForReviewMixin$ActorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ReviewDismissedMixin$Actor extends JsonSerializable
    with EquatableMixin, ActorMixin {
  ReviewDismissedMixin$Actor();

  factory ReviewDismissedMixin$Actor.fromJson(Map<String, dynamic> json) =>
      _$ReviewDismissedMixin$ActorFromJson(json);

  @override
  List<Object?> get props => [avatarUrl, login];
  @override
  Map<String, dynamic> toJson() => _$ReviewDismissedMixin$ActorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ReviewRequestedMixin$Actor extends JsonSerializable
    with EquatableMixin, ActorMixin {
  ReviewRequestedMixin$Actor();

  factory ReviewRequestedMixin$Actor.fromJson(Map<String, dynamic> json) =>
      _$ReviewRequestedMixin$ActorFromJson(json);

  @override
  List<Object?> get props => [avatarUrl, login];
  @override
  Map<String, dynamic> toJson() => _$ReviewRequestedMixin$ActorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ReviewRequestedMixin$RequestedReviewer$User
    extends ReviewRequestedMixin$RequestedReviewer
    with EquatableMixin, ActorMixin {
  ReviewRequestedMixin$RequestedReviewer$User();

  factory ReviewRequestedMixin$RequestedReviewer$User.fromJson(
          Map<String, dynamic> json) =>
      _$ReviewRequestedMixin$RequestedReviewer$UserFromJson(json);

  @override
  List<Object?> get props => [avatarUrl, login];
  @override
  Map<String, dynamic> toJson() =>
      _$ReviewRequestedMixin$RequestedReviewer$UserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ReviewRequestedMixin$RequestedReviewer$Team
    extends ReviewRequestedMixin$RequestedReviewer with EquatableMixin {
  ReviewRequestedMixin$RequestedReviewer$Team();

  factory ReviewRequestedMixin$RequestedReviewer$Team.fromJson(
          Map<String, dynamic> json) =>
      _$ReviewRequestedMixin$RequestedReviewer$TeamFromJson(json);

  Uri? avatar;

  late String name;

  @override
  List<Object?> get props => [avatar, name];
  @override
  Map<String, dynamic> toJson() =>
      _$ReviewRequestedMixin$RequestedReviewer$TeamToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ReviewRequestedMixin$RequestedReviewer extends JsonSerializable
    with EquatableMixin {
  ReviewRequestedMixin$RequestedReviewer();

  factory ReviewRequestedMixin$RequestedReviewer.fromJson(
      Map<String, dynamic> json) {
    switch (json['__typename'].toString()) {
      case r'User':
        return ReviewRequestedMixin$RequestedReviewer$User.fromJson(json);
      case r'Team':
        return ReviewRequestedMixin$RequestedReviewer$Team.fromJson(json);
      default:
    }
    return _$ReviewRequestedMixin$RequestedReviewerFromJson(json);
  }

  @JsonKey(name: '__typename')
  String? $$typename;

  @override
  List<Object?> get props => [$$typename];
  @override
  Map<String, dynamic> toJson() {
    switch ($$typename) {
      case r'User':
        return (this as ReviewRequestedMixin$RequestedReviewer$User).toJson();
      case r'Team':
        return (this as ReviewRequestedMixin$RequestedReviewer$Team).toJson();
      default:
    }
    return _$ReviewRequestedMixin$RequestedReviewerToJson(this);
  }
}

@JsonSerializable(explicitToJson: true)
class GetPRReviewComments$Query$Node$PullRequestReview
    extends GetPRReviewComments$Query$Node
    with EquatableMixin, PRReviewCommentsMixin {
  GetPRReviewComments$Query$Node$PullRequestReview();

  factory GetPRReviewComments$Query$Node$PullRequestReview.fromJson(
          Map<String, dynamic> json) =>
      _$GetPRReviewComments$Query$Node$PullRequestReviewFromJson(json);

  @override
  List<Object?> get props => [comments];
  @override
  Map<String, dynamic> toJson() =>
      _$GetPRReviewComments$Query$Node$PullRequestReviewToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetPRReviewComments$Query$Node extends JsonSerializable
    with EquatableMixin {
  GetPRReviewComments$Query$Node();

  factory GetPRReviewComments$Query$Node.fromJson(Map<String, dynamic> json) {
    switch (json['__typename'].toString()) {
      case r'PullRequestReview':
        return GetPRReviewComments$Query$Node$PullRequestReview.fromJson(json);
      default:
    }
    return _$GetPRReviewComments$Query$NodeFromJson(json);
  }

  @JsonKey(name: '__typename')
  String? $$typename;

  @override
  List<Object?> get props => [$$typename];
  @override
  Map<String, dynamic> toJson() {
    switch ($$typename) {
      case r'PullRequestReview':
        return (this as GetPRReviewComments$Query$Node$PullRequestReview)
            .toJson();
      default:
    }
    return _$GetPRReviewComments$Query$NodeToJson(this);
  }
}

@JsonSerializable(explicitToJson: true)
class GetPRReviewComments$Query extends JsonSerializable with EquatableMixin {
  GetPRReviewComments$Query();

  factory GetPRReviewComments$Query.fromJson(Map<String, dynamic> json) =>
      _$GetPRReviewComments$QueryFromJson(json);

  GetPRReviewComments$Query$Node? node;

  @override
  List<Object?> get props => [node];
  @override
  Map<String, dynamic> toJson() => _$GetPRReviewComments$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PRReviewCommentsMixin$Comments$Edges$Node extends JsonSerializable
    with EquatableMixin, PullRequestReviewCommentMixin {
  PRReviewCommentsMixin$Comments$Edges$Node();

  factory PRReviewCommentsMixin$Comments$Edges$Node.fromJson(
          Map<String, dynamic> json) =>
      _$PRReviewCommentsMixin$Comments$Edges$NodeFromJson(json);

  @override
  List<Object?> get props => [
        id,
        databaseId,
        author,
        createdAt,
        authorAssociation,
        body,
        bodyHTML,
        lastEditedAt,
        state,
        diffHunk,
        outdated,
        isMinimized,
        replyTo,
        path,
        reactionGroups,
        viewerCanDelete,
        viewerCanUpdate,
        viewerDidAuthor,
        viewerCannotUpdateReasons,
        viewerCanReact,
        viewerCanMinimize,
        pullRequest,
        repository
      ];
  @override
  Map<String, dynamic> toJson() =>
      _$PRReviewCommentsMixin$Comments$Edges$NodeToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PRReviewCommentsMixin$Comments$Edges extends JsonSerializable
    with EquatableMixin {
  PRReviewCommentsMixin$Comments$Edges();

  factory PRReviewCommentsMixin$Comments$Edges.fromJson(
          Map<String, dynamic> json) =>
      _$PRReviewCommentsMixin$Comments$EdgesFromJson(json);

  @JsonKey(name: '__typename')
  String? $$typename;

  late String cursor;

  PRReviewCommentsMixin$Comments$Edges$Node? node;

  @override
  List<Object?> get props => [$$typename, cursor, node];
  @override
  Map<String, dynamic> toJson() =>
      _$PRReviewCommentsMixin$Comments$EdgesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PRReviewCommentsMixin$Comments extends JsonSerializable
    with EquatableMixin {
  PRReviewCommentsMixin$Comments();

  factory PRReviewCommentsMixin$Comments.fromJson(Map<String, dynamic> json) =>
      _$PRReviewCommentsMixin$CommentsFromJson(json);

  List<PRReviewCommentsMixin$Comments$Edges?>? edges;

  @override
  List<Object?> get props => [edges];
  @override
  Map<String, dynamic> toJson() => _$PRReviewCommentsMixin$CommentsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PullRequestReviewCommentMixin$Author extends JsonSerializable
    with EquatableMixin, ActorMixin {
  PullRequestReviewCommentMixin$Author();

  factory PullRequestReviewCommentMixin$Author.fromJson(
          Map<String, dynamic> json) =>
      _$PullRequestReviewCommentMixin$AuthorFromJson(json);

  @override
  List<Object?> get props => [avatarUrl, login];
  @override
  Map<String, dynamic> toJson() =>
      _$PullRequestReviewCommentMixin$AuthorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PullRequestReviewCommentMixin$ReplyTo extends JsonSerializable
    with EquatableMixin {
  PullRequestReviewCommentMixin$ReplyTo();

  factory PullRequestReviewCommentMixin$ReplyTo.fromJson(
          Map<String, dynamic> json) =>
      _$PullRequestReviewCommentMixin$ReplyToFromJson(json);

  late String id;

  @override
  List<Object?> get props => [id];
  @override
  Map<String, dynamic> toJson() =>
      _$PullRequestReviewCommentMixin$ReplyToToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PullRequestReviewCommentMixin$ReactionGroups extends JsonSerializable
    with EquatableMixin, ReactionGroupsMixin {
  PullRequestReviewCommentMixin$ReactionGroups();

  factory PullRequestReviewCommentMixin$ReactionGroups.fromJson(
          Map<String, dynamic> json) =>
      _$PullRequestReviewCommentMixin$ReactionGroupsFromJson(json);

  @override
  List<Object?> get props => [content, viewerHasReacted, reactors, subject];
  @override
  Map<String, dynamic> toJson() =>
      _$PullRequestReviewCommentMixin$ReactionGroupsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PullRequestReviewCommentMixin$PullRequest extends JsonSerializable
    with EquatableMixin {
  PullRequestReviewCommentMixin$PullRequest();

  factory PullRequestReviewCommentMixin$PullRequest.fromJson(
          Map<String, dynamic> json) =>
      _$PullRequestReviewCommentMixin$PullRequestFromJson(json);

  late int number;

  @override
  List<Object?> get props => [number];
  @override
  Map<String, dynamic> toJson() =>
      _$PullRequestReviewCommentMixin$PullRequestToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PullRequestReviewCommentMixin$Repository$Owner extends JsonSerializable
    with EquatableMixin {
  PullRequestReviewCommentMixin$Repository$Owner();

  factory PullRequestReviewCommentMixin$Repository$Owner.fromJson(
          Map<String, dynamic> json) =>
      _$PullRequestReviewCommentMixin$Repository$OwnerFromJson(json);

  late String login;

  @override
  List<Object?> get props => [login];
  @override
  Map<String, dynamic> toJson() =>
      _$PullRequestReviewCommentMixin$Repository$OwnerToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PullRequestReviewCommentMixin$Repository extends JsonSerializable
    with EquatableMixin {
  PullRequestReviewCommentMixin$Repository();

  factory PullRequestReviewCommentMixin$Repository.fromJson(
          Map<String, dynamic> json) =>
      _$PullRequestReviewCommentMixin$RepositoryFromJson(json);

  late String name;

  late PullRequestReviewCommentMixin$Repository$Owner owner;

  @override
  List<Object?> get props => [name, owner];
  @override
  Map<String, dynamic> toJson() =>
      _$PullRequestReviewCommentMixin$RepositoryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ReviewThreadFirstCommentQuery$Query$Repository$PullRequest$ReviewThreads$Edges$Node$Comments$Nodes
    extends JsonSerializable with EquatableMixin {
  ReviewThreadFirstCommentQuery$Query$Repository$PullRequest$ReviewThreads$Edges$Node$Comments$Nodes();

  factory ReviewThreadFirstCommentQuery$Query$Repository$PullRequest$ReviewThreads$Edges$Node$Comments$Nodes.fromJson(
          Map<String, dynamic> json) =>
      _$ReviewThreadFirstCommentQuery$Query$Repository$PullRequest$ReviewThreads$Edges$Node$Comments$NodesFromJson(
          json);

  late String id;

  @override
  List<Object?> get props => [id];
  @override
  Map<String, dynamic> toJson() =>
      _$ReviewThreadFirstCommentQuery$Query$Repository$PullRequest$ReviewThreads$Edges$Node$Comments$NodesToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class ReviewThreadFirstCommentQuery$Query$Repository$PullRequest$ReviewThreads$Edges$Node$Comments
    extends JsonSerializable with EquatableMixin {
  ReviewThreadFirstCommentQuery$Query$Repository$PullRequest$ReviewThreads$Edges$Node$Comments();

  factory ReviewThreadFirstCommentQuery$Query$Repository$PullRequest$ReviewThreads$Edges$Node$Comments.fromJson(
          Map<String, dynamic> json) =>
      _$ReviewThreadFirstCommentQuery$Query$Repository$PullRequest$ReviewThreads$Edges$Node$CommentsFromJson(
          json);

  late int totalCount;

  List<ReviewThreadFirstCommentQuery$Query$Repository$PullRequest$ReviewThreads$Edges$Node$Comments$Nodes?>?
      nodes;

  @override
  List<Object?> get props => [totalCount, nodes];
  @override
  Map<String, dynamic> toJson() =>
      _$ReviewThreadFirstCommentQuery$Query$Repository$PullRequest$ReviewThreads$Edges$Node$CommentsToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class ReviewThreadFirstCommentQuery$Query$Repository$PullRequest$ReviewThreads$Edges$Node
    extends JsonSerializable with EquatableMixin {
  ReviewThreadFirstCommentQuery$Query$Repository$PullRequest$ReviewThreads$Edges$Node();

  factory ReviewThreadFirstCommentQuery$Query$Repository$PullRequest$ReviewThreads$Edges$Node.fromJson(
          Map<String, dynamic> json) =>
      _$ReviewThreadFirstCommentQuery$Query$Repository$PullRequest$ReviewThreads$Edges$NodeFromJson(
          json);

  late String id;

  late bool viewerCanResolve;

  late bool viewerCanUnresolve;

  late bool viewerCanReply;

  late bool isOutdated;

  late bool isCollapsed;

  late bool isResolved;

  late ReviewThreadFirstCommentQuery$Query$Repository$PullRequest$ReviewThreads$Edges$Node$Comments
      comments;

  @override
  List<Object?> get props => [
        id,
        viewerCanResolve,
        viewerCanUnresolve,
        viewerCanReply,
        isOutdated,
        isCollapsed,
        isResolved,
        comments
      ];
  @override
  Map<String, dynamic> toJson() =>
      _$ReviewThreadFirstCommentQuery$Query$Repository$PullRequest$ReviewThreads$Edges$NodeToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class ReviewThreadFirstCommentQuery$Query$Repository$PullRequest$ReviewThreads$Edges
    extends JsonSerializable with EquatableMixin {
  ReviewThreadFirstCommentQuery$Query$Repository$PullRequest$ReviewThreads$Edges();

  factory ReviewThreadFirstCommentQuery$Query$Repository$PullRequest$ReviewThreads$Edges.fromJson(
          Map<String, dynamic> json) =>
      _$ReviewThreadFirstCommentQuery$Query$Repository$PullRequest$ReviewThreads$EdgesFromJson(
          json);

  late String cursor;

  ReviewThreadFirstCommentQuery$Query$Repository$PullRequest$ReviewThreads$Edges$Node?
      node;

  @override
  List<Object?> get props => [cursor, node];
  @override
  Map<String, dynamic> toJson() =>
      _$ReviewThreadFirstCommentQuery$Query$Repository$PullRequest$ReviewThreads$EdgesToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class ReviewThreadFirstCommentQuery$Query$Repository$PullRequest$ReviewThreads
    extends JsonSerializable with EquatableMixin {
  ReviewThreadFirstCommentQuery$Query$Repository$PullRequest$ReviewThreads();

  factory ReviewThreadFirstCommentQuery$Query$Repository$PullRequest$ReviewThreads.fromJson(
          Map<String, dynamic> json) =>
      _$ReviewThreadFirstCommentQuery$Query$Repository$PullRequest$ReviewThreadsFromJson(
          json);

  List<ReviewThreadFirstCommentQuery$Query$Repository$PullRequest$ReviewThreads$Edges?>?
      edges;

  @override
  List<Object?> get props => [edges];
  @override
  Map<String, dynamic> toJson() =>
      _$ReviewThreadFirstCommentQuery$Query$Repository$PullRequest$ReviewThreadsToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class ReviewThreadFirstCommentQuery$Query$Repository$PullRequest
    extends JsonSerializable with EquatableMixin {
  ReviewThreadFirstCommentQuery$Query$Repository$PullRequest();

  factory ReviewThreadFirstCommentQuery$Query$Repository$PullRequest.fromJson(
          Map<String, dynamic> json) =>
      _$ReviewThreadFirstCommentQuery$Query$Repository$PullRequestFromJson(
          json);

  late String id;

  late ReviewThreadFirstCommentQuery$Query$Repository$PullRequest$ReviewThreads
      reviewThreads;

  @override
  List<Object?> get props => [id, reviewThreads];
  @override
  Map<String, dynamic> toJson() =>
      _$ReviewThreadFirstCommentQuery$Query$Repository$PullRequestToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ReviewThreadFirstCommentQuery$Query$Repository extends JsonSerializable
    with EquatableMixin {
  ReviewThreadFirstCommentQuery$Query$Repository();

  factory ReviewThreadFirstCommentQuery$Query$Repository.fromJson(
          Map<String, dynamic> json) =>
      _$ReviewThreadFirstCommentQuery$Query$RepositoryFromJson(json);

  ReviewThreadFirstCommentQuery$Query$Repository$PullRequest? pullRequest;

  @override
  List<Object?> get props => [pullRequest];
  @override
  Map<String, dynamic> toJson() =>
      _$ReviewThreadFirstCommentQuery$Query$RepositoryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ReviewThreadFirstCommentQuery$Query extends JsonSerializable
    with EquatableMixin {
  ReviewThreadFirstCommentQuery$Query();

  factory ReviewThreadFirstCommentQuery$Query.fromJson(
          Map<String, dynamic> json) =>
      _$ReviewThreadFirstCommentQuery$QueryFromJson(json);

  ReviewThreadFirstCommentQuery$Query$Repository? repository;

  @override
  List<Object?> get props => [repository];
  @override
  Map<String, dynamic> toJson() =>
      _$ReviewThreadFirstCommentQuery$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ReviewThreadCommentsQuery$Query$Node$PullRequestReviewThread$Comments$Edges$Node
    extends JsonSerializable
    with EquatableMixin, PullRequestReviewCommentMixin {
  ReviewThreadCommentsQuery$Query$Node$PullRequestReviewThread$Comments$Edges$Node();

  factory ReviewThreadCommentsQuery$Query$Node$PullRequestReviewThread$Comments$Edges$Node.fromJson(
          Map<String, dynamic> json) =>
      _$ReviewThreadCommentsQuery$Query$Node$PullRequestReviewThread$Comments$Edges$NodeFromJson(
          json);

  @override
  List<Object?> get props => [
        id,
        databaseId,
        author,
        createdAt,
        authorAssociation,
        body,
        bodyHTML,
        lastEditedAt,
        state,
        diffHunk,
        outdated,
        isMinimized,
        replyTo,
        path,
        reactionGroups,
        viewerCanDelete,
        viewerCanUpdate,
        viewerDidAuthor,
        viewerCannotUpdateReasons,
        viewerCanReact,
        viewerCanMinimize,
        pullRequest,
        repository
      ];
  @override
  Map<String, dynamic> toJson() =>
      _$ReviewThreadCommentsQuery$Query$Node$PullRequestReviewThread$Comments$Edges$NodeToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class ReviewThreadCommentsQuery$Query$Node$PullRequestReviewThread$Comments$Edges
    extends JsonSerializable with EquatableMixin {
  ReviewThreadCommentsQuery$Query$Node$PullRequestReviewThread$Comments$Edges();

  factory ReviewThreadCommentsQuery$Query$Node$PullRequestReviewThread$Comments$Edges.fromJson(
          Map<String, dynamic> json) =>
      _$ReviewThreadCommentsQuery$Query$Node$PullRequestReviewThread$Comments$EdgesFromJson(
          json);

  late String cursor;

  ReviewThreadCommentsQuery$Query$Node$PullRequestReviewThread$Comments$Edges$Node?
      node;

  @override
  List<Object?> get props => [cursor, node];
  @override
  Map<String, dynamic> toJson() =>
      _$ReviewThreadCommentsQuery$Query$Node$PullRequestReviewThread$Comments$EdgesToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class ReviewThreadCommentsQuery$Query$Node$PullRequestReviewThread$Comments
    extends JsonSerializable with EquatableMixin {
  ReviewThreadCommentsQuery$Query$Node$PullRequestReviewThread$Comments();

  factory ReviewThreadCommentsQuery$Query$Node$PullRequestReviewThread$Comments.fromJson(
          Map<String, dynamic> json) =>
      _$ReviewThreadCommentsQuery$Query$Node$PullRequestReviewThread$CommentsFromJson(
          json);

  List<ReviewThreadCommentsQuery$Query$Node$PullRequestReviewThread$Comments$Edges?>?
      edges;

  @override
  List<Object?> get props => [edges];
  @override
  Map<String, dynamic> toJson() =>
      _$ReviewThreadCommentsQuery$Query$Node$PullRequestReviewThread$CommentsToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class ReviewThreadCommentsQuery$Query$Node$PullRequestReviewThread
    extends ReviewThreadCommentsQuery$Query$Node with EquatableMixin {
  ReviewThreadCommentsQuery$Query$Node$PullRequestReviewThread();

  factory ReviewThreadCommentsQuery$Query$Node$PullRequestReviewThread.fromJson(
          Map<String, dynamic> json) =>
      _$ReviewThreadCommentsQuery$Query$Node$PullRequestReviewThreadFromJson(
          json);

  late ReviewThreadCommentsQuery$Query$Node$PullRequestReviewThread$Comments
      comments;

  @override
  List<Object?> get props => [comments];
  @override
  Map<String, dynamic> toJson() =>
      _$ReviewThreadCommentsQuery$Query$Node$PullRequestReviewThreadToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class ReviewThreadCommentsQuery$Query$Node extends JsonSerializable
    with EquatableMixin {
  ReviewThreadCommentsQuery$Query$Node();

  factory ReviewThreadCommentsQuery$Query$Node.fromJson(
      Map<String, dynamic> json) {
    switch (json['__typename'].toString()) {
      case r'PullRequestReviewThread':
        return ReviewThreadCommentsQuery$Query$Node$PullRequestReviewThread
            .fromJson(json);
      default:
    }
    return _$ReviewThreadCommentsQuery$Query$NodeFromJson(json);
  }

  @JsonKey(name: '__typename')
  String? $$typename;

  @override
  List<Object?> get props => [$$typename];
  @override
  Map<String, dynamic> toJson() {
    switch ($$typename) {
      case r'PullRequestReviewThread':
        return (this
                as ReviewThreadCommentsQuery$Query$Node$PullRequestReviewThread)
            .toJson();
      default:
    }
    return _$ReviewThreadCommentsQuery$Query$NodeToJson(this);
  }
}

@JsonSerializable(explicitToJson: true)
class ReviewThreadCommentsQuery$Query extends JsonSerializable
    with EquatableMixin {
  ReviewThreadCommentsQuery$Query();

  factory ReviewThreadCommentsQuery$Query.fromJson(Map<String, dynamic> json) =>
      _$ReviewThreadCommentsQuery$QueryFromJson(json);

  ReviewThreadCommentsQuery$Query$Node? node;

  @override
  List<Object?> get props => [node];
  @override
  Map<String, dynamic> toJson() =>
      _$ReviewThreadCommentsQuery$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CheckPendingViewerReviews$Query$Node$PullRequest$Reviews$Nodes
    extends JsonSerializable with EquatableMixin {
  CheckPendingViewerReviews$Query$Node$PullRequest$Reviews$Nodes();

  factory CheckPendingViewerReviews$Query$Node$PullRequest$Reviews$Nodes.fromJson(
          Map<String, dynamic> json) =>
      _$CheckPendingViewerReviews$Query$Node$PullRequest$Reviews$NodesFromJson(
          json);

  late Uri url;

  @override
  List<Object?> get props => [url];
  @override
  Map<String, dynamic> toJson() =>
      _$CheckPendingViewerReviews$Query$Node$PullRequest$Reviews$NodesToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class CheckPendingViewerReviews$Query$Node$PullRequest$Reviews
    extends JsonSerializable with EquatableMixin {
  CheckPendingViewerReviews$Query$Node$PullRequest$Reviews();

  factory CheckPendingViewerReviews$Query$Node$PullRequest$Reviews.fromJson(
          Map<String, dynamic> json) =>
      _$CheckPendingViewerReviews$Query$Node$PullRequest$ReviewsFromJson(json);

  late int totalCount;

  List<CheckPendingViewerReviews$Query$Node$PullRequest$Reviews$Nodes?>? nodes;

  @override
  List<Object?> get props => [totalCount, nodes];
  @override
  Map<String, dynamic> toJson() =>
      _$CheckPendingViewerReviews$Query$Node$PullRequest$ReviewsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CheckPendingViewerReviews$Query$Node$PullRequest
    extends CheckPendingViewerReviews$Query$Node with EquatableMixin {
  CheckPendingViewerReviews$Query$Node$PullRequest();

  factory CheckPendingViewerReviews$Query$Node$PullRequest.fromJson(
          Map<String, dynamic> json) =>
      _$CheckPendingViewerReviews$Query$Node$PullRequestFromJson(json);

  CheckPendingViewerReviews$Query$Node$PullRequest$Reviews? reviews;

  @override
  List<Object?> get props => [reviews];
  @override
  Map<String, dynamic> toJson() =>
      _$CheckPendingViewerReviews$Query$Node$PullRequestToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CheckPendingViewerReviews$Query$Node extends JsonSerializable
    with EquatableMixin {
  CheckPendingViewerReviews$Query$Node();

  factory CheckPendingViewerReviews$Query$Node.fromJson(
      Map<String, dynamic> json) {
    switch (json['__typename'].toString()) {
      case r'PullRequest':
        return CheckPendingViewerReviews$Query$Node$PullRequest.fromJson(json);
      default:
    }
    return _$CheckPendingViewerReviews$Query$NodeFromJson(json);
  }

  @JsonKey(name: '__typename')
  String? $$typename;

  @override
  List<Object?> get props => [$$typename];
  @override
  Map<String, dynamic> toJson() {
    switch ($$typename) {
      case r'PullRequest':
        return (this as CheckPendingViewerReviews$Query$Node$PullRequest)
            .toJson();
      default:
    }
    return _$CheckPendingViewerReviews$Query$NodeToJson(this);
  }
}

@JsonSerializable(explicitToJson: true)
class CheckPendingViewerReviews$Query extends JsonSerializable
    with EquatableMixin {
  CheckPendingViewerReviews$Query();

  factory CheckPendingViewerReviews$Query.fromJson(Map<String, dynamic> json) =>
      _$CheckPendingViewerReviews$QueryFromJson(json);

  CheckPendingViewerReviews$Query$Node? node;

  @override
  List<Object?> get props => [node];
  @override
  Map<String, dynamic> toJson() =>
      _$CheckPendingViewerReviews$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetParticipants$Query$Node$Issue$Participants$Edges$Node
    extends JsonSerializable with EquatableMixin, ActorMixin {
  GetParticipants$Query$Node$Issue$Participants$Edges$Node();

  factory GetParticipants$Query$Node$Issue$Participants$Edges$Node.fromJson(
          Map<String, dynamic> json) =>
      _$GetParticipants$Query$Node$Issue$Participants$Edges$NodeFromJson(json);

  @override
  List<Object?> get props => [avatarUrl, login];
  @override
  Map<String, dynamic> toJson() =>
      _$GetParticipants$Query$Node$Issue$Participants$Edges$NodeToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetParticipants$Query$Node$Issue$Participants$Edges
    extends JsonSerializable with EquatableMixin {
  GetParticipants$Query$Node$Issue$Participants$Edges();

  factory GetParticipants$Query$Node$Issue$Participants$Edges.fromJson(
          Map<String, dynamic> json) =>
      _$GetParticipants$Query$Node$Issue$Participants$EdgesFromJson(json);

  late String cursor;

  GetParticipants$Query$Node$Issue$Participants$Edges$Node? node;

  @override
  List<Object?> get props => [cursor, node];
  @override
  Map<String, dynamic> toJson() =>
      _$GetParticipants$Query$Node$Issue$Participants$EdgesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetParticipants$Query$Node$Issue$Participants extends JsonSerializable
    with EquatableMixin {
  GetParticipants$Query$Node$Issue$Participants();

  factory GetParticipants$Query$Node$Issue$Participants.fromJson(
          Map<String, dynamic> json) =>
      _$GetParticipants$Query$Node$Issue$ParticipantsFromJson(json);

  List<GetParticipants$Query$Node$Issue$Participants$Edges?>? edges;

  @override
  List<Object?> get props => [edges];
  @override
  Map<String, dynamic> toJson() =>
      _$GetParticipants$Query$Node$Issue$ParticipantsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetParticipants$Query$Node$Issue extends GetParticipants$Query$Node
    with EquatableMixin {
  GetParticipants$Query$Node$Issue();

  factory GetParticipants$Query$Node$Issue.fromJson(
          Map<String, dynamic> json) =>
      _$GetParticipants$Query$Node$IssueFromJson(json);

  late GetParticipants$Query$Node$Issue$Participants participants;

  @override
  List<Object?> get props => [participants];
  @override
  Map<String, dynamic> toJson() =>
      _$GetParticipants$Query$Node$IssueToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetParticipants$Query$Node extends JsonSerializable with EquatableMixin {
  GetParticipants$Query$Node();

  factory GetParticipants$Query$Node.fromJson(Map<String, dynamic> json) {
    switch (json['__typename'].toString()) {
      case r'Issue':
        return GetParticipants$Query$Node$Issue.fromJson(json);
      default:
    }
    return _$GetParticipants$Query$NodeFromJson(json);
  }

  @JsonKey(name: '__typename')
  String? $$typename;

  @override
  List<Object?> get props => [$$typename];
  @override
  Map<String, dynamic> toJson() {
    switch ($$typename) {
      case r'Issue':
        return (this as GetParticipants$Query$Node$Issue).toJson();
      default:
    }
    return _$GetParticipants$Query$NodeToJson(this);
  }
}

@JsonSerializable(explicitToJson: true)
class GetParticipants$Query extends JsonSerializable with EquatableMixin {
  GetParticipants$Query();

  factory GetParticipants$Query.fromJson(Map<String, dynamic> json) =>
      _$GetParticipants$QueryFromJson(json);

  GetParticipants$Query$Node? node;

  @override
  List<Object?> get props => [node];
  @override
  Map<String, dynamic> toJson() => _$GetParticipants$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class FetchReview$Query$Node$PullRequestReviewComment$Author
    extends JsonSerializable with EquatableMixin, ActorMixin {
  FetchReview$Query$Node$PullRequestReviewComment$Author();

  factory FetchReview$Query$Node$PullRequestReviewComment$Author.fromJson(
          Map<String, dynamic> json) =>
      _$FetchReview$Query$Node$PullRequestReviewComment$AuthorFromJson(json);

  @override
  List<Object?> get props => [avatarUrl, login];
  @override
  Map<String, dynamic> toJson() =>
      _$FetchReview$Query$Node$PullRequestReviewComment$AuthorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class FetchReview$Query$Node$PullRequestReviewComment
    extends FetchReview$Query$Node with EquatableMixin {
  FetchReview$Query$Node$PullRequestReviewComment();

  factory FetchReview$Query$Node$PullRequestReviewComment.fromJson(
          Map<String, dynamic> json) =>
      _$FetchReview$Query$Node$PullRequestReviewCommentFromJson(json);

  late String bodyHTML;

  FetchReview$Query$Node$PullRequestReviewComment$Author? author;

  late String diffHunk;

  late String path;

  @override
  List<Object?> get props => [bodyHTML, author, diffHunk, path];
  @override
  Map<String, dynamic> toJson() =>
      _$FetchReview$Query$Node$PullRequestReviewCommentToJson(this);
}

@JsonSerializable(explicitToJson: true)
class FetchReview$Query$Node extends JsonSerializable with EquatableMixin {
  FetchReview$Query$Node();

  factory FetchReview$Query$Node.fromJson(Map<String, dynamic> json) {
    switch (json['__typename'].toString()) {
      case r'PullRequestReviewComment':
        return FetchReview$Query$Node$PullRequestReviewComment.fromJson(json);
      default:
    }
    return _$FetchReview$Query$NodeFromJson(json);
  }

  @JsonKey(name: '__typename')
  String? $$typename;

  @override
  List<Object?> get props => [$$typename];
  @override
  Map<String, dynamic> toJson() {
    switch ($$typename) {
      case r'PullRequestReviewComment':
        return (this as FetchReview$Query$Node$PullRequestReviewComment)
            .toJson();
      default:
    }
    return _$FetchReview$Query$NodeToJson(this);
  }
}

@JsonSerializable(explicitToJson: true)
class FetchReview$Query extends JsonSerializable with EquatableMixin {
  FetchReview$Query();

  factory FetchReview$Query.fromJson(Map<String, dynamic> json) =>
      _$FetchReview$QueryFromJson(json);

  FetchReview$Query$Node? node;

  @override
  List<Object?> get props => [node];
  @override
  Map<String, dynamic> toJson() => _$FetchReview$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class IssuePullInfo$Query$Repository$IssueOrPullRequest$Issue
    extends IssuePullInfo$Query$Repository$IssueOrPullRequest
    with EquatableMixin, IssueInfoMixin {
  IssuePullInfo$Query$Repository$IssueOrPullRequest$Issue();

  factory IssuePullInfo$Query$Repository$IssueOrPullRequest$Issue.fromJson(
          Map<String, dynamic> json) =>
      _$IssuePullInfo$Query$Repository$IssueOrPullRequest$IssueFromJson(json);

  @override
  List<Object?> get props => [
        id,
        activeLockReason,
        assignees,
        author,
        participants,
        authorAssociation,
        bodyHTML,
        body,
        closed,
        closedAt,
        createdAt,
        comments,
        userContentEdits,
        includesCreatedEdit,
        isPinned,
        labels,
        locked,
        number,
        reactionGroups,
        repository,
        state,
        titleHTML,
        timelineItems,
        url,
        viewerCanReact,
        viewerCanUpdate
      ];
  @override
  Map<String, dynamic> toJson() =>
      _$IssuePullInfo$Query$Repository$IssueOrPullRequest$IssueToJson(this);
}

@JsonSerializable(explicitToJson: true)
class IssuePullInfo$Query$Repository$IssueOrPullRequest$PullRequest
    extends IssuePullInfo$Query$Repository$IssueOrPullRequest
    with EquatableMixin, PullInfoMixin {
  IssuePullInfo$Query$Repository$IssueOrPullRequest$PullRequest();

  factory IssuePullInfo$Query$Repository$IssueOrPullRequest$PullRequest.fromJson(
          Map<String, dynamic> json) =>
      _$IssuePullInfo$Query$Repository$IssueOrPullRequest$PullRequestFromJson(
          json);

  @override
  List<Object?> get props => [
        activeLockReason,
        assignees,
        author,
        authorAssociation,
        bodyHTML,
        body,
        closed,
        closedAt,
        createdAt,
        comments,
        labels,
        locked,
        number,
        reactionGroups,
        repository,
        state,
        timelineItems,
        titleHTML,
        url,
        userContentEdits,
        includesCreatedEdit,
        viewerCanReact,
        additions,
        deletions,
        baseRef,
        headRef,
        changedFiles,
        closingIssuesReferences,
        commits,
        isCrossRepository,
        merged,
        reviewDecision,
        viewerCanUpdate
      ];
  @override
  Map<String, dynamic> toJson() =>
      _$IssuePullInfo$Query$Repository$IssueOrPullRequest$PullRequestToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class IssuePullInfo$Query$Repository$IssueOrPullRequest extends JsonSerializable
    with EquatableMixin {
  IssuePullInfo$Query$Repository$IssueOrPullRequest();

  factory IssuePullInfo$Query$Repository$IssueOrPullRequest.fromJson(
      Map<String, dynamic> json) {
    switch (json['__typename'].toString()) {
      case r'Issue':
        return IssuePullInfo$Query$Repository$IssueOrPullRequest$Issue.fromJson(
            json);
      case r'PullRequest':
        return IssuePullInfo$Query$Repository$IssueOrPullRequest$PullRequest
            .fromJson(json);
      default:
    }
    return _$IssuePullInfo$Query$Repository$IssueOrPullRequestFromJson(json);
  }

  @JsonKey(name: '__typename')
  String? $$typename;

  @override
  List<Object?> get props => [$$typename];
  @override
  Map<String, dynamic> toJson() {
    switch ($$typename) {
      case r'Issue':
        return (this as IssuePullInfo$Query$Repository$IssueOrPullRequest$Issue)
            .toJson();
      case r'PullRequest':
        return (this
                as IssuePullInfo$Query$Repository$IssueOrPullRequest$PullRequest)
            .toJson();
      default:
    }
    return _$IssuePullInfo$Query$Repository$IssueOrPullRequestToJson(this);
  }
}

@JsonSerializable(explicitToJson: true)
class IssuePullInfo$Query$Repository extends JsonSerializable
    with EquatableMixin {
  IssuePullInfo$Query$Repository();

  factory IssuePullInfo$Query$Repository.fromJson(Map<String, dynamic> json) =>
      _$IssuePullInfo$Query$RepositoryFromJson(json);

  IssuePullInfo$Query$Repository$IssueOrPullRequest? issueOrPullRequest;

  @override
  List<Object?> get props => [issueOrPullRequest];
  @override
  Map<String, dynamic> toJson() => _$IssuePullInfo$Query$RepositoryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class IssuePullInfo$Query extends JsonSerializable with EquatableMixin {
  IssuePullInfo$Query();

  factory IssuePullInfo$Query.fromJson(Map<String, dynamic> json) =>
      _$IssuePullInfo$QueryFromJson(json);

  IssuePullInfo$Query$Repository? repository;

  @override
  List<Object?> get props => [repository];
  @override
  Map<String, dynamic> toJson() => _$IssuePullInfo$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class IssueInfoMixin$Assignees extends JsonSerializable
    with EquatableMixin, AssigneeInfoMixin {
  IssueInfoMixin$Assignees();

  factory IssueInfoMixin$Assignees.fromJson(Map<String, dynamic> json) =>
      _$IssueInfoMixin$AssigneesFromJson(json);

  @override
  List<Object?> get props => [totalCount, edges];
  @override
  Map<String, dynamic> toJson() => _$IssueInfoMixin$AssigneesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class IssueInfoMixin$Author extends JsonSerializable
    with EquatableMixin, ActorMixin {
  IssueInfoMixin$Author();

  factory IssueInfoMixin$Author.fromJson(Map<String, dynamic> json) =>
      _$IssueInfoMixin$AuthorFromJson(json);

  @override
  List<Object?> get props => [avatarUrl, login];
  @override
  Map<String, dynamic> toJson() => _$IssueInfoMixin$AuthorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class IssueInfoMixin$Participants$Nodes extends JsonSerializable
    with EquatableMixin {
  IssueInfoMixin$Participants$Nodes();

  factory IssueInfoMixin$Participants$Nodes.fromJson(
          Map<String, dynamic> json) =>
      _$IssueInfoMixin$Participants$NodesFromJson(json);

  late Uri avatarUrl;

  @override
  List<Object?> get props => [avatarUrl];
  @override
  Map<String, dynamic> toJson() =>
      _$IssueInfoMixin$Participants$NodesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class IssueInfoMixin$Participants extends JsonSerializable with EquatableMixin {
  IssueInfoMixin$Participants();

  factory IssueInfoMixin$Participants.fromJson(Map<String, dynamic> json) =>
      _$IssueInfoMixin$ParticipantsFromJson(json);

  late int totalCount;

  List<IssueInfoMixin$Participants$Nodes?>? nodes;

  @override
  List<Object?> get props => [totalCount, nodes];
  @override
  Map<String, dynamic> toJson() => _$IssueInfoMixin$ParticipantsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class IssueInfoMixin$Comments extends JsonSerializable with EquatableMixin {
  IssueInfoMixin$Comments();

  factory IssueInfoMixin$Comments.fromJson(Map<String, dynamic> json) =>
      _$IssueInfoMixin$CommentsFromJson(json);

  late int totalCount;

  @override
  List<Object?> get props => [totalCount];
  @override
  Map<String, dynamic> toJson() => _$IssueInfoMixin$CommentsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class IssueInfoMixin$UserContentEdits extends JsonSerializable
    with EquatableMixin {
  IssueInfoMixin$UserContentEdits();

  factory IssueInfoMixin$UserContentEdits.fromJson(Map<String, dynamic> json) =>
      _$IssueInfoMixin$UserContentEditsFromJson(json);

  late int totalCount;

  @override
  List<Object?> get props => [totalCount];
  @override
  Map<String, dynamic> toJson() =>
      _$IssueInfoMixin$UserContentEditsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class IssueInfoMixin$Labels$Nodes extends JsonSerializable
    with EquatableMixin, LabelMixin {
  IssueInfoMixin$Labels$Nodes();

  factory IssueInfoMixin$Labels$Nodes.fromJson(Map<String, dynamic> json) =>
      _$IssueInfoMixin$Labels$NodesFromJson(json);

  @override
  List<Object?> get props => [color, name];
  @override
  Map<String, dynamic> toJson() => _$IssueInfoMixin$Labels$NodesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class IssueInfoMixin$Labels extends JsonSerializable with EquatableMixin {
  IssueInfoMixin$Labels();

  factory IssueInfoMixin$Labels.fromJson(Map<String, dynamic> json) =>
      _$IssueInfoMixin$LabelsFromJson(json);

  List<IssueInfoMixin$Labels$Nodes?>? nodes;

  @override
  List<Object?> get props => [nodes];
  @override
  Map<String, dynamic> toJson() => _$IssueInfoMixin$LabelsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class IssueInfoMixin$ReactionGroups extends JsonSerializable
    with EquatableMixin, ReactionGroupsMixin {
  IssueInfoMixin$ReactionGroups();

  factory IssueInfoMixin$ReactionGroups.fromJson(Map<String, dynamic> json) =>
      _$IssueInfoMixin$ReactionGroupsFromJson(json);

  @override
  List<Object?> get props => [content, viewerHasReacted, reactors, subject];
  @override
  Map<String, dynamic> toJson() => _$IssueInfoMixin$ReactionGroupsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class IssueInfoMixin$Repository extends JsonSerializable
    with EquatableMixin, RepoInfoMixin {
  IssueInfoMixin$Repository();

  factory IssueInfoMixin$Repository.fromJson(Map<String, dynamic> json) =>
      _$IssueInfoMixin$RepositoryFromJson(json);

  @override
  List<Object?> get props => [name, owner];
  @override
  Map<String, dynamic> toJson() => _$IssueInfoMixin$RepositoryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class IssueInfoMixin$TimelineItems extends JsonSerializable
    with EquatableMixin {
  IssueInfoMixin$TimelineItems();

  factory IssueInfoMixin$TimelineItems.fromJson(Map<String, dynamic> json) =>
      _$IssueInfoMixin$TimelineItemsFromJson(json);

  late int totalCount;

  @override
  List<Object?> get props => [totalCount];
  @override
  Map<String, dynamic> toJson() => _$IssueInfoMixin$TimelineItemsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AssigneeInfoMixin$Edges$Node extends JsonSerializable
    with EquatableMixin, ActorMixin {
  AssigneeInfoMixin$Edges$Node();

  factory AssigneeInfoMixin$Edges$Node.fromJson(Map<String, dynamic> json) =>
      _$AssigneeInfoMixin$Edges$NodeFromJson(json);

  @override
  List<Object?> get props => [avatarUrl, login];
  @override
  Map<String, dynamic> toJson() => _$AssigneeInfoMixin$Edges$NodeToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AssigneeInfoMixin$Edges extends JsonSerializable with EquatableMixin {
  AssigneeInfoMixin$Edges();

  factory AssigneeInfoMixin$Edges.fromJson(Map<String, dynamic> json) =>
      _$AssigneeInfoMixin$EdgesFromJson(json);

  late String cursor;

  AssigneeInfoMixin$Edges$Node? node;

  @override
  List<Object?> get props => [cursor, node];
  @override
  Map<String, dynamic> toJson() => _$AssigneeInfoMixin$EdgesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RepoInfoMixin$Owner extends JsonSerializable with EquatableMixin {
  RepoInfoMixin$Owner();

  factory RepoInfoMixin$Owner.fromJson(Map<String, dynamic> json) =>
      _$RepoInfoMixin$OwnerFromJson(json);

  late String login;

  late Uri avatarUrl;

  @override
  List<Object?> get props => [login, avatarUrl];
  @override
  Map<String, dynamic> toJson() => _$RepoInfoMixin$OwnerToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PullInfoMixin$Assignees extends JsonSerializable
    with EquatableMixin, AssigneeInfoMixin {
  PullInfoMixin$Assignees();

  factory PullInfoMixin$Assignees.fromJson(Map<String, dynamic> json) =>
      _$PullInfoMixin$AssigneesFromJson(json);

  @override
  List<Object?> get props => [totalCount, edges];
  @override
  Map<String, dynamic> toJson() => _$PullInfoMixin$AssigneesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PullInfoMixin$Author extends JsonSerializable
    with EquatableMixin, ActorMixin {
  PullInfoMixin$Author();

  factory PullInfoMixin$Author.fromJson(Map<String, dynamic> json) =>
      _$PullInfoMixin$AuthorFromJson(json);

  @override
  List<Object?> get props => [avatarUrl, login];
  @override
  Map<String, dynamic> toJson() => _$PullInfoMixin$AuthorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PullInfoMixin$Comments extends JsonSerializable with EquatableMixin {
  PullInfoMixin$Comments();

  factory PullInfoMixin$Comments.fromJson(Map<String, dynamic> json) =>
      _$PullInfoMixin$CommentsFromJson(json);

  late int totalCount;

  @override
  List<Object?> get props => [totalCount];
  @override
  Map<String, dynamic> toJson() => _$PullInfoMixin$CommentsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PullInfoMixin$Labels$Nodes extends JsonSerializable
    with EquatableMixin, LabelMixin {
  PullInfoMixin$Labels$Nodes();

  factory PullInfoMixin$Labels$Nodes.fromJson(Map<String, dynamic> json) =>
      _$PullInfoMixin$Labels$NodesFromJson(json);

  @override
  List<Object?> get props => [color, name];
  @override
  Map<String, dynamic> toJson() => _$PullInfoMixin$Labels$NodesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PullInfoMixin$Labels extends JsonSerializable with EquatableMixin {
  PullInfoMixin$Labels();

  factory PullInfoMixin$Labels.fromJson(Map<String, dynamic> json) =>
      _$PullInfoMixin$LabelsFromJson(json);

  List<PullInfoMixin$Labels$Nodes?>? nodes;

  @override
  List<Object?> get props => [nodes];
  @override
  Map<String, dynamic> toJson() => _$PullInfoMixin$LabelsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PullInfoMixin$ReactionGroups extends JsonSerializable
    with EquatableMixin, ReactionGroupsMixin {
  PullInfoMixin$ReactionGroups();

  factory PullInfoMixin$ReactionGroups.fromJson(Map<String, dynamic> json) =>
      _$PullInfoMixin$ReactionGroupsFromJson(json);

  @override
  List<Object?> get props => [content, viewerHasReacted, reactors, subject];
  @override
  Map<String, dynamic> toJson() => _$PullInfoMixin$ReactionGroupsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PullInfoMixin$Repository extends JsonSerializable
    with EquatableMixin, RepoInfoMixin {
  PullInfoMixin$Repository();

  factory PullInfoMixin$Repository.fromJson(Map<String, dynamic> json) =>
      _$PullInfoMixin$RepositoryFromJson(json);

  @override
  List<Object?> get props => [name, owner];
  @override
  Map<String, dynamic> toJson() => _$PullInfoMixin$RepositoryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PullInfoMixin$TimelineItems extends JsonSerializable with EquatableMixin {
  PullInfoMixin$TimelineItems();

  factory PullInfoMixin$TimelineItems.fromJson(Map<String, dynamic> json) =>
      _$PullInfoMixin$TimelineItemsFromJson(json);

  late int totalCount;

  @override
  List<Object?> get props => [totalCount];
  @override
  Map<String, dynamic> toJson() => _$PullInfoMixin$TimelineItemsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PullInfoMixin$UserContentEdits extends JsonSerializable
    with EquatableMixin {
  PullInfoMixin$UserContentEdits();

  factory PullInfoMixin$UserContentEdits.fromJson(Map<String, dynamic> json) =>
      _$PullInfoMixin$UserContentEditsFromJson(json);

  late int totalCount;

  @override
  List<Object?> get props => [totalCount];
  @override
  Map<String, dynamic> toJson() => _$PullInfoMixin$UserContentEditsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PullInfoMixin$BaseRef$Repository extends JsonSerializable
    with EquatableMixin {
  PullInfoMixin$BaseRef$Repository();

  factory PullInfoMixin$BaseRef$Repository.fromJson(
          Map<String, dynamic> json) =>
      _$PullInfoMixin$BaseRef$RepositoryFromJson(json);

  late Uri url;

  @override
  List<Object?> get props => [url];
  @override
  Map<String, dynamic> toJson() =>
      _$PullInfoMixin$BaseRef$RepositoryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PullInfoMixin$BaseRef extends JsonSerializable with EquatableMixin {
  PullInfoMixin$BaseRef();

  factory PullInfoMixin$BaseRef.fromJson(Map<String, dynamic> json) =>
      _$PullInfoMixin$BaseRefFromJson(json);

  late String name;

  late PullInfoMixin$BaseRef$Repository repository;

  @override
  List<Object?> get props => [name, repository];
  @override
  Map<String, dynamic> toJson() => _$PullInfoMixin$BaseRefToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PullInfoMixin$HeadRef$Repository extends JsonSerializable
    with EquatableMixin {
  PullInfoMixin$HeadRef$Repository();

  factory PullInfoMixin$HeadRef$Repository.fromJson(
          Map<String, dynamic> json) =>
      _$PullInfoMixin$HeadRef$RepositoryFromJson(json);

  late Uri url;

  @override
  List<Object?> get props => [url];
  @override
  Map<String, dynamic> toJson() =>
      _$PullInfoMixin$HeadRef$RepositoryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PullInfoMixin$HeadRef extends JsonSerializable with EquatableMixin {
  PullInfoMixin$HeadRef();

  factory PullInfoMixin$HeadRef.fromJson(Map<String, dynamic> json) =>
      _$PullInfoMixin$HeadRefFromJson(json);

  late String name;

  late PullInfoMixin$HeadRef$Repository repository;

  @override
  List<Object?> get props => [name, repository];
  @override
  Map<String, dynamic> toJson() => _$PullInfoMixin$HeadRefToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PullInfoMixin$ClosingIssuesReferences extends JsonSerializable
    with EquatableMixin {
  PullInfoMixin$ClosingIssuesReferences();

  factory PullInfoMixin$ClosingIssuesReferences.fromJson(
          Map<String, dynamic> json) =>
      _$PullInfoMixin$ClosingIssuesReferencesFromJson(json);

  late int totalCount;

  @override
  List<Object?> get props => [totalCount];
  @override
  Map<String, dynamic> toJson() =>
      _$PullInfoMixin$ClosingIssuesReferencesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PullInfoMixin$Commits extends JsonSerializable with EquatableMixin {
  PullInfoMixin$Commits();

  factory PullInfoMixin$Commits.fromJson(Map<String, dynamic> json) =>
      _$PullInfoMixin$CommitsFromJson(json);

  late int totalCount;

  @override
  List<Object?> get props => [totalCount];
  @override
  Map<String, dynamic> toJson() => _$PullInfoMixin$CommitsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetReactors$Query$Node$Issue$ReactionGroups extends JsonSerializable
    with EquatableMixin, ReactorsGroupMixin {
  GetReactors$Query$Node$Issue$ReactionGroups();

  factory GetReactors$Query$Node$Issue$ReactionGroups.fromJson(
          Map<String, dynamic> json) =>
      _$GetReactors$Query$Node$Issue$ReactionGroupsFromJson(json);

  @override
  List<Object?> get props => [content, reactors];
  @override
  Map<String, dynamic> toJson() =>
      _$GetReactors$Query$Node$Issue$ReactionGroupsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetReactors$Query$Node$Issue extends GetReactors$Query$Node
    with EquatableMixin {
  GetReactors$Query$Node$Issue();

  factory GetReactors$Query$Node$Issue.fromJson(Map<String, dynamic> json) =>
      _$GetReactors$Query$Node$IssueFromJson(json);

  List<GetReactors$Query$Node$Issue$ReactionGroups>? reactionGroups;

  @override
  List<Object?> get props => [reactionGroups];
  @override
  Map<String, dynamic> toJson() => _$GetReactors$Query$Node$IssueToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetReactors$Query$Node$PullRequest$ReactionGroups extends JsonSerializable
    with EquatableMixin, ReactorsGroupMixin {
  GetReactors$Query$Node$PullRequest$ReactionGroups();

  factory GetReactors$Query$Node$PullRequest$ReactionGroups.fromJson(
          Map<String, dynamic> json) =>
      _$GetReactors$Query$Node$PullRequest$ReactionGroupsFromJson(json);

  @override
  List<Object?> get props => [content, reactors];
  @override
  Map<String, dynamic> toJson() =>
      _$GetReactors$Query$Node$PullRequest$ReactionGroupsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetReactors$Query$Node$PullRequest extends GetReactors$Query$Node
    with EquatableMixin {
  GetReactors$Query$Node$PullRequest();

  factory GetReactors$Query$Node$PullRequest.fromJson(
          Map<String, dynamic> json) =>
      _$GetReactors$Query$Node$PullRequestFromJson(json);

  List<GetReactors$Query$Node$PullRequest$ReactionGroups>? reactionGroups;

  @override
  List<Object?> get props => [reactionGroups];
  @override
  Map<String, dynamic> toJson() =>
      _$GetReactors$Query$Node$PullRequestToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetReactors$Query$Node extends JsonSerializable with EquatableMixin {
  GetReactors$Query$Node();

  factory GetReactors$Query$Node.fromJson(Map<String, dynamic> json) {
    switch (json['__typename'].toString()) {
      case r'Issue':
        return GetReactors$Query$Node$Issue.fromJson(json);
      case r'PullRequest':
        return GetReactors$Query$Node$PullRequest.fromJson(json);
      default:
    }
    return _$GetReactors$Query$NodeFromJson(json);
  }

  @JsonKey(name: '__typename')
  String? $$typename;

  @override
  List<Object?> get props => [$$typename];
  @override
  Map<String, dynamic> toJson() {
    switch ($$typename) {
      case r'Issue':
        return (this as GetReactors$Query$Node$Issue).toJson();
      case r'PullRequest':
        return (this as GetReactors$Query$Node$PullRequest).toJson();
      default:
    }
    return _$GetReactors$Query$NodeToJson(this);
  }
}

@JsonSerializable(explicitToJson: true)
class GetReactors$Query extends JsonSerializable with EquatableMixin {
  GetReactors$Query();

  factory GetReactors$Query.fromJson(Map<String, dynamic> json) =>
      _$GetReactors$QueryFromJson(json);

  GetReactors$Query$Node? node;

  @override
  List<Object?> get props => [node];
  @override
  Map<String, dynamic> toJson() => _$GetReactors$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ReactorsGroupMixin$Reactors$Edges$Node$User
    extends ReactorsGroupMixin$Reactors$Edges$Node
    with EquatableMixin, ActorMixin {
  ReactorsGroupMixin$Reactors$Edges$Node$User();

  factory ReactorsGroupMixin$Reactors$Edges$Node$User.fromJson(
          Map<String, dynamic> json) =>
      _$ReactorsGroupMixin$Reactors$Edges$Node$UserFromJson(json);

  @override
  List<Object?> get props => [avatarUrl, login];
  @override
  Map<String, dynamic> toJson() =>
      _$ReactorsGroupMixin$Reactors$Edges$Node$UserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ReactorsGroupMixin$Reactors$Edges$Node extends JsonSerializable
    with EquatableMixin {
  ReactorsGroupMixin$Reactors$Edges$Node();

  factory ReactorsGroupMixin$Reactors$Edges$Node.fromJson(
      Map<String, dynamic> json) {
    switch (json['__typename'].toString()) {
      case r'User':
        return ReactorsGroupMixin$Reactors$Edges$Node$User.fromJson(json);
      default:
    }
    return _$ReactorsGroupMixin$Reactors$Edges$NodeFromJson(json);
  }

  @JsonKey(name: '__typename')
  String? $$typename;

  @override
  List<Object?> get props => [$$typename];
  @override
  Map<String, dynamic> toJson() {
    switch ($$typename) {
      case r'User':
        return (this as ReactorsGroupMixin$Reactors$Edges$Node$User).toJson();
      default:
    }
    return _$ReactorsGroupMixin$Reactors$Edges$NodeToJson(this);
  }
}

@JsonSerializable(explicitToJson: true)
class ReactorsGroupMixin$Reactors$Edges extends JsonSerializable
    with EquatableMixin {
  ReactorsGroupMixin$Reactors$Edges();

  factory ReactorsGroupMixin$Reactors$Edges.fromJson(
          Map<String, dynamic> json) =>
      _$ReactorsGroupMixin$Reactors$EdgesFromJson(json);

  late String cursor;

  late ReactorsGroupMixin$Reactors$Edges$Node node;

  @override
  List<Object?> get props => [cursor, node];
  @override
  Map<String, dynamic> toJson() =>
      _$ReactorsGroupMixin$Reactors$EdgesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ReactorsGroupMixin$Reactors extends JsonSerializable with EquatableMixin {
  ReactorsGroupMixin$Reactors();

  factory ReactorsGroupMixin$Reactors.fromJson(Map<String, dynamic> json) =>
      _$ReactorsGroupMixin$ReactorsFromJson(json);

  List<ReactorsGroupMixin$Reactors$Edges?>? edges;

  @override
  List<Object?> get props => [edges];
  @override
  Map<String, dynamic> toJson() => _$ReactorsGroupMixin$ReactorsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AddReaction$Mutation$AddReaction$Reaction extends JsonSerializable
    with EquatableMixin {
  AddReaction$Mutation$AddReaction$Reaction();

  factory AddReaction$Mutation$AddReaction$Reaction.fromJson(
          Map<String, dynamic> json) =>
      _$AddReaction$Mutation$AddReaction$ReactionFromJson(json);

  late DateTime createdAt;

  @override
  List<Object?> get props => [createdAt];
  @override
  Map<String, dynamic> toJson() =>
      _$AddReaction$Mutation$AddReaction$ReactionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AddReaction$Mutation$AddReaction extends JsonSerializable
    with EquatableMixin {
  AddReaction$Mutation$AddReaction();

  factory AddReaction$Mutation$AddReaction.fromJson(
          Map<String, dynamic> json) =>
      _$AddReaction$Mutation$AddReactionFromJson(json);

  AddReaction$Mutation$AddReaction$Reaction? reaction;

  @override
  List<Object?> get props => [reaction];
  @override
  Map<String, dynamic> toJson() =>
      _$AddReaction$Mutation$AddReactionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AddReaction$Mutation extends JsonSerializable with EquatableMixin {
  AddReaction$Mutation();

  factory AddReaction$Mutation.fromJson(Map<String, dynamic> json) =>
      _$AddReaction$MutationFromJson(json);

  AddReaction$Mutation$AddReaction? addReaction;

  @override
  List<Object?> get props => [addReaction];
  @override
  Map<String, dynamic> toJson() => _$AddReaction$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RemoveReaction$Mutation$RemoveReaction$Reaction extends JsonSerializable
    with EquatableMixin {
  RemoveReaction$Mutation$RemoveReaction$Reaction();

  factory RemoveReaction$Mutation$RemoveReaction$Reaction.fromJson(
          Map<String, dynamic> json) =>
      _$RemoveReaction$Mutation$RemoveReaction$ReactionFromJson(json);

  late DateTime createdAt;

  @override
  List<Object?> get props => [createdAt];
  @override
  Map<String, dynamic> toJson() =>
      _$RemoveReaction$Mutation$RemoveReaction$ReactionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RemoveReaction$Mutation$RemoveReaction extends JsonSerializable
    with EquatableMixin {
  RemoveReaction$Mutation$RemoveReaction();

  factory RemoveReaction$Mutation$RemoveReaction.fromJson(
          Map<String, dynamic> json) =>
      _$RemoveReaction$Mutation$RemoveReactionFromJson(json);

  RemoveReaction$Mutation$RemoveReaction$Reaction? reaction;

  @override
  List<Object?> get props => [reaction];
  @override
  Map<String, dynamic> toJson() =>
      _$RemoveReaction$Mutation$RemoveReactionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class RemoveReaction$Mutation extends JsonSerializable with EquatableMixin {
  RemoveReaction$Mutation();

  factory RemoveReaction$Mutation.fromJson(Map<String, dynamic> json) =>
      _$RemoveReaction$MutationFromJson(json);

  RemoveReaction$Mutation$RemoveReaction? removeReaction;

  @override
  List<Object?> get props => [removeReaction];
  @override
  Map<String, dynamic> toJson() => _$RemoveReaction$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class IssuePullAssignees$Query$Repository$IssueOrPullRequest$Issue
    extends IssuePullAssignees$Query$Repository$IssueOrPullRequest
    with EquatableMixin, AssigneeUserListMixin {
  IssuePullAssignees$Query$Repository$IssueOrPullRequest$Issue();

  factory IssuePullAssignees$Query$Repository$IssueOrPullRequest$Issue.fromJson(
          Map<String, dynamic> json) =>
      _$IssuePullAssignees$Query$Repository$IssueOrPullRequest$IssueFromJson(
          json);

  @override
  List<Object?> get props => [assignees];
  @override
  Map<String, dynamic> toJson() =>
      _$IssuePullAssignees$Query$Repository$IssueOrPullRequest$IssueToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class IssuePullAssignees$Query$Repository$IssueOrPullRequest$PullRequest
    extends IssuePullAssignees$Query$Repository$IssueOrPullRequest
    with EquatableMixin, AssigneeUserListMixin {
  IssuePullAssignees$Query$Repository$IssueOrPullRequest$PullRequest();

  factory IssuePullAssignees$Query$Repository$IssueOrPullRequest$PullRequest.fromJson(
          Map<String, dynamic> json) =>
      _$IssuePullAssignees$Query$Repository$IssueOrPullRequest$PullRequestFromJson(
          json);

  @override
  List<Object?> get props => [assignees];
  @override
  Map<String, dynamic> toJson() =>
      _$IssuePullAssignees$Query$Repository$IssueOrPullRequest$PullRequestToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class IssuePullAssignees$Query$Repository$IssueOrPullRequest
    extends JsonSerializable with EquatableMixin {
  IssuePullAssignees$Query$Repository$IssueOrPullRequest();

  factory IssuePullAssignees$Query$Repository$IssueOrPullRequest.fromJson(
      Map<String, dynamic> json) {
    switch (json['__typename'].toString()) {
      case r'Issue':
        return IssuePullAssignees$Query$Repository$IssueOrPullRequest$Issue
            .fromJson(json);
      case r'PullRequest':
        return IssuePullAssignees$Query$Repository$IssueOrPullRequest$PullRequest
            .fromJson(json);
      default:
    }
    return _$IssuePullAssignees$Query$Repository$IssueOrPullRequestFromJson(
        json);
  }

  @JsonKey(name: '__typename')
  String? $$typename;

  @override
  List<Object?> get props => [$$typename];
  @override
  Map<String, dynamic> toJson() {
    switch ($$typename) {
      case r'Issue':
        return (this
                as IssuePullAssignees$Query$Repository$IssueOrPullRequest$Issue)
            .toJson();
      case r'PullRequest':
        return (this
                as IssuePullAssignees$Query$Repository$IssueOrPullRequest$PullRequest)
            .toJson();
      default:
    }
    return _$IssuePullAssignees$Query$Repository$IssueOrPullRequestToJson(this);
  }
}

@JsonSerializable(explicitToJson: true)
class IssuePullAssignees$Query$Repository extends JsonSerializable
    with EquatableMixin {
  IssuePullAssignees$Query$Repository();

  factory IssuePullAssignees$Query$Repository.fromJson(
          Map<String, dynamic> json) =>
      _$IssuePullAssignees$Query$RepositoryFromJson(json);

  IssuePullAssignees$Query$Repository$IssueOrPullRequest? issueOrPullRequest;

  @override
  List<Object?> get props => [issueOrPullRequest];
  @override
  Map<String, dynamic> toJson() =>
      _$IssuePullAssignees$Query$RepositoryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class IssuePullAssignees$Query extends JsonSerializable with EquatableMixin {
  IssuePullAssignees$Query();

  factory IssuePullAssignees$Query.fromJson(Map<String, dynamic> json) =>
      _$IssuePullAssignees$QueryFromJson(json);

  IssuePullAssignees$Query$Repository? repository;

  @override
  List<Object?> get props => [repository];
  @override
  Map<String, dynamic> toJson() => _$IssuePullAssignees$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AssigneeUserListMixin$Assignees$Edges$Node extends JsonSerializable
    with EquatableMixin, ActorMixin {
  AssigneeUserListMixin$Assignees$Edges$Node();

  factory AssigneeUserListMixin$Assignees$Edges$Node.fromJson(
          Map<String, dynamic> json) =>
      _$AssigneeUserListMixin$Assignees$Edges$NodeFromJson(json);

  @override
  List<Object?> get props => [avatarUrl, login];
  @override
  Map<String, dynamic> toJson() =>
      _$AssigneeUserListMixin$Assignees$Edges$NodeToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AssigneeUserListMixin$Assignees$Edges extends JsonSerializable
    with EquatableMixin {
  AssigneeUserListMixin$Assignees$Edges();

  factory AssigneeUserListMixin$Assignees$Edges.fromJson(
          Map<String, dynamic> json) =>
      _$AssigneeUserListMixin$Assignees$EdgesFromJson(json);

  late String cursor;

  AssigneeUserListMixin$Assignees$Edges$Node? node;

  @override
  List<Object?> get props => [cursor, node];
  @override
  Map<String, dynamic> toJson() =>
      _$AssigneeUserListMixin$Assignees$EdgesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AssigneeUserListMixin$Assignees extends JsonSerializable
    with EquatableMixin {
  AssigneeUserListMixin$Assignees();

  factory AssigneeUserListMixin$Assignees.fromJson(Map<String, dynamic> json) =>
      _$AssigneeUserListMixin$AssigneesFromJson(json);

  List<AssigneeUserListMixin$Assignees$Edges?>? edges;

  @override
  List<Object?> get props => [edges];
  @override
  Map<String, dynamic> toJson() =>
      _$AssigneeUserListMixin$AssigneesToJson(this);
}

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
  @override
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
  @override
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
  @override
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
  @override
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
  @override
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
  @override
  Map<String, dynamic> toJson() => _$SearchMentionUsers$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$Owner
    extends JsonSerializable with EquatableMixin {
  GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$Owner();

  factory GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$Owner.fromJson(
          Map<String, dynamic> json) =>
      _$GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$OwnerFromJson(
          json);

  late String login;

  @override
  List<Object?> get props => [login];
  @override
  Map<String, dynamic> toJson() =>
      _$GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$OwnerToJson(
          this);
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
  @override
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
  @override
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
  @override
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

  late GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$Owner
      owner;

  GetUserPinnedRepos$Query$User$PinnedItems$Edges$Node$Repository$Languages?
      languages;

  @override
  List<Object?> get props =>
      [name, description, stargazerCount, updatedAt, url, owner, languages];
  @override
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
  @override
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
  @override
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
  @override
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
  @override
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
  @override
  Map<String, dynamic> toJson() => _$GetUserPinnedRepos$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class FollowStatusInfo$Query$User$Followers extends JsonSerializable
    with EquatableMixin {
  FollowStatusInfo$Query$User$Followers();

  factory FollowStatusInfo$Query$User$Followers.fromJson(
          Map<String, dynamic> json) =>
      _$FollowStatusInfo$Query$User$FollowersFromJson(json);

  late int totalCount;

  @override
  List<Object?> get props => [totalCount];
  @override
  Map<String, dynamic> toJson() =>
      _$FollowStatusInfo$Query$User$FollowersToJson(this);
}

@JsonSerializable(explicitToJson: true)
class FollowStatusInfo$Query$User extends JsonSerializable with EquatableMixin {
  FollowStatusInfo$Query$User();

  factory FollowStatusInfo$Query$User.fromJson(Map<String, dynamic> json) =>
      _$FollowStatusInfo$Query$UserFromJson(json);

  late String id;

  late bool viewerIsFollowing;

  late bool viewerCanFollow;

  late FollowStatusInfo$Query$User$Followers followers;

  @override
  List<Object?> get props =>
      [id, viewerIsFollowing, viewerCanFollow, followers];
  @override
  Map<String, dynamic> toJson() => _$FollowStatusInfo$Query$UserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class FollowStatusInfo$Query extends JsonSerializable with EquatableMixin {
  FollowStatusInfo$Query();

  factory FollowStatusInfo$Query.fromJson(Map<String, dynamic> json) =>
      _$FollowStatusInfo$QueryFromJson(json);

  FollowStatusInfo$Query$User? user;

  @override
  List<Object?> get props => [user];
  @override
  Map<String, dynamic> toJson() => _$FollowStatusInfo$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class FollowUser$Mutation$FollowUser$User extends JsonSerializable
    with EquatableMixin {
  FollowUser$Mutation$FollowUser$User();

  factory FollowUser$Mutation$FollowUser$User.fromJson(
          Map<String, dynamic> json) =>
      _$FollowUser$Mutation$FollowUser$UserFromJson(json);

  late String login;

  @override
  List<Object?> get props => [login];
  @override
  Map<String, dynamic> toJson() =>
      _$FollowUser$Mutation$FollowUser$UserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class FollowUser$Mutation$FollowUser extends JsonSerializable
    with EquatableMixin {
  FollowUser$Mutation$FollowUser();

  factory FollowUser$Mutation$FollowUser.fromJson(Map<String, dynamic> json) =>
      _$FollowUser$Mutation$FollowUserFromJson(json);

  FollowUser$Mutation$FollowUser$User? user;

  @override
  List<Object?> get props => [user];
  @override
  Map<String, dynamic> toJson() => _$FollowUser$Mutation$FollowUserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class FollowUser$Mutation extends JsonSerializable with EquatableMixin {
  FollowUser$Mutation();

  factory FollowUser$Mutation.fromJson(Map<String, dynamic> json) =>
      _$FollowUser$MutationFromJson(json);

  FollowUser$Mutation$FollowUser? followUser;

  @override
  List<Object?> get props => [followUser];
  @override
  Map<String, dynamic> toJson() => _$FollowUser$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UnfollowUser$Mutation$UnfollowUser$User extends JsonSerializable
    with EquatableMixin {
  UnfollowUser$Mutation$UnfollowUser$User();

  factory UnfollowUser$Mutation$UnfollowUser$User.fromJson(
          Map<String, dynamic> json) =>
      _$UnfollowUser$Mutation$UnfollowUser$UserFromJson(json);

  late String login;

  @override
  List<Object?> get props => [login];
  @override
  Map<String, dynamic> toJson() =>
      _$UnfollowUser$Mutation$UnfollowUser$UserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UnfollowUser$Mutation$UnfollowUser extends JsonSerializable
    with EquatableMixin {
  UnfollowUser$Mutation$UnfollowUser();

  factory UnfollowUser$Mutation$UnfollowUser.fromJson(
          Map<String, dynamic> json) =>
      _$UnfollowUser$Mutation$UnfollowUserFromJson(json);

  UnfollowUser$Mutation$UnfollowUser$User? user;

  @override
  List<Object?> get props => [user];
  @override
  Map<String, dynamic> toJson() =>
      _$UnfollowUser$Mutation$UnfollowUserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UnfollowUser$Mutation extends JsonSerializable with EquatableMixin {
  UnfollowUser$Mutation();

  factory UnfollowUser$Mutation.fromJson(Map<String, dynamic> json) =>
      _$UnfollowUser$MutationFromJson(json);

  UnfollowUser$Mutation$UnfollowUser? unfollowUser;

  @override
  List<Object?> get props => [unfollowUser];
  @override
  Map<String, dynamic> toJson() => _$UnfollowUser$MutationToJson(this);
}

enum ProjectState {
  @JsonValue('CLOSED')
  closed,
  @JsonValue('OPEN')
  open,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}

enum ProjectOrderField {
  @JsonValue('CREATED_AT')
  createdAt,
  @JsonValue('NAME')
  name,
  @JsonValue('UPDATED_AT')
  updatedAt,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}

enum OrderDirection {
  @JsonValue('ASC')
  asc,
  @JsonValue('DESC')
  desc,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}

enum ProjectCardArchivedState {
  @JsonValue('ARCHIVED')
  archived,
  @JsonValue('NOT_ARCHIVED')
  notArchived,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}

enum IssueState {
  @JsonValue('CLOSED')
  closed,
  @JsonValue('OPEN')
  open,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}

enum SubscriptionState {
  @JsonValue('IGNORED')
  ignored,
  @JsonValue('SUBSCRIBED')
  subscribed,
  @JsonValue('UNSUBSCRIBED')
  unsubscribed,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}

enum PullRequestState {
  @JsonValue('CLOSED')
  closed,
  @JsonValue('MERGED')
  merged,
  @JsonValue('OPEN')
  open,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}

enum CommentAuthorAssociation {
  @JsonValue('COLLABORATOR')
  collaborator,
  @JsonValue('CONTRIBUTOR')
  contributor,
  @JsonValue('FIRST_TIMER')
  firstTimer,
  @JsonValue('FIRST_TIME_CONTRIBUTOR')
  firstTimeContributor,
  @JsonValue('MANNEQUIN')
  mannequin,
  @JsonValue('MEMBER')
  member,
  @JsonValue('NONE')
  none,
  @JsonValue('OWNER')
  owner,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}

enum CommentCannotUpdateReason {
  @JsonValue('ARCHIVED')
  archived,
  @JsonValue('DENIED')
  denied,
  @JsonValue('INSUFFICIENT_ACCESS')
  insufficientAccess,
  @JsonValue('LOCKED')
  locked,
  @JsonValue('LOGIN_REQUIRED')
  loginRequired,
  @JsonValue('MAINTENANCE')
  maintenance,
  @JsonValue('VERIFIED_EMAIL_REQUIRED')
  verifiedEmailRequired,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}

enum ReactionContent {
  @JsonValue('CONFUSED')
  confused,
  @JsonValue('EYES')
  eyes,
  @JsonValue('HEART')
  heart,
  @JsonValue('HOORAY')
  hooray,
  @JsonValue('LAUGH')
  laugh,
  @JsonValue('ROCKET')
  rocket,
  @JsonValue('THUMBS_DOWN')
  thumbsDown,
  @JsonValue('THUMBS_UP')
  thumbsUp,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}

enum LockReason {
  @JsonValue('OFF_TOPIC')
  offTopic,
  @JsonValue('RESOLVED')
  resolved,
  @JsonValue('SPAM')
  spam,
  @JsonValue('TOO_HEATED')
  tooHeated,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}

enum PullRequestReviewState {
  @JsonValue('APPROVED')
  approved,
  @JsonValue('CHANGES_REQUESTED')
  changesRequested,
  @JsonValue('COMMENTED')
  commented,
  @JsonValue('DISMISSED')
  dismissed,
  @JsonValue('PENDING')
  pending,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}

enum PullRequestReviewCommentState {
  @JsonValue('PENDING')
  pending,
  @JsonValue('SUBMITTED')
  submitted,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}

enum PullRequestReviewDecision {
  @JsonValue('APPROVED')
  approved,
  @JsonValue('CHANGES_REQUESTED')
  changesRequested,
  @JsonValue('REVIEW_REQUIRED')
  reviewRequired,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}

@JsonSerializable(explicitToJson: true)
class GetRepoProjectsArguments extends JsonSerializable with EquatableMixin {
  GetRepoProjectsArguments({
    required this.name,
    required this.owner,
    this.cursor,
    this.query,
    this.states,
    required this.orderByField,
    required this.orderByDir,
  });

  @override
  factory GetRepoProjectsArguments.fromJson(Map<String, dynamic> json) =>
      _$GetRepoProjectsArgumentsFromJson(json);

  late String name;

  late String owner;

  final String? cursor;

  final String? query;

  @JsonKey(unknownEnumValue: ProjectState.artemisUnknown)
  final List<ProjectState>? states;

  @JsonKey(unknownEnumValue: ProjectOrderField.artemisUnknown)
  late ProjectOrderField orderByField;

  @JsonKey(unknownEnumValue: OrderDirection.artemisUnknown)
  late OrderDirection orderByDir;

  @override
  List<Object?> get props =>
      [name, owner, cursor, query, states, orderByField, orderByDir];
  @override
  Map<String, dynamic> toJson() => _$GetRepoProjectsArgumentsToJson(this);
}

final GET_REPO_PROJECTS_QUERY_DOCUMENT_OPERATION_NAME = 'getRepoProjects';
final GET_REPO_PROJECTS_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getRepoProjects'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'name')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'owner')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'cursor')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'query')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'states')),
        type: ListTypeNode(
          type: NamedTypeNode(
            name: NameNode(value: 'ProjectState'),
            isNonNull: true,
          ),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'orderByField')),
        type: NamedTypeNode(
          name: NameNode(value: 'ProjectOrderField'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'orderByDir')),
        type: NamedTypeNode(
          name: NameNode(value: 'OrderDirection'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'repository'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'name'),
            value: VariableNode(name: NameNode(value: 'name')),
          ),
          ArgumentNode(
            name: NameNode(value: 'owner'),
            value: VariableNode(name: NameNode(value: 'owner')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'projects'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'first'),
                value: IntValueNode(value: '10'),
              ),
              ArgumentNode(
                name: NameNode(value: 'after'),
                value: VariableNode(name: NameNode(value: 'cursor')),
              ),
              ArgumentNode(
                name: NameNode(value: 'search'),
                value: VariableNode(name: NameNode(value: 'query')),
              ),
              ArgumentNode(
                name: NameNode(value: 'states'),
                value: VariableNode(name: NameNode(value: 'states')),
              ),
              ArgumentNode(
                name: NameNode(value: 'orderBy'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: 'field'),
                    value: VariableNode(name: NameNode(value: 'orderByField')),
                  ),
                  ObjectFieldNode(
                    name: NameNode(value: 'direction'),
                    value: VariableNode(name: NameNode(value: 'orderByDir')),
                  ),
                ]),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'totalCount'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'edges'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'cursor'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'node'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FragmentSpreadNode(
                        name: NameNode(value: 'project'),
                        directives: [],
                      )
                    ]),
                  ),
                ]),
              ),
            ]),
          )
        ]),
      )
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'project'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'Project'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'name'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'databaseId'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'updatedAt'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'number'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'bodyHTML'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'body'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'closed'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'progress'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'donePercentage'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          )
        ]),
      ),
    ]),
  ),
]);

class GetRepoProjectsQuery
    extends GraphQLQuery<GetRepoProjects$Query, GetRepoProjectsArguments> {
  GetRepoProjectsQuery({required this.variables});

  @override
  final DocumentNode document = GET_REPO_PROJECTS_QUERY_DOCUMENT;

  @override
  final String operationName = GET_REPO_PROJECTS_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  final GetRepoProjectsArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  GetRepoProjects$Query parse(Map<String, dynamic> json) =>
      GetRepoProjects$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class GetProjectInfoArguments extends JsonSerializable with EquatableMixin {
  GetProjectInfoArguments({required this.id});

  @override
  factory GetProjectInfoArguments.fromJson(Map<String, dynamic> json) =>
      _$GetProjectInfoArgumentsFromJson(json);

  late String id;

  @override
  List<Object?> get props => [id];
  @override
  Map<String, dynamic> toJson() => _$GetProjectInfoArgumentsToJson(this);
}

final GET_PROJECT_INFO_QUERY_DOCUMENT_OPERATION_NAME = 'getProjectInfo';
final GET_PROJECT_INFO_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getProjectInfo'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'node'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'id')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          InlineFragmentNode(
            typeCondition: TypeConditionNode(
                on: NamedTypeNode(
              name: NameNode(value: 'Project'),
              isNonNull: false,
            )),
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(
                name: NameNode(value: 'project'),
                directives: [],
              )
            ]),
          ),
        ]),
      )
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'project'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'Project'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'name'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'databaseId'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'updatedAt'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'number'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'bodyHTML'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'body'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'closed'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'progress'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'donePercentage'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          )
        ]),
      ),
    ]),
  ),
]);

class GetProjectInfoQuery
    extends GraphQLQuery<GetProjectInfo$Query, GetProjectInfoArguments> {
  GetProjectInfoQuery({required this.variables});

  @override
  final DocumentNode document = GET_PROJECT_INFO_QUERY_DOCUMENT;

  @override
  final String operationName = GET_PROJECT_INFO_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  final GetProjectInfoArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  GetProjectInfo$Query parse(Map<String, dynamic> json) =>
      GetProjectInfo$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class GetProjectColumnsArguments extends JsonSerializable with EquatableMixin {
  GetProjectColumnsArguments({
    required this.id,
    this.cursor,
  });

  @override
  factory GetProjectColumnsArguments.fromJson(Map<String, dynamic> json) =>
      _$GetProjectColumnsArgumentsFromJson(json);

  late String id;

  final String? cursor;

  @override
  List<Object?> get props => [id, cursor];
  @override
  Map<String, dynamic> toJson() => _$GetProjectColumnsArgumentsToJson(this);
}

final GET_PROJECT_COLUMNS_QUERY_DOCUMENT_OPERATION_NAME = 'getProjectColumns';
final GET_PROJECT_COLUMNS_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getProjectColumns'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'cursor')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'node'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'id')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          InlineFragmentNode(
            typeCondition: TypeConditionNode(
                on: NamedTypeNode(
              name: NameNode(value: 'Project'),
              isNonNull: false,
            )),
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'columns'),
                alias: null,
                arguments: [
                  ArgumentNode(
                    name: NameNode(value: 'first'),
                    value: IntValueNode(value: '10'),
                  ),
                  ArgumentNode(
                    name: NameNode(value: 'after'),
                    value: VariableNode(name: NameNode(value: 'cursor')),
                  ),
                ],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'totalCount'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'edges'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                        name: NameNode(value: 'cursor'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'node'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: SelectionSetNode(selections: [
                          FieldNode(
                            name: NameNode(value: 'name'),
                            alias: null,
                            arguments: [],
                            directives: [],
                            selectionSet: null,
                          ),
                          FieldNode(
                            name: NameNode(value: 'id'),
                            alias: null,
                            arguments: [],
                            directives: [],
                            selectionSet: null,
                          ),
                          FieldNode(
                            name: NameNode(value: 'updatedAt'),
                            alias: null,
                            arguments: [],
                            directives: [],
                            selectionSet: null,
                          ),
                        ]),
                      ),
                    ]),
                  ),
                ]),
              )
            ]),
          ),
        ]),
      )
    ]),
  )
]);

class GetProjectColumnsQuery
    extends GraphQLQuery<GetProjectColumns$Query, GetProjectColumnsArguments> {
  GetProjectColumnsQuery({required this.variables});

  @override
  final DocumentNode document = GET_PROJECT_COLUMNS_QUERY_DOCUMENT;

  @override
  final String operationName =
      GET_PROJECT_COLUMNS_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  final GetProjectColumnsArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  GetProjectColumns$Query parse(Map<String, dynamic> json) =>
      GetProjectColumns$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class GetProjectColumnCardsArguments extends JsonSerializable
    with EquatableMixin {
  GetProjectColumnCardsArguments({
    required this.id,
    this.cursor,
    this.archiveStates,
  });

  @override
  factory GetProjectColumnCardsArguments.fromJson(Map<String, dynamic> json) =>
      _$GetProjectColumnCardsArgumentsFromJson(json);

  late String id;

  final String? cursor;

  @JsonKey(unknownEnumValue: ProjectCardArchivedState.artemisUnknown)
  final List<ProjectCardArchivedState>? archiveStates;

  @override
  List<Object?> get props => [id, cursor, archiveStates];
  @override
  Map<String, dynamic> toJson() => _$GetProjectColumnCardsArgumentsToJson(this);
}

final GET_PROJECT_COLUMN_CARDS_QUERY_DOCUMENT_OPERATION_NAME =
    'getProjectColumnCards';
final GET_PROJECT_COLUMN_CARDS_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getProjectColumnCards'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'cursor')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'archiveStates')),
        type: ListTypeNode(
          type: NamedTypeNode(
            name: NameNode(value: 'ProjectCardArchivedState'),
            isNonNull: true,
          ),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'node'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'id')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          InlineFragmentNode(
            typeCondition: TypeConditionNode(
                on: NamedTypeNode(
              name: NameNode(value: 'ProjectColumn'),
              isNonNull: false,
            )),
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'cards'),
                alias: null,
                arguments: [
                  ArgumentNode(
                    name: NameNode(value: 'first'),
                    value: IntValueNode(value: '10'),
                  ),
                  ArgumentNode(
                    name: NameNode(value: 'archivedStates'),
                    value: VariableNode(name: NameNode(value: 'archiveStates')),
                  ),
                  ArgumentNode(
                    name: NameNode(value: 'after'),
                    value: VariableNode(name: NameNode(value: 'cursor')),
                  ),
                ],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'totalCount'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'edges'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                        name: NameNode(value: 'cursor'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'node'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: SelectionSetNode(selections: [
                          FieldNode(
                            name: NameNode(value: 'note'),
                            alias: null,
                            arguments: [],
                            directives: [],
                            selectionSet: null,
                          ),
                          FieldNode(
                            name: NameNode(value: 'content'),
                            alias: null,
                            arguments: [],
                            directives: [],
                            selectionSet: SelectionSetNode(selections: [
                              FieldNode(
                                name: NameNode(value: '__typename'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null,
                              ),
                              InlineFragmentNode(
                                typeCondition: TypeConditionNode(
                                    on: NamedTypeNode(
                                  name: NameNode(value: 'Issue'),
                                  isNonNull: false,
                                )),
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  FieldNode(
                                    name: NameNode(value: 'bodyHTML'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null,
                                  ),
                                  FieldNode(
                                    name: NameNode(value: 'title'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null,
                                  ),
                                  FieldNode(
                                    name: NameNode(value: 'number'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null,
                                  ),
                                ]),
                              ),
                            ]),
                          ),
                        ]),
                      ),
                    ]),
                  ),
                ]),
              )
            ]),
          ),
        ]),
      )
    ]),
  )
]);

class GetProjectColumnCardsQuery extends GraphQLQuery<
    GetProjectColumnCards$Query, GetProjectColumnCardsArguments> {
  GetProjectColumnCardsQuery({required this.variables});

  @override
  final DocumentNode document = GET_PROJECT_COLUMN_CARDS_QUERY_DOCUMENT;

  @override
  final String operationName =
      GET_PROJECT_COLUMN_CARDS_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  final GetProjectColumnCardsArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  GetProjectColumnCards$Query parse(Map<String, dynamic> json) =>
      GetProjectColumnCards$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class IssueTemplatesArguments extends JsonSerializable with EquatableMixin {
  IssueTemplatesArguments({
    required this.name,
    required this.owner,
  });

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

final ISSUE_TEMPLATES_QUERY_DOCUMENT_OPERATION_NAME = 'issueTemplates';
final ISSUE_TEMPLATES_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'issueTemplates'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'name')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'owner')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'repository'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'name'),
            value: VariableNode(name: NameNode(value: 'name')),
          ),
          ArgumentNode(
            name: NameNode(value: 'owner'),
            value: VariableNode(name: NameNode(value: 'owner')),
          ),
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
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'title'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'body'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'about'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          )
        ]),
      )
    ]),
  )
]);

class IssueTemplatesQuery
    extends GraphQLQuery<IssueTemplates$Query, IssueTemplatesArguments> {
  IssueTemplatesQuery({required this.variables});

  @override
  final DocumentNode document = ISSUE_TEMPLATES_QUERY_DOCUMENT;

  @override
  final String operationName = ISSUE_TEMPLATES_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  final IssueTemplatesArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  IssueTemplates$Query parse(Map<String, dynamic> json) =>
      IssueTemplates$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class PinnedIssuesArguments extends JsonSerializable with EquatableMixin {
  PinnedIssuesArguments({
    required this.name,
    required this.owner,
  });

  @override
  factory PinnedIssuesArguments.fromJson(Map<String, dynamic> json) =>
      _$PinnedIssuesArgumentsFromJson(json);

  late String name;

  late String owner;

  @override
  List<Object?> get props => [name, owner];
  @override
  Map<String, dynamic> toJson() => _$PinnedIssuesArgumentsToJson(this);
}

final PINNED_ISSUES_QUERY_DOCUMENT_OPERATION_NAME = 'pinnedIssues';
final PINNED_ISSUES_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'pinnedIssues'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'name')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'owner')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'repository'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'name'),
            value: VariableNode(name: NameNode(value: 'name')),
          ),
          ArgumentNode(
            name: NameNode(value: 'owner'),
            value: VariableNode(name: NameNode(value: 'owner')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'pinnedIssues'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'first'),
                value: IntValueNode(value: '3'),
              )
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'totalCount'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'nodes'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'issue'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FragmentSpreadNode(
                        name: NameNode(value: 'issue'),
                        directives: [],
                      )
                    ]),
                  )
                ]),
              ),
            ]),
          )
        ]),
      )
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'issue'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'Issue'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'url'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'title'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'number'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'state'),
        alias: NameNode(value: 'issueState'),
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'repository'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'name'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'nameWithOwner'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
    ]),
  ),
]);

class PinnedIssuesQuery
    extends GraphQLQuery<PinnedIssues$Query, PinnedIssuesArguments> {
  PinnedIssuesQuery({required this.variables});

  @override
  final DocumentNode document = PINNED_ISSUES_QUERY_DOCUMENT;

  @override
  final String operationName = PINNED_ISSUES_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  final PinnedIssuesArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  PinnedIssues$Query parse(Map<String, dynamic> json) =>
      PinnedIssues$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class HasStarredArguments extends JsonSerializable with EquatableMixin {
  HasStarredArguments({
    required this.name,
    required this.owner,
  });

  @override
  factory HasStarredArguments.fromJson(Map<String, dynamic> json) =>
      _$HasStarredArgumentsFromJson(json);

  late String name;

  late String owner;

  @override
  List<Object?> get props => [name, owner];
  @override
  Map<String, dynamic> toJson() => _$HasStarredArgumentsToJson(this);
}

final HAS_STARRED_QUERY_DOCUMENT_OPERATION_NAME = 'hasStarred';
final HAS_STARRED_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'hasStarred'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'name')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'owner')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'repository'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'name'),
            value: VariableNode(name: NameNode(value: 'name')),
          ),
          ArgumentNode(
            name: NameNode(value: 'owner'),
            value: VariableNode(name: NameNode(value: 'owner')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'viewerHasStarred'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'stargazerCount'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      )
    ]),
  )
]);

class HasStarredQuery
    extends GraphQLQuery<HasStarred$Query, HasStarredArguments> {
  HasStarredQuery({required this.variables});

  @override
  final DocumentNode document = HAS_STARRED_QUERY_DOCUMENT;

  @override
  final String operationName = HAS_STARRED_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  final HasStarredArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  HasStarred$Query parse(Map<String, dynamic> json) =>
      HasStarred$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class HasWatchedArguments extends JsonSerializable with EquatableMixin {
  HasWatchedArguments({
    required this.name,
    required this.owner,
  });

  @override
  factory HasWatchedArguments.fromJson(Map<String, dynamic> json) =>
      _$HasWatchedArgumentsFromJson(json);

  late String name;

  late String owner;

  @override
  List<Object?> get props => [name, owner];
  @override
  Map<String, dynamic> toJson() => _$HasWatchedArgumentsToJson(this);
}

final HAS_WATCHED_QUERY_DOCUMENT_OPERATION_NAME = 'hasWatched';
final HAS_WATCHED_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'hasWatched'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'name')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'owner')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'repository'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'name'),
            value: VariableNode(name: NameNode(value: 'name')),
          ),
          ArgumentNode(
            name: NameNode(value: 'owner'),
            value: VariableNode(name: NameNode(value: 'owner')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'viewerSubscription'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'viewerCanSubscribe'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'watchers'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'totalCount'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              )
            ]),
          ),
        ]),
      )
    ]),
  )
]);

class HasWatchedQuery
    extends GraphQLQuery<HasWatched$Query, HasWatchedArguments> {
  HasWatchedQuery({required this.variables});

  @override
  final DocumentNode document = HAS_WATCHED_QUERY_DOCUMENT;

  @override
  final String operationName = HAS_WATCHED_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  final HasWatchedArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  HasWatched$Query parse(Map<String, dynamic> json) =>
      HasWatched$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class GetViewerOrgsArguments extends JsonSerializable with EquatableMixin {
  GetViewerOrgsArguments({this.cursor});

  @override
  factory GetViewerOrgsArguments.fromJson(Map<String, dynamic> json) =>
      _$GetViewerOrgsArgumentsFromJson(json);

  final String? cursor;

  @override
  List<Object?> get props => [cursor];
  @override
  Map<String, dynamic> toJson() => _$GetViewerOrgsArgumentsToJson(this);
}

final GET_VIEWER_ORGS_QUERY_DOCUMENT_OPERATION_NAME = 'getViewerOrgs';
final GET_VIEWER_ORGS_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getViewerOrgs'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'cursor')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'viewer'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'organizations'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'first'),
                value: IntValueNode(value: '10'),
              ),
              ArgumentNode(
                name: NameNode(value: 'after'),
                value: VariableNode(name: NameNode(value: 'cursor')),
              ),
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
                    name: NameNode(value: 'cursor'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'node'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                        name: NameNode(value: 'avatarUrl'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'login'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                    ]),
                  ),
                ]),
              )
            ]),
          )
        ]),
      )
    ]),
  )
]);

class GetViewerOrgsQuery
    extends GraphQLQuery<GetViewerOrgs$Query, GetViewerOrgsArguments> {
  GetViewerOrgsQuery({required this.variables});

  @override
  final DocumentNode document = GET_VIEWER_ORGS_QUERY_DOCUMENT;

  @override
  final String operationName = GET_VIEWER_ORGS_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  final GetViewerOrgsArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  GetViewerOrgs$Query parse(Map<String, dynamic> json) =>
      GetViewerOrgs$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class GetTimelineArguments extends JsonSerializable with EquatableMixin {
  GetTimelineArguments({
    required this.repoName,
    required this.owner,
    required this.number,
    this.after,
    this.since,
  });

  @override
  factory GetTimelineArguments.fromJson(Map<String, dynamic> json) =>
      _$GetTimelineArgumentsFromJson(json);

  late String repoName;

  late String owner;

  late int number;

  final String? after;

  final DateTime? since;

  @override
  List<Object?> get props => [repoName, owner, number, after, since];
  @override
  Map<String, dynamic> toJson() => _$GetTimelineArgumentsToJson(this);
}

final GET_TIMELINE_QUERY_DOCUMENT_OPERATION_NAME = 'getTimeline';
final GET_TIMELINE_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getTimeline'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'repoName')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'owner')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'number')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'after')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'since')),
        type: NamedTypeNode(
          name: NameNode(value: 'DateTime'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'repository'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'name'),
            value: VariableNode(name: NameNode(value: 'repoName')),
          ),
          ArgumentNode(
            name: NameNode(value: 'owner'),
            value: VariableNode(name: NameNode(value: 'owner')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'issueOrPullRequest'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'number'),
                value: VariableNode(name: NameNode(value: 'number')),
              )
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              InlineFragmentNode(
                typeCondition: TypeConditionNode(
                    on: NamedTypeNode(
                  name: NameNode(value: 'Issue'),
                  isNonNull: false,
                )),
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'timelineItems'),
                    alias: null,
                    arguments: [
                      ArgumentNode(
                        name: NameNode(value: 'first'),
                        value: IntValueNode(value: '20'),
                      ),
                      ArgumentNode(
                        name: NameNode(value: 'after'),
                        value: VariableNode(name: NameNode(value: 'after')),
                      ),
                      ArgumentNode(
                        name: NameNode(value: 'since'),
                        value: VariableNode(name: NameNode(value: 'since')),
                      ),
                      ArgumentNode(
                        name: NameNode(value: 'itemTypes'),
                        value: ListValueNode(values: [
                          EnumValueNode(
                              name: NameNode(value: 'ADDED_TO_PROJECT_EVENT')),
                          EnumValueNode(
                              name: NameNode(value: 'ASSIGNED_EVENT')),
                          EnumValueNode(name: NameNode(value: 'CLOSED_EVENT')),
                          EnumValueNode(
                              name: NameNode(value: 'CROSS_REFERENCED_EVENT')),
                          EnumValueNode(
                              name: NameNode(value: 'DEMILESTONED_EVENT')),
                          EnumValueNode(name: NameNode(value: 'ISSUE_COMMENT')),
                          EnumValueNode(name: NameNode(value: 'LABELED_EVENT')),
                          EnumValueNode(name: NameNode(value: 'LOCKED_EVENT')),
                          EnumValueNode(
                              name:
                                  NameNode(value: 'MARKED_AS_DUPLICATE_EVENT')),
                          EnumValueNode(
                              name: NameNode(value: 'MILESTONED_EVENT')),
                          EnumValueNode(
                              name: NameNode(
                                  value: 'MOVED_COLUMNS_IN_PROJECT_EVENT')),
                          EnumValueNode(name: NameNode(value: 'PINNED_EVENT')),
                          EnumValueNode(
                              name: NameNode(
                                  value: 'REMOVED_FROM_PROJECT_EVENT')),
                          EnumValueNode(
                              name: NameNode(value: 'RENAMED_TITLE_EVENT')),
                          EnumValueNode(
                              name: NameNode(value: 'REOPENED_EVENT')),
                          EnumValueNode(
                              name: NameNode(value: 'UNASSIGNED_EVENT')),
                          EnumValueNode(
                              name: NameNode(value: 'UNLABELED_EVENT')),
                          EnumValueNode(
                              name: NameNode(value: 'UNLOCKED_EVENT')),
                          EnumValueNode(
                              name: NameNode(
                                  value: 'UNMARKED_AS_DUPLICATE_EVENT')),
                          EnumValueNode(
                              name: NameNode(value: 'UNPINNED_EVENT')),
                        ]),
                      ),
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
                                selectionSet: null,
                              ),
                              InlineFragmentNode(
                                typeCondition: TypeConditionNode(
                                    on: NamedTypeNode(
                                  name: NameNode(value: 'AddedToProjectEvent'),
                                  isNonNull: false,
                                )),
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  FragmentSpreadNode(
                                    name: NameNode(value: 'addedToProject'),
                                    directives: [],
                                  )
                                ]),
                              ),
                              InlineFragmentNode(
                                typeCondition: TypeConditionNode(
                                    on: NamedTypeNode(
                                  name: NameNode(value: 'AssignedEvent'),
                                  isNonNull: false,
                                )),
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  FragmentSpreadNode(
                                    name: NameNode(value: 'assigned'),
                                    directives: [],
                                  )
                                ]),
                              ),
                              InlineFragmentNode(
                                typeCondition: TypeConditionNode(
                                    on: NamedTypeNode(
                                  name: NameNode(value: 'ClosedEvent'),
                                  isNonNull: false,
                                )),
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  FragmentSpreadNode(
                                    name: NameNode(value: 'closed'),
                                    directives: [],
                                  )
                                ]),
                              ),
                              InlineFragmentNode(
                                typeCondition: TypeConditionNode(
                                    on: NamedTypeNode(
                                  name: NameNode(value: 'CrossReferencedEvent'),
                                  isNonNull: false,
                                )),
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  FragmentSpreadNode(
                                    name: NameNode(value: 'crossReference'),
                                    directives: [],
                                  )
                                ]),
                              ),
                              InlineFragmentNode(
                                typeCondition: TypeConditionNode(
                                    on: NamedTypeNode(
                                  name: NameNode(value: 'DemilestonedEvent'),
                                  isNonNull: false,
                                )),
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  FragmentSpreadNode(
                                    name: NameNode(value: 'deMileStoned'),
                                    directives: [],
                                  )
                                ]),
                              ),
                              InlineFragmentNode(
                                typeCondition: TypeConditionNode(
                                    on: NamedTypeNode(
                                  name: NameNode(value: 'IssueComment'),
                                  isNonNull: false,
                                )),
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  FragmentSpreadNode(
                                    name: NameNode(value: 'issueComment'),
                                    directives: [],
                                  )
                                ]),
                              ),
                              InlineFragmentNode(
                                typeCondition: TypeConditionNode(
                                    on: NamedTypeNode(
                                  name: NameNode(value: 'LabeledEvent'),
                                  isNonNull: false,
                                )),
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  FragmentSpreadNode(
                                    name: NameNode(value: 'labeled'),
                                    directives: [],
                                  )
                                ]),
                              ),
                              InlineFragmentNode(
                                typeCondition: TypeConditionNode(
                                    on: NamedTypeNode(
                                  name: NameNode(value: 'LockedEvent'),
                                  isNonNull: false,
                                )),
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  FragmentSpreadNode(
                                    name: NameNode(value: 'locked'),
                                    directives: [],
                                  )
                                ]),
                              ),
                              InlineFragmentNode(
                                typeCondition: TypeConditionNode(
                                    on: NamedTypeNode(
                                  name:
                                      NameNode(value: 'MarkedAsDuplicateEvent'),
                                  isNonNull: false,
                                )),
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  FragmentSpreadNode(
                                    name: NameNode(value: 'markedAsDuplicate'),
                                    directives: [],
                                  )
                                ]),
                              ),
                              InlineFragmentNode(
                                typeCondition: TypeConditionNode(
                                    on: NamedTypeNode(
                                  name: NameNode(value: 'MilestonedEvent'),
                                  isNonNull: false,
                                )),
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  FragmentSpreadNode(
                                    name: NameNode(value: 'mileStoned'),
                                    directives: [],
                                  )
                                ]),
                              ),
                              InlineFragmentNode(
                                typeCondition: TypeConditionNode(
                                    on: NamedTypeNode(
                                  name: NameNode(
                                      value: 'MovedColumnsInProjectEvent'),
                                  isNonNull: false,
                                )),
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  FragmentSpreadNode(
                                    name: NameNode(
                                        value: 'movedColumnsInProject'),
                                    directives: [],
                                  )
                                ]),
                              ),
                              InlineFragmentNode(
                                typeCondition: TypeConditionNode(
                                    on: NamedTypeNode(
                                  name: NameNode(value: 'PinnedEvent'),
                                  isNonNull: false,
                                )),
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  FragmentSpreadNode(
                                    name: NameNode(value: 'pinned'),
                                    directives: [],
                                  )
                                ]),
                              ),
                              InlineFragmentNode(
                                typeCondition: TypeConditionNode(
                                    on: NamedTypeNode(
                                  name: NameNode(
                                      value: 'RemovedFromProjectEvent'),
                                  isNonNull: false,
                                )),
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  FragmentSpreadNode(
                                    name: NameNode(value: 'removedFromProject'),
                                    directives: [],
                                  )
                                ]),
                              ),
                              InlineFragmentNode(
                                typeCondition: TypeConditionNode(
                                    on: NamedTypeNode(
                                  name: NameNode(value: 'RenamedTitleEvent'),
                                  isNonNull: false,
                                )),
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  FragmentSpreadNode(
                                    name: NameNode(value: 'renamedTitle'),
                                    directives: [],
                                  )
                                ]),
                              ),
                              InlineFragmentNode(
                                typeCondition: TypeConditionNode(
                                    on: NamedTypeNode(
                                  name: NameNode(value: 'ReopenedEvent'),
                                  isNonNull: false,
                                )),
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  FragmentSpreadNode(
                                    name: NameNode(value: 'reopened'),
                                    directives: [],
                                  )
                                ]),
                              ),
                              InlineFragmentNode(
                                typeCondition: TypeConditionNode(
                                    on: NamedTypeNode(
                                  name: NameNode(value: 'UnassignedEvent'),
                                  isNonNull: false,
                                )),
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  FragmentSpreadNode(
                                    name: NameNode(value: 'unassigned'),
                                    directives: [],
                                  )
                                ]),
                              ),
                              InlineFragmentNode(
                                typeCondition: TypeConditionNode(
                                    on: NamedTypeNode(
                                  name: NameNode(value: 'UnlabeledEvent'),
                                  isNonNull: false,
                                )),
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  FragmentSpreadNode(
                                    name: NameNode(value: 'unlabeled'),
                                    directives: [],
                                  )
                                ]),
                              ),
                              InlineFragmentNode(
                                typeCondition: TypeConditionNode(
                                    on: NamedTypeNode(
                                  name: NameNode(value: 'UnlockedEvent'),
                                  isNonNull: false,
                                )),
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  FragmentSpreadNode(
                                    name: NameNode(value: 'unlocked'),
                                    directives: [],
                                  )
                                ]),
                              ),
                              InlineFragmentNode(
                                typeCondition: TypeConditionNode(
                                    on: NamedTypeNode(
                                  name: NameNode(
                                      value: 'UnmarkedAsDuplicateEvent'),
                                  isNonNull: false,
                                )),
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  FragmentSpreadNode(
                                    name:
                                        NameNode(value: 'unmarkedAsDuplicate'),
                                    directives: [],
                                  )
                                ]),
                              ),
                              InlineFragmentNode(
                                typeCondition: TypeConditionNode(
                                    on: NamedTypeNode(
                                  name: NameNode(value: 'UnpinnedEvent'),
                                  isNonNull: false,
                                )),
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  FragmentSpreadNode(
                                    name: NameNode(value: 'unpinned'),
                                    directives: [],
                                  )
                                ]),
                              ),
                            ]),
                          ),
                          FieldNode(
                            name: NameNode(value: 'cursor'),
                            alias: null,
                            arguments: [],
                            directives: [],
                            selectionSet: null,
                          ),
                        ]),
                      )
                    ]),
                  )
                ]),
              ),
              InlineFragmentNode(
                typeCondition: TypeConditionNode(
                    on: NamedTypeNode(
                  name: NameNode(value: 'PullRequest'),
                  isNonNull: false,
                )),
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'timelineItems'),
                    alias: null,
                    arguments: [
                      ArgumentNode(
                        name: NameNode(value: 'first'),
                        value: IntValueNode(value: '20'),
                      ),
                      ArgumentNode(
                        name: NameNode(value: 'after'),
                        value: VariableNode(name: NameNode(value: 'after')),
                      ),
                      ArgumentNode(
                        name: NameNode(value: 'since'),
                        value: VariableNode(name: NameNode(value: 'since')),
                      ),
                      ArgumentNode(
                        name: NameNode(value: 'itemTypes'),
                        value: ListValueNode(values: [
                          EnumValueNode(
                              name: NameNode(value: 'ADDED_TO_PROJECT_EVENT')),
                          EnumValueNode(
                              name: NameNode(value: 'ASSIGNED_EVENT')),
                          EnumValueNode(
                              name: NameNode(value: 'BASE_REF_CHANGED_EVENT')),
                          EnumValueNode(
                              name: NameNode(value: 'BASE_REF_DELETED_EVENT')),
                          EnumValueNode(
                              name: NameNode(
                                  value: 'BASE_REF_FORCE_PUSHED_EVENT')),
                          EnumValueNode(name: NameNode(value: 'CLOSED_EVENT')),
                          EnumValueNode(
                              name: NameNode(value: 'CONVERT_TO_DRAFT_EVENT')),
                          EnumValueNode(
                              name: NameNode(value: 'CROSS_REFERENCED_EVENT')),
                          EnumValueNode(
                              name: NameNode(value: 'DEMILESTONED_EVENT')),
                          EnumValueNode(
                              name: NameNode(value: 'HEAD_REF_DELETED_EVENT')),
                          EnumValueNode(
                              name: NameNode(
                                  value: 'HEAD_REF_FORCE_PUSHED_EVENT')),
                          EnumValueNode(
                              name: NameNode(value: 'HEAD_REF_RESTORED_EVENT')),
                          EnumValueNode(name: NameNode(value: 'ISSUE_COMMENT')),
                          EnumValueNode(name: NameNode(value: 'LABELED_EVENT')),
                          EnumValueNode(name: NameNode(value: 'LOCKED_EVENT')),
                          EnumValueNode(
                              name:
                                  NameNode(value: 'MARKED_AS_DUPLICATE_EVENT')),
                          EnumValueNode(name: NameNode(value: 'MERGED_EVENT')),
                          EnumValueNode(
                              name: NameNode(value: 'MILESTONED_EVENT')),
                          EnumValueNode(
                              name: NameNode(
                                  value: 'MOVED_COLUMNS_IN_PROJECT_EVENT')),
                          EnumValueNode(name: NameNode(value: 'PINNED_EVENT')),
                          EnumValueNode(
                              name: NameNode(value: 'PULL_REQUEST_COMMIT')),
                          EnumValueNode(
                              name: NameNode(
                                  value: 'PULL_REQUEST_COMMIT_COMMENT_THREAD')),
                          EnumValueNode(
                              name: NameNode(value: 'PULL_REQUEST_REVIEW')),
                          EnumValueNode(
                              name: NameNode(value: 'READY_FOR_REVIEW_EVENT')),
                          EnumValueNode(
                              name: NameNode(
                                  value: 'REMOVED_FROM_PROJECT_EVENT')),
                          EnumValueNode(
                              name: NameNode(value: 'RENAMED_TITLE_EVENT')),
                          EnumValueNode(
                              name: NameNode(value: 'REOPENED_EVENT')),
                          EnumValueNode(
                              name: NameNode(value: 'REVIEW_DISMISSED_EVENT')),
                          EnumValueNode(
                              name: NameNode(value: 'REVIEW_REQUESTED_EVENT')),
                          EnumValueNode(
                              name: NameNode(
                                  value: 'REVIEW_REQUEST_REMOVED_EVENT')),
                          EnumValueNode(
                              name: NameNode(value: 'UNASSIGNED_EVENT')),
                          EnumValueNode(
                              name: NameNode(value: 'UNLABELED_EVENT')),
                          EnumValueNode(
                              name: NameNode(value: 'UNLOCKED_EVENT')),
                          EnumValueNode(
                              name: NameNode(
                                  value: 'UNMARKED_AS_DUPLICATE_EVENT')),
                          EnumValueNode(
                              name: NameNode(value: 'UNPINNED_EVENT')),
                        ]),
                      ),
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
                                selectionSet: null,
                              ),
                              InlineFragmentNode(
                                typeCondition: TypeConditionNode(
                                    on: NamedTypeNode(
                                  name: NameNode(value: 'AddedToProjectEvent'),
                                  isNonNull: false,
                                )),
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  FragmentSpreadNode(
                                    name: NameNode(value: 'addedToProject'),
                                    directives: [],
                                  )
                                ]),
                              ),
                              InlineFragmentNode(
                                typeCondition: TypeConditionNode(
                                    on: NamedTypeNode(
                                  name: NameNode(value: 'AssignedEvent'),
                                  isNonNull: false,
                                )),
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  FragmentSpreadNode(
                                    name: NameNode(value: 'assigned'),
                                    directives: [],
                                  )
                                ]),
                              ),
                              InlineFragmentNode(
                                typeCondition: TypeConditionNode(
                                    on: NamedTypeNode(
                                  name: NameNode(value: 'BaseRefChangedEvent'),
                                  isNonNull: false,
                                )),
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  FragmentSpreadNode(
                                    name: NameNode(value: 'baseRefChanged'),
                                    directives: [],
                                  )
                                ]),
                              ),
                              InlineFragmentNode(
                                typeCondition: TypeConditionNode(
                                    on: NamedTypeNode(
                                  name: NameNode(value: 'BaseRefDeletedEvent'),
                                  isNonNull: false,
                                )),
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  FragmentSpreadNode(
                                    name: NameNode(value: 'baseRefDeleted'),
                                    directives: [],
                                  )
                                ]),
                              ),
                              InlineFragmentNode(
                                typeCondition: TypeConditionNode(
                                    on: NamedTypeNode(
                                  name: NameNode(
                                      value: 'BaseRefForcePushedEvent'),
                                  isNonNull: false,
                                )),
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  FragmentSpreadNode(
                                    name: NameNode(value: 'baseRefForcePushed'),
                                    directives: [],
                                  )
                                ]),
                              ),
                              InlineFragmentNode(
                                typeCondition: TypeConditionNode(
                                    on: NamedTypeNode(
                                  name: NameNode(value: 'ClosedEvent'),
                                  isNonNull: false,
                                )),
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  FragmentSpreadNode(
                                    name: NameNode(value: 'closed'),
                                    directives: [],
                                  )
                                ]),
                              ),
                              InlineFragmentNode(
                                typeCondition: TypeConditionNode(
                                    on: NamedTypeNode(
                                  name: NameNode(value: 'ConvertToDraftEvent'),
                                  isNonNull: false,
                                )),
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  FragmentSpreadNode(
                                    name: NameNode(value: 'convertedToDraft'),
                                    directives: [],
                                  )
                                ]),
                              ),
                              InlineFragmentNode(
                                typeCondition: TypeConditionNode(
                                    on: NamedTypeNode(
                                  name: NameNode(value: 'CrossReferencedEvent'),
                                  isNonNull: false,
                                )),
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  FragmentSpreadNode(
                                    name: NameNode(value: 'crossReference'),
                                    directives: [],
                                  )
                                ]),
                              ),
                              InlineFragmentNode(
                                typeCondition: TypeConditionNode(
                                    on: NamedTypeNode(
                                  name: NameNode(value: 'DemilestonedEvent'),
                                  isNonNull: false,
                                )),
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  FragmentSpreadNode(
                                    name: NameNode(value: 'deMileStoned'),
                                    directives: [],
                                  )
                                ]),
                              ),
                              InlineFragmentNode(
                                typeCondition: TypeConditionNode(
                                    on: NamedTypeNode(
                                  name: NameNode(value: 'HeadRefDeletedEvent'),
                                  isNonNull: false,
                                )),
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  FragmentSpreadNode(
                                    name: NameNode(value: 'headRefDeleted'),
                                    directives: [],
                                  )
                                ]),
                              ),
                              InlineFragmentNode(
                                typeCondition: TypeConditionNode(
                                    on: NamedTypeNode(
                                  name: NameNode(
                                      value: 'HeadRefForcePushedEvent'),
                                  isNonNull: false,
                                )),
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  FragmentSpreadNode(
                                    name: NameNode(value: 'headRefForcePushed'),
                                    directives: [],
                                  )
                                ]),
                              ),
                              InlineFragmentNode(
                                typeCondition: TypeConditionNode(
                                    on: NamedTypeNode(
                                  name: NameNode(value: 'HeadRefRestoredEvent'),
                                  isNonNull: false,
                                )),
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  FragmentSpreadNode(
                                    name: NameNode(value: 'headRefRestored'),
                                    directives: [],
                                  )
                                ]),
                              ),
                              InlineFragmentNode(
                                typeCondition: TypeConditionNode(
                                    on: NamedTypeNode(
                                  name: NameNode(value: 'IssueComment'),
                                  isNonNull: false,
                                )),
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  FragmentSpreadNode(
                                    name: NameNode(value: 'issueComment'),
                                    directives: [],
                                  )
                                ]),
                              ),
                              InlineFragmentNode(
                                typeCondition: TypeConditionNode(
                                    on: NamedTypeNode(
                                  name: NameNode(value: 'LabeledEvent'),
                                  isNonNull: false,
                                )),
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  FragmentSpreadNode(
                                    name: NameNode(value: 'labeled'),
                                    directives: [],
                                  )
                                ]),
                              ),
                              InlineFragmentNode(
                                typeCondition: TypeConditionNode(
                                    on: NamedTypeNode(
                                  name: NameNode(value: 'LockedEvent'),
                                  isNonNull: false,
                                )),
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  FragmentSpreadNode(
                                    name: NameNode(value: 'locked'),
                                    directives: [],
                                  )
                                ]),
                              ),
                              InlineFragmentNode(
                                typeCondition: TypeConditionNode(
                                    on: NamedTypeNode(
                                  name:
                                      NameNode(value: 'MarkedAsDuplicateEvent'),
                                  isNonNull: false,
                                )),
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  FragmentSpreadNode(
                                    name: NameNode(value: 'markedAsDuplicate'),
                                    directives: [],
                                  )
                                ]),
                              ),
                              InlineFragmentNode(
                                typeCondition: TypeConditionNode(
                                    on: NamedTypeNode(
                                  name: NameNode(value: 'MergedEvent'),
                                  isNonNull: false,
                                )),
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  FragmentSpreadNode(
                                    name: NameNode(value: 'merged'),
                                    directives: [],
                                  )
                                ]),
                              ),
                              InlineFragmentNode(
                                typeCondition: TypeConditionNode(
                                    on: NamedTypeNode(
                                  name: NameNode(value: 'MilestonedEvent'),
                                  isNonNull: false,
                                )),
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  FragmentSpreadNode(
                                    name: NameNode(value: 'mileStoned'),
                                    directives: [],
                                  )
                                ]),
                              ),
                              InlineFragmentNode(
                                typeCondition: TypeConditionNode(
                                    on: NamedTypeNode(
                                  name: NameNode(
                                      value: 'MovedColumnsInProjectEvent'),
                                  isNonNull: false,
                                )),
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  FragmentSpreadNode(
                                    name: NameNode(
                                        value: 'movedColumnsInProject'),
                                    directives: [],
                                  )
                                ]),
                              ),
                              InlineFragmentNode(
                                typeCondition: TypeConditionNode(
                                    on: NamedTypeNode(
                                  name: NameNode(value: 'PinnedEvent'),
                                  isNonNull: false,
                                )),
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  FragmentSpreadNode(
                                    name: NameNode(value: 'pinned'),
                                    directives: [],
                                  )
                                ]),
                              ),
                              InlineFragmentNode(
                                typeCondition: TypeConditionNode(
                                    on: NamedTypeNode(
                                  name: NameNode(value: 'PullRequestCommit'),
                                  isNonNull: false,
                                )),
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  FragmentSpreadNode(
                                    name: NameNode(value: 'pullRequestCommit'),
                                    directives: [],
                                  )
                                ]),
                              ),
                              InlineFragmentNode(
                                typeCondition: TypeConditionNode(
                                    on: NamedTypeNode(
                                  name: NameNode(
                                      value: 'PullRequestCommitCommentThread'),
                                  isNonNull: false,
                                )),
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  FieldNode(
                                    name: NameNode(value: 'id'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null,
                                  )
                                ]),
                              ),
                              InlineFragmentNode(
                                typeCondition: TypeConditionNode(
                                    on: NamedTypeNode(
                                  name: NameNode(value: 'PullRequestReview'),
                                  isNonNull: false,
                                )),
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  FragmentSpreadNode(
                                    name: NameNode(value: 'pullRequestReview'),
                                    directives: [],
                                  )
                                ]),
                              ),
                              InlineFragmentNode(
                                typeCondition: TypeConditionNode(
                                    on: NamedTypeNode(
                                  name: NameNode(
                                      value: 'PullRequestReviewThread'),
                                  isNonNull: false,
                                )),
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  FieldNode(
                                    name: NameNode(value: 'id'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null,
                                  )
                                ]),
                              ),
                              InlineFragmentNode(
                                typeCondition: TypeConditionNode(
                                    on: NamedTypeNode(
                                  name: NameNode(value: 'ReadyForReviewEvent'),
                                  isNonNull: false,
                                )),
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  FragmentSpreadNode(
                                    name: NameNode(value: 'readyForReview'),
                                    directives: [],
                                  )
                                ]),
                              ),
                              InlineFragmentNode(
                                typeCondition: TypeConditionNode(
                                    on: NamedTypeNode(
                                  name: NameNode(
                                      value: 'RemovedFromProjectEvent'),
                                  isNonNull: false,
                                )),
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  FragmentSpreadNode(
                                    name: NameNode(value: 'removedFromProject'),
                                    directives: [],
                                  )
                                ]),
                              ),
                              InlineFragmentNode(
                                typeCondition: TypeConditionNode(
                                    on: NamedTypeNode(
                                  name: NameNode(value: 'RenamedTitleEvent'),
                                  isNonNull: false,
                                )),
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  FragmentSpreadNode(
                                    name: NameNode(value: 'renamedTitle'),
                                    directives: [],
                                  )
                                ]),
                              ),
                              InlineFragmentNode(
                                typeCondition: TypeConditionNode(
                                    on: NamedTypeNode(
                                  name: NameNode(value: 'ReopenedEvent'),
                                  isNonNull: false,
                                )),
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  FragmentSpreadNode(
                                    name: NameNode(value: 'reopened'),
                                    directives: [],
                                  )
                                ]),
                              ),
                              InlineFragmentNode(
                                typeCondition: TypeConditionNode(
                                    on: NamedTypeNode(
                                  name: NameNode(value: 'ReviewDismissedEvent'),
                                  isNonNull: false,
                                )),
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  FragmentSpreadNode(
                                    name: NameNode(value: 'reviewDismissed'),
                                    directives: [],
                                  )
                                ]),
                              ),
                              InlineFragmentNode(
                                typeCondition: TypeConditionNode(
                                    on: NamedTypeNode(
                                  name: NameNode(value: 'ReviewRequestedEvent'),
                                  isNonNull: false,
                                )),
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  FragmentSpreadNode(
                                    name: NameNode(value: 'reviewRequested'),
                                    directives: [],
                                  )
                                ]),
                              ),
                              InlineFragmentNode(
                                typeCondition: TypeConditionNode(
                                    on: NamedTypeNode(
                                  name: NameNode(value: 'UnassignedEvent'),
                                  isNonNull: false,
                                )),
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  FragmentSpreadNode(
                                    name: NameNode(value: 'unassigned'),
                                    directives: [],
                                  )
                                ]),
                              ),
                              InlineFragmentNode(
                                typeCondition: TypeConditionNode(
                                    on: NamedTypeNode(
                                  name: NameNode(value: 'UnlabeledEvent'),
                                  isNonNull: false,
                                )),
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  FragmentSpreadNode(
                                    name: NameNode(value: 'unlabeled'),
                                    directives: [],
                                  )
                                ]),
                              ),
                              InlineFragmentNode(
                                typeCondition: TypeConditionNode(
                                    on: NamedTypeNode(
                                  name: NameNode(value: 'UnlockedEvent'),
                                  isNonNull: false,
                                )),
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  FragmentSpreadNode(
                                    name: NameNode(value: 'unlocked'),
                                    directives: [],
                                  )
                                ]),
                              ),
                              InlineFragmentNode(
                                typeCondition: TypeConditionNode(
                                    on: NamedTypeNode(
                                  name: NameNode(
                                      value: 'UnmarkedAsDuplicateEvent'),
                                  isNonNull: false,
                                )),
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  FragmentSpreadNode(
                                    name:
                                        NameNode(value: 'unmarkedAsDuplicate'),
                                    directives: [],
                                  )
                                ]),
                              ),
                              InlineFragmentNode(
                                typeCondition: TypeConditionNode(
                                    on: NamedTypeNode(
                                  name: NameNode(value: 'UnpinnedEvent'),
                                  isNonNull: false,
                                )),
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  FragmentSpreadNode(
                                    name: NameNode(value: 'unpinned'),
                                    directives: [],
                                  )
                                ]),
                              ),
                            ]),
                          ),
                          FieldNode(
                            name: NameNode(value: 'cursor'),
                            alias: null,
                            arguments: [],
                            directives: [],
                            selectionSet: null,
                          ),
                        ]),
                      )
                    ]),
                  )
                ]),
              ),
            ]),
          )
        ]),
      )
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'addedToProject'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'AddedToProjectEvent'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'createdAt'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'actor'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'actor'),
            directives: [],
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'projectColumnName'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'project'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'name'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          )
        ]),
      ),
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'actor'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'Actor'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'avatarUrl'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'login'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'assigned'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'AssignedEvent'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'createdAt'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'actor'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'actor'),
            directives: [],
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'assignee'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          InlineFragmentNode(
            typeCondition: TypeConditionNode(
                on: NamedTypeNode(
              name: NameNode(value: 'User'),
              isNonNull: false,
            )),
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(
                name: NameNode(value: 'actor'),
                directives: [],
              )
            ]),
          ),
          InlineFragmentNode(
            typeCondition: TypeConditionNode(
                on: NamedTypeNode(
              name: NameNode(value: 'Bot'),
              isNonNull: false,
            )),
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(
                name: NameNode(value: 'actor'),
                directives: [],
              )
            ]),
          ),
          InlineFragmentNode(
            typeCondition: TypeConditionNode(
                on: NamedTypeNode(
              name: NameNode(value: 'Mannequin'),
              isNonNull: false,
            )),
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(
                name: NameNode(value: 'actor'),
                directives: [],
              )
            ]),
          ),
          InlineFragmentNode(
            typeCondition: TypeConditionNode(
                on: NamedTypeNode(
              name: NameNode(value: 'Organization'),
              isNonNull: false,
            )),
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(
                name: NameNode(value: 'actor'),
                directives: [],
              )
            ]),
          ),
        ]),
      ),
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'closed'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'ClosedEvent'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'createdAt'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'actor'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'actor'),
            directives: [],
          )
        ]),
      ),
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'crossReference'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'CrossReferencedEvent'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'createdAt'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'actor'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'actor'),
            directives: [],
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'source'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          InlineFragmentNode(
            typeCondition: TypeConditionNode(
                on: NamedTypeNode(
              name: NameNode(value: 'Issue'),
              isNonNull: false,
            )),
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(
                name: NameNode(value: 'issue'),
                directives: [],
              )
            ]),
          ),
          InlineFragmentNode(
            typeCondition: TypeConditionNode(
                on: NamedTypeNode(
              name: NameNode(value: 'PullRequest'),
              isNonNull: false,
            )),
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(
                name: NameNode(value: 'pullRequest'),
                directives: [],
              )
            ]),
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'isCrossRepository'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'issue'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'Issue'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'url'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'title'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'number'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'state'),
        alias: NameNode(value: 'issueState'),
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'repository'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'name'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'nameWithOwner'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'pullRequest'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'PullRequest'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'url'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'title'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'number'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'state'),
        alias: NameNode(value: 'pullState'),
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'repository'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'name'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'nameWithOwner'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'deMileStoned'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'DemilestonedEvent'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'createdAt'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'actor'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'actor'),
            directives: [],
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'milestoneTitle'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'issueComment'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'IssueComment'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'author'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'actor'),
            directives: [],
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'createdAt'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'authorAssociation'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'body'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'bodyHTML'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'lastEditedAt'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'isMinimized'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'minimizedReason'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'reactionGroups'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'reactionGroups'),
            directives: [],
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'viewerCanMinimize'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'viewerCanDelete'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'viewerCanUpdate'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'viewerDidAuthor'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'viewerCannotUpdateReasons'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'viewerCanReact'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'reactionGroups'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'ReactionGroup'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'content'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'viewerHasReacted'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'reactors'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'totalCount'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'subject'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          )
        ]),
      ),
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'labeled'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'LabeledEvent'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'createdAt'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'actor'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'actor'),
            directives: [],
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'label'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'label'),
            directives: [],
          )
        ]),
      ),
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'label'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'Label'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'color'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'name'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'locked'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'LockedEvent'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'createdAt'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'actor'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'actor'),
            directives: [],
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'lockReason'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'markedAsDuplicate'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'MarkedAsDuplicateEvent'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'createdAt'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'actor'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'actor'),
            directives: [],
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'isCrossRepository'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'canonical'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          InlineFragmentNode(
            typeCondition: TypeConditionNode(
                on: NamedTypeNode(
              name: NameNode(value: 'Issue'),
              isNonNull: false,
            )),
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(
                name: NameNode(value: 'issue'),
                directives: [],
              )
            ]),
          ),
          InlineFragmentNode(
            typeCondition: TypeConditionNode(
                on: NamedTypeNode(
              name: NameNode(value: 'PullRequest'),
              isNonNull: false,
            )),
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(
                name: NameNode(value: 'pullRequest'),
                directives: [],
              )
            ]),
          ),
        ]),
      ),
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'mileStoned'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'MilestonedEvent'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'createdAt'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'actor'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'actor'),
            directives: [],
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'milestoneTitle'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'movedColumnsInProject'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'MovedColumnsInProjectEvent'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'createdAt'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'actor'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'actor'),
            directives: [],
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'previousProjectColumnName'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'projectColumnName'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'project'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'name'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          )
        ]),
      ),
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'pinned'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'PinnedEvent'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'createdAt'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'actor'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'actor'),
            directives: [],
          )
        ]),
      ),
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'removedFromProject'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'RemovedFromProjectEvent'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'createdAt'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'actor'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'actor'),
            directives: [],
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'project'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'name'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'projectColumnName'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'renamedTitle'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'RenamedTitleEvent'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'createdAt'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'actor'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'actor'),
            directives: [],
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'previousTitle'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'currentTitle'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'reopened'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'ReopenedEvent'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'createdAt'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'actor'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'actor'),
            directives: [],
          )
        ]),
      ),
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'unassigned'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'UnassignedEvent'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'createdAt'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'actor'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'actor'),
            directives: [],
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'assignee'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          InlineFragmentNode(
            typeCondition: TypeConditionNode(
                on: NamedTypeNode(
              name: NameNode(value: 'User'),
              isNonNull: false,
            )),
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(
                name: NameNode(value: 'actor'),
                directives: [],
              )
            ]),
          ),
          InlineFragmentNode(
            typeCondition: TypeConditionNode(
                on: NamedTypeNode(
              name: NameNode(value: 'Bot'),
              isNonNull: false,
            )),
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(
                name: NameNode(value: 'actor'),
                directives: [],
              )
            ]),
          ),
          InlineFragmentNode(
            typeCondition: TypeConditionNode(
                on: NamedTypeNode(
              name: NameNode(value: 'Mannequin'),
              isNonNull: false,
            )),
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(
                name: NameNode(value: 'actor'),
                directives: [],
              )
            ]),
          ),
          InlineFragmentNode(
            typeCondition: TypeConditionNode(
                on: NamedTypeNode(
              name: NameNode(value: 'Organization'),
              isNonNull: false,
            )),
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(
                name: NameNode(value: 'actor'),
                directives: [],
              )
            ]),
          ),
        ]),
      ),
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'unlabeled'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'UnlabeledEvent'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'createdAt'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'actor'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'actor'),
            directives: [],
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'label'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'label'),
            directives: [],
          )
        ]),
      ),
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'unlocked'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'UnlockedEvent'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'createdAt'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'actor'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'actor'),
            directives: [],
          )
        ]),
      ),
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'unmarkedAsDuplicate'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'UnmarkedAsDuplicateEvent'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'createdAt'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'actor'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'actor'),
            directives: [],
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'isCrossRepository'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'canonical'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          InlineFragmentNode(
            typeCondition: TypeConditionNode(
                on: NamedTypeNode(
              name: NameNode(value: 'Issue'),
              isNonNull: false,
            )),
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(
                name: NameNode(value: 'issue'),
                directives: [],
              )
            ]),
          ),
          InlineFragmentNode(
            typeCondition: TypeConditionNode(
                on: NamedTypeNode(
              name: NameNode(value: 'PullRequest'),
              isNonNull: false,
            )),
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(
                name: NameNode(value: 'pullRequest'),
                directives: [],
              )
            ]),
          ),
        ]),
      ),
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'unpinned'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'UnpinnedEvent'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'createdAt'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'actor'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'actor'),
            directives: [],
          )
        ]),
      ),
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'baseRefChanged'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'BaseRefChangedEvent'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'createdAt'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'actor'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'actor'),
            directives: [],
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'currentRefName'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'previousRefName'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'baseRefDeleted'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'BaseRefDeletedEvent'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'createdAt'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'actor'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'actor'),
            directives: [],
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'baseRefName'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'baseRefForcePushed'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'BaseRefForcePushedEvent'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'createdAt'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'beforeCommit'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'abbreviatedOid'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'url'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'afterCommit'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'url'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'abbreviatedOid'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'ref'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'name'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'actor'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'actor'),
            directives: [],
          )
        ]),
      ),
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'convertedToDraft'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'ConvertToDraftEvent'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'createdAt'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'actor'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'actor'),
            directives: [],
          )
        ]),
      ),
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'headRefDeleted'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'HeadRefDeletedEvent'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'createdAt'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'actor'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'actor'),
            directives: [],
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'headRefName'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'headRefForcePushed'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'HeadRefForcePushedEvent'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'createdAt'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'beforeCommit'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'abbreviatedOid'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'url'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'afterCommit'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'url'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'abbreviatedOid'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'ref'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'name'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'actor'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'actor'),
            directives: [],
          )
        ]),
      ),
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'headRefRestored'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'HeadRefRestoredEvent'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'createdAt'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'actor'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'actor'),
            directives: [],
          )
        ]),
      ),
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'merged'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'MergedEvent'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'createdAt'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'actor'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'actor'),
            directives: [],
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'mergeRefName'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'pullRequestCommit'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'PullRequestCommit'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'commit'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'commit'),
            directives: [],
          )
        ]),
      ),
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'commit'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'Commit'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'additions'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'authoredDate'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'oid'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'message'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'commitUrl'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'messageHeadline'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'author'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'avatarUrl'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'name'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'user'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(
                name: NameNode(value: 'actor'),
                directives: [],
              )
            ]),
          ),
        ]),
      ),
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'pullRequestReview'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'PullRequestReview'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'author'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'actor'),
            directives: [],
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'createdAt'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'authorAssociation'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'body'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'bodyHTML'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'lastEditedAt'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'state'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'comments'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'totalCount'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'reactionGroups'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'reactionGroups'),
            directives: [],
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'viewerCanDelete'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'viewerCanUpdate'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'viewerDidAuthor'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'viewerCannotUpdateReasons'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'viewerCanReact'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'readyForReview'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'ReadyForReviewEvent'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'createdAt'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'actor'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'actor'),
            directives: [],
          )
        ]),
      ),
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'reviewDismissed'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'ReviewDismissedEvent'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'createdAt'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'actor'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'actor'),
            directives: [],
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'dismissalMessage'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'dismissalMessageHTML'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'previousReviewState'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'reviewRequested'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'ReviewRequestedEvent'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'createdAt'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'actor'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'actor'),
            directives: [],
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'requestedReviewer'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          InlineFragmentNode(
            typeCondition: TypeConditionNode(
                on: NamedTypeNode(
              name: NameNode(value: 'User'),
              isNonNull: false,
            )),
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(
                name: NameNode(value: 'actor'),
                directives: [],
              )
            ]),
          ),
          InlineFragmentNode(
            typeCondition: TypeConditionNode(
                on: NamedTypeNode(
              name: NameNode(value: 'Team'),
              isNonNull: false,
            )),
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'avatarUrl'),
                alias: NameNode(value: 'avatar'),
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'name'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
        ]),
      ),
    ]),
  ),
]);

class GetTimelineQuery
    extends GraphQLQuery<GetTimeline$Query, GetTimelineArguments> {
  GetTimelineQuery({required this.variables});

  @override
  final DocumentNode document = GET_TIMELINE_QUERY_DOCUMENT;

  @override
  final String operationName = GET_TIMELINE_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  final GetTimelineArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  GetTimeline$Query parse(Map<String, dynamic> json) =>
      GetTimeline$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class GetPRReviewCommentsArguments extends JsonSerializable
    with EquatableMixin {
  GetPRReviewCommentsArguments({
    required this.id,
    this.cursor,
  });

  @override
  factory GetPRReviewCommentsArguments.fromJson(Map<String, dynamic> json) =>
      _$GetPRReviewCommentsArgumentsFromJson(json);

  late String id;

  final String? cursor;

  @override
  List<Object?> get props => [id, cursor];
  @override
  Map<String, dynamic> toJson() => _$GetPRReviewCommentsArgumentsToJson(this);
}

final GET_P_R_REVIEW_COMMENTS_QUERY_DOCUMENT_OPERATION_NAME =
    'getPRReviewComments';
final GET_P_R_REVIEW_COMMENTS_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getPRReviewComments'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'cursor')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'node'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'id')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          InlineFragmentNode(
            typeCondition: TypeConditionNode(
                on: NamedTypeNode(
              name: NameNode(value: 'PullRequestReview'),
              isNonNull: false,
            )),
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(
                name: NameNode(value: 'PRReviewComments'),
                directives: [],
              )
            ]),
          ),
        ]),
      )
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'PRReviewComments'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'PullRequestReview'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'comments'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'first'),
            value: IntValueNode(value: '10'),
          ),
          ArgumentNode(
            name: NameNode(value: 'after'),
            value: VariableNode(name: NameNode(value: 'cursor')),
          ),
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
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'cursor'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'node'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FragmentSpreadNode(
                    name: NameNode(value: 'pullRequestReviewComment'),
                    directives: [],
                  )
                ]),
              ),
            ]),
          )
        ]),
      )
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'pullRequestReviewComment'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'PullRequestReviewComment'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'databaseId'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'author'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'actor'),
            directives: [],
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'createdAt'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'authorAssociation'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'body'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'bodyHTML'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'lastEditedAt'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'state'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'diffHunk'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'outdated'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'isMinimized'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'replyTo'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'path'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'reactionGroups'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'reactionGroups'),
            directives: [],
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'viewerCanDelete'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'viewerCanUpdate'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'viewerDidAuthor'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'viewerCannotUpdateReasons'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'viewerCanReact'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'viewerCanMinimize'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'pullRequest'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'number'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'repository'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'name'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'owner'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'login'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              )
            ]),
          ),
        ]),
      ),
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'actor'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'Actor'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'avatarUrl'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'login'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'reactionGroups'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'ReactionGroup'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'content'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'viewerHasReacted'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'reactors'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'totalCount'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'subject'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          )
        ]),
      ),
    ]),
  ),
]);

class GetPRReviewCommentsQuery extends GraphQLQuery<GetPRReviewComments$Query,
    GetPRReviewCommentsArguments> {
  GetPRReviewCommentsQuery({required this.variables});

  @override
  final DocumentNode document = GET_P_R_REVIEW_COMMENTS_QUERY_DOCUMENT;

  @override
  final String operationName =
      GET_P_R_REVIEW_COMMENTS_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  final GetPRReviewCommentsArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  GetPRReviewComments$Query parse(Map<String, dynamic> json) =>
      GetPRReviewComments$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class ReviewThreadFirstCommentQueryArguments extends JsonSerializable
    with EquatableMixin {
  ReviewThreadFirstCommentQueryArguments({
    required this.name,
    required this.owner,
    required this.number,
    this.cursor,
  });

  @override
  factory ReviewThreadFirstCommentQueryArguments.fromJson(
          Map<String, dynamic> json) =>
      _$ReviewThreadFirstCommentQueryArgumentsFromJson(json);

  late String name;

  late String owner;

  late int number;

  final String? cursor;

  @override
  List<Object?> get props => [name, owner, number, cursor];
  @override
  Map<String, dynamic> toJson() =>
      _$ReviewThreadFirstCommentQueryArgumentsToJson(this);
}

final REVIEW_THREAD_FIRST_COMMENT_QUERY_QUERY_DOCUMENT_OPERATION_NAME =
    'reviewThreadFirstCommentQuery';
final REVIEW_THREAD_FIRST_COMMENT_QUERY_QUERY_DOCUMENT =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'reviewThreadFirstCommentQuery'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'name')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'owner')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'number')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'cursor')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'repository'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'name'),
            value: VariableNode(name: NameNode(value: 'name')),
          ),
          ArgumentNode(
            name: NameNode(value: 'owner'),
            value: VariableNode(name: NameNode(value: 'owner')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'pullRequest'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'number'),
                value: VariableNode(name: NameNode(value: 'number')),
              )
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'reviewThreads'),
                alias: null,
                arguments: [
                  ArgumentNode(
                    name: NameNode(value: 'first'),
                    value: IntValueNode(value: '25'),
                  ),
                  ArgumentNode(
                    name: NameNode(value: 'after'),
                    value: VariableNode(name: NameNode(value: 'cursor')),
                  ),
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
                        name: NameNode(value: 'cursor'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'node'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: SelectionSetNode(selections: [
                          FieldNode(
                            name: NameNode(value: 'id'),
                            alias: null,
                            arguments: [],
                            directives: [],
                            selectionSet: null,
                          ),
                          FieldNode(
                            name: NameNode(value: 'viewerCanResolve'),
                            alias: null,
                            arguments: [],
                            directives: [],
                            selectionSet: null,
                          ),
                          FieldNode(
                            name: NameNode(value: 'viewerCanUnresolve'),
                            alias: null,
                            arguments: [],
                            directives: [],
                            selectionSet: null,
                          ),
                          FieldNode(
                            name: NameNode(value: 'viewerCanReply'),
                            alias: null,
                            arguments: [],
                            directives: [],
                            selectionSet: null,
                          ),
                          FieldNode(
                            name: NameNode(value: 'isOutdated'),
                            alias: null,
                            arguments: [],
                            directives: [],
                            selectionSet: null,
                          ),
                          FieldNode(
                            name: NameNode(value: 'isCollapsed'),
                            alias: null,
                            arguments: [],
                            directives: [],
                            selectionSet: null,
                          ),
                          FieldNode(
                            name: NameNode(value: 'isResolved'),
                            alias: null,
                            arguments: [],
                            directives: [],
                            selectionSet: null,
                          ),
                          FieldNode(
                            name: NameNode(value: 'comments'),
                            alias: null,
                            arguments: [
                              ArgumentNode(
                                name: NameNode(value: 'first'),
                                value: IntValueNode(value: '1'),
                              )
                            ],
                            directives: [],
                            selectionSet: SelectionSetNode(selections: [
                              FieldNode(
                                name: NameNode(value: 'totalCount'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null,
                              ),
                              FieldNode(
                                name: NameNode(value: 'nodes'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: SelectionSetNode(selections: [
                                  FieldNode(
                                    name: NameNode(value: 'id'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null,
                                  )
                                ]),
                              ),
                            ]),
                          ),
                        ]),
                      ),
                    ]),
                  )
                ]),
              ),
            ]),
          )
        ]),
      )
    ]),
  )
]);

class ReviewThreadFirstCommentQueryQuery extends GraphQLQuery<
    ReviewThreadFirstCommentQuery$Query,
    ReviewThreadFirstCommentQueryArguments> {
  ReviewThreadFirstCommentQueryQuery({required this.variables});

  @override
  final DocumentNode document =
      REVIEW_THREAD_FIRST_COMMENT_QUERY_QUERY_DOCUMENT;

  @override
  final String operationName =
      REVIEW_THREAD_FIRST_COMMENT_QUERY_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  final ReviewThreadFirstCommentQueryArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  ReviewThreadFirstCommentQuery$Query parse(Map<String, dynamic> json) =>
      ReviewThreadFirstCommentQuery$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class ReviewThreadCommentsQueryArguments extends JsonSerializable
    with EquatableMixin {
  ReviewThreadCommentsQueryArguments({
    required this.nodeID,
    this.cursor,
  });

  @override
  factory ReviewThreadCommentsQueryArguments.fromJson(
          Map<String, dynamic> json) =>
      _$ReviewThreadCommentsQueryArgumentsFromJson(json);

  late String nodeID;

  final String? cursor;

  @override
  List<Object?> get props => [nodeID, cursor];
  @override
  Map<String, dynamic> toJson() =>
      _$ReviewThreadCommentsQueryArgumentsToJson(this);
}

final REVIEW_THREAD_COMMENTS_QUERY_QUERY_DOCUMENT_OPERATION_NAME =
    'reviewThreadCommentsQuery';
final REVIEW_THREAD_COMMENTS_QUERY_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'reviewThreadCommentsQuery'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'nodeID')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'cursor')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'node'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'nodeID')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          InlineFragmentNode(
            typeCondition: TypeConditionNode(
                on: NamedTypeNode(
              name: NameNode(value: 'PullRequestReviewThread'),
              isNonNull: false,
            )),
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'comments'),
                alias: null,
                arguments: [
                  ArgumentNode(
                    name: NameNode(value: 'first'),
                    value: IntValueNode(value: '10'),
                  ),
                  ArgumentNode(
                    name: NameNode(value: 'after'),
                    value: VariableNode(name: NameNode(value: 'cursor')),
                  ),
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
                        name: NameNode(value: 'cursor'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'node'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: SelectionSetNode(selections: [
                          FragmentSpreadNode(
                            name: NameNode(value: 'pullRequestReviewComment'),
                            directives: [],
                          )
                        ]),
                      ),
                    ]),
                  )
                ]),
              )
            ]),
          ),
        ]),
      )
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'pullRequestReviewComment'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'PullRequestReviewComment'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'databaseId'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'author'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'actor'),
            directives: [],
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'createdAt'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'authorAssociation'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'body'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'bodyHTML'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'lastEditedAt'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'state'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'diffHunk'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'outdated'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'isMinimized'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'replyTo'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'path'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'reactionGroups'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'reactionGroups'),
            directives: [],
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'viewerCanDelete'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'viewerCanUpdate'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'viewerDidAuthor'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'viewerCannotUpdateReasons'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'viewerCanReact'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'viewerCanMinimize'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'pullRequest'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'number'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'repository'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'name'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'owner'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'login'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              )
            ]),
          ),
        ]),
      ),
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'actor'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'Actor'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'avatarUrl'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'login'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'reactionGroups'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'ReactionGroup'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'content'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'viewerHasReacted'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'reactors'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'totalCount'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'subject'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          )
        ]),
      ),
    ]),
  ),
]);

class ReviewThreadCommentsQueryQuery extends GraphQLQuery<
    ReviewThreadCommentsQuery$Query, ReviewThreadCommentsQueryArguments> {
  ReviewThreadCommentsQueryQuery({required this.variables});

  @override
  final DocumentNode document = REVIEW_THREAD_COMMENTS_QUERY_QUERY_DOCUMENT;

  @override
  final String operationName =
      REVIEW_THREAD_COMMENTS_QUERY_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  final ReviewThreadCommentsQueryArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  ReviewThreadCommentsQuery$Query parse(Map<String, dynamic> json) =>
      ReviewThreadCommentsQuery$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class CheckPendingViewerReviewsArguments extends JsonSerializable
    with EquatableMixin {
  CheckPendingViewerReviewsArguments({
    required this.pullNodeID,
    required this.author,
  });

  @override
  factory CheckPendingViewerReviewsArguments.fromJson(
          Map<String, dynamic> json) =>
      _$CheckPendingViewerReviewsArgumentsFromJson(json);

  late String pullNodeID;

  late String author;

  @override
  List<Object?> get props => [pullNodeID, author];
  @override
  Map<String, dynamic> toJson() =>
      _$CheckPendingViewerReviewsArgumentsToJson(this);
}

final CHECK_PENDING_VIEWER_REVIEWS_QUERY_DOCUMENT_OPERATION_NAME =
    'checkPendingViewerReviews';
final CHECK_PENDING_VIEWER_REVIEWS_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'checkPendingViewerReviews'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'pullNodeID')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'author')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'node'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'pullNodeID')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          InlineFragmentNode(
            typeCondition: TypeConditionNode(
                on: NamedTypeNode(
              name: NameNode(value: 'PullRequest'),
              isNonNull: false,
            )),
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'reviews'),
                alias: null,
                arguments: [
                  ArgumentNode(
                    name: NameNode(value: 'author'),
                    value: VariableNode(name: NameNode(value: 'author')),
                  ),
                  ArgumentNode(
                    name: NameNode(value: 'states'),
                    value: ListValueNode(values: [
                      EnumValueNode(name: NameNode(value: 'PENDING'))
                    ]),
                  ),
                  ArgumentNode(
                    name: NameNode(value: 'first'),
                    value: IntValueNode(value: '1'),
                  ),
                ],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FieldNode(
                    name: NameNode(value: 'totalCount'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'nodes'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                        name: NameNode(value: 'url'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      )
                    ]),
                  ),
                ]),
              )
            ]),
          ),
        ]),
      )
    ]),
  )
]);

class CheckPendingViewerReviewsQuery extends GraphQLQuery<
    CheckPendingViewerReviews$Query, CheckPendingViewerReviewsArguments> {
  CheckPendingViewerReviewsQuery({required this.variables});

  @override
  final DocumentNode document = CHECK_PENDING_VIEWER_REVIEWS_QUERY_DOCUMENT;

  @override
  final String operationName =
      CHECK_PENDING_VIEWER_REVIEWS_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  final CheckPendingViewerReviewsArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  CheckPendingViewerReviews$Query parse(Map<String, dynamic> json) =>
      CheckPendingViewerReviews$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class GetParticipantsArguments extends JsonSerializable with EquatableMixin {
  GetParticipantsArguments({
    required this.id,
    this.after,
  });

  @override
  factory GetParticipantsArguments.fromJson(Map<String, dynamic> json) =>
      _$GetParticipantsArgumentsFromJson(json);

  late String id;

  final String? after;

  @override
  List<Object?> get props => [id, after];
  @override
  Map<String, dynamic> toJson() => _$GetParticipantsArgumentsToJson(this);
}

final GET_PARTICIPANTS_QUERY_DOCUMENT_OPERATION_NAME = 'getParticipants';
final GET_PARTICIPANTS_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getParticipants'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'after')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'node'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'id')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          InlineFragmentNode(
            typeCondition: TypeConditionNode(
                on: NamedTypeNode(
              name: NameNode(value: 'Issue'),
              isNonNull: false,
            )),
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'participants'),
                alias: null,
                arguments: [
                  ArgumentNode(
                    name: NameNode(value: 'after'),
                    value: VariableNode(name: NameNode(value: 'after')),
                  )
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
                        name: NameNode(value: 'cursor'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'node'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: SelectionSetNode(selections: [
                          FragmentSpreadNode(
                            name: NameNode(value: 'actor'),
                            directives: [],
                          )
                        ]),
                      ),
                    ]),
                  )
                ]),
              )
            ]),
          ),
        ]),
      )
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'actor'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'Actor'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'avatarUrl'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'login'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);

class GetParticipantsQuery
    extends GraphQLQuery<GetParticipants$Query, GetParticipantsArguments> {
  GetParticipantsQuery({required this.variables});

  @override
  final DocumentNode document = GET_PARTICIPANTS_QUERY_DOCUMENT;

  @override
  final String operationName = GET_PARTICIPANTS_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  final GetParticipantsArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  GetParticipants$Query parse(Map<String, dynamic> json) =>
      GetParticipants$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class FetchReviewArguments extends JsonSerializable with EquatableMixin {
  FetchReviewArguments({required this.id});

  @override
  factory FetchReviewArguments.fromJson(Map<String, dynamic> json) =>
      _$FetchReviewArgumentsFromJson(json);

  late String id;

  @override
  List<Object?> get props => [id];
  @override
  Map<String, dynamic> toJson() => _$FetchReviewArgumentsToJson(this);
}

final FETCH_REVIEW_QUERY_DOCUMENT_OPERATION_NAME = 'fetchReview';
final FETCH_REVIEW_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'fetchReview'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'node'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'id')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          InlineFragmentNode(
            typeCondition: TypeConditionNode(
                on: NamedTypeNode(
              name: NameNode(value: 'PullRequestReviewComment'),
              isNonNull: false,
            )),
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'bodyHTML'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'author'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FragmentSpreadNode(
                    name: NameNode(value: 'actor'),
                    directives: [],
                  )
                ]),
              ),
              FieldNode(
                name: NameNode(value: 'diffHunk'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'path'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
        ]),
      )
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'actor'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'Actor'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'avatarUrl'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'login'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);

class FetchReviewQuery
    extends GraphQLQuery<FetchReview$Query, FetchReviewArguments> {
  FetchReviewQuery({required this.variables});

  @override
  final DocumentNode document = FETCH_REVIEW_QUERY_DOCUMENT;

  @override
  final String operationName = FETCH_REVIEW_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  final FetchReviewArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  FetchReview$Query parse(Map<String, dynamic> json) =>
      FetchReview$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class IssuePullInfoArguments extends JsonSerializable with EquatableMixin {
  IssuePullInfoArguments({
    required this.user,
    required this.repo,
    required this.number,
  });

  @override
  factory IssuePullInfoArguments.fromJson(Map<String, dynamic> json) =>
      _$IssuePullInfoArgumentsFromJson(json);

  late String user;

  late String repo;

  late int number;

  @override
  List<Object?> get props => [user, repo, number];
  @override
  Map<String, dynamic> toJson() => _$IssuePullInfoArgumentsToJson(this);
}

final ISSUE_PULL_INFO_QUERY_DOCUMENT_OPERATION_NAME = 'issuePullInfo';
final ISSUE_PULL_INFO_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'issuePullInfo'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'user')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'repo')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'number')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'repository'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'name'),
            value: VariableNode(name: NameNode(value: 'repo')),
          ),
          ArgumentNode(
            name: NameNode(value: 'owner'),
            value: VariableNode(name: NameNode(value: 'user')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'issueOrPullRequest'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'number'),
                value: VariableNode(name: NameNode(value: 'number')),
              )
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              InlineFragmentNode(
                typeCondition: TypeConditionNode(
                    on: NamedTypeNode(
                  name: NameNode(value: 'Issue'),
                  isNonNull: false,
                )),
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FragmentSpreadNode(
                    name: NameNode(value: 'issueInfo'),
                    directives: [],
                  )
                ]),
              ),
              InlineFragmentNode(
                typeCondition: TypeConditionNode(
                    on: NamedTypeNode(
                  name: NameNode(value: 'PullRequest'),
                  isNonNull: false,
                )),
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FragmentSpreadNode(
                    name: NameNode(value: 'pullInfo'),
                    directives: [],
                  )
                ]),
              ),
            ]),
          )
        ]),
      )
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'issueInfo'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'Issue'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'activeLockReason'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'assignees'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'first'),
            value: IntValueNode(value: '5'),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'assigneeInfo'),
            directives: [],
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'author'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'actor'),
            directives: [],
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'participants'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'first'),
            value: IntValueNode(value: '5'),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'totalCount'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'nodes'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'avatarUrl'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              )
            ]),
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'authorAssociation'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'bodyHTML'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'body'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'closed'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'closedAt'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'createdAt'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'comments'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'totalCount'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'userContentEdits'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'totalCount'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'includesCreatedEdit'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'isPinned'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'labels'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'first'),
            value: IntValueNode(value: '100'),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'nodes'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(
                name: NameNode(value: 'label'),
                directives: [],
              )
            ]),
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'locked'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'number'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'reactionGroups'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'reactionGroups'),
            directives: [],
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'repository'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'repoInfo'),
            directives: [],
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'state'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'titleHTML'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'timelineItems'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'totalCount'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'url'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'viewerCanReact'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'viewerCanUpdate'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'assigneeInfo'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'UserConnection'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'totalCount'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'edges'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'cursor'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'node'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(
                name: NameNode(value: 'actor'),
                directives: [],
              )
            ]),
          ),
        ]),
      ),
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'actor'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'Actor'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'avatarUrl'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'login'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'label'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'Label'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'color'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'name'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'reactionGroups'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'ReactionGroup'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'content'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'viewerHasReacted'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'reactors'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'totalCount'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'subject'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          )
        ]),
      ),
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'repoInfo'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'Repository'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'name'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'owner'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'login'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'avatarUrl'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'pullInfo'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'PullRequest'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'activeLockReason'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'assignees'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'first'),
            value: IntValueNode(value: '5'),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'assigneeInfo'),
            directives: [],
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'author'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'actor'),
            directives: [],
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'authorAssociation'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'bodyHTML'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'body'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'closed'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'closedAt'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'createdAt'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'comments'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'totalCount'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'labels'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'first'),
            value: IntValueNode(value: '100'),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'nodes'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(
                name: NameNode(value: 'label'),
                directives: [],
              )
            ]),
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'locked'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'number'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'reactionGroups'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'reactionGroups'),
            directives: [],
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'repository'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'repoInfo'),
            directives: [],
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'state'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'timelineItems'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'totalCount'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'titleHTML'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'url'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'userContentEdits'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'totalCount'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'includesCreatedEdit'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'viewerCanReact'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'additions'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'deletions'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'baseRef'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'name'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'repository'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'url'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              )
            ]),
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'headRef'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'name'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'repository'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'url'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              )
            ]),
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'changedFiles'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'closingIssuesReferences'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'totalCount'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'commits'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'totalCount'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'isCrossRepository'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'merged'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'reviewDecision'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'viewerCanUpdate'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);

class IssuePullInfoQuery
    extends GraphQLQuery<IssuePullInfo$Query, IssuePullInfoArguments> {
  IssuePullInfoQuery({required this.variables});

  @override
  final DocumentNode document = ISSUE_PULL_INFO_QUERY_DOCUMENT;

  @override
  final String operationName = ISSUE_PULL_INFO_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  final IssuePullInfoArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  IssuePullInfo$Query parse(Map<String, dynamic> json) =>
      IssuePullInfo$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class GetReactorsArguments extends JsonSerializable with EquatableMixin {
  GetReactorsArguments({required this.id});

  @override
  factory GetReactorsArguments.fromJson(Map<String, dynamic> json) =>
      _$GetReactorsArgumentsFromJson(json);

  late String id;

  @override
  List<Object?> get props => [id];
  @override
  Map<String, dynamic> toJson() => _$GetReactorsArgumentsToJson(this);
}

final GET_REACTORS_QUERY_DOCUMENT_OPERATION_NAME = 'getReactors';
final GET_REACTORS_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getReactors'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'node'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: VariableNode(name: NameNode(value: 'id')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          InlineFragmentNode(
            typeCondition: TypeConditionNode(
                on: NamedTypeNode(
              name: NameNode(value: 'Issue'),
              isNonNull: false,
            )),
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'reactionGroups'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FragmentSpreadNode(
                    name: NameNode(value: 'reactorsGroup'),
                    directives: [],
                  )
                ]),
              )
            ]),
          ),
          InlineFragmentNode(
            typeCondition: TypeConditionNode(
                on: NamedTypeNode(
              name: NameNode(value: 'PullRequest'),
              isNonNull: false,
            )),
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'reactionGroups'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FragmentSpreadNode(
                    name: NameNode(value: 'reactorsGroup'),
                    directives: [],
                  )
                ]),
              )
            ]),
          ),
        ]),
      )
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'reactorsGroup'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'ReactionGroup'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'content'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'reactors'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'first'),
            value: IntValueNode(value: '11'),
          )
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
                name: NameNode(value: 'cursor'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
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
                    selectionSet: null,
                  ),
                  InlineFragmentNode(
                    typeCondition: TypeConditionNode(
                        on: NamedTypeNode(
                      name: NameNode(value: 'User'),
                      isNonNull: false,
                    )),
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FragmentSpreadNode(
                        name: NameNode(value: 'actor'),
                        directives: [],
                      )
                    ]),
                  ),
                ]),
              ),
            ]),
          )
        ]),
      ),
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'actor'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'Actor'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'avatarUrl'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'login'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);

class GetReactorsQuery
    extends GraphQLQuery<GetReactors$Query, GetReactorsArguments> {
  GetReactorsQuery({required this.variables});

  @override
  final DocumentNode document = GET_REACTORS_QUERY_DOCUMENT;

  @override
  final String operationName = GET_REACTORS_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  final GetReactorsArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  GetReactors$Query parse(Map<String, dynamic> json) =>
      GetReactors$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class AddReactionArguments extends JsonSerializable with EquatableMixin {
  AddReactionArguments({
    required this.id,
    required this.content,
  });

  @override
  factory AddReactionArguments.fromJson(Map<String, dynamic> json) =>
      _$AddReactionArgumentsFromJson(json);

  late String id;

  @JsonKey(unknownEnumValue: ReactionContent.artemisUnknown)
  late ReactionContent content;

  @override
  List<Object?> get props => [id, content];
  @override
  Map<String, dynamic> toJson() => _$AddReactionArgumentsToJson(this);
}

final ADD_REACTION_MUTATION_DOCUMENT_OPERATION_NAME = 'addReaction';
final ADD_REACTION_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'addReaction'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'content')),
        type: NamedTypeNode(
          name: NameNode(value: 'ReactionContent'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'addReaction'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'subjectId'),
                value: VariableNode(name: NameNode(value: 'id')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'content'),
                value: VariableNode(name: NameNode(value: 'content')),
              ),
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'reaction'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'createdAt'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              )
            ]),
          )
        ]),
      )
    ]),
  )
]);

class AddReactionMutation
    extends GraphQLQuery<AddReaction$Mutation, AddReactionArguments> {
  AddReactionMutation({required this.variables});

  @override
  final DocumentNode document = ADD_REACTION_MUTATION_DOCUMENT;

  @override
  final String operationName = ADD_REACTION_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final AddReactionArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  AddReaction$Mutation parse(Map<String, dynamic> json) =>
      AddReaction$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class RemoveReactionArguments extends JsonSerializable with EquatableMixin {
  RemoveReactionArguments({
    required this.id,
    required this.content,
  });

  @override
  factory RemoveReactionArguments.fromJson(Map<String, dynamic> json) =>
      _$RemoveReactionArgumentsFromJson(json);

  late String id;

  @JsonKey(unknownEnumValue: ReactionContent.artemisUnknown)
  late ReactionContent content;

  @override
  List<Object?> get props => [id, content];
  @override
  Map<String, dynamic> toJson() => _$RemoveReactionArgumentsToJson(this);
}

final REMOVE_REACTION_MUTATION_DOCUMENT_OPERATION_NAME = 'removeReaction';
final REMOVE_REACTION_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'removeReaction'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'content')),
        type: NamedTypeNode(
          name: NameNode(value: 'ReactionContent'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'removeReaction'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'subjectId'),
                value: VariableNode(name: NameNode(value: 'id')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'content'),
                value: VariableNode(name: NameNode(value: 'content')),
              ),
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'reaction'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'createdAt'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              )
            ]),
          )
        ]),
      )
    ]),
  )
]);

class RemoveReactionMutation
    extends GraphQLQuery<RemoveReaction$Mutation, RemoveReactionArguments> {
  RemoveReactionMutation({required this.variables});

  @override
  final DocumentNode document = REMOVE_REACTION_MUTATION_DOCUMENT;

  @override
  final String operationName = REMOVE_REACTION_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final RemoveReactionArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  RemoveReaction$Mutation parse(Map<String, dynamic> json) =>
      RemoveReaction$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class IssuePullAssigneesArguments extends JsonSerializable with EquatableMixin {
  IssuePullAssigneesArguments({
    required this.user,
    required this.repo,
    required this.number,
    this.after,
  });

  @override
  factory IssuePullAssigneesArguments.fromJson(Map<String, dynamic> json) =>
      _$IssuePullAssigneesArgumentsFromJson(json);

  late String user;

  late String repo;

  late int number;

  final String? after;

  @override
  List<Object?> get props => [user, repo, number, after];
  @override
  Map<String, dynamic> toJson() => _$IssuePullAssigneesArgumentsToJson(this);
}

final ISSUE_PULL_ASSIGNEES_QUERY_DOCUMENT_OPERATION_NAME = 'issuePullAssignees';
final ISSUE_PULL_ASSIGNEES_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'issuePullAssignees'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'user')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'repo')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'number')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'after')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'repository'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'name'),
            value: VariableNode(name: NameNode(value: 'repo')),
          ),
          ArgumentNode(
            name: NameNode(value: 'owner'),
            value: VariableNode(name: NameNode(value: 'user')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'issueOrPullRequest'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'number'),
                value: VariableNode(name: NameNode(value: 'number')),
              )
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              InlineFragmentNode(
                typeCondition: TypeConditionNode(
                    on: NamedTypeNode(
                  name: NameNode(value: 'Issue'),
                  isNonNull: false,
                )),
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FragmentSpreadNode(
                    name: NameNode(value: 'assigneeUserList'),
                    directives: [],
                  )
                ]),
              ),
              InlineFragmentNode(
                typeCondition: TypeConditionNode(
                    on: NamedTypeNode(
                  name: NameNode(value: 'PullRequest'),
                  isNonNull: false,
                )),
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FragmentSpreadNode(
                    name: NameNode(value: 'assigneeUserList'),
                    directives: [],
                  )
                ]),
              ),
            ]),
          )
        ]),
      )
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'assigneeUserList'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'Assignable'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'assignees'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'after'),
            value: VariableNode(name: NameNode(value: 'after')),
          ),
          ArgumentNode(
            name: NameNode(value: 'first'),
            value: IntValueNode(value: '10'),
          ),
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
                name: NameNode(value: 'cursor'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'node'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: SelectionSetNode(selections: [
                  FragmentSpreadNode(
                    name: NameNode(value: 'actor'),
                    directives: [],
                  )
                ]),
              ),
            ]),
          )
        ]),
      )
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'actor'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'Actor'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'avatarUrl'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'login'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);

class IssuePullAssigneesQuery extends GraphQLQuery<IssuePullAssignees$Query,
    IssuePullAssigneesArguments> {
  IssuePullAssigneesQuery({required this.variables});

  @override
  final DocumentNode document = ISSUE_PULL_ASSIGNEES_QUERY_DOCUMENT;

  @override
  final String operationName =
      ISSUE_PULL_ASSIGNEES_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  final IssuePullAssigneesArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  IssuePullAssignees$Query parse(Map<String, dynamic> json) =>
      IssuePullAssignees$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class SearchMentionUsersArguments extends JsonSerializable with EquatableMixin {
  SearchMentionUsersArguments({
    required this.query,
    this.after,
  });

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

final SEARCH_MENTION_USERS_QUERY_DOCUMENT_OPERATION_NAME = 'searchMentionUsers';
final SEARCH_MENTION_USERS_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'searchMentionUsers'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'query')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'after')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'search'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'query'),
            value: VariableNode(name: NameNode(value: 'query')),
          ),
          ArgumentNode(
            name: NameNode(value: 'type'),
            value: EnumValueNode(name: NameNode(value: 'USER')),
          ),
          ArgumentNode(
            name: NameNode(value: 'first'),
            value: IntValueNode(value: '20'),
          ),
          ArgumentNode(
            name: NameNode(value: 'after'),
            value: VariableNode(name: NameNode(value: 'after')),
          ),
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
                    selectionSet: null,
                  ),
                  InlineFragmentNode(
                    typeCondition: TypeConditionNode(
                        on: NamedTypeNode(
                      name: NameNode(value: 'User'),
                      isNonNull: false,
                    )),
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                        name: NameNode(value: 'login'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'avatarUrl'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                    ]),
                  ),
                  InlineFragmentNode(
                    typeCondition: TypeConditionNode(
                        on: NamedTypeNode(
                      name: NameNode(value: 'Organization'),
                      isNonNull: false,
                    )),
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                        name: NameNode(value: 'login'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'avatarUrl'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                    ]),
                  ),
                ]),
              ),
              FieldNode(
                name: NameNode(value: 'cursor'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          )
        ]),
      )
    ]),
  )
]);

class SearchMentionUsersQuery extends GraphQLQuery<SearchMentionUsers$Query,
    SearchMentionUsersArguments> {
  SearchMentionUsersQuery({required this.variables});

  @override
  final DocumentNode document = SEARCH_MENTION_USERS_QUERY_DOCUMENT;

  @override
  final String operationName =
      SEARCH_MENTION_USERS_QUERY_DOCUMENT_OPERATION_NAME;

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

final GET_USER_PINNED_REPOS_QUERY_DOCUMENT_OPERATION_NAME =
    'getUserPinnedRepos';
final GET_USER_PINNED_REPOS_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getUserPinnedRepos'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'user')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'user'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'login'),
            value: VariableNode(name: NameNode(value: 'user')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'pinnedItems'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'first'),
                value: IntValueNode(value: '6'),
              ),
              ArgumentNode(
                name: NameNode(value: 'types'),
                value: ListValueNode(values: [
                  EnumValueNode(name: NameNode(value: 'REPOSITORY'))
                ]),
              ),
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
                        selectionSet: null,
                      ),
                      InlineFragmentNode(
                        typeCondition: TypeConditionNode(
                            on: NamedTypeNode(
                          name: NameNode(value: 'Repository'),
                          isNonNull: false,
                        )),
                        directives: [],
                        selectionSet: SelectionSetNode(selections: [
                          FieldNode(
                            name: NameNode(value: 'name'),
                            alias: null,
                            arguments: [],
                            directives: [],
                            selectionSet: null,
                          ),
                          FieldNode(
                            name: NameNode(value: 'description'),
                            alias: null,
                            arguments: [],
                            directives: [],
                            selectionSet: null,
                          ),
                          FieldNode(
                            name: NameNode(value: 'stargazerCount'),
                            alias: null,
                            arguments: [],
                            directives: [],
                            selectionSet: null,
                          ),
                          FieldNode(
                            name: NameNode(value: 'updatedAt'),
                            alias: null,
                            arguments: [],
                            directives: [],
                            selectionSet: null,
                          ),
                          FieldNode(
                            name: NameNode(value: 'url'),
                            alias: null,
                            arguments: [],
                            directives: [],
                            selectionSet: null,
                          ),
                          FieldNode(
                            name: NameNode(value: 'owner'),
                            alias: null,
                            arguments: [],
                            directives: [],
                            selectionSet: SelectionSetNode(selections: [
                              FieldNode(
                                name: NameNode(value: 'login'),
                                alias: null,
                                arguments: [],
                                directives: [],
                                selectionSet: null,
                              )
                            ]),
                          ),
                          FieldNode(
                            name: NameNode(value: 'languages'),
                            alias: null,
                            arguments: [
                              ArgumentNode(
                                name: NameNode(value: 'orderBy'),
                                value: ObjectValueNode(fields: [
                                  ObjectFieldNode(
                                    name: NameNode(value: 'direction'),
                                    value: EnumValueNode(
                                        name: NameNode(value: 'DESC')),
                                  ),
                                  ObjectFieldNode(
                                    name: NameNode(value: 'field'),
                                    value: EnumValueNode(
                                        name: NameNode(value: 'SIZE')),
                                  ),
                                ]),
                              ),
                              ArgumentNode(
                                name: NameNode(value: 'first'),
                                value: IntValueNode(value: '1'),
                              ),
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
                                        name: NameNode(value: 'name'),
                                        alias: null,
                                        arguments: [],
                                        directives: [],
                                        selectionSet: null,
                                      )
                                    ]),
                                  )
                                ]),
                              )
                            ]),
                          ),
                        ]),
                      ),
                    ]),
                  )
                ]),
              )
            ]),
          )
        ]),
      )
    ]),
  )
]);

class GetUserPinnedReposQuery extends GraphQLQuery<GetUserPinnedRepos$Query,
    GetUserPinnedReposArguments> {
  GetUserPinnedReposQuery({required this.variables});

  @override
  final DocumentNode document = GET_USER_PINNED_REPOS_QUERY_DOCUMENT;

  @override
  final String operationName =
      GET_USER_PINNED_REPOS_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  final GetUserPinnedReposArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  GetUserPinnedRepos$Query parse(Map<String, dynamic> json) =>
      GetUserPinnedRepos$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class FollowStatusInfoArguments extends JsonSerializable with EquatableMixin {
  FollowStatusInfoArguments({required this.user});

  @override
  factory FollowStatusInfoArguments.fromJson(Map<String, dynamic> json) =>
      _$FollowStatusInfoArgumentsFromJson(json);

  late String user;

  @override
  List<Object?> get props => [user];
  @override
  Map<String, dynamic> toJson() => _$FollowStatusInfoArgumentsToJson(this);
}

final FOLLOW_STATUS_INFO_QUERY_DOCUMENT_OPERATION_NAME = 'followStatusInfo';
final FOLLOW_STATUS_INFO_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'followStatusInfo'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'user')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'user'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'login'),
            value: VariableNode(name: NameNode(value: 'user')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'viewerIsFollowing'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'viewerCanFollow'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'followers'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'totalCount'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              )
            ]),
          ),
        ]),
      )
    ]),
  )
]);

class FollowStatusInfoQuery
    extends GraphQLQuery<FollowStatusInfo$Query, FollowStatusInfoArguments> {
  FollowStatusInfoQuery({required this.variables});

  @override
  final DocumentNode document = FOLLOW_STATUS_INFO_QUERY_DOCUMENT;

  @override
  final String operationName = FOLLOW_STATUS_INFO_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  final FollowStatusInfoArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  FollowStatusInfo$Query parse(Map<String, dynamic> json) =>
      FollowStatusInfo$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class FollowUserArguments extends JsonSerializable with EquatableMixin {
  FollowUserArguments({required this.user});

  @override
  factory FollowUserArguments.fromJson(Map<String, dynamic> json) =>
      _$FollowUserArgumentsFromJson(json);

  late String user;

  @override
  List<Object?> get props => [user];
  @override
  Map<String, dynamic> toJson() => _$FollowUserArgumentsToJson(this);
}

final FOLLOW_USER_MUTATION_DOCUMENT_OPERATION_NAME = 'followUser';
final FOLLOW_USER_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'followUser'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'user')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'followUser'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'userId'),
                value: VariableNode(name: NameNode(value: 'user')),
              )
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'user'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'login'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              )
            ]),
          )
        ]),
      )
    ]),
  )
]);

class FollowUserMutation
    extends GraphQLQuery<FollowUser$Mutation, FollowUserArguments> {
  FollowUserMutation({required this.variables});

  @override
  final DocumentNode document = FOLLOW_USER_MUTATION_DOCUMENT;

  @override
  final String operationName = FOLLOW_USER_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final FollowUserArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  FollowUser$Mutation parse(Map<String, dynamic> json) =>
      FollowUser$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class UnfollowUserArguments extends JsonSerializable with EquatableMixin {
  UnfollowUserArguments({required this.user});

  @override
  factory UnfollowUserArguments.fromJson(Map<String, dynamic> json) =>
      _$UnfollowUserArgumentsFromJson(json);

  late String user;

  @override
  List<Object?> get props => [user];
  @override
  Map<String, dynamic> toJson() => _$UnfollowUserArgumentsToJson(this);
}

final UNFOLLOW_USER_MUTATION_DOCUMENT_OPERATION_NAME = 'unfollowUser';
final UNFOLLOW_USER_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'unfollowUser'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'user')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'unfollowUser'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'userId'),
                value: VariableNode(name: NameNode(value: 'user')),
              )
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'user'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'login'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              )
            ]),
          )
        ]),
      )
    ]),
  )
]);

class UnfollowUserMutation
    extends GraphQLQuery<UnfollowUser$Mutation, UnfollowUserArguments> {
  UnfollowUserMutation({required this.variables});

  @override
  final DocumentNode document = UNFOLLOW_USER_MUTATION_DOCUMENT;

  @override
  final String operationName = UNFOLLOW_USER_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final UnfollowUserArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  UnfollowUser$Mutation parse(Map<String, dynamic> json) =>
      UnfollowUser$Mutation.fromJson(json);
}
