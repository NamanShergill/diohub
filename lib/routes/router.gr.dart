// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
// ignore_for_file: always_require_non_null_named_parameters, annotate_overrides, avoid_function_literals_in_foreach_calls, avoid_init_to_null, avoid_null_checks_in_equality_operators, avoid_renaming_method_parameters, avoid_return_types_on_setters, avoid_returning_null_for_void, avoid_single_cascade_in_expression_statements, constant_identifier_names, control_flow_in_finally, empty_constructor_bodies, empty_statements, exhaustive_cases, implementation_imports, library_names, library_prefixes, null_closures, overridden_fields, package_names, prefer_adjacent_string_concatenation, prefer_collection_literals, prefer_conditional_assignment, prefer_contains, prefer_equal_for_default_values, prefer_final_fields, prefer_for_elements_to_map_fromIterable, prefer_function_declarations_over_variables, prefer_if_null_operators, prefer_initializing_formals, prefer_inlined_adds, prefer_is_not_operator, prefer_null_aware_operators, prefer_spread_collections, prefer_void_to_null, recursive_getters, slash_for_doc_comments, type_init_formals, unnecessary_brace_in_string_interps, unnecessary_const, unnecessary_getters_setters, unnecessary_new, unnecessary_null_in_if_null_operators, unnecessary_string_escapes, unnecessary_string_interpolations, unnecessary_this, use_function_type_syntax_for_parameters, use_rethrow_when_possible, valid_regexps, always_use_package_imports, avoid_relative_lib_imports, always_declare_return_types, avoid_double_and_int_checks, avoid_empty_else, avoid_print, avoid_private_typedef_functions, avoid_setters_without_getters, avoid_shadowing_type_parameters, avoid_slow_async_io, avoid_types_as_parameter_names, avoid_unused_constructor_parameters, await_only_futures, camel_case_extensions, camel_case_types, cancel_subscriptions, curly_braces_in_flow_control_structures, directives_ordering, file_names, flutter_style_todos, list_remove_unrelated_type, no_duplicate_case_values, non_constant_identifier_names, no_adjacent_strings_in_list, one_member_abstracts, only_throw_errors, package_api_docs, parameter_assignments, prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_const_declarations, prefer_const_literals_to_create_immutables, prefer_constructors_over_static_methods, prefer_asserts_with_message, prefer_asserts_in_initializer_lists, package_prefixed_library_names, prefer_final_in_for_each, prefer_final_locals, provide_deprecation_message, prefer_foreach, prefer_is_empty, prefer_is_not_empty, prefer_typing_uninitialized_variables, sort_child_properties_last, sort_constructors_first, use_setters_to_change_properties, use_string_buffers, sort_pub_dependencies, sort_unnamed_constructors_first, throw_in_finally, type_annotate_public_apis, unnecessary_await_in_return, unnecessary_lambdas, unnecessary_null_aware_assignments, unnecessary_overrides, unnecessary_parenthesis, unnecessary_statements, unrelated_type_equality_checks, unsafe_html, use_full_hex_values_for_flutter_colors, use_to_and_as_if_applicable, void_checks, always_put_control_body_on_new_line, avoid_bool_literals_in_conditional_expressions, avoid_catching_errors, avoid_field_initializers_in_const_classes, hash_and_equals, literal_only_boolean_expressions, join_return_with_assignment, invariant_booleans, avoid_classes_with_only_static_members, avoid_equals_and_hash_code_on_mutable_classes, avoid_positional_boolean_parameters, avoid_returning_null, avoid_returning_this, avoid_returning_null_for_future, avoid_types_on_closure_parameters, omit_local_variable_types, prefer_generic_function_type_aliases, prefer_interpolation_to_compose_strings, prefer_iterable_whereType, prefer_mixin, prefer_single_quotes, iterable_contains_unrelated_type, empty_catches, avoid_catches_without_on_clauses, lines_longer_than_80_chars

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../common/search_overlay/search_overlay.dart' as _i8;
import '../controller/deep_linking_handler.dart' as _i19;
import '../graphql/graphql.dart' as _i20;
import '../view/authentication/auth_screen.dart' as _i4;
import '../view/issues_pulls/issue_screen.dart' as _i9;
import '../view/issues_pulls/pull_screen.dart' as _i10;
import '../view/issues_pulls/widgets/p_r_review_screen.dart' as _i18;
import '../view/landing/landing.dart' as _i6;
import '../view/landing/widgets/landing_loading_screen.dart' as _i5;
import '../view/landing/widgets/place_holder_screen.dart' as _i7;
import '../view/profile/other_user_profile_screen.dart' as _i16;
import '../view/repository/code/file_viewer.dart' as _i12;
import '../view/repository/commits/commit_info_screen.dart' as _i13;
import '../view/repository/commits/widgets/changes_viewer.dart' as _i15;
import '../view/repository/issues/new_issue_screen.dart' as _i17;
import '../view/repository/repository_screen.dart' as _i11;
import '../view/repository/wiki/wiki_viewer.dart' as _i14;
import 'router.dart' as _i3;

