import 'package:auto_route/auto_route.dart';
import 'package:onehub/view/home/widgets/search_overlay.dart';
import 'package:onehub/view/landing/widgets/landing_auth_wrapper.dart';
import 'package:onehub/view/repository/code/file_viewer.dart';
import 'package:onehub/view/repository/repository_screen.dart';

// flutter packages pub run build_runner watch --delete-conflicting-outputs

@CustomAutoRouter(
  transitionsBuilder: TransitionsBuilders.slideBottom,
  durationInMilliseconds: 250,
  routes: <AutoRoute>[
    AutoRoute(page: LandingAuthWrapperScreen, initial: true),
    CustomRoute(
        page: SearchOverlayScreen,
        transitionsBuilder: TransitionsBuilders.fadeIn),
    AutoRoute(page: RepositoryScreen),
    AutoRoute(page: FileViewerAPI)
  ],
)
class $AppRouter {}
