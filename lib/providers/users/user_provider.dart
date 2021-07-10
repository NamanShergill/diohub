import 'dart:async';

import 'package:dio_hub/common/misc/base_popup_notification.dart';
import 'package:dio_hub/models/users/user_info_model.dart';
import 'package:dio_hub/providers/base_provider.dart';
import 'package:dio_hub/services/users/user_info_service.dart';

class UserProvider extends BaseProvider {
  UserProvider(String? username) : _userName = username {
    getUserInfo();
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
  UserInfoModel? _currentUserInfo;
  final String? _userName;
  UserInfoModel? get currentUserInfo => _currentUserInfo;

  /// Get User information from the API.
  Future<UserInfoModel?> getUserInfo() async {
    loading();
    try {
      _currentUserInfo = await UserInfoService.getUserInfo(_userName);
      loaded();
    } catch (e) {
      error(error: e);
    }
    return _currentUserInfo;
  }

  @override
  void reset() {
    _currentUserInfo = null;
    reset();
  }
}
