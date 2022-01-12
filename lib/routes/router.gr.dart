// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i15;
import 'package:flutter/material.dart' as _i16;

import '../common/search_overlay/search_overlay.dart' as _i5;
import '../controller/deep_linking_handler.dart' as _i18;
import '../graphql/graphql.dart' as _i19;
import '../view/authentication/auth_screen.dart' as _i1;
import '../view/issues_pulls/issue_pull_screen.dart' as _i6;
import '../view/issues_pulls/widgets/p_r_review_screen.dart' as _i14;
import '../view/landing/landing.dart' as _i3;
import '../view/landing/widgets/landing_loading_screen.dart' as _i2;
import '../view/landing/widgets/place_holder_screen.dart' as _i4;
import '../view/profile/other_user_profile_screen.dart' as _i12;
import '../view/repository/code/file_viewer.dart' as _i8;
import '../view/repository/commits/commit_info_screen.dart' as _i9;
import '../view/repository/commits/widgets/changes_viewer.dart' as _i11;
import '../view/repository/issues/new_issue_screen.dart' as _i13;
import '../view/repository/repository_screen.dart' as _i7;
import '../view/repository/wiki/wiki_viewer.dart' as _i10;
import 'router.dart' as _i17;

class AppRouter extends _i15.RootStackRouter {
  AppRouter(
      {_i16.GlobalKey<_i16.NavigatorState>? navigatorKey,
      required this.authGuard})
      : super(navigatorKey);

  final _i17.AuthGuard authGuard;

