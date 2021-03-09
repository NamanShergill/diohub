import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onehub/app/Dio/response_handler.dart';
import 'package:onehub/app/global.dart';
import 'package:onehub/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:onehub/providers/landing_navigation_provider.dart';
import 'package:onehub/providers/users/current_user_provider.dart';
import 'package:onehub/style/borderRadiuses.dart';
import 'package:onehub/style/colors.dart';
import 'package:onehub/utils/internet_connectivity.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Error popup stream initialised.
  ResponseHandler.getErrorStream();
  // Success popup stream initialised.
  ResponseHandler.getSuccessStream();
  // Connectivity check stream initialised.
  InternetConnectivity.networkStatusService();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Initialise Authentication Bloc and add event to check auth state.
        BlocProvider(
          create: (_) => AuthenticationBloc()..add(CheckAuthState()),
          lazy: false,
        ),
      ],
      child: Builder(
        builder: (context) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(
                lazy: false,
                create: (_) => CurrentUserProvider(
                    authenticationBloc:
                        BlocProvider.of<AuthenticationBloc>(context)),
              ),
              ChangeNotifierProvider(
                create: (_) => NavigationProvider(),
              ),
            ],
            child: MaterialApp.router(
              theme: ThemeData(
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                  unselectedWidgetColor: AppColor.grey,
                  accentColor: Colors.white,
                  cardColor: AppColor.background,
                  elevatedButtonTheme: ElevatedButtonThemeData(
                      style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(AppColor.onBackground),
                  )),
                  appBarTheme:
                      AppBarTheme(color: AppColor.background, elevation: 5),
                  iconTheme: IconThemeData(color: Colors.white),
                  textTheme: TextTheme(
                    bodyText1: TextStyle(),
                    bodyText2: TextStyle(),
                    headline1: TextStyle(),
                    headline2: TextStyle(),
                    headline3: TextStyle(),
                    headline4: TextStyle(),
                    headline5: TextStyle(),
                    headline6: TextStyle(),
                    subtitle1: TextStyle(),
                    subtitle2: TextStyle(),
                    caption: TextStyle(),
                    button: TextStyle(),
                    overline: TextStyle(),
                  ).apply(displayColor: Colors.white, bodyColor: Colors.white),
                  primaryColor: AppColor.accent,
                  scrollbarTheme: ScrollbarThemeData(
                      thumbColor:
                          MaterialStateProperty.all<Color>(Colors.grey)),
                  primaryIconTheme: IconThemeData(color: Colors.white),
                  accentIconTheme: IconThemeData(color: AppColor.accent),
                  dividerColor: Colors.grey.withOpacity(0.7),
                  backgroundColor: AppColor.background,
                  buttonTheme: ButtonThemeData(
                    textTheme: ButtonTextTheme.primary,
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                        borderRadius: AppThemeBorderRadius.medBorderRadius),
                  ),
                  dividerTheme:
                      DividerThemeData(color: Colors.white, thickness: 0.04),
                  fontFamily: 'Montserrat'),
              routerDelegate: Global.customRouter.delegate(),
              routeInformationParser: Global.customRouter.defaultRouteParser(),
            ),
          );
        },
      ),
    );
  }
}
