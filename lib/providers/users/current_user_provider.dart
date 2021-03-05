import 'dart:async';

import 'package:onehub/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:onehub/common/base_popup_notification.dart';
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
  StreamSubscription errorSubscription;

  String error;

  CurrentUserInfoModel get currentUserInfo => _currentUserInfo;

  // Get provider status.
  @override
  Status get status => _providerStatus;

  @override
  void dispose() {
    authBlocSubscription.cancel();
    internetSubscription.cancel();
    errorSubscription.cancel();
    super.dispose();
  }

  CurrentUserProvider({this.authenticationBloc}) {
    authBlocSubscription = authenticationBloc.listen((state) {
      // Fetch user details if authentication is successful.
      if (state is AuthenticationSuccessful) getUserInfo();
    });
    // Request for user details again when back online, if failed previously due to no connection.
    internetSubscription =
        InternetConnectivity.networkStream.listen((event) async {
      if (event != NetworkStatus.Online && _providerStatus == Status.error) {
        await getUserInfo();
      }
    });
    // listen to the status of the provider and execute accordingly.
    errorSubscription = super.statusStream.listen((event) {
      _providerStatus = event;
      // Show a popup to retry if there was an error fetching the user details.
      if (event == Status.error) {
        super.showPopup(BasePopupNotification(
          title: 'Could not fetch user details. Tap to retry.',
          dismissOnTap: false,
          // Try getting the user details again on tap.
          onTap: (context) async {
            await getUserInfo();
          },
        ));
        // Remove the popup if a status other than loading is set.
      } else if (event != Status.loading) {
        super.showPopup(null);
      }
    });
  }

  /// Get User information from the API.
  Future<CurrentUserInfoModel> getUserInfo() async {
    super.statusController.add(Status.loading);
    try {
      _currentUserInfo =
          await CurrentUserService.getCurrentUserInfo().then((value) {
        if (value != null) {
          super.statusController.add(Status.loaded);
          notifyListeners();
          return value;
        }
        return null;
      });
    } catch (e) {
      // LogOut if auth credentials sent are incorrect.
      if (e.response != null && e.response.statusCode == 401)
        authenticationBloc.add(LogOut());
      error = e.message ?? 'Something went wrong.';
      super.statusController.add(Status.error);
      notifyListeners();
    }
    return _currentUserInfo;
  }
}
