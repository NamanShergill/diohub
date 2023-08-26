import 'package:auto_route/auto_route.dart';
import 'package:dio_hub/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:dio_hub/controller/deep_linking_handler.dart';
import 'package:dio_hub/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// flutter packages pub run build_runner watch --delete-conflicting-outputs

StackRouter autoRoute(BuildContext context) => AutoRouter.of(context);

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  AppRouter(BuildContext context) : authGuard = AuthGuard(context);
  final AuthGuard authGuard;
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: AuthRoute.page),
        AutoRoute(
            page: LandingLoadingRoute.page,
            guards: [
              authGuard,
            ],
            initial: true),
        AutoRoute(
          page: LandingRoute.page,
          guards: [
            authGuard,
          ],
        ),
        AutoRoute(
          page: PlaceHolderRoute.page,
          guards: [
            authGuard,
          ],
        ),
        CustomRoute(
            page: SearchOverlayRoute.page,
            transitionsBuilder: TransitionsBuilders.fadeIn,
            guards: [authGuard]),
        AutoRoute(
          page: IssuePullRoute.page,
          guards: [
            authGuard,
          ],
        ),
        AutoRoute(
          page: RepositoryRoute.page,
          guards: [
            authGuard,
          ],
        ),
        AutoRoute(
          page: FileViewerAPI.page,
          guards: [
            authGuard,
          ],
        ),
        AutoRoute(
          page: CommitInfoRoute.page,
          guards: [
            authGuard,
          ],
        ),
        AutoRoute(
          page: WikiViewer.page,
          guards: [
            authGuard,
          ],
        ),
        AutoRoute(
          page: ChangesViewer.page,
          guards: [
            authGuard,
          ],
        ),
        AutoRoute(
          page: OtherUserProfileRoute.page,
          guards: [
            authGuard,
          ],
        ),
        AutoRoute(
          page: NewIssueRoute.page,
          guards: [
            authGuard,
          ],
        ),
        AutoRoute(
          page: PRReviewRoute.page,
          guards: [
            authGuard,
          ],
        ),
      ];
}

// class $AppRouter {}

class AuthGuard extends AutoRouteGuard {
  AuthGuard(this.context);
  final BuildContext context;
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (!BlocProvider.of<AuthenticationBloc>(context).state.authenticated) {
      router.replaceAll(
        [
          AuthRoute(
            onAuthenticated: () {
              router.removeLast();
              resolver.next(true);
            },
          ),
        ],
      );
    } else {
      resolver.next(true);
    }
  }
}

// Widget fadeThroughTransition(BuildContext context, Animation<double> animation,
//     Animation<double> secondaryAnimation, Widget child) {
//   return FadeThroughTransition(
//     animation: animation,
//     secondaryAnimation: secondaryAnimation,
//     fillColor: secondary(context),
//     child: child,
//   );
// }

T getRoute<T extends PageRouteInfo>(PathData path,
    {required T Function(PathData path) onDeepLink,
    T Function(PathData path)? onAPILink}) {
  if (path.isAPIPath && onAPILink != null) {
    return onAPILink(path);
  }
  return onDeepLink(path);
}
