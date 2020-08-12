import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gitapp/app/Dio/response_handler.dart';
import 'package:gitapp/app/global.dart';
import 'package:gitapp/providers/authentication/auth_provider.dart';
import 'package:gitapp/providers/landing_navigation_provider.dart';
import 'package:gitapp/providers/notifications/notifications_provider.dart';
import 'package:gitapp/providers/users/current_user_provider.dart';
import 'package:gitapp/routes/router.gr.dart';
import 'package:gitapp/services/authentication/auth_service.dart';
import 'package:gitapp/style/colors.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String initialRoute;
  await AuthService.isAuthenticated().then((value) async {
    if (value) {
      initialRoute = Routes.landingScreen;
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

class MyApp extends StatelessWidget {
  final initialRoute;
  MyApp({this.initialRoute = Routes.loginScreen});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CurrentUserProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => NavigationProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => NotificationsProvider(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
            visualDensity: VisualDensity.adaptivePlatformDensity,
            unselectedWidgetColor: AppColor.grey,
            accentColor: AppColor.accent,
            primaryColor: AppColor.accent,
            fontFamily: 'Montserrat'),
        builder: ExtendedNavigator.builder(
            router: Router(),
            name: 'rootNav',
            navigatorKey: Global.navKey,
            initialRoute: initialRoute,
            builder: (context, extendedNav) => extendedNav),
      ),
    );
  }
}
