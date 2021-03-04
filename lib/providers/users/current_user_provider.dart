import 'dart:async';

import 'package:onehub/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:onehub/models/users/current_user_info_model.dart';
import 'package:onehub/providers/base_provider.dart';
import 'package:onehub/services/users/current_user_service.dart';
import 'package:onehub/utils/internet_connectivity.dart';

class CurrentUserProvider extends BaseProvider {
  CurrentUserInfoModel _currentUserInfo;
  Status _providerStatus = Status.initialized;
  final AuthenticationBloc authenticationBloc;
  StreamSubscription authBlocSubscription;
  StreamSubscription internetSubscription;
  String error;

  CurrentUserProvider({this.authenticationBloc}) {
    authBlocSubscription = authenticationBloc.listen((state) {
      // Fetch user details if authentication is successful.
      if (state is AuthenticationSuccessful) getUserInfo();
    });
    // Request for user details again when back online, if failed previously due to no connection.
    internetSubscription = InternetConnectivity.networkStream.listen((event) {
      if (event != NetworkStatus.Online && _providerStatus == Status.error)
        getUserInfo();
    });
  }

  // Get provider status.
  @override
  Status get status => _providerStatus;

  @override
  void dispose() {
    authBlocSubscription.cancel();
    internetSubscription.cancel();
    super.dispose();
  }

  CurrentUserInfoModel get currentUserInfo => _currentUserInfo;

  /// Get User information from the API.
  Future<CurrentUserInfoModel> getUserInfo() async {
    _providerStatus = Status.loading;
    try {
      _currentUserInfo =
          await CurrentUserService.getCurrentUserInfo().then((value) {
        if (value != null) {
          _providerStatus = Status.loaded;
          notifyListeners();
          return value;
        }
        return null;
      });
    } catch (e) {
      // LogOut if auth credentials sent are incorrect.
      if (e.response != null && e.response.statusCode == 401)
        authenticationBloc.add(LogOut());
      error = e.message ?? 'Something went wrong';
      _providerStatus = Status.error;
      notifyListeners();
    }
    return _currentUserInfo;
  }
}
