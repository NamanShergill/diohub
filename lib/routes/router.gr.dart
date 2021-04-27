// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../common/search_overlay/search_overlay.dart' as _i4;
import '../view/issues_pulls/issue_screen.dart' as _i5;
import '../view/issues_pulls/pull_screen.dart' as _i6;
import '../view/landing/widgets/landing_auth_wrapper.dart' as _i3;
import '../view/profile/other_user_profile_screen.dart' as _i12;
import '../view/repository/code/file_viewer.dart' as _i8;
import '../view/repository/commits/commit_info_screen.dart' as _i9;
import '../view/repository/commits/widgets/changes_viewer.dart' as _i11;
import '../view/repository/repository_screen.dart' as _i7;
import '../view/repository/wiki/wiki_viewer.dart' as _i10;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    LandingAuthWrapperScreenRoute.name: (routeData) {
      final args = routeData.argsAs<LandingAuthWrapperScreenRouteArgs>(
          orElse: () => const LandingAuthWrapperScreenRouteArgs());
      return _i1.CustomPage<dynamic>(
          routeData: routeData,
          child: _i3.LandingAuthWrapperScreen(key: args.key),
          transitionsBuilder: _i1.TransitionsBuilders.slideBottom,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    SearchOverlayScreenRoute.name: (routeData) {
      final args = routeData.argsAs<SearchOverlayScreenRouteArgs>();
      return _i1.CustomPage<dynamic>(
          routeData: routeData,
          child: _i4.SearchOverlayScreen(args.searchData,
              message: args.message,
              heroTag: args.heroTag,
              multiHero: args.multiHero,
              onSubmit: args.onSubmit),
          transitionsBuilder: _i1.TransitionsBuilders.fadeIn,
          opaque: true,
          barrierDismissible: false);
    },
    IssueScreenRoute.name: (routeData) {
      final args = routeData.argsAs<IssueScreenRouteArgs>();
      return _i1.CustomPage<dynamic>(
          routeData: routeData,
          child: _i5.IssueScreen(args.issueURL, args.repoURL,
              initialIndex: args.initialIndex,
              commentsSince: args.commentsSince),
          transitionsBuilder: _i1.TransitionsBuilders.slideBottom,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    PullScreenRoute.name: (routeData) {
      final args = routeData.argsAs<PullScreenRouteArgs>();
      return _i1.CustomPage<dynamic>(
          routeData: routeData,
          child: _i6.PullScreen(args.pullURL,
              initialIndex: args.initialIndex,
              commentsSince: args.commentsSince),
          transitionsBuilder: _i1.TransitionsBuilders.slideBottom,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    RepositoryScreenRoute.name: (routeData) {
      final args = routeData.argsAs<RepositoryScreenRouteArgs>();
      return _i1.CustomPage<dynamic>(
          routeData: routeData,
          child: _i7.RepositoryScreen(args.repositoryURL,
              branch: args.branch,
              index: args.index,
              key: args.key,
              initSHA: args.initSHA),
          transitionsBuilder: _i1.TransitionsBuilders.slideBottom,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    FileViewerAPIRoute.name: (routeData) {
      final args = routeData.argsAs<FileViewerAPIRouteArgs>();
      return _i1.CustomPage<dynamic>(
          routeData: routeData,
          child: _i8.FileViewerAPI(args.sha,
              repoURL: args.repoURL,
              fileName: args.fileName,
              branch: args.branch,
              repoName: args.repoName),
          transitionsBuilder: _i1.TransitionsBuilders.slideBottom,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    CommitInfoScreenRoute.name: (routeData) {
      final args = routeData.argsAs<CommitInfoScreenRouteArgs>(
          orElse: () => const CommitInfoScreenRouteArgs());
      return _i1.CustomPage<dynamic>(
          routeData: routeData,
          child: _i9.CommitInfoScreen(key: args.key, commitURL: args.commitURL),
          transitionsBuilder: _i1.TransitionsBuilders.slideBottom,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    WikiViewerRoute.name: (routeData) {
      final args = routeData.argsAs<WikiViewerRouteArgs>(
          orElse: () => const WikiViewerRouteArgs());
      return _i1.CustomPage<dynamic>(
          routeData: routeData,
          child: _i10.WikiViewer(key: args.key, repoURL: args.repoURL),
          transitionsBuilder: _i1.TransitionsBuilders.slideBottom,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    ChangesViewerRoute.name: (routeData) {
      final args = routeData.argsAs<ChangesViewerRouteArgs>();
      return _i1.CustomPage<dynamic>(
          routeData: routeData,
          child: _i11.ChangesViewer(args.patch, args.contentURL, args.fileType),
          transitionsBuilder: _i1.TransitionsBuilders.slideBottom,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    },
    OtherUserProfileScreenRoute.name: (routeData) {
      final args = routeData.argsAs<OtherUserProfileScreenRouteArgs>();
      return _i1.CustomPage<dynamic>(
          routeData: routeData,
          child: _i12.OtherUserProfileScreen(args.login),
          transitionsBuilder: _i1.TransitionsBuilders.slideBottom,
          durationInMilliseconds: 250,
          opaque: true,
          barrierDismissible: false);
    }
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(LandingAuthWrapperScreenRoute.name, path: '/'),
        _i1.RouteConfig(SearchOverlayScreenRoute.name,
            path: '/search-overlay-screen'),
        _i1.RouteConfig(IssueScreenRoute.name, path: '/issue-screen'),
        _i1.RouteConfig(PullScreenRoute.name, path: '/pull-screen'),
        _i1.RouteConfig(RepositoryScreenRoute.name, path: '/repository-screen'),
        _i1.RouteConfig(FileViewerAPIRoute.name, path: '/file-viewer-ap-i'),
        _i1.RouteConfig(CommitInfoScreenRoute.name,
            path: '/commit-info-screen'),
        _i1.RouteConfig(WikiViewerRoute.name, path: '/wiki-viewer'),
        _i1.RouteConfig(ChangesViewerRoute.name, path: '/changes-viewer'),
        _i1.RouteConfig(OtherUserProfileScreenRoute.name,
            path: '/other-user-profile-screen')
      ];
}

class LandingAuthWrapperScreenRoute
    extends _i1.PageRouteInfo<LandingAuthWrapperScreenRouteArgs> {
  LandingAuthWrapperScreenRoute({_i2.Key? key})
      : super(name,
            path: '/', args: LandingAuthWrapperScreenRouteArgs(key: key));

  static const String name = 'LandingAuthWrapperScreenRoute';
}

class LandingAuthWrapperScreenRouteArgs {
  const LandingAuthWrapperScreenRouteArgs({this.key});

  final _i2.Key? key;
}

class SearchOverlayScreenRoute
    extends _i1.PageRouteInfo<SearchOverlayScreenRouteArgs> {
  SearchOverlayScreenRoute(
      {required _i4.SearchData searchData,
      String? message,
      String heroTag = 'search_bar',
      required bool multiHero,
      required void Function(_i4.SearchData) onSubmit})
      : super(name,
            path: '/search-overlay-screen',
            args: SearchOverlayScreenRouteArgs(
                searchData: searchData,
                message: message,
                heroTag: heroTag,
                multiHero: multiHero,
                onSubmit: onSubmit));

  static const String name = 'SearchOverlayScreenRoute';
}

class SearchOverlayScreenRouteArgs {
  const SearchOverlayScreenRouteArgs(
      {required this.searchData,
      this.message,
      this.heroTag = 'search_bar',
      required this.multiHero,
      required this.onSubmit});

  final _i4.SearchData searchData;

  final String? message;

  final String heroTag;

  final bool multiHero;

  final void Function(_i4.SearchData) onSubmit;
}

class IssueScreenRoute extends _i1.PageRouteInfo<IssueScreenRouteArgs> {
  IssueScreenRoute(
      {required String? issueURL,
      required String? repoURL,
      int initialIndex = 0,
      DateTime? commentsSince})
      : super(name,
            path: '/issue-screen',
            args: IssueScreenRouteArgs(
                issueURL: issueURL,
                repoURL: repoURL,
                initialIndex: initialIndex,
                commentsSince: commentsSince));

  static const String name = 'IssueScreenRoute';
}

class IssueScreenRouteArgs {
  const IssueScreenRouteArgs(
      {required this.issueURL,
      required this.repoURL,
      this.initialIndex = 0,
      this.commentsSince});

  final String? issueURL;

  final String? repoURL;

  final int initialIndex;

  final DateTime? commentsSince;
}

class PullScreenRoute extends _i1.PageRouteInfo<PullScreenRouteArgs> {
  PullScreenRoute(
      {required String? pullURL, int initialIndex = 0, DateTime? commentsSince})
      : super(name,
            path: '/pull-screen',
            args: PullScreenRouteArgs(
                pullURL: pullURL,
                initialIndex: initialIndex,
                commentsSince: commentsSince));

  static const String name = 'PullScreenRoute';
}

class PullScreenRouteArgs {
  const PullScreenRouteArgs(
      {required this.pullURL, this.initialIndex = 0, this.commentsSince});

  final String? pullURL;

  final int initialIndex;

  final DateTime? commentsSince;
}

class RepositoryScreenRoute
    extends _i1.PageRouteInfo<RepositoryScreenRouteArgs> {
  RepositoryScreenRoute(
      {required String? repositoryURL,
      String? branch,
      int index = 0,
      _i2.Key? key,
      String? initSHA})
      : super(name,
            path: '/repository-screen',
            args: RepositoryScreenRouteArgs(
                repositoryURL: repositoryURL,
                branch: branch,
                index: index,
                key: key,
                initSHA: initSHA));

  static const String name = 'RepositoryScreenRoute';
}

class RepositoryScreenRouteArgs {
  const RepositoryScreenRouteArgs(
      {required this.repositoryURL,
      this.branch,
      this.index = 0,
      this.key,
      this.initSHA});

  final String? repositoryURL;

  final String? branch;

  final int index;

  final _i2.Key? key;

  final String? initSHA;
}

class FileViewerAPIRoute extends _i1.PageRouteInfo<FileViewerAPIRouteArgs> {
  FileViewerAPIRoute(
      {required String? sha,
      String? repoURL,
      String? fileName,
      String? branch,
      String? repoName})
      : super(name,
            path: '/file-viewer-ap-i',
            args: FileViewerAPIRouteArgs(
                sha: sha,
                repoURL: repoURL,
                fileName: fileName,
                branch: branch,
                repoName: repoName));

  static const String name = 'FileViewerAPIRoute';
}

class FileViewerAPIRouteArgs {
  const FileViewerAPIRouteArgs(
      {required this.sha,
      this.repoURL,
      this.fileName,
      this.branch,
      this.repoName});

  final String? sha;

  final String? repoURL;

  final String? fileName;

  final String? branch;

  final String? repoName;
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
      required String? fileType})
      : super(name,
            path: '/changes-viewer',
            args: ChangesViewerRouteArgs(
                patch: patch, contentURL: contentURL, fileType: fileType));

  static const String name = 'ChangesViewerRoute';
}

class ChangesViewerRouteArgs {
  const ChangesViewerRouteArgs(
      {required this.patch, required this.contentURL, required this.fileType});

  final String? patch;

  final String? contentURL;

  final String? fileType;
}

class OtherUserProfileScreenRoute
    extends _i1.PageRouteInfo<OtherUserProfileScreenRouteArgs> {
  OtherUserProfileScreenRoute({required String? login})
      : super(name,
            path: '/other-user-profile-screen',
            args: OtherUserProfileScreenRouteArgs(login: login));

  static const String name = 'OtherUserProfileScreenRoute';
}

class OtherUserProfileScreenRouteArgs {
  const OtherUserProfileScreenRouteArgs({required this.login});

  final String? login;
}
