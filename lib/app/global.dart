import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:logger/logger.dart';
import 'package:onehub/routes/router.gr.dart';
import 'package:path_provider/path_provider.dart';

class Global {
  static final AppRouter customRouter = AppRouter();
  static final currentContext = customRouter.navigatorKey.currentContext;
  static const String apiBaseURL = 'https://api.github.com';
  static final Logger log = Logger();
  static String? _directoryPath;
  static String? get directoryPath => _directoryPath;
  static HiveCacheStore? _cacheStore;
  static HiveCacheStore get cacheStore => _cacheStore!;

  static Future setupAppCache() async {
    await getApplicationDocumentsDirectory()
        .then((value) => _directoryPath = value.path);
    _cacheStore = HiveCacheStore(_directoryPath);
  }
}
