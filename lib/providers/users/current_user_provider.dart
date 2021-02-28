import 'package:onehub/models/enums/status_enum.dart';
import 'package:onehub/models/users/current_user_info_model.dart';
import 'package:onehub/providers/base_provider.dart';
import 'package:onehub/services/authentication/auth_service.dart';
import 'package:onehub/services/users/current_user_service.dart';

class CurrentUserProvider extends BaseProvider {
  bool _authenticated;
  CurrentUserInfoModel _currentUserInfo;
  Status status = Status.Idle;

  bool get authenticated => _authenticated;
  CurrentUserInfoModel get currentUserInfo => _currentUserInfo;

  Future<CurrentUserInfoModel> getUserInfo() async {
    status = Status.Loading;
    _currentUserInfo =
        await CurrentUserService.getCurrentUserInfo().then((value) {
      if (value != null) {
        status = Status.Loaded;
        _authenticated = true;
        return value;
      }
      AuthService.logOut();
      return null;
    });
    return _currentUserInfo;
  }
}
