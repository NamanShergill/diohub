// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i15;
import 'package:dio_hub/common/search_overlay/search_overlay.dart' as _i13;
import 'package:dio_hub/controller/deep_linking_handler.dart' as _i17;
import 'package:dio_hub/graphql/graphql.dart' as _i18;
import 'package:dio_hub/view/authentication/auth_screen.dart' as _i1;
import 'package:dio_hub/view/issues_pulls/issue_pull_screen.dart' as _i5;
import 'package:dio_hub/view/issues_pulls/widgets/p_r_review_screen.dart'
    as _i10;
import 'package:dio_hub/view/landing/landing.dart' as _i7;
import 'package:dio_hub/view/landing/widgets/landing_loading_screen.dart'
    as _i6;
import 'package:dio_hub/view/landing/widgets/place_holder_screen.dart' as _i11;
import 'package:dio_hub/view/profile/other_user_profile_screen.dart' as _i9;
import 'package:dio_hub/view/repository/code/file_viewer.dart' as _i4;
import 'package:dio_hub/view/repository/commits/commit_info_screen.dart' as _i3;
import 'package:dio_hub/view/repository/commits/widgets/changes_viewer.dart'
    as _i2;
import 'package:dio_hub/view/repository/issues/new_issue_screen.dart' as _i8;
import 'package:dio_hub/view/repository/repository_screen.dart' as _i12;
import 'package:dio_hub/view/repository/wiki/wiki_viewer.dart' as _i14;
import 'package:flutter/material.dart' as _i16;

