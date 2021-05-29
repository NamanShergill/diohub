// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../common/search_overlay/search_overlay.dart' as _i6;
import '../controller/deep_linking_handler.dart' as _i16;
import '../graphql/graphql.dart' as _i17;
import '../view/issues_pulls/issue_screen.dart' as _i7;
import '../view/issues_pulls/pull_screen.dart' as _i8;
import '../view/landing/landing.dart' as _i4;
import '../view/landing/widgets/landing_auth_wrapper_screen.dart' as _i3;
import '../view/landing/widgets/place_holder_screen.dart' as _i5;
import '../view/profile/other_user_profile_screen.dart' as _i14;
import '../view/repository/code/file_viewer.dart' as _i10;
import '../view/repository/commits/commit_info_screen.dart' as _i11;
import '../view/repository/commits/widgets/changes_viewer.dart' as _i13;
import '../view/repository/issues/new_issue_screen.dart' as _i15;
import '../view/repository/repository_screen.dart' as _i9;
import '../view/repository/wiki/wiki_viewer.dart' as _i12;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    LandingAuthWrapperScreenRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<LandingAuthWrapperScreenRouteArgs>(
              orElse: () => const LandingAuthWrapperScreenRouteArgs());
          return _i3.LandingAuthWrapperScreen(
              key: args.key, initLink: args.initLink);
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideBottom,
        durationInMilliseconds: 250,
        opaque: true,
        barrierDismissible: false),
    LandingScreenRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<LandingScreenRouteArgs>(
              orElse: () => const LandingScreenRouteArgs());
          return _i4.LandingScreen(
              deepLinkData: args.deepLinkData, key: args.key);
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideBottom,
        durationInMilliseconds: 250,
        opaque: true,
        barrierDismissible: false),
    PlaceHolderScreenRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i5.PlaceHolderScreen();
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideBottom,
        durationInMilliseconds: 250,
        opaque: true,
        barrierDismissible: false),
    SearchOverlayScreenRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<SearchOverlayScreenRouteArgs>();
          return _i6.SearchOverlayScreen(args.searchData,
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
          return _i7.IssueScreen(args.issueURL,
              initialIndex: args.initialIndex,
              commentsSince: args.commentsSince,
              key: args.key);
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideBottom,
        durationInMilliseconds: 250,
        opaque: true,
        barrierDismissible: false),
    PullScreenRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<PullScreenRouteArgs>();
          return _i8.PullScreen(args.pullURL,
              initialIndex: args.initialIndex,
              commentsSince: args.commentsSince,
              key: args.key);
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideBottom,
        durationInMilliseconds: 250,
        opaque: true,
        barrierDismissible: false),
    RepositoryScreenRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<RepositoryScreenRouteArgs>();
          return _i9.RepositoryScreen(args.repositoryURL,
              branch: args.branch,
              index: args.index,
              deepLinkData: args.deepLinkData,
              key: args.key,
              initSHA: args.initSHA);
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideBottom,
        durationInMilliseconds: 250,
        opaque: true,
        barrierDismissible: false),
    FileViewerAPIRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<FileViewerAPIRouteArgs>();
          return _i10.FileViewerAPI(args.sha,
              repoURL: args.repoURL,
              fileName: args.fileName,
              branch: args.branch,
              repoName: args.repoName,
              key: args.key);
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideBottom,
        durationInMilliseconds: 250,
        opaque: true,
        barrierDismissible: false),
    CommitInfoScreenRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<CommitInfoScreenRouteArgs>(
              orElse: () => const CommitInfoScreenRouteArgs());
          return _i11.CommitInfoScreen(
              key: args.key, commitURL: args.commitURL);
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideBottom,
        durationInMilliseconds: 250,
        opaque: true,
        barrierDismissible: false),
    WikiViewerRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<WikiViewerRouteArgs>(
              orElse: () => const WikiViewerRouteArgs());
          return _i12.WikiViewer(key: args.key, repoURL: args.repoURL);
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideBottom,
        durationInMilliseconds: 250,
        opaque: true,
        barrierDismissible: false),
    ChangesViewerRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<ChangesViewerRouteArgs>();
          return _i13.ChangesViewer(args.patch, args.contentURL, args.fileType,
              key: args.key);
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideBottom,
        durationInMilliseconds: 250,
        opaque: true,
        barrierDismissible: false),
    OtherUserProfileScreenRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<OtherUserProfileScreenRouteArgs>();
          return _i14.OtherUserProfileScreen(args.login, key: args.key);
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideBottom,
        durationInMilliseconds: 250,
        opaque: true,
        barrierDismissible: false),
    NewIssueScreenRoute.name: (routeData) => _i1.CustomPage<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<NewIssueScreenRouteArgs>();
          return _i15.NewIssueScreen(
              key: args.key,
              template: args.template,
              repo: args.repo,
              owner: args.owner);
        },
        transitionsBuilder: _i1.TransitionsBuilders.slideBottom,
        durationInMilliseconds: 250,
        opaque: true,
        barrierDismissible: false)
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(LandingAuthWrapperScreenRoute.name, path: '/'),
        _i1.RouteConfig(LandingScreenRoute.name, path: '/landing-screen'),
        _i1.RouteConfig(PlaceHolderScreenRoute.name,
            path: '/place-holder-screen'),
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
            path: '/other-user-profile-screen'),
        _i1.RouteConfig(NewIssueScreenRoute.name, path: '/new-issue-screen')
      ];
}

