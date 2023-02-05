import 'package:dio_hub/app/Dio/dio.dart';
import 'package:dio_hub/app/Dio/response_handler.dart';
import 'package:dio_hub/app/global.dart';
import 'package:dio_hub/app/settings/font.dart';
import 'package:dio_hub/app/settings/palette.dart';
import 'package:dio_hub/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:dio_hub/controller/deep_linking_handler.dart';
import 'package:dio_hub/controller/internet_connectivity.dart';
import 'package:dio_hub/providers/search_data_provider.dart';
import 'package:dio_hub/providers/users/current_user_provider.dart';
import 'package:dio_hub/routes/router.gr.dart';
import 'package:dio_hub/services/authentication/auth_service.dart';
import 'package:dio_hub/style/border_radiuses.dart';
import 'package:dio_hub/utils/device_display_mode.dart';
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

  await Future.wait([
    BaseAPIHandler.setupDioAPICache(),
    setUpSharedPrefs(),
    setHighRefreshRate(),
  ]);

  final initLink = await initUniLink();
  uniLinkStream();
  final auth = await AuthRepository().isAuthenticated;
  runApp(
    MyApp(
      initLink,
      authenticated: auth,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp(this.initDeepLink, {Key? key, required this.authenticated})
      : super(key: key);
  final String? initDeepLink;
  final bool authenticated;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Initialise Authentication Bloc and add event to check auth state.
        BlocProvider(
          create: (_) => AuthenticationBloc(authenticated: authenticated),
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
                      BlocProvider.of<AuthenticationBloc>(context),
                ),
              ),
              ChangeNotifierProvider(
                create: (_) => SearchDataProvider(),
              ),
              ChangeNotifierProvider(
                create: (_) => FontSettings(),
              ),
              ChangeNotifierProvider(
                create: (_) => PaletteSettings(),
              ),
            ],
            builder: (context, child) {
              return Portal(
                child: RootApp(
                  initDeepLink: initDeepLink,
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class RootApp extends StatefulWidget {
  const RootApp({Key? key, this.initDeepLink}) : super(key: key);
  final String? initDeepLink;

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  @override
  void initState() {
    setUpRouter(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: _getTheme(context, brightness: Brightness.light),
      darkTheme: _getTheme(context, brightness: Brightness.dark),
      routerDelegate: customRouter.delegate(initialRoutes: [
        LandingLoadingScreenRoute(initLink: widget.initDeepLink)
      ]),
      routeInformationParser: customRouter.defaultRouteParser(),
    );
  }
}

ThemeData _getTheme(
  BuildContext context, {
  required Brightness brightness,
}) {
  final palette = Provider.of<PaletteSettings>(context).currentSetting;

  return ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    unselectedWidgetColor: palette.faded1,
    cardColor: palette.primary,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(palette.secondary),
      ),
    ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        // TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
    appBarTheme: AppBarTheme(color: palette.primary, elevation: 5),
    tabBarTheme: TabBarTheme(
      indicator: BoxDecoration(
          borderRadius: bigBorderRadius,
          color: Provider.of<PaletteSettings>(context).currentSetting.accent),
      unselectedLabelColor:
          Provider.of<PaletteSettings>(context).currentSetting.faded3,
      // unselectedLabelStyle: Theme.of(context)
      //     .textTheme
      //     .headline6!
      //     .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
      // labelStyle: Theme.of(context)
      //     .textTheme
      //     .headline6!
      //     .copyWith(fontSize: 17, fontWeight: FontWeight.bold),
      labelPadding: const EdgeInsets.only(left: 8, right: 8, bottom: 8, top: 0),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
      ),
      backgroundColor: palette.primary,
    ),
    iconTheme: IconThemeData(color: palette.baseElements),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(),
      bodyMedium: TextStyle(),
      displayLarge: TextStyle(fontWeight: FontWeight.bold),
      displayMedium: TextStyle(fontWeight: FontWeight.bold),
      displaySmall: TextStyle(fontWeight: FontWeight.bold),
      headlineMedium: TextStyle(fontWeight: FontWeight.bold),
      headlineSmall: TextStyle(fontWeight: FontWeight.bold),
      titleLarge: TextStyle(fontWeight: FontWeight.bold),
      titleMedium: TextStyle(),
      titleSmall: TextStyle(),
      bodySmall: TextStyle(),
      labelLarge: TextStyle(),
      labelSmall: TextStyle(),
    ).apply(
      displayColor: palette.baseElements,
      bodyColor: palette.baseElements,
    ),
    primaryColor: palette.accent,
    scrollbarTheme: ScrollbarThemeData(
        thumbColor: MaterialStateProperty.all<Color>(Colors.grey)),
    dialogTheme: DialogTheme(
      backgroundColor: palette.primary,
      shape: RoundedRectangleBorder(borderRadius: medBorderRadius),
      titleTextStyle: TextStyle(color: palette.baseElements),
      contentTextStyle: TextStyle(color: palette.baseElements),
    ),
    listTileTheme: ListTileThemeData(iconColor: context.palette.baseElements),
    scaffoldBackgroundColor: palette.primary,
    primaryIconTheme: IconThemeData(color: palette.baseElements),
    dividerColor: Colors.grey.withOpacity(0.7),
    // brightness: Brightness.dark,
    backgroundColor: palette.primary,
    buttonTheme: ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
      padding: EdgeInsets.zero,
      colorScheme: const ColorScheme.dark(),
      shape: RoundedRectangleBorder(borderRadius: medBorderRadius),
    ),
    dividerTheme:
        DividerThemeData(color: palette.baseElements, thickness: 0.04),
    fontFamily: Provider.of<FontSettings>(context).currentSetting,
    colorScheme: ColorScheme.fromSwatch(brightness: brightness)
        .copyWith(secondary: palette.accent),
    cardTheme: CardTheme(
      color: palette.secondary,
      shape: RoundedRectangleBorder(borderRadius: medBorderRadius),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(16),
      fillColor: palette.secondary,
      hintStyle:
          TextStyle(color: palette.faded3.withOpacity(0.7), fontSize: 12),
      filled: true,
      enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: medBorderRadius),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: palette.faded3),
          borderRadius: medBorderRadius),
      labelStyle: TextStyle(color: palette.faded3),
      border: OutlineInputBorder(
        borderRadius: medBorderRadius,
      ),
    ),
  );
}

extension ThemeExtension on BuildContext {
  ThemeData get themeData => Theme.of(this);

  TextTheme get textTheme => themeData.textTheme;
}
