import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gitapp/app/Dio/response_handler.dart';
import 'package:gitapp/routes/router.gr.dart';
import 'package:gitapp/services/authentication/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String initialRoute;
  await AuthService.isAuthenticated().then((value) async {
    if (value) {
      initialRoute = Routes.dashboardScreen;
    } else {
      initialRoute = Routes.loginScreen;
    }
    ResponseHandler.getErrorStream();
    ResponseHandler.getSuccessStream();
    runApp(MyApp(
      initialRoute: initialRoute,
    ));
  });
}

GlobalKey navKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  final initialRoute;
  MyApp({this.initialRoute = Routes.loginScreen});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      builder: ExtendedNavigator.builder(
          router: Router(),
          name: 'rootNav',
          navigatorKey: navKey,
          initialRoute: initialRoute,
          builder: (context, extendedNav) => extendedNav),
    );
  }
}