class AppRouter extends _i1.RootStackRouter {
  AppRouter(
      {_i2.GlobalKey<_i2.NavigatorState>? navigatorKey,
      required this.authGuard})
      : super(navigatorKey);

  final _i3.AuthGuard authGuard;

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    AuthScreenRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<AuthScreenRouteArgs>(
              orElse: () => const AuthScreenRouteArgs());
          return _i4.AuthScreen(
              key: args.key, onAuthenticated: args.onAuthenticated);
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideLeft,
        opaque: true,
        barrierDismissible: false),
    LandingLoadingScreenRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<LandingLoadingScreenRouteArgs>(
              orElse: () => const LandingLoadingScreenRouteArgs());
          return _i5.LandingLoadingScreen(
              key: args.key, initLink: args.initLink);
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideLeft,
        opaque: true,
        barrierDismissible: false),
    LandingScreenRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<LandingScreenRouteArgs>(
              orElse: () => const LandingScreenRouteArgs());
          return _i6.LandingScreen(
              deepLinkData: args.deepLinkData, key: args.key);
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideLeft,
        opaque: true,
        barrierDismissible: false),
    PlaceHolderScreenRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i7.PlaceHolderScreen();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideLeft,
        opaque: true,
        barrierDismissible: false),
    SearchOverlayScreenRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<SearchOverlayScreenRouteArgs>();
          return _i8.SearchOverlayScreen(args.searchData,
              message: args.message,
              heroTag: args.heroTag,
              multiHero: args.multiHero,
              onSubmit: args.onSubmit,
              key: args.key);
        },
        transitionsBuilder: _i1.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false),
    IssueScreenRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<IssueScreenRouteArgs>();
          return _i9.IssueScreen(args.issueURL,
              initialIndex: args.initialIndex,
              commentsSince: args.commentsSince,
              key: args.key);
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideLeft,
        opaque: true,
        barrierDismissible: false),
    PullScreenRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<PullScreenRouteArgs>();
          return _i10.PullScreen(args.pullURL,
              initialIndex: args.initialIndex,
              commentsSince: args.commentsSince,
              key: args.key);
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideLeft,
        opaque: true,
        barrierDismissible: false),
    RepositoryScreenRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<RepositoryScreenRouteArgs>();
          return _i11.RepositoryScreen(args.repositoryURL,
              branch: args.branch,
              index: args.index,
              deepLinkData: args.deepLinkData,
              key: args.key,
              initSHA: args.initSHA);
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideLeft,
        opaque: true,
        barrierDismissible: false),
    FileViewerAPIRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<FileViewerAPIRouteArgs>();
          return _i12.FileViewerAPI(args.sha,
              repoURL: args.repoURL,
              fileName: args.fileName,
              branch: args.branch,
              repoName: args.repoName,
              key: args.key);
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideLeft,
        opaque: true,
        barrierDismissible: false),
    CommitInfoScreenRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<CommitInfoScreenRouteArgs>(
              orElse: () => const CommitInfoScreenRouteArgs());
          return _i13.CommitInfoScreen(
              key: args.key, commitURL: args.commitURL);
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideLeft,
        opaque: true,
        barrierDismissible: false),
    WikiViewerRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<WikiViewerRouteArgs>(
              orElse: () => const WikiViewerRouteArgs());
          return _i14.WikiViewer(key: args.key, repoURL: args.repoURL);
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideLeft,
        opaque: true,
        barrierDismissible: false),
    ChangesViewerRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<ChangesViewerRouteArgs>();
          return _i15.ChangesViewer(args.patch, args.contentURL, args.fileType,
              key: args.key);
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideLeft,
        opaque: true,
        barrierDismissible: false),
    OtherUserProfileScreenRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<OtherUserProfileScreenRouteArgs>();
          return _i16.OtherUserProfileScreen(args.login, key: args.key);
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideLeft,
        opaque: true,
        barrierDismissible: false),
    NewIssueScreenRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<NewIssueScreenRouteArgs>();
          return _i17.NewIssueScreen(
              key: args.key,
              template: args.template,
              repo: args.repo,
              owner: args.owner);
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideLeft,
        opaque: true,
        barrierDismissible: false),
    PRReviewScreenRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<PRReviewScreenRouteArgs>();
          return _i18.PRReviewScreen(args.nodeID,
              key: args.key, pullNodeID: args.pullNodeID);
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideLeft,
        opaque: true,
        barrierDismissible: false)
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(AuthScreenRoute.name, path: '/auth-screen'),
        _i1.RouteConfig(LandingLoadingScreenRoute.name,
            path: '/', guards: [authGuard]),
        _i1.RouteConfig(LandingScreenRoute.name,
            path: '/landing-screen', guards: [authGuard]),
        _i1.RouteConfig(PlaceHolderScreenRoute.name,
            path: '/place-holder-screen', guards: [authGuard]),
        _i1.RouteConfig(SearchOverlayScreenRoute.name,
            path: '/search-overlay-screen', guards: [authGuard]),
        _i1.RouteConfig(IssueScreenRoute.name,
            path: '/issue-screen', guards: [authGuard]),
        _i1.RouteConfig(PullScreenRoute.name,
            path: '/pull-screen', guards: [authGuard]),
        _i1.RouteConfig(RepositoryScreenRoute.name,
            path: '/repository-screen', guards: [authGuard]),
        _i1.RouteConfig(FileViewerAPIRoute.name,
            path: '/file-viewer-ap-i', guards: [authGuard]),
        _i1.RouteConfig(CommitInfoScreenRoute.name,
            path: '/commit-info-screen', guards: [authGuard]),
        _i1.RouteConfig(WikiViewerRoute.name,
            path: '/wiki-viewer', guards: [authGuard]),
        _i1.RouteConfig(ChangesViewerRoute.name,
            path: '/changes-viewer', guards: [authGuard]),
        _i1.RouteConfig(OtherUserProfileScreenRoute.name,
            path: '/other-user-profile-screen', guards: [authGuard]),
        _i1.RouteConfig(NewIssueScreenRoute.name,
            path: '/new-issue-screen', guards: [authGuard]),
        _i1.RouteConfig(PRReviewScreenRoute.name,
            path: '/p-rreview-screen', guards: [authGuard])
      ];
}

