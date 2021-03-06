import 'package:logger/logger.dart';
import 'package:onehub/routes/router.gr.dart';

class Global {
  static final AppRouter customRouter = AppRouter();
  static final currentContext = customRouter.navigatorKey.currentContext;
  static const String apiBaseURL = 'https://api.github.com';
  static final Logger log = Logger();
}
