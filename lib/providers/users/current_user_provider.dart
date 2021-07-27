import 'dart:async';

import 'package:dio/dio.dart';
import 'package:dio_hub/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:dio_hub/models/users/current_user_info_model.dart';
import 'package:dio_hub/providers/base_provider.dart';
import 'package:dio_hub/services/users/user_info_service.dart';

class CurrentUserProvider extends BaseDataProvider<CurrentUserInfoModel> {
  CurrentUserProvider({required this.authenticationBloc})
      : super(loadDataOnInit: authenticationBloc.state.authenticated) {
    authenticationBloc.stream.listen((authState) {
      // Fetch user details if authentication is successful.
      if (authState is AuthenticationSuccessful) {
        // Start the recursive function.
        loadData();
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
  void onError(Object error) {
    if (error is DioError) {
      if (error.response != null &&
          error.response!.statusCode == 401 &&
          authenticationBloc.state.authenticated) {
        authenticationBloc.add(LogOut());
      }
    }
  }

  @override
  Future<CurrentUserInfoModel> setInitData() {
    return UserInfoService.getCurrentUserInfo();
  }
}
