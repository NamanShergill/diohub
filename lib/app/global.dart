import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_hub/routes/router.dart';
import 'package:dio_hub/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Global {
  static final AppRouter customRouter = AppRouter(authGuard: AuthGuard());
  static final BuildContext currentContext =
      customRouter.navigatorKey.currentContext!;
  static const String apiBaseURL = 'https://api.github.com';
  static final Logger log = Logger();
  static late String _directoryPath;
  static String get directoryPath => _directoryPath;
  static late DbCacheStore _cacheStore;
  static DbCacheStore get cacheStore => _cacheStore;

  static late SharedPreferences _sharedPrefs;
  static SharedPreferences get sharedPrefs => _sharedPrefs;

  static Future setUpSharedPrefs() async {
    _sharedPrefs = await SharedPreferences.getInstance();
  }

  static Future setupAppCache() async {
    await getApplicationDocumentsDirectory()
        .then((value) => _directoryPath = value.path);
    _cacheStore = DbCacheStore(databasePath: _directoryPath);
  }
}