  @override
  final Map<String, _i15.PageFactory> pagesMap = {
    AuthScreenRoute.name: (routeData) {
      final args = routeData.argsAs<AuthScreenRouteArgs>(
          orElse: () => const AuthScreenRouteArgs());
      return _i15.CustomPage<dynamic>(
          routeData: routeData,
          child: _i1.AuthScreen(
              key: args.key, onAuthenticated: args.onAuthenticated),
          transitionsBuilder: _i17.fadeThroughTransition,
          opaque: true,
          barrierDismissible: false);
    },
    LandingLoadingScreenRoute.name: (routeData) {
      final args = routeData.argsAs<LandingLoadingScreenRouteArgs>(
          orElse: () => const LandingLoadingScreenRouteArgs());
      return _i15.CustomPage<dynamic>(
          routeData: routeData,
          child:
              _i2.LandingLoadingScreen(key: args.key, initLink: args.initLink),
          transitionsBuilder: _i17.fadeThroughTransition,
          opaque: true,
          barrierDismissible: false);
    },
    LandingScreenRoute.name: (routeData) {
      final args = routeData.argsAs<LandingScreenRouteArgs>(
          orElse: () => const LandingScreenRouteArgs());
      return _i15.CustomPage<dynamic>(
          routeData: routeData,
          child:
              _i3.LandingScreen(deepLinkData: args.deepLinkData, key: args.key),
          transitionsBuilder: _i17.fadeThroughTransition,
          opaque: true,
          barrierDismissible: false);
    },
    PlaceHolderScreenRoute.name: (routeData) {
      return _i15.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i4.PlaceHolderScreen(),
          transitionsBuilder: _i17.fadeThroughTransition,
          opaque: true,
          barrierDismissible: false);
    },
    SearchOverlayScreenRoute.name: (routeData) {
      final args = routeData.argsAs<SearchOverlayScreenRouteArgs>();
      return _i15.CustomPage<dynamic>(
          routeData: routeData,
          child: _i5.SearchOverlayScreen(args.searchData,
              message: args.message,
              heroTag: args.heroTag,
              multiHero: args.multiHero,
              onSubmit: args.onSubmit,
              key: args.key),
          transitionsBuilder: _i15.TransitionsBuilders.fadeIn,
          opaque: true,
          barrierDismissible: false);
    },
    IssuePullScreenRoute.name: (routeData) {
      final args = routeData.argsAs<IssuePullScreenRouteArgs>();
      return _i15.CustomPage<dynamic>(
          routeData: routeData,
          child: _i6.IssuePullScreen(
              number: args.number,
              repoName: args.repoName,
              ownerName: args.ownerName,
              key: args.key,
              commentsSince: args.commentsSince,
              initialIndex: args.initialIndex),
          transitionsBuilder: _i17.fadeThroughTransition,
          opaque: true,
          barrierDismissible: false);
    },
    RepositoryScreenRoute.name: (routeData) {
      final args = routeData.argsAs<RepositoryScreenRouteArgs>();
      return _i15.CustomPage<dynamic>(
          routeData: routeData,
          child: _i7.RepositoryScreen(args.repositoryURL,
              branch: args.branch,
              index: args.index,
              deepLinkData: args.deepLinkData,
              key: args.key,
              initSHA: args.initSHA),
          transitionsBuilder: _i17.fadeThroughTransition,
          opaque: true,
          barrierDismissible: false);
    },
    FileViewerAPIRoute.name: (routeData) {
      final args = routeData.argsAs<FileViewerAPIRouteArgs>();
      return _i15.CustomPage<dynamic>(
          routeData: routeData,
          child: _i8.FileViewerAPI(args.sha,
              repoURL: args.repoURL,
              fileName: args.fileName,
              branch: args.branch,
              repoName: args.repoName,
              key: args.key),
          transitionsBuilder: _i17.fadeThroughTransition,
          opaque: true,
          barrierDismissible: false);
    },
    CommitInfoScreenRoute.name: (routeData) {
      final args = routeData.argsAs<CommitInfoScreenRouteArgs>();
      return _i15.CustomPage<dynamic>(
          routeData: routeData,
          child: _i9.CommitInfoScreen(key: args.key, commitURL: args.commitURL),
          transitionsBuilder: _i17.fadeThroughTransition,
          opaque: true,
          barrierDismissible: false);
    },
    WikiViewerRoute.name: (routeData) {
      final args = routeData.argsAs<WikiViewerRouteArgs>(
          orElse: () => const WikiViewerRouteArgs());
      return _i15.CustomPage<dynamic>(
          routeData: routeData,
          child: _i10.WikiViewer(key: args.key, repoURL: args.repoURL),
          transitionsBuilder: _i17.fadeThroughTransition,
          opaque: true,
          barrierDismissible: false);
    },
    ChangesViewerRoute.name: (routeData) {
      final args = routeData.argsAs<ChangesViewerRouteArgs>();
      return _i15.CustomPage<dynamic>(
          routeData: routeData,
          child: _i11.ChangesViewer(args.patch, args.contentURL, args.fileType,
              key: args.key),
          transitionsBuilder: _i17.fadeThroughTransition,
          opaque: true,
          barrierDismissible: false);
    },
    OtherUserProfileScreenRoute.name: (routeData) {
      final args = routeData.argsAs<OtherUserProfileScreenRouteArgs>();
      return _i15.CustomPage<dynamic>(
          routeData: routeData,
          child: _i12.OtherUserProfileScreen(args.login, key: args.key),
          transitionsBuilder: _i17.fadeThroughTransition,
          opaque: true,
          barrierDismissible: false);
    },
    NewIssueScreenRoute.name: (routeData) {
      final args = routeData.argsAs<NewIssueScreenRouteArgs>();
      return _i15.CustomPage<dynamic>(
          routeData: routeData,
          child: _i13.NewIssueScreen(
              key: args.key,
              template: args.template,
              repo: args.repo,
              owner: args.owner),
          transitionsBuilder: _i17.fadeThroughTransition,
          opaque: true,
          barrierDismissible: false);
    },
    PRReviewScreenRoute.name: (routeData) {
      final args = routeData.argsAs<PRReviewScreenRouteArgs>();
      return _i15.CustomPage<dynamic>(
          routeData: routeData,
          child: _i14.PRReviewScreen(args.nodeID,
              key: args.key, pullNodeID: args.pullNodeID),
          transitionsBuilder: _i17.fadeThroughTransition,
          opaque: true,
          barrierDismissible: false);
    }
  };

  @override
  List<_i15.RouteConfig> get routes => [
        _i15.RouteConfig(AuthScreenRoute.name, path: '/auth-screen'),
        _i15.RouteConfig(LandingLoadingScreenRoute.name,
            path: '/', guards: [authGuard]),
        _i15.RouteConfig(LandingScreenRoute.name,
            path: '/landing-screen', guards: [authGuard]),
        _i15.RouteConfig(PlaceHolderScreenRoute.name,
            path: '/place-holder-screen', guards: [authGuard]),
        _i15.RouteConfig(SearchOverlayScreenRoute.name,
            path: '/search-overlay-screen', guards: [authGuard]),
        _i15.RouteConfig(IssuePullScreenRoute.name,
            path: '/issue-pull-screen', guards: [authGuard]),
        _i15.RouteConfig(RepositoryScreenRoute.name,
            path: '/repository-screen', guards: [authGuard]),
        _i15.RouteConfig(FileViewerAPIRoute.name,
            path: '/file-viewer-ap-i', guards: [authGuard]),
        _i15.RouteConfig(CommitInfoScreenRoute.name,
            path: '/commit-info-screen', guards: [authGuard]),
        _i15.RouteConfig(WikiViewerRoute.name,
            path: '/wiki-viewer', guards: [authGuard]),
        _i15.RouteConfig(ChangesViewerRoute.name,
            path: '/changes-viewer', guards: [authGuard]),
        _i15.RouteConfig(OtherUserProfileScreenRoute.name,
            path: '/other-user-profile-screen', guards: [authGuard]),
        _i15.RouteConfig(NewIssueScreenRoute.name,
            path: '/new-issue-screen', guards: [authGuard]),
        _i15.RouteConfig(PRReviewScreenRoute.name,
            path: '/p-rreview-screen', guards: [authGuard])
      ];
}