class LandingAuthWrapperScreenRoute
    extends _i1.PageRouteInfo<LandingAuthWrapperScreenRouteArgs> {
  LandingAuthWrapperScreenRoute({_i2.Key? key, String? initLink})
      : super(name,
            path: '/',
            args: LandingAuthWrapperScreenRouteArgs(
                key: key, initLink: initLink));

  static const String name = 'LandingAuthWrapperScreenRoute';
}

class LandingAuthWrapperScreenRouteArgs {
  const LandingAuthWrapperScreenRouteArgs({this.key, this.initLink});

  final _i2.Key? key;

  final String? initLink;
}

class LandingScreenRoute extends _i1.PageRouteInfo<LandingScreenRouteArgs> {
  LandingScreenRoute({_i16.DeepLinkData? deepLinkData, _i2.Key? key})
      : super(name,
            path: '/landing-screen',
            args: LandingScreenRouteArgs(deepLinkData: deepLinkData, key: key));

  static const String name = 'LandingScreenRoute';
}

class LandingScreenRouteArgs {
  const LandingScreenRouteArgs({this.deepLinkData, this.key});

  final _i16.DeepLinkData? deepLinkData;

  final _i2.Key? key;
}

class PlaceHolderScreenRoute extends _i1.PageRouteInfo {
  const PlaceHolderScreenRoute() : super(name, path: '/place-holder-screen');

  static const String name = 'PlaceHolderScreenRoute';
}

class SearchOverlayScreenRoute
    extends _i1.PageRouteInfo<SearchOverlayScreenRouteArgs> {
  SearchOverlayScreenRoute(
      {required _i6.SearchData searchData,
      String? message,
      String heroTag = '',
      required bool multiHero,
      required void Function(_i6.SearchData) onSubmit,
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
      this.heroTag = '',
      required this.multiHero,
      required this.onSubmit,
      this.key});

  final _i6.SearchData searchData;

  final String? message;

  final String heroTag;

  final bool multiHero;

  final void Function(_i6.SearchData) onSubmit;

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
      _i16.DeepLinkData? deepLinkData,
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

  final _i16.DeepLinkData? deepLinkData;

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
      _i17.IssueTemplates$Query$Repository$IssueTemplates? template,
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

  final _i17.IssueTemplates$Query$Repository$IssueTemplates? template;

  final String repo;

  final String owner;
}
