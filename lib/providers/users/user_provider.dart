import 'dart:async';

import 'package:onehub/common/base_popup_notification.dart';
import 'package:onehub/models/users/user_info_model.dart';
import 'package:onehub/providers/base_provider.dart';
import 'package:onehub/services/users/user_info_service.dart';

class UserProvider extends BaseProvider {
  UserInfoModel _currentUserInfo;
  final String _userName;
  UserInfoModel get currentUserInfo => _currentUserInfo;

  UserProvider(String username) : _userName = username {
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

  /// Get User information from the API.
  Future<UserInfoModel> getUserInfo() async {
    statusController.add(Status.loading);
    try {
      _currentUserInfo =
          await UserInfoService.getUserInfo(_userName).then((value) {
        if (value != null) {
          statusController.add(Status.loaded);
          return value;
        }
        return null;
      });
    } catch (e) {
      error = e.message ?? 'Something went wrong.';
      statusController.add(Status.error);
    }
    return _currentUserInfo;
  }

  @override
  void resetProvider() {
    _currentUserInfo = null;
    resetProvider();
  }
}