/// generated route for
/// [_i1.AuthScreen]
class AuthScreenRoute extends _i15.PageRouteInfo<AuthScreenRouteArgs> {
  AuthScreenRoute({_i16.Key? key, void Function()? onAuthenticated})
      : super(AuthScreenRoute.name,
            path: '/auth-screen',
            args: AuthScreenRouteArgs(
                key: key, onAuthenticated: onAuthenticated));

  static const String name = 'AuthScreenRoute';
}

class AuthScreenRouteArgs {
  const AuthScreenRouteArgs({this.key, this.onAuthenticated});

  final _i16.Key? key;

  final void Function()? onAuthenticated;

  @override
  String toString() {
    return 'AuthScreenRouteArgs{key: $key, onAuthenticated: $onAuthenticated}';
  }
}

/// generated route for
/// [_i2.LandingLoadingScreen]
class LandingLoadingScreenRoute
    extends _i15.PageRouteInfo<LandingLoadingScreenRouteArgs> {
  LandingLoadingScreenRoute({_i16.Key? key, String? initLink})
      : super(LandingLoadingScreenRoute.name,
            path: '/',
            args: LandingLoadingScreenRouteArgs(key: key, initLink: initLink));

  static const String name = 'LandingLoadingScreenRoute';
}

class LandingLoadingScreenRouteArgs {
  const LandingLoadingScreenRouteArgs({this.key, this.initLink});

  final _i16.Key? key;

  final String? initLink;

  @override
  String toString() {
    return 'LandingLoadingScreenRouteArgs{key: $key, initLink: $initLink}';
  }
}

/// generated route for
/// [_i3.LandingScreen]
class LandingScreenRoute extends _i15.PageRouteInfo<LandingScreenRouteArgs> {
  LandingScreenRoute({_i18.PathData? deepLinkData, _i16.Key? key})
      : super(LandingScreenRoute.name,
            path: '/landing-screen',
            args: LandingScreenRouteArgs(deepLinkData: deepLinkData, key: key));

  static const String name = 'LandingScreenRoute';
}

class LandingScreenRouteArgs {
  const LandingScreenRouteArgs({this.deepLinkData, this.key});

  final _i18.PathData? deepLinkData;

  final _i16.Key? key;

  @override
  String toString() {
    return 'LandingScreenRouteArgs{deepLinkData: $deepLinkData, key: $key}';
  }
}

/// generated route for
/// [_i4.PlaceHolderScreen]
class PlaceHolderScreenRoute extends _i15.PageRouteInfo<void> {
  const PlaceHolderScreenRoute()
      : super(PlaceHolderScreenRoute.name, path: '/place-holder-screen');

  static const String name = 'PlaceHolderScreenRoute';
}

