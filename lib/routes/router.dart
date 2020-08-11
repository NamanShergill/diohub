import 'package:auto_route/auto_route.dart';
import 'package:auto_route/auto_route_annotations.dart';
import 'package:gitapp/view/authentication/login.dart';
import 'package:gitapp/view/dashboard/dashboard.dart';

@CustomAutoRouter(
  transitionsBuilder: TransitionsBuilders.fadeIn,
  durationInMilliseconds: 350,
  routes: <AutoRoute>[
    AutoRoute(page: LoginScreen),
    AutoRoute(page: DashboardScreen),
  ],
)
class $Router {}