class AuthScreenRoute extends _i1.PageRouteInfo<AuthScreenRouteArgs> {
  AuthScreenRoute({_i2.Key? key, void Function()? onAuthenticated})
      : super(name,
            path: '/auth-screen',
            args: AuthScreenRouteArgs(
                key: key, onAuthenticated: onAuthenticated));

  static const String name = 'AuthScreenRoute';
}

class AuthScreenRouteArgs {
  const AuthScreenRouteArgs({this.key, this.onAuthenticated});

  final _i2.Key? key;

  final void Function()? onAuthenticated;
}

class LandingLoadingScreenRoute
    extends _i1.PageRouteInfo<LandingLoadingScreenRouteArgs> {
  LandingLoadingScreenRoute({_i2.Key? key, String? initLink})
      : super(name,
            path: '/',
            args: LandingLoadingScreenRouteArgs(key: key, initLink: initLink));

  static const String name = 'LandingLoadingScreenRoute';
}

class LandingLoadingScreenRouteArgs {
  const LandingLoadingScreenRouteArgs({this.key, this.initLink});

  final _i2.Key? key;

  final String? initLink;
}

class LandingScreenRoute extends _i1.PageRouteInfo<LandingScreenRouteArgs> {
  LandingScreenRoute({_i19.DeepLinkData? deepLinkData, _i2.Key? key})
      : super(name,
            path: '/landing-screen',
            args: LandingScreenRouteArgs(deepLinkData: deepLinkData, key: key));

  static const String name = 'LandingScreenRoute';
}

class LandingScreenRouteArgs {
  const LandingScreenRouteArgs({this.deepLinkData, this.key});

  final _i19.DeepLinkData? deepLinkData;

  final _i2.Key? key;
}

