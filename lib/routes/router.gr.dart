// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../view/authentication/login.dart';
import '../view/home/widgets/search_overlay.dart';
import '../view/landing/landing.dart';

class Routes {
  static const String loginScreen = '/login-screen';
  static const String landingScreen = '/landing-screen';
  static const String searchOverlayScreen = '/search-overlay-screen';
  static const all = <String>{
    loginScreen,
    landingScreen,
    searchOverlayScreen,
  };
}

class AutoRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.loginScreen, page: LoginScreen),
    RouteDef(Routes.landingScreen, page: LandingScreen),
    RouteDef(Routes.searchOverlayScreen, page: SearchOverlayScreen),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    LoginScreen: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => LoginScreen(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.slideRight,
      );
    },
    LandingScreen: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            LandingScreen(),
        settings: data,
        opaque: false,
        barrierDismissible: false,
        transitionsBuilder: TransitionsBuilders.slideLeft,
        transitionDuration: const Duration(milliseconds: 350),
      );
    },
    SearchOverlayScreen: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            SearchOverlayScreen(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
      );
    },
  };
}
