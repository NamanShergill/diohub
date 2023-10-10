import 'package:auto_route/auto_route.dart';
import 'package:dio_hub/app/api_handler/dio.dart';
import 'package:dio_hub/app/api_handler/response_handler.dart';
import 'package:dio_hub/app/global.dart';
import 'package:dio_hub/app/settings/font.dart';
import 'package:dio_hub/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:dio_hub/controller/deep_linking_handler.dart';
import 'package:dio_hub/controller/internet_connectivity.dart';
import 'package:dio_hub/providers/search_data_provider.dart';
import 'package:dio_hub/providers/users/current_user_provider.dart';
import 'package:dio_hub/routes/router.gr.dart';
import 'package:dio_hub/services/authentication/auth_service.dart';
import 'package:dio_hub/style/border_radiuses.dart';
import 'package:dio_hub/utils/device_display_mode.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/cupertino.dart';
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
  url = 'https://github.com/firebase/flutterfire/issues/1041';
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
              // ChangeNotifierProvider<PaletteSettings>(
              //   create: (final _) => PaletteSettings(),
              // ),
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
  Widget build(final BuildContext context) => DynamicColorBuilder(
        builder:
            (final ColorScheme? lightDynamic, final ColorScheme? darkDynamic) =>
                MaterialApp.router(
          theme: getTheme(
            context,
            brightness: Brightness.light,
            colorScheme: lightDynamic,
          ),
          darkTheme: getTheme(
            context,
            brightness: Brightness.dark,
            colorScheme: darkDynamic,
          ),
          localizationsDelegates: const <LocalizationsDelegate>[
            DefaultMaterialLocalizations.delegate,
            DefaultCupertinoLocalizations.delegate,
            DefaultWidgetsLocalizations.delegate,
          ], // getTheme(context, brightness: Brightness.light),
          // darkTheme: getTheme(context, brightness: Brightness.dark),
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
        ),
      );
}

ThemeData getTheme(
  final BuildContext context, {
  required final Brightness brightness,
  final ColorScheme? colorScheme,
}) {
  // final DioHubPalette palette =
  //     Provider.of<PaletteSettings>(context).currentSetting;

  return ThemeData(
    useMaterial3: true,
    visualDensity: VisualDensity.compact,
    // unselectedWidgetColor: palette.faded1,
    // cardColor: palette.primary,
    // pageTransitionsTheme: const PageTransitionsTheme(
    //   builders: <TargetPlatform, PageTransitionsBuilder>{
    //     // TargetPlatform.android: CupertinoPageTransitionsBuilder(),
    //     TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    //   },
    // ),
    // appBarTheme: const AppBarTheme(elevation: 0),
    // tabBarTheme: TabBarTheme(
    //   indicator: BoxDecoration(
    //     borderRadius: bigBorderRadius,
    //   ),
    //   unselectedLabelStyle: Theme.of(context)
    //       .textTheme
    //       .titleLarge!
    //       .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
    //   labelStyle: Theme.of(context)
    //       .textTheme
    //       .titleLarge!
    //       .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
    //   labelPadding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
    // ),

    // bottomSheetTheme: BottomSheetThemeData(
    //   shape: const RoundedRectangleBorder(
    //     borderRadius: BorderRadius.only(
    //       topRight: Radius.circular(20),
    //       topLeft: Radius.circular(20),
    //     ),
    //   ),
    // ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontWeight: FontWeight.bold),
      displayMedium: TextStyle(fontWeight: FontWeight.bold),
      displaySmall: TextStyle(fontWeight: FontWeight.bold),
      headlineMedium: TextStyle(fontWeight: FontWeight.bold),
      headlineSmall: TextStyle(fontWeight: FontWeight.bold),
      titleLarge: TextStyle(fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(fontWeight: FontWeight.bold),
    ),
    // scrollbarTheme: ScrollbarThemeData(
    //   thumbColor: MaterialStateProperty.all<Color>(Colors.grey),
    // ),
    // dialogTheme: DialogTheme(
    //   shape: RoundedRectangleBorder(borderRadius: medBorderRadius),
    // ),
    // listTileTheme: ListTileThemeData(iconColor: context.palette.baseElements),
    // dividerColor: Colors.grey.withOpacity(0.7),
    // buttonTheme: ButtonThemeData(
    //   textTheme: ButtonTextTheme.primary,
    //   padding: EdgeInsets.zero,
    //   colorScheme: const ColorScheme.dark(),
    //   shape: RoundedRectangleBorder(borderRadius: medBorderRadius),
    // ),
    dividerTheme: DividerThemeData(thickness: 0.3),
    fontFamily: Provider.of<FontSettings>(context).currentSetting,
    // cardTheme: CardTheme(
    //   // color: palette.secondary,
    //   shape: RoundedRectangleBorder(borderRadius: medBorderRadius),
    // ),
    inputDecorationTheme: InputDecorationTheme(
      // contentPadding: const EdgeInsets.all(16),
      // hintStyle: TextStyle(fontSize: 12),
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: medBorderRadius,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: medBorderRadius,
      ),
      border: OutlineInputBorder(
        borderRadius: medBorderRadius,
      ),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: colorScheme?.background,
    ),
    colorScheme: colorScheme ??
        switch (brightness) {
          Brightness.dark => cs1,
          Brightness.light => cs2,
        },
  );
}

