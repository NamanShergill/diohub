import 'package:dio_hub/app/Dio/response_handler.dart';
import 'package:dio_hub/app/global.dart';
import 'package:dio_hub/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:dio_hub/controller/deep_linking_handler.dart';
import 'package:dio_hub/controller/internet_connectivity.dart';
import 'package:dio_hub/providers/landing_navigation_provider.dart';
import 'package:dio_hub/providers/search_data_provider.dart';
import 'package:dio_hub/providers/users/current_user_provider.dart';
import 'package:dio_hub/style/borderRadiuses.dart';
import 'package:dio_hub/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Error popup stream initialised.
  ResponseHandler.getErrorStream();
  // Success popup stream initialised.
  ResponseHandler.getSuccessStream();
  // Connectivity check stream initialised.
  InternetConnectivity.networkStatusService();
  await Global.setupAppCache();
  String? initLink = await DeepLinkHandler.initUniLink();
  DeepLinkHandler.uniLinkStream();
  runApp(MyApp(initLink));
}

class MyApp extends StatelessWidget {
  final String? initLink;
  MyApp(this.initLink);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Initialise Authentication Bloc and add event to check auth state.
        BlocProvider(
          create: (_) => AuthenticationBloc(),
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
              ChangeNotifierProvider(
                create: (_) => SearchDataProvider(),
              ),
            ],
            child: Portal(
              child: MaterialApp.router(
                theme: ThemeData(
                    visualDensity: VisualDensity.adaptivePlatformDensity,
                    unselectedWidgetColor: AppColor.grey,
                    accentColor: Colors.white,
                    cardColor: AppColor.background,
                    elevatedButtonTheme: ElevatedButtonThemeData(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            AppColor.onBackground),
                      ),
                    ),
                    appBarTheme:
                        AppBarTheme(color: AppColor.background, elevation: 5),
                    iconTheme: IconThemeData(color: Colors.white),
                    textTheme: TextTheme(
                      bodyText1: TextStyle(),
                      bodyText2: TextStyle(),
                      headline1: TextStyle(fontWeight: FontWeight.bold),
                      headline2: TextStyle(fontWeight: FontWeight.bold),
                      headline3: TextStyle(fontWeight: FontWeight.bold),
                      headline4: TextStyle(fontWeight: FontWeight.bold),
                      headline5: TextStyle(fontWeight: FontWeight.bold),
                      headline6: TextStyle(fontWeight: FontWeight.bold),
                      subtitle1: TextStyle(),
                      subtitle2: TextStyle(),
                      caption: TextStyle(),
                      button: TextStyle(),
                      overline: TextStyle(),
                    ).apply(
                        displayColor: Colors.white, bodyColor: Colors.white),
                    primaryColor: AppColor.accent,
                    scrollbarTheme: ScrollbarThemeData(
                        thumbColor:
                            MaterialStateProperty.all<Color>(Colors.grey)),
                    dialogTheme: DialogTheme(
                      backgroundColor: AppColor.background,
                      shape: RoundedRectangleBorder(
                          borderRadius: AppThemeBorderRadius.medBorderRadius),
                      titleTextStyle: TextStyle(color: Colors.white),
                      contentTextStyle: TextStyle(color: Colors.white),
                    ),
                    scaffoldBackgroundColor: AppColor.background,
                    primaryIconTheme: IconThemeData(color: Colors.white),
                    accentIconTheme: IconThemeData(color: AppColor.accent),
                    dividerColor: Colors.grey.withOpacity(0.7),
                    brightness: Brightness.dark,
                    backgroundColor: AppColor.background,
                    buttonTheme: ButtonThemeData(
                      textTheme: ButtonTextTheme.primary,
                      padding: EdgeInsets.zero,
                      colorScheme: ColorScheme.dark(),
                      shape: RoundedRectangleBorder(
                          borderRadius: AppThemeBorderRadius.medBorderRadius),
                    ),
                    dividerTheme:
                        DividerThemeData(color: Colors.white, thickness: 0.04),
                    fontFamily: 'Montserrat'),
                routerDelegate: Global.customRouter.delegate(
                    initialRoutes: DeepLinkHandler.getRoutes(initLink ?? '',
                        isInitial: true)),
                routeInformationParser:
                    Global.customRouter.defaultRouteParser(),
              ),
            ),
          );
        },
      ),
    );
  }
}
