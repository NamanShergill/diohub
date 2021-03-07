// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/foundation.dart' as _i5;

import '../view/home/widgets/search_overlay.dart' as _i3;
import '../view/landing/widgets/landing_auth_wrapper.dart' as _i2;
import '../view/repository/repository_screen.dart' as _i4;

class AppRouter extends _i1.RootStackRouter {
  AppRouter();

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    LandingAuthWrapperScreenRoute.name: (entry) {
      var route = entry.routeData.as<LandingAuthWrapperScreenRoute>();
      return _i1.CustomPage(
          entry: entry,
          child: _i2.LandingAuthWrapperScreen(key: route.key),
          transitionsBuilder: _i1.TransitionsBuilders.slideLeft,
          durationInMilliseconds: 250);
    },
    SearchOverlayScreenRoute.name: (entry) {
      return _i1.CustomPage(
          entry: entry,
          child: _i3.SearchOverlayScreen(),
          transitionsBuilder: _i1.TransitionsBuilders.fadeIn);
    },
    RepositoryScreenRoute.name: (entry) {
      var route = entry.routeData.as<RepositoryScreenRoute>();
      return _i1.CustomPage(
          entry: entry,
          child: _i4.RepositoryScreen(route.repositoryURL,
              branch: route.branch, key: route.key),
          transitionsBuilder: _i1.TransitionsBuilders.slideLeft,
          durationInMilliseconds: 250);
    }
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig<LandingAuthWrapperScreenRoute>(
            LandingAuthWrapperScreenRoute.name,
            path: '/',
            routeBuilder: (match) =>
                LandingAuthWrapperScreenRoute.fromMatch(match)),
        _i1.RouteConfig<SearchOverlayScreenRoute>(SearchOverlayScreenRoute.name,
            path: '/search-overlay-screen',
            routeBuilder: (match) => SearchOverlayScreenRoute.fromMatch(match)),
        _i1.RouteConfig<RepositoryScreenRoute>(RepositoryScreenRoute.name,
            path: '/repository-screen',
            routeBuilder: (match) => RepositoryScreenRoute.fromMatch(match))
      ];
}

class LandingAuthWrapperScreenRoute extends _i1.PageRouteInfo {
  LandingAuthWrapperScreenRoute({this.key}) : super(name, path: '/');

  LandingAuthWrapperScreenRoute.fromMatch(_i1.RouteMatch match)
      : key = null,
        super.fromMatch(match);

  final _i5.Key key;

  static const String name = 'LandingAuthWrapperScreenRoute';
}

class SearchOverlayScreenRoute extends _i1.PageRouteInfo {
  const SearchOverlayScreenRoute()
      : super(name, path: '/search-overlay-screen');

  SearchOverlayScreenRoute.fromMatch(_i1.RouteMatch match)
      : super.fromMatch(match);

  static const String name = 'SearchOverlayScreenRoute';
}

class RepositoryScreenRoute extends _i1.PageRouteInfo {
  RepositoryScreenRoute({this.repositoryURL, this.branch, this.key})
      : super(name, path: '/repository-screen');

  RepositoryScreenRoute.fromMatch(_i1.RouteMatch match)
      : repositoryURL = null,
        branch = null,
        key = null,
        super.fromMatch(match);

  final String repositoryURL;

  final String branch;

  final _i5.Key key;

  static const String name = 'RepositoryScreenRoute';
}
