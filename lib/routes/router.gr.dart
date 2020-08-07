// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../models/authentication/device_code_model.dart';
import '../view/authentication/enter_code.dart';
import '../view/authentication/login.dart';
import '../view/dashboard/dashboard.dart';

class Routes {
  static const String enterCodeScreen = '/enter-code-screen';
  static const String loginScreen = '/login-screen';
  static const String dashboardScreen = '/dashboard-screen';
  static const all = <String>{
    enterCodeScreen,
    loginScreen,
    dashboardScreen,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.enterCodeScreen, page: EnterCodeScreen),
    RouteDef(Routes.loginScreen, page: LoginScreen),
    RouteDef(Routes.dashboardScreen, page: DashboardScreen),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    EnterCodeScreen: (data) {
      final args = data.getArgs<EnterCodeScreenArguments>(nullOk: false);
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            EnterCodeScreen(deviceCodeModel: args.deviceCodeModel),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
        transitionDuration: const Duration(milliseconds: 350),
      );
    },
    LoginScreen: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => LoginScreen(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
        transitionDuration: const Duration(milliseconds: 350),
      );
    },
    DashboardScreen: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            DashboardScreen(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
        transitionDuration: const Duration(milliseconds: 350),
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// EnterCodeScreen arguments holder class
class EnterCodeScreenArguments {
  final DeviceCodeModel deviceCodeModel;
  EnterCodeScreenArguments({@required this.deviceCodeModel});
}
