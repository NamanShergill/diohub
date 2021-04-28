import 'package:auto_route/auto_route.dart';
import 'package:dio_hub/common/search_overlay/search_overlay.dart';
import 'package:dio_hub/view/issues_pulls/issue_screen.dart';
import 'package:dio_hub/view/issues_pulls/pull_screen.dart';
import 'package:dio_hub/view/landing/landing.dart';
import 'package:dio_hub/view/landing/widgets/place_holder_screen.dart';
import 'package:dio_hub/view/profile/other_user_profile_screen.dart';
import 'package:dio_hub/view/repository/code/file_viewer.dart';
import 'package:dio_hub/view/repository/commits/commit_info_screen.dart';
import 'package:dio_hub/view/repository/commits/widgets/changes_viewer.dart';
import 'package:dio_hub/view/repository/repository_screen.dart';
import 'package:dio_hub/view/repository/wiki/wiki_viewer.dart';

// flutter packages pub run build_runner watch --delete-conflicting-outputs

@CustomAutoRouter(
  transitionsBuilder: TransitionsBuilders.slideBottom,
  durationInMilliseconds: 250,
  routes: <AutoRoute>[
    AutoRoute(page: LandingScreen, initial: true),
    AutoRoute(page: PlaceHolderScreen),
    CustomRoute(
        page: SearchOverlayScreen,
        transitionsBuilder: TransitionsBuilders.fadeIn),
    AutoRoute(page: IssueScreen),
    AutoRoute(page: PullScreen),
    AutoRoute(page: RepositoryScreen),
    AutoRoute(page: FileViewerAPI),
    AutoRoute(page: CommitInfoScreen),
    AutoRoute(page: WikiViewer),
    AutoRoute(page: ChangesViewer),
    AutoRoute(page: OtherUserProfileScreen),
  ],
)
class $AppRouter {}