/// generated route for
/// [_i5.SearchOverlayScreen]
class SearchOverlayScreenRoute
    extends _i15.PageRouteInfo<SearchOverlayScreenRouteArgs> {
  SearchOverlayScreenRoute(
      {required _i5.SearchData searchData,
      String? message,
      String heroTag = 'search_bar',
      required bool multiHero,
      required void Function(_i5.SearchData) onSubmit,
      _i16.Key? key})
      : super(SearchOverlayScreenRoute.name,
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

  final _i5.SearchData searchData;

  final String? message;

  final String heroTag;

  final bool multiHero;

  final void Function(_i5.SearchData) onSubmit;

  final _i16.Key? key;

  @override
  String toString() {
    return 'SearchOverlayScreenRouteArgs{searchData: $searchData, message: $message, heroTag: $heroTag, multiHero: $multiHero, onSubmit: $onSubmit, key: $key}';
  }
}

/// generated route for
/// [_i6.IssuePullScreen]
class IssuePullScreenRoute
    extends _i15.PageRouteInfo<IssuePullScreenRouteArgs> {
  IssuePullScreenRoute(
      {required int number,
      required String repoName,
      required String ownerName,
      _i16.Key? key,
      DateTime? commentsSince,
      int initialIndex = 0})
      : super(IssuePullScreenRoute.name,
            path: '/issue-pull-screen',
            args: IssuePullScreenRouteArgs(
                number: number,
                repoName: repoName,
                ownerName: ownerName,
                key: key,
                commentsSince: commentsSince,
                initialIndex: initialIndex));

  static const String name = 'IssuePullScreenRoute';
}

class IssuePullScreenRouteArgs {
  const IssuePullScreenRouteArgs(
      {required this.number,
      required this.repoName,
      required this.ownerName,
      this.key,
      this.commentsSince,
      this.initialIndex = 0});

  final int number;

  final String repoName;

  final String ownerName;

  final _i16.Key? key;

  final DateTime? commentsSince;

  final int initialIndex;

  @override
  String toString() {
    return 'IssuePullScreenRouteArgs{number: $number, repoName: $repoName, ownerName: $ownerName, key: $key, commentsSince: $commentsSince, initialIndex: $initialIndex}';
  }
}

/// generated route for
/// [_i7.RepositoryScreen]
class RepositoryScreenRoute
    extends _i15.PageRouteInfo<RepositoryScreenRouteArgs> {
  RepositoryScreenRoute(
      {required String repositoryURL,
      String? branch,
      int index = 0,
      _i18.PathData? deepLinkData,
      _i16.Key? key,
      String? initSHA})
      : super(RepositoryScreenRoute.name,
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

  final String repositoryURL;

  final String? branch;

  final int index;

  final _i18.PathData? deepLinkData;

  final _i16.Key? key;

  final String? initSHA;

  @override
  String toString() {
    return 'RepositoryScreenRouteArgs{repositoryURL: $repositoryURL, branch: $branch, index: $index, deepLinkData: $deepLinkData, key: $key, initSHA: $initSHA}';
  }
}

/// generated route for
/// [_i8.FileViewerAPI]
class FileViewerAPIRoute extends _i15.PageRouteInfo<FileViewerAPIRouteArgs> {
  FileViewerAPIRoute(
      {required String? sha,
      String? repoURL,
      String? fileName,
      String? branch,
      String? repoName,
      _i16.Key? key})
      : super(FileViewerAPIRoute.name,
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

  final _i16.Key? key;

  @override
  String toString() {
    return 'FileViewerAPIRouteArgs{sha: $sha, repoURL: $repoURL, fileName: $fileName, branch: $branch, repoName: $repoName, key: $key}';
  }
}

/// generated route for
/// [_i9.CommitInfoScreen]
class CommitInfoScreenRoute
    extends _i15.PageRouteInfo<CommitInfoScreenRouteArgs> {
  CommitInfoScreenRoute({_i16.Key? key, required String commitURL})
      : super(CommitInfoScreenRoute.name,
            path: '/commit-info-screen',
            args: CommitInfoScreenRouteArgs(key: key, commitURL: commitURL));

  static const String name = 'CommitInfoScreenRoute';
}

class CommitInfoScreenRouteArgs {
  const CommitInfoScreenRouteArgs({this.key, required this.commitURL});

  final _i16.Key? key;

  final String commitURL;

  @override
  String toString() {
    return 'CommitInfoScreenRouteArgs{key: $key, commitURL: $commitURL}';
  }
}

/// generated route for
/// [_i10.WikiViewer]
class WikiViewerRoute extends _i15.PageRouteInfo<WikiViewerRouteArgs> {
  WikiViewerRoute({_i16.Key? key, String? repoURL})
      : super(WikiViewerRoute.name,
            path: '/wiki-viewer',
            args: WikiViewerRouteArgs(key: key, repoURL: repoURL));

  static const String name = 'WikiViewerRoute';
}

class WikiViewerRouteArgs {
  const WikiViewerRouteArgs({this.key, this.repoURL});

  final _i16.Key? key;

  final String? repoURL;

  @override
  String toString() {
    return 'WikiViewerRouteArgs{key: $key, repoURL: $repoURL}';
  }
}

/// generated route for
/// [_i11.ChangesViewer]
class ChangesViewerRoute extends _i15.PageRouteInfo<ChangesViewerRouteArgs> {
  ChangesViewerRoute(
      {required String? patch,
      required String? contentURL,
      required String? fileType,
      _i16.Key? key})
      : super(ChangesViewerRoute.name,
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

  final _i16.Key? key;

  @override
  String toString() {
    return 'ChangesViewerRouteArgs{patch: $patch, contentURL: $contentURL, fileType: $fileType, key: $key}';
  }
}

/// generated route for
/// [_i12.OtherUserProfileScreen]
class OtherUserProfileScreenRoute
    extends _i15.PageRouteInfo<OtherUserProfileScreenRouteArgs> {
  OtherUserProfileScreenRoute({required String login, _i16.Key? key})
      : super(OtherUserProfileScreenRoute.name,
            path: '/other-user-profile-screen',
            args: OtherUserProfileScreenRouteArgs(login: login, key: key));

  static const String name = 'OtherUserProfileScreenRoute';
}

class OtherUserProfileScreenRouteArgs {
  const OtherUserProfileScreenRouteArgs({required this.login, this.key});

  final String login;

  final _i16.Key? key;

  @override
  String toString() {
    return 'OtherUserProfileScreenRouteArgs{login: $login, key: $key}';
  }
}

/// generated route for
/// [_i13.NewIssueScreen]
class NewIssueScreenRoute extends _i15.PageRouteInfo<NewIssueScreenRouteArgs> {
  NewIssueScreenRoute(
      {_i16.Key? key,
      _i19.IssueTemplates$Query$Repository$IssueTemplates? template,
      required String repo,
      required String owner})
      : super(NewIssueScreenRoute.name,
            path: '/new-issue-screen',
            args: NewIssueScreenRouteArgs(
                key: key, template: template, repo: repo, owner: owner));

  static const String name = 'NewIssueScreenRoute';
}

class NewIssueScreenRouteArgs {
  const NewIssueScreenRouteArgs(
      {this.key, this.template, required this.repo, required this.owner});

  final _i16.Key? key;

  final _i19.IssueTemplates$Query$Repository$IssueTemplates? template;

  final String repo;

  final String owner;

  @override
  String toString() {
    return 'NewIssueScreenRouteArgs{key: $key, template: $template, repo: $repo, owner: $owner}';
  }
}

/// generated route for
/// [_i14.PRReviewScreen]
class PRReviewScreenRoute extends _i15.PageRouteInfo<PRReviewScreenRouteArgs> {
  PRReviewScreenRoute(
      {required String nodeID, _i16.Key? key, required String pullNodeID})
      : super(PRReviewScreenRoute.name,
            path: '/p-rreview-screen',
            args: PRReviewScreenRouteArgs(
                nodeID: nodeID, key: key, pullNodeID: pullNodeID));

  static const String name = 'PRReviewScreenRoute';
}

class PRReviewScreenRouteArgs {
  const PRReviewScreenRouteArgs(
      {required this.nodeID, this.key, required this.pullNodeID});

  final String nodeID;

  final _i16.Key? key;

  final String pullNodeID;

  @override
  String toString() {
    return 'PRReviewScreenRouteArgs{nodeID: $nodeID, key: $key, pullNodeID: $pullNodeID}';
  }
}