abstract class $AppRouter extends _i15.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i15.PageFactory> pagesMap = {
    AuthRoute.name: (routeData) {
      final args =
          routeData.argsAs<AuthRouteArgs>(orElse: () => const AuthRouteArgs());
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.AuthScreen(
          key: args.key,
          onAuthenticated: args.onAuthenticated,
        ),
      );
    },
    ChangesViewer.name: (routeData) {
      final args = routeData.argsAs<ChangesViewerArgs>();
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.ChangesViewer(
          args.patch,
          args.contentURL,
          args.fileType,
          key: args.key,
        ),
      );
    },
    CommitInfoRoute.name: (routeData) {
      final args = routeData.argsAs<CommitInfoRouteArgs>();
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.CommitInfoScreen(
          key: args.key,
          commitURL: args.commitURL,
        ),
      );
    },
    FileViewerAPI.name: (routeData) {
      final args = routeData.argsAs<FileViewerAPIArgs>();
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.FileViewerAPI(
          args.sha,
          repoURL: args.repoURL,
          fileName: args.fileName,
          branch: args.branch,
          repoName: args.repoName,
          key: args.key,
        ),
      );
    },
    IssuePullRoute.name: (routeData) {
      final args = routeData.argsAs<IssuePullRouteArgs>();
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.IssuePullScreen(
          number: args.number,
          repoName: args.repoName,
          ownerName: args.ownerName,
          key: args.key,
          commentsSince: args.commentsSince,
          initialIndex: args.initialIndex,
        ),
      );
    },
    LandingLoadingRoute.name: (routeData) {
      final args = routeData.argsAs<LandingLoadingRouteArgs>(
          orElse: () => const LandingLoadingRouteArgs());
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.LandingLoadingScreen(
          key: args.key,
          initLink: args.initLink,
        ),
      );
    },
    LandingRoute.name: (routeData) {
      final args = routeData.argsAs<LandingRouteArgs>(
          orElse: () => const LandingRouteArgs());
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.LandingScreen(
          deepLinkData: args.deepLinkData,
          key: args.key,
        ),
      );
    },
    NewIssueRoute.name: (routeData) {
      final args = routeData.argsAs<NewIssueRouteArgs>();
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.NewIssueScreen(
          key: args.key,
          template: args.template,
          repo: args.repo,
          owner: args.owner,
        ),
      );
    },
    OtherUserProfileRoute.name: (routeData) {
      final args = routeData.argsAs<OtherUserProfileRouteArgs>();
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.OtherUserProfileScreen(
          args.login,
          key: args.key,
        ),
      );
    },
    PRReviewRoute.name: (routeData) {
      final args = routeData.argsAs<PRReviewRouteArgs>();
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.PRReviewScreen(
          args.nodeID,
          key: args.key,
          pullNodeID: args.pullNodeID,
        ),
      );
    },
    PlaceHolderRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.PlaceHolderScreen(),
      );
    },
    RepositoryRoute.name: (routeData) {
      final args = routeData.argsAs<RepositoryRouteArgs>();
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.RepositoryScreen(
          args.repositoryURL,
          branch: args.branch,
          index: args.index,
          deepLinkData: args.deepLinkData,
          key: args.key,
          initSHA: args.initSHA,
        ),
      );
    },
    SearchOverlayRoute.name: (routeData) {
      final args = routeData.argsAs<SearchOverlayRouteArgs>();
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i13.SearchOverlayScreen(
          args.searchData,
          message: args.message,
          heroTag: args.heroTag,
          multiHero: args.multiHero,
          onSubmit: args.onSubmit,
          key: args.key,
        ),
      );
    },
    WikiViewer.name: (routeData) {
      final args = routeData.argsAs<WikiViewerArgs>(
          orElse: () => const WikiViewerArgs());
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i14.WikiViewer(
          key: args.key,
          repoURL: args.repoURL,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.AuthScreen]
class AuthRoute extends _i15.PageRouteInfo<AuthRouteArgs> {
  AuthRoute({
    _i16.Key? key,
    void Function()? onAuthenticated,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          AuthRoute.name,
          args: AuthRouteArgs(
            key: key,
            onAuthenticated: onAuthenticated,
          ),
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const _i15.PageInfo<AuthRouteArgs> page =
      _i15.PageInfo<AuthRouteArgs>(name);
}

class AuthRouteArgs {
  const AuthRouteArgs({
    this.key,
    this.onAuthenticated,
  });

  final _i16.Key? key;

  final void Function()? onAuthenticated;

  @override
  String toString() {
    return 'AuthRouteArgs{key: $key, onAuthenticated: $onAuthenticated}';
  }
}

/// generated route for
/// [_i2.ChangesViewer]
class ChangesViewer extends _i15.PageRouteInfo<ChangesViewerArgs> {
  ChangesViewer({
    required String? patch,
    required String? contentURL,
    required String? fileType,
    _i16.Key? key,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          ChangesViewer.name,
          args: ChangesViewerArgs(
            patch: patch,
            contentURL: contentURL,
            fileType: fileType,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ChangesViewer';

  static const _i15.PageInfo<ChangesViewerArgs> page =
      _i15.PageInfo<ChangesViewerArgs>(name);
}

class ChangesViewerArgs {
  const ChangesViewerArgs({
    required this.patch,
    required this.contentURL,
    required this.fileType,
    this.key,
  });

  final String? patch;

  final String? contentURL;

  final String? fileType;

  final _i16.Key? key;

  @override
  String toString() {
    return 'ChangesViewerArgs{patch: $patch, contentURL: $contentURL, fileType: $fileType, key: $key}';
  }
}

/// generated route for
/// [_i3.CommitInfoScreen]
class CommitInfoRoute extends _i15.PageRouteInfo<CommitInfoRouteArgs> {
  CommitInfoRoute({
    _i16.Key? key,
    required String commitURL,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          CommitInfoRoute.name,
          args: CommitInfoRouteArgs(
            key: key,
            commitURL: commitURL,
          ),
          initialChildren: children,
        );

  static const String name = 'CommitInfoRoute';

  static const _i15.PageInfo<CommitInfoRouteArgs> page =
      _i15.PageInfo<CommitInfoRouteArgs>(name);
}

class CommitInfoRouteArgs {
  const CommitInfoRouteArgs({
    this.key,
    required this.commitURL,
  });

  final _i16.Key? key;

  final String commitURL;

  @override
  String toString() {
    return 'CommitInfoRouteArgs{key: $key, commitURL: $commitURL}';
  }
}

/// generated route for
/// [_i4.FileViewerAPI]
class FileViewerAPI extends _i15.PageRouteInfo<FileViewerAPIArgs> {
  FileViewerAPI({
    required String? sha,
    String? repoURL,
    String? fileName,
    String? branch,
    String? repoName,
    _i16.Key? key,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          FileViewerAPI.name,
          args: FileViewerAPIArgs(
            sha: sha,
            repoURL: repoURL,
            fileName: fileName,
            branch: branch,
            repoName: repoName,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'FileViewerAPI';

  static const _i15.PageInfo<FileViewerAPIArgs> page =
      _i15.PageInfo<FileViewerAPIArgs>(name);
}

class FileViewerAPIArgs {
  const FileViewerAPIArgs({
    required this.sha,
    this.repoURL,
    this.fileName,
    this.branch,
    this.repoName,
    this.key,
  });

  final String? sha;

  final String? repoURL;

  final String? fileName;

  final String? branch;

  final String? repoName;

  final _i16.Key? key;

  @override
  String toString() {
    return 'FileViewerAPIArgs{sha: $sha, repoURL: $repoURL, fileName: $fileName, branch: $branch, repoName: $repoName, key: $key}';
  }
}

/// generated route for
/// [_i5.IssuePullScreen]
class IssuePullRoute extends _i15.PageRouteInfo<IssuePullRouteArgs> {
  IssuePullRoute({
    required int number,
    required String repoName,
    required String ownerName,
    _i16.Key? key,
    DateTime? commentsSince,
    int initialIndex = 0,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          IssuePullRoute.name,
          args: IssuePullRouteArgs(
            number: number,
            repoName: repoName,
            ownerName: ownerName,
            key: key,
            commentsSince: commentsSince,
            initialIndex: initialIndex,
          ),
          initialChildren: children,
        );

  static const String name = 'IssuePullRoute';

  static const _i15.PageInfo<IssuePullRouteArgs> page =
      _i15.PageInfo<IssuePullRouteArgs>(name);
}

class IssuePullRouteArgs {
  const IssuePullRouteArgs({
    required this.number,
    required this.repoName,
    required this.ownerName,
    this.key,
    this.commentsSince,
    this.initialIndex = 0,
  });

  final int number;

  final String repoName;

  final String ownerName;

  final _i16.Key? key;

  final DateTime? commentsSince;

  final int initialIndex;

  @override
  String toString() {
    return 'IssuePullRouteArgs{number: $number, repoName: $repoName, ownerName: $ownerName, key: $key, commentsSince: $commentsSince, initialIndex: $initialIndex}';
  }
}

/// generated route for
/// [_i6.LandingLoadingScreen]
class LandingLoadingRoute extends _i15.PageRouteInfo<LandingLoadingRouteArgs> {
  LandingLoadingRoute({
    _i16.Key? key,
    Uri? initLink,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          LandingLoadingRoute.name,
          args: LandingLoadingRouteArgs(
            key: key,
            initLink: initLink,
          ),
          initialChildren: children,
        );

  static const String name = 'LandingLoadingRoute';

  static const _i15.PageInfo<LandingLoadingRouteArgs> page =
      _i15.PageInfo<LandingLoadingRouteArgs>(name);
}

class LandingLoadingRouteArgs {
  const LandingLoadingRouteArgs({
    this.key,
    this.initLink,
  });

  final _i16.Key? key;

  final Uri? initLink;

  @override
  String toString() {
    return 'LandingLoadingRouteArgs{key: $key, initLink: $initLink}';
  }
}

/// generated route for
/// [_i7.LandingScreen]
class LandingRoute extends _i15.PageRouteInfo<LandingRouteArgs> {
  LandingRoute({
    _i17.PathData? deepLinkData,
    _i16.Key? key,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          LandingRoute.name,
          args: LandingRouteArgs(
            deepLinkData: deepLinkData,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'LandingRoute';

  static const _i15.PageInfo<LandingRouteArgs> page =
      _i15.PageInfo<LandingRouteArgs>(name);
}

class LandingRouteArgs {
  const LandingRouteArgs({
    this.deepLinkData,
    this.key,
  });

  final _i17.PathData? deepLinkData;

  final _i16.Key? key;

  @override
  String toString() {
    return 'LandingRouteArgs{deepLinkData: $deepLinkData, key: $key}';
  }
}

/// generated route for
/// [_i8.NewIssueScreen]
class NewIssueRoute extends _i15.PageRouteInfo<NewIssueRouteArgs> {
  NewIssueRoute({
    _i16.Key? key,
    _i18.IssueTemplates$Query$Repository$IssueTemplates? template,
    required String repo,
    required String owner,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          NewIssueRoute.name,
          args: NewIssueRouteArgs(
            key: key,
            template: template,
            repo: repo,
            owner: owner,
          ),
          initialChildren: children,
        );

  static const String name = 'NewIssueRoute';

  static const _i15.PageInfo<NewIssueRouteArgs> page =
      _i15.PageInfo<NewIssueRouteArgs>(name);
}

class NewIssueRouteArgs {
  const NewIssueRouteArgs({
    this.key,
    this.template,
    required this.repo,
    required this.owner,
  });

  final _i16.Key? key;

  final _i18.IssueTemplates$Query$Repository$IssueTemplates? template;

  final String repo;

  final String owner;

  @override
  String toString() {
    return 'NewIssueRouteArgs{key: $key, template: $template, repo: $repo, owner: $owner}';
  }
}

/// generated route for
/// [_i9.OtherUserProfileScreen]
class OtherUserProfileRoute
    extends _i15.PageRouteInfo<OtherUserProfileRouteArgs> {
  OtherUserProfileRoute({
    required String login,
    _i16.Key? key,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          OtherUserProfileRoute.name,
          args: OtherUserProfileRouteArgs(
            login: login,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'OtherUserProfileRoute';

  static const _i15.PageInfo<OtherUserProfileRouteArgs> page =
      _i15.PageInfo<OtherUserProfileRouteArgs>(name);
}

class OtherUserProfileRouteArgs {
  const OtherUserProfileRouteArgs({
    required this.login,
    this.key,
  });

  final String login;

  final _i16.Key? key;

  @override
  String toString() {
    return 'OtherUserProfileRouteArgs{login: $login, key: $key}';
  }
}

/// generated route for
/// [_i10.PRReviewScreen]
class PRReviewRoute extends _i15.PageRouteInfo<PRReviewRouteArgs> {
  PRReviewRoute({
    required String nodeID,
    _i16.Key? key,
    required String pullNodeID,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          PRReviewRoute.name,
          args: PRReviewRouteArgs(
            nodeID: nodeID,
            key: key,
            pullNodeID: pullNodeID,
          ),
          initialChildren: children,
        );

  static const String name = 'PRReviewRoute';

  static const _i15.PageInfo<PRReviewRouteArgs> page =
      _i15.PageInfo<PRReviewRouteArgs>(name);
}

class PRReviewRouteArgs {
  const PRReviewRouteArgs({
    required this.nodeID,
    this.key,
    required this.pullNodeID,
  });

  final String nodeID;

  final _i16.Key? key;

  final String pullNodeID;

  @override
  String toString() {
    return 'PRReviewRouteArgs{nodeID: $nodeID, key: $key, pullNodeID: $pullNodeID}';
  }
}

/// generated route for
/// [_i11.PlaceHolderScreen]
class PlaceHolderRoute extends _i15.PageRouteInfo<void> {
  const PlaceHolderRoute({List<_i15.PageRouteInfo>? children})
      : super(
          PlaceHolderRoute.name,
          initialChildren: children,
        );

  static const String name = 'PlaceHolderRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i12.RepositoryScreen]
class RepositoryRoute extends _i15.PageRouteInfo<RepositoryRouteArgs> {
  RepositoryRoute({
    required String repositoryURL,
    String? branch,
    int index = 0,
    _i17.PathData? deepLinkData,
    _i16.Key? key,
    String? initSHA,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          RepositoryRoute.name,
          args: RepositoryRouteArgs(
            repositoryURL: repositoryURL,
            branch: branch,
            index: index,
            deepLinkData: deepLinkData,
            key: key,
            initSHA: initSHA,
          ),
          initialChildren: children,
        );

  static const String name = 'RepositoryRoute';

  static const _i15.PageInfo<RepositoryRouteArgs> page =
      _i15.PageInfo<RepositoryRouteArgs>(name);
}

class RepositoryRouteArgs {
  const RepositoryRouteArgs({
    required this.repositoryURL,
    this.branch,
    this.index = 0,
    this.deepLinkData,
    this.key,
    this.initSHA,
  });

  final String repositoryURL;

  final String? branch;

  final int index;

  final _i17.PathData? deepLinkData;

  final _i16.Key? key;

  final String? initSHA;

  @override
  String toString() {
    return 'RepositoryRouteArgs{repositoryURL: $repositoryURL, branch: $branch, index: $index, deepLinkData: $deepLinkData, key: $key, initSHA: $initSHA}';
  }
}

/// generated route for
/// [_i13.SearchOverlayScreen]
class SearchOverlayRoute extends _i15.PageRouteInfo<SearchOverlayRouteArgs> {
  SearchOverlayRoute({
    required _i13.SearchData searchData,
    String? message,
    String heroTag = 'search_bar',
    required bool multiHero,
    required void Function(_i13.SearchData) onSubmit,
    _i16.Key? key,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          SearchOverlayRoute.name,
          args: SearchOverlayRouteArgs(
            searchData: searchData,
            message: message,
            heroTag: heroTag,
            multiHero: multiHero,
            onSubmit: onSubmit,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'SearchOverlayRoute';

  static const _i15.PageInfo<SearchOverlayRouteArgs> page =
      _i15.PageInfo<SearchOverlayRouteArgs>(name);
}

class SearchOverlayRouteArgs {
  const SearchOverlayRouteArgs({
    required this.searchData,
    this.message,
    this.heroTag = 'search_bar',
    required this.multiHero,
    required this.onSubmit,
    this.key,
  });

  final _i13.SearchData searchData;

  final String? message;

  final String heroTag;

  final bool multiHero;

  final void Function(_i13.SearchData) onSubmit;

  final _i16.Key? key;

  @override
  String toString() {
    return 'SearchOverlayRouteArgs{searchData: $searchData, message: $message, heroTag: $heroTag, multiHero: $multiHero, onSubmit: $onSubmit, key: $key}';
  }
}

/// generated route for
/// [_i14.WikiViewer]
class WikiViewer extends _i15.PageRouteInfo<WikiViewerArgs> {
  WikiViewer({
    _i16.Key? key,
    String? repoURL,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          WikiViewer.name,
          args: WikiViewerArgs(
            key: key,
            repoURL: repoURL,
          ),
          initialChildren: children,
        );

  static const String name = 'WikiViewer';

  static const _i15.PageInfo<WikiViewerArgs> page =
      _i15.PageInfo<WikiViewerArgs>(name);
}

class WikiViewerArgs {
  const WikiViewerArgs({
    this.key,
    this.repoURL,
  });

  final _i16.Key? key;

  final String? repoURL;

  @override
  String toString() {
    return 'WikiViewerArgs{key: $key, repoURL: $repoURL}';
  }
}