class PlaceHolderScreenRoute extends _i1.PageRouteInfo {
  const PlaceHolderScreenRoute() : super(name, path: '/place-holder-screen');

  static const String name = 'PlaceHolderScreenRoute';
}

class SearchOverlayScreenRoute
    extends _i1.PageRouteInfo<SearchOverlayScreenRouteArgs> {
  SearchOverlayScreenRoute(
      {required _i8.SearchData searchData,
      String? message,
      String heroTag = 'search_bar',
      required bool multiHero,
      required void Function(_i8.SearchData) onSubmit,
      _i2.Key? key})
      : super(name,
            path: '/search-overlay-screen',
            args: SearchOverlayScreenRouteArgs(
                searchData: searchData,
                message: message,
                heroTag: heroTag,
                multiHero: multiHero,
                onSubmit: onSubmit,
                key: key));

  static const String name = 'SearchOverlayScreenRoute';
}

class SearchOverlayScreenRouteArgs {
  const SearchOverlayScreenRouteArgs(
      {required this.searchData,
      this.message,
      this.heroTag = 'search_bar',
      required this.multiHero,
      required this.onSubmit,
      this.key});

  final _i8.SearchData searchData;

  final String? message;

  final String heroTag;

  final bool multiHero;

  final void Function(_i8.SearchData) onSubmit;

  final _i2.Key? key;
}

class IssueScreenRoute extends _i1.PageRouteInfo<IssueScreenRouteArgs> {
  IssueScreenRoute(
      {required String? issueURL,
      int initialIndex = 0,
      DateTime? commentsSince,
      _i2.Key? key})
      : super(name,
            path: '/issue-screen',
            args: IssueScreenRouteArgs(
                issueURL: issueURL,
                initialIndex: initialIndex,
                commentsSince: commentsSince,
                key: key));

  static const String name = 'IssueScreenRoute';
}

class IssueScreenRouteArgs {
  const IssueScreenRouteArgs(
      {required this.issueURL,
      this.initialIndex = 0,
      this.commentsSince,
      this.key});

  final String? issueURL;

  final int initialIndex;

  final DateTime? commentsSince;

  final _i2.Key? key;
}

class PullScreenRoute extends _i1.PageRouteInfo<PullScreenRouteArgs> {
  PullScreenRoute(
      {required String? pullURL,
      int initialIndex = 0,
      DateTime? commentsSince,
      _i2.Key? key})
      : super(name,
            path: '/pull-screen',
            args: PullScreenRouteArgs(
                pullURL: pullURL,
                initialIndex: initialIndex,
                commentsSince: commentsSince,
                key: key));

  static const String name = 'PullScreenRoute';
}

class PullScreenRouteArgs {
  const PullScreenRouteArgs(
      {required this.pullURL,
      this.initialIndex = 0,
      this.commentsSince,
      this.key});

  final String? pullURL;

  final int initialIndex;

  final DateTime? commentsSince;

  final _i2.Key? key;
}

class RepositoryScreenRoute
    extends _i1.PageRouteInfo<RepositoryScreenRouteArgs> {
  RepositoryScreenRoute(
      {required String? repositoryURL,
      String? branch,
      int index = 0,
      _i19.DeepLinkData? deepLinkData,
      _i2.Key? key,
      String? initSHA})
      : super(name,
            path: '/repository-screen',
            args: RepositoryScreenRouteArgs(
                repositoryURL: repositoryURL,
                branch: branch,
                index: index,
                deepLinkData: deepLinkData,
                key: key,
                initSHA: initSHA));

  static const String name = 'RepositoryScreenRoute';
}

class RepositoryScreenRouteArgs {
  const RepositoryScreenRouteArgs(
      {required this.repositoryURL,
      this.branch,
      this.index = 0,
      this.deepLinkData,
      this.key,
      this.initSHA});

  final String? repositoryURL;

  final String? branch;

  final int index;

  final _i19.DeepLinkData? deepLinkData;

  final _i2.Key? key;

  final String? initSHA;
}

class FileViewerAPIRoute extends _i1.PageRouteInfo<FileViewerAPIRouteArgs> {
  FileViewerAPIRoute(
      {required String? sha,
      String? repoURL,
      String? fileName,
      String? branch,
      String? repoName,
      _i2.Key? key})
      : super(name,
            path: '/file-viewer-ap-i',
            args: FileViewerAPIRouteArgs(
                sha: sha,
                repoURL: repoURL,
                fileName: fileName,
                branch: branch,
                repoName: repoName,
                key: key));

