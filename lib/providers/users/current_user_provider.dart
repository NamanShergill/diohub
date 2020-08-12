import 'package:gitapp/models/users/current_user_info_model.dart';
import 'package:gitapp/providers/base_provider.dart';
import 'package:gitapp/services/authentication/auth_service.dart';
import 'package:gitapp/services/users/current_user_service.dart';

class CurrentUserProvider extends BaseProvider {
  bool _authenticated;
  CurrentUserInfoModel _currentUserInfo;

  bool get authenticated => _authenticated;
  CurrentUserInfoModel get currentUserInfo => _currentUserInfo;

  Future<CurrentUserInfoModel> getUserInfo() async {
    _currentUserInfo =
        await CurrentUserService.getCurrentUserInfo().then((value) {
      if (value != null) {
        _authenticated = true;
        return value;
      }
      AuthService.logOut();
      return null;
    });
    return _currentUserInfo;
  }
}
