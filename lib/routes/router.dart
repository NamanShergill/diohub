import 'package:auto_route/auto_route.dart';
import 'package:onehub/view/home/widgets/search_overlay.dart';
import 'package:onehub/view/landing/widgets/landing_auth_wrapper.dart';
import 'package:onehub/view/profile/other_user_profile_screen.dart';
import 'package:onehub/view/repository/code/file_viewer.dart';
import 'package:onehub/view/repository/commits/commit_info_screen.dart';
import 'package:onehub/view/repository/commits/widgets/changes_viewer.dart';
import 'package:onehub/view/repository/repository_screen.dart';
import 'package:onehub/view/repository/wiki/wiki_viewer.dart';

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
    AutoRoute(page: FileViewerAPI),
    AutoRoute(page: CommitInfoScreen),
    AutoRoute(page: WikiViewer),
    AutoRoute(page: ChangesViewer),
    AutoRoute(page: OtherUserProfileScreen),
  ],
)
class $AppRouter {}