const ColorScheme cs2 = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF006687),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFC1E8FF),
  onPrimaryContainer: Color(0xFF001E2B),
  secondary: Color(0xFF006687),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFC1E8FF),
  onSecondaryContainer: Color(0xFF001E2B),
  tertiary: Color(0xFF006687),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFC0E8FF),
  onTertiaryContainer: Color(0xFF001E2B),
  error: Color(0xFFBA1A1A),
  errorContainer: Color(0xFFFFDAD6),
  onError: Color(0xFFFFFFFF),
  onErrorContainer: Color(0xFF410002),
  background: Color(0xFFFBFCFE),
  onBackground: Color(0xFF191C1E),
  surface: Color(0xFFFBFCFE),
  onSurface: Color(0xFF191C1E),
  surfaceVariant: Color(0xFFDCE3E9),
  onSurfaceVariant: Color(0xFF40484C),
  outline: Color(0xFF71787D),
  onInverseSurface: Color(0xFFF0F1F3),
  inverseSurface: Color(0xFF2E3133),
  inversePrimary: Color(0xFF73D1FF),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF006687),
  outlineVariant: Color(0xFFC0C7CD),
  scrim: Color(0xFF000000),
);

const ColorScheme cs1 = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFF73D1FF),
  onPrimary: Color(0xFF003548),
  primaryContainer: Color(0xFF004D67),
  onPrimaryContainer: Color(0xFFC1E8FF),
  secondary: Color(0xFF72D2FF),
  onSecondary: Color(0xFF003548),
  secondaryContainer: Color(0xFF004D66),
  onSecondaryContainer: Color(0xFFC1E8FF),
  tertiary: Color(0xFF72D2FF),
  onTertiary: Color(0xFF003548),
  tertiaryContainer: Color(0xFF004D66),
  onTertiaryContainer: Color(0xFFC0E8FF),
  error: Color(0xFFFFB4AB),
  errorContainer: Color(0xFF93000A),
  onError: Color(0xFF690005),
  onErrorContainer: Color(0xFFFFDAD6),
  background: Color(0xFF191C1E),
  onBackground: Color(0xFFE1E2E5),
  surface: Color(0xFF191C1E),
  onSurface: Color(0xFFE1E2E5),
  surfaceVariant: Color(0xFF40484C),
  onSurfaceVariant: Color(0xFFC0C7CD),
  outline: Color(0xFF8A9297),
  onInverseSurface: Color(0xFF191C1E),
  inverseSurface: Color(0xFFE1E2E5),
  inversePrimary: Color(0xFF006687),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF73D1FF),
  outlineVariant: Color(0xFF40484C),
  scrim: Color(0xFF000000),
);
