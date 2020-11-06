import 'package:auto_route/auto_route.dart';
import 'package:auto_route/auto_route_annotations.dart';
import 'package:gitapp/view/authentication/login.dart';
import 'package:gitapp/view/home/widgets/search_overlay.dart';
import 'package:gitapp/view/landing/landing.dart';

// flutter packages pub run build_runner watch --delete-conflicting-outputs

@CustomAutoRouter(
  transitionsBuilder: TransitionsBuilders.slideLeft,
  durationInMilliseconds: 350,
  routes: <AutoRoute>[
    CustomRoute(
        page: LoginScreen, transitionsBuilder: TransitionsBuilders.slideRight),
    AutoRoute(page: LandingScreen),
    CustomRoute(
        page: SearchOverlayScreen,
        transitionsBuilder: TransitionsBuilders.fadeIn)
  ],
)
class $AutoRouter {}
