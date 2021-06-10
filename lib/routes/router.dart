import 'package:auto_route/auto_route.dart';
import 'package:dio_hub/app/global.dart';
import 'package:dio_hub/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:dio_hub/common/search_overlay/search_overlay.dart';
import 'package:dio_hub/routes/router.gr.dart';
import 'package:dio_hub/view/authentication/auth_screen.dart';
import 'package:dio_hub/view/issues_pulls/issue_screen.dart';
import 'package:dio_hub/view/issues_pulls/pull_screen.dart';
import 'package:dio_hub/view/issues_pulls/widgets/p_r_review_screen.dart';
import 'package:dio_hub/view/landing/landing.dart';
import 'package:dio_hub/view/landing/widgets/landing_loading_screen.dart';
import 'package:dio_hub/view/landing/widgets/place_holder_screen.dart';
import 'package:dio_hub/view/profile/other_user_profile_screen.dart';
import 'package:dio_hub/view/repository/code/file_viewer.dart';
import 'package:dio_hub/view/repository/commits/commit_info_screen.dart';
import 'package:dio_hub/view/repository/commits/widgets/changes_viewer.dart';
import 'package:dio_hub/view/repository/issues/new_issue_screen.dart';
import 'package:dio_hub/view/repository/repository_screen.dart';
import 'package:dio_hub/view/repository/wiki/wiki_viewer.dart';
import 'package:dio_hub/view/settings/dependencies_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// flutter packages pub run build_runner watch --delete-conflicting-outputs

@CustomAutoRouter(
  transitionsBuilder: TransitionsBuilders.slideLeft,
  // durationInMilliseconds: 250,
  routes: <AutoRoute>[
    AutoRoute(page: AuthScreen),
    AutoRoute(page: LandingLoadingScreen, guards: [AuthGuard], initial: true),
    AutoRoute(page: LandingScreen, guards: [AuthGuard]),
    AutoRoute(page: PlaceHolderScreen, guards: [AuthGuard]),
    CustomRoute(
        page: SearchOverlayScreen,
        transitionsBuilder: TransitionsBuilders.fadeIn,
        guards: [AuthGuard]),
    AutoRoute(page: IssueScreen, guards: [AuthGuard]),
    AutoRoute(page: PullScreen, guards: [AuthGuard]),
    AutoRoute(page: RepositoryScreen, guards: [AuthGuard]),
    AutoRoute(page: FileViewerAPI, guards: [AuthGuard]),
    AutoRoute(page: CommitInfoScreen, guards: [AuthGuard]),
    AutoRoute(page: WikiViewer, guards: [AuthGuard]),
    AutoRoute(page: ChangesViewer, guards: [AuthGuard]),
    AutoRoute(page: OtherUserProfileScreen, guards: [AuthGuard]),
    AutoRoute(page: NewIssueScreen, guards: [AuthGuard]),
    AutoRoute(page: PRReviewScreen, guards: [AuthGuard]),
    AutoRoute(page: DependenciesScreen, guards: [AuthGuard]),
    AutoRoute(page: OssLicenseScreen, guards: [AuthGuard]),
  ],
)
class $AppRouter {}

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (!BlocProvider.of<AuthenticationBloc>(Global.currentContext)
        .state
        .authenticated) {
      router.replaceAll([
        AuthScreenRoute(onAuthenticated: () {
          router.removeLast();
          resolver.next(true);
        }),
      ]);
    } else {
      resolver.next(true);
    }
  }
}
