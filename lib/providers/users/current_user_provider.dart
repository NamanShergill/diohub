import 'dart:async';

import 'package:dio/dio.dart';
import 'package:dio_hub/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:dio_hub/common/base_popup_notification.dart';
import 'package:dio_hub/controller/internet_connectivity.dart';
import 'package:dio_hub/models/users/current_user_info_model.dart';
import 'package:dio_hub/providers/base_provider.dart';
import 'package:dio_hub/services/users/user_info_service.dart';

class CurrentUserProvider extends BaseProvider {
  CurrentUserInfoModel? _currentUserInfo;
  final AuthenticationBloc authenticationBloc;
  CurrentUserInfoModel? get currentUserInfo => _currentUserInfo;

  CurrentUserProvider({required this.authenticationBloc}) {
    if (authenticationBloc.state.authenticated) {
      tryFetchUserInfo();
    }
    authenticationBloc.stream.listen((authState) {
      // Fetch user details if authentication is successful.
      if (authState is AuthenticationSuccessful) {
        // Start the recursive function.
        tryFetchUserInfo();
      } else if (authState is AuthenticationUnauthenticated) {
        // Reset provider if the user is unauthenticated.
        if (status != Status.initialized) reset();
      }
    });
    // Request for user details again when back online,
    // if failed previously due to no connection.
    InternetConnectivity.networkStream.listen((event) async {
      if (event != NetworkStatus.online &&
          status == Status.error &&
          authenticationBloc.state.authenticated) {
        await getUserInfo();
      }
    });
    // listen to the status of the provider and execute accordingly.
    statusStream.listen((event) {
      // Show a popup to retry if there was an error fetching the user details.
      if (event == Status.error) {
        showPopup(BasePopupNotification(
          title: 'Could not fetch user details. Tap to retry.',
          dismissOnTap: false,
          notificationController: notificationController,
          // Try getting the user details again on tap.
          onTap: (context) async {
            await getUserInfo();
          },
        ));
        // Remove the popup if a status other than loading is set.
      } else if (event != Status.loading) {
        showPopup(null);
      }
    });
  }

  void tryFetchUserInfo() async {
    // Fetch user info.
    await getUserInfo();
    // Wait a short duration.
    await Future.delayed(const Duration(seconds: 10));
    // If internet is available and user still not fetched,
    // call this function again.
    if (status != Status.loaded &&
        authenticationBloc.state is AuthenticationSuccessful &&
        InternetConnectivity.status != NetworkStatus.offline) {
      tryFetchUserInfo();
    }
  }

  /// Get User information from the API.
  Future<CurrentUserInfoModel?> getUserInfo() async {
    loading();
    try {
      _currentUserInfo =
          await UserInfoService.getCurrentUserInfo().then((value) {
        loaded();
        return value;
      });
    } catch (e) {
      // LogOut if auth credentials sent are incorrect.
      if (e is DioError) {
        if (e.response != null &&
            e.response!.statusCode == 401 &&
            authenticationBloc.state.authenticated) {
          authenticationBloc.add(LogOut());
        }
      }
      errorInfo = e.toString();
      error(error: e);
    }
    return _currentUserInfo;
  }

  @override
  void reset() {
    super.reset();
    _currentUserInfo = null;
  }
}
