import 'dart:async';

import 'package:dio/dio.dart';
import 'package:diohub/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:diohub/models/users/current_user_info_model.dart';
import 'package:diohub/providers/base_provider.dart';
import 'package:diohub/services/users/user_info_service.dart';

class CurrentUserProvider extends BaseDataProvider<CurrentUserInfoModel> {
  CurrentUserProvider({required this.authenticationBloc})
      : super(loadDataOnInit: authenticationBloc.state.authenticated) {
    authenticationBloc.stream
        .listen((final AuthenticationState authState) async {
      // Fetch user details if authentication is successful.
      if (authState is AuthenticationSuccessful) {
        // Start the recursive function.
        await loadData();
      } else if (authState is AuthenticationUnauthenticated) {
        // Reset provider if the user is unauthenticated.
        if (status != Status.initialized) {
          reset();
        }
      }
    });
  }
  final AuthenticationBloc authenticationBloc;

  @override
  void onError(final Object error) {
    if (error is DioException) {
      if (error.response != null &&
          error.response!.statusCode == 401 &&
          authenticationBloc.state.authenticated) {
        authenticationBloc.add(LogOut());
      }
    }
  }

  @override
  Future<CurrentUserInfoModel> setInitData({
    final bool isInitialisation = false,
  }) =>
      UserInfoService.getCurrentUserInfo();
}
