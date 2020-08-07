import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gitapp/app/global.dart';
import 'package:gitapp/routes/router.gr.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  String initialRoute;
  await Global.isAuthenticated().then((value) async {
    if (value) {
      initialRoute = Routes.dashboardScreen;
    } else {
      initialRoute = Routes.loginScreen;
    }
    Global.getAccessToken();
    runApp(MyApp(
      initialRoute: initialRoute,
    ));
  });
}

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
          initialRoute: initialRoute,
          builder: (context, extendedNav) => extendedNav),
    );
  }
}
