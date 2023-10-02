import 'package:auto_route/auto_route.dart';
import 'package:dio_hub/app/api_handler/dio.dart';
import 'package:dio_hub/app/api_handler/response_handler.dart';
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
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

Future<void> debugURLLauncher() async {
  await Future<void>.delayed(const Duration(seconds: 2));
  String? url;
  // https://github.com/flutter/flutter/issues/120732
  // https://github.com/flutter/flutter/issues/128696
  url = 'https://github.com/NamanShergill/git/issues/21';
  if (kDebugMode) {
    await deepLinkNavigate(
      Uri.parse(url ?? ''),
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Error popup stream initialised.
  ResponseHandler.getErrorStream();
  // Success popup stream initialised.
  ResponseHandler.getSuccessStream();
  // Connectivity check stream initialised.
  await InternetConnectivity.networkStatusService();

  await Future.wait(<Future<void>>[
    BaseAPIHandler.setupDioAPICache(),
    setUpSharedPrefs(),
    setHighRefreshRate(),
  ]);

  // final initLink = await initUniLink();
  uniLinkStream();
  final bool auth = await AuthRepository().isAuthenticated;
  runApp(
    MyApp(
      authenticated: auth,
      // initDeepLink: initLink,
    ),
  );
  await debugURLLauncher();
}

class MyApp extends StatelessWidget {
  const MyApp({required this.authenticated, super.key});
  // final String? initDeepLink;
  final bool authenticated;

  @override
  Widget build(final BuildContext context) => MultiBlocProvider(
        providers: <SingleChildWidget>[
          // Initialise Authentication Bloc and add event to check auth state.
          BlocProvider<AuthenticationBloc>(
            create: (final _) =>
                AuthenticationBloc(authenticated: authenticated),
            lazy: false,
          ),
        ],
        child: Builder(
          builder: (final BuildContext context) => MultiProvider(
            providers: <SingleChildWidget>[
              ChangeNotifierProvider<CurrentUserProvider>(
                lazy: false,
                create: (final _) => CurrentUserProvider(
                  authenticationBloc:
                      BlocProvider.of<AuthenticationBloc>(context),
                ),
              ),
              ChangeNotifierProvider<SearchDataProvider>(
                create: (final _) => SearchDataProvider(),
              ),
              ChangeNotifierProvider<FontSettings>(
                create: (final _) => FontSettings(),
              ),
              ChangeNotifierProvider<PaletteSettings>(
                create: (final _) => PaletteSettings(),
              ),
            ],
            builder: (final BuildContext context, final Widget? child) =>
                const Portal(
              child: RootApp(),
            ),
          ),
        ),
      );
}

class RootApp extends StatefulWidget {
  const RootApp({super.key});
  // final String? initDeepLink;

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
  Widget build(final BuildContext context) => MaterialApp.router(
        theme: _getTheme(context, brightness: Brightness.light),
        darkTheme: _getTheme(context, brightness: Brightness.dark),
        routerDelegate: customRouter.delegate(
          deepLinkBuilder: (final PlatformDeepLink deepLink) =>
              DeepLink(<PageRouteInfo>[
            LandingLoadingRoute(
              initLink: deepLink.configuration.uri,
            ),
          ]),
          rebuildStackOnDeepLink: true,
        ),
        routeInformationParser: customRouter.defaultRouteParser(),
      );
}

ThemeData _getTheme(
  final BuildContext context, {
  required final Brightness brightness,
}) {
  final DioHubPalette palette =
      Provider.of<PaletteSettings>(context).currentSetting;

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
      builders: <TargetPlatform, PageTransitionsBuilder>{
        // TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
    appBarTheme: AppBarTheme(color: palette.primary, elevation: 5),
    tabBarTheme: TabBarTheme(
      indicator: BoxDecoration(
        borderRadius: bigBorderRadius,
        color: Provider.of<PaletteSettings>(context).currentSetting.accent,
      ),
      unselectedLabelColor:
          Provider.of<PaletteSettings>(context).currentSetting.faded3,
      // unselectedLabelStyle: Theme.of(context)
      //     .textTheme
      //     .titleLarge!
      //     .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
      // labelStyle: Theme.of(context)
      //     .textTheme
      //     .titleLarge!
      //     .copyWith(fontSize: 17, fontWeight: FontWeight.bold),
      labelPadding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
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
      thumbColor: MaterialStateProperty.all<Color>(Colors.grey),
    ),
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
    buttonTheme: ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
      padding: EdgeInsets.zero,
      colorScheme: const ColorScheme.dark(),
      shape: RoundedRectangleBorder(borderRadius: medBorderRadius),
    ),
    dividerTheme:
        DividerThemeData(color: palette.baseElements, thickness: 0.04),
    fontFamily: Provider.of<FontSettings>(context).currentSetting,
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
        borderRadius: medBorderRadius,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: palette.faded3),
        borderRadius: medBorderRadius,
      ),
      labelStyle: TextStyle(color: palette.faded3),
      border: OutlineInputBorder(
        borderRadius: medBorderRadius,
      ),
    ),
    colorScheme: ColorScheme.fromSwatch(brightness: brightness)
        .copyWith(secondary: palette.accent)
        .copyWith(background: palette.primary),
  );
}