  static const String name = 'FileViewerAPIRoute';
}

class FileViewerAPIRouteArgs {
  const FileViewerAPIRouteArgs(
      {required this.sha,
      this.repoURL,
      this.fileName,
      this.branch,
      this.repoName,
      this.key});

  final String? sha;

  final String? repoURL;

  final String? fileName;

  final String? branch;

  final String? repoName;

  final _i2.Key? key;
}

class CommitInfoScreenRoute
    extends _i1.PageRouteInfo<CommitInfoScreenRouteArgs> {
  CommitInfoScreenRoute({_i2.Key? key, String? commitURL})
      : super(name,
            path: '/commit-info-screen',
            args: CommitInfoScreenRouteArgs(key: key, commitURL: commitURL));

  static const String name = 'CommitInfoScreenRoute';
}

class CommitInfoScreenRouteArgs {
  const CommitInfoScreenRouteArgs({this.key, this.commitURL});

  final _i2.Key? key;

  final String? commitURL;
}

class WikiViewerRoute extends _i1.PageRouteInfo<WikiViewerRouteArgs> {
  WikiViewerRoute({_i2.Key? key, String? repoURL})
      : super(name,
            path: '/wiki-viewer',
            args: WikiViewerRouteArgs(key: key, repoURL: repoURL));

  static const String name = 'WikiViewerRoute';
}

class WikiViewerRouteArgs {
  const WikiViewerRouteArgs({this.key, this.repoURL});

  final _i2.Key? key;

  final String? repoURL;
}

class ChangesViewerRoute extends _i1.PageRouteInfo<ChangesViewerRouteArgs> {
  ChangesViewerRoute(
      {required String? patch,
      required String? contentURL,
      required String? fileType,
      _i2.Key? key})
      : super(name,
            path: '/changes-viewer',
            args: ChangesViewerRouteArgs(
                patch: patch,
                contentURL: contentURL,
                fileType: fileType,
                key: key));

  static const String name = 'ChangesViewerRoute';
}

class ChangesViewerRouteArgs {
  const ChangesViewerRouteArgs(
      {required this.patch,
      required this.contentURL,
      required this.fileType,
      this.key});

  final String? patch;

  final String? contentURL;

  final String? fileType;

  final _i2.Key? key;
}

class OtherUserProfileScreenRoute
    extends _i1.PageRouteInfo<OtherUserProfileScreenRouteArgs> {
  OtherUserProfileScreenRoute({required String? login, _i2.Key? key})
      : super(name,
            path: '/other-user-profile-screen',
            args: OtherUserProfileScreenRouteArgs(login: login, key: key));

  static const String name = 'OtherUserProfileScreenRoute';
}

class OtherUserProfileScreenRouteArgs {
  const OtherUserProfileScreenRouteArgs({required this.login, this.key});

  final String? login;

  final _i2.Key? key;
}

class NewIssueScreenRoute extends _i1.PageRouteInfo<NewIssueScreenRouteArgs> {
  NewIssueScreenRoute(
      {_i2.Key? key,
      _i20.IssueTemplates$Query$Repository$IssueTemplates? template,
      required String repo,
      required String owner})
      : super(name,
            path: '/new-issue-screen',
            args: NewIssueScreenRouteArgs(
                key: key, template: template, repo: repo, owner: owner));

  static const String name = 'NewIssueScreenRoute';
}

class NewIssueScreenRouteArgs {
  const NewIssueScreenRouteArgs(
      {this.key, this.template, required this.repo, required this.owner});

  final _i2.Key? key;

  final _i20.IssueTemplates$Query$Repository$IssueTemplates? template;

  final String repo;

  final String owner;
}

class PRReviewScreenRoute extends _i1.PageRouteInfo<PRReviewScreenRouteArgs> {
  PRReviewScreenRoute(
      {required String nodeID, _i2.Key? key, required String pullNodeID})
      : super(name,
            path: '/p-rreview-screen',
            args: PRReviewScreenRouteArgs(
                nodeID: nodeID, key: key, pullNodeID: pullNodeID));

  static const String name = 'PRReviewScreenRoute';
}

class PRReviewScreenRouteArgs {
  const PRReviewScreenRouteArgs(
      {required this.nodeID, this.key, required this.pullNodeID});

  final String nodeID;

  final _i2.Key? key;

  final String pullNodeID;
}
