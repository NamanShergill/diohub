import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:onehub/app/Dio/response_handler.dart';
import 'package:onehub/app/global.dart';
import 'package:onehub/providers/authentication/auth_provider.dart';
import 'package:onehub/providers/landing_navigation_provider.dart';
import 'package:onehub/providers/notifications/notifications_provider.dart';
import 'package:onehub/providers/users/current_user_provider.dart';
import 'package:onehub/routes/router.gr.dart';
import 'package:onehub/services/authentication/auth_service.dart';
import 'package:onehub/style/colors.dart';
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
            iconTheme: IconThemeData(color: Colors.white),
            textTheme: TextTheme(
              bodyText1: TextStyle(color: Colors.white),
              bodyText2: TextStyle(color: Colors.white),
              headline1: TextStyle(color: Colors.white),
              headline2: TextStyle(color: Colors.white),
              headline3: TextStyle(color: Colors.white),
              headline4: TextStyle(color: Colors.white),
              headline5: TextStyle(color: Colors.white),
              headline6: TextStyle(color: Colors.white),
            ),
            primaryColor: AppColor.accent,
            fontFamily: 'Montserrat'),
        builder: ExtendedNavigator<AutoRouter>(
          router: AutoRouter(),
          name: 'rootNav',
          navigatorKey: Global.navKey,
          initialRoute: initialRoute,
        ),
      ),
    );
  }
}
