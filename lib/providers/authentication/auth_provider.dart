import 'package:gitapp/models/authentication/device_code_model.dart';
import 'package:gitapp/providers/base_provider.dart';
import 'package:gitapp/services/authentication/auth_service.dart';

enum AuthStatus {
  unauthenticated,
  authenticating,
  authenticated,
}

class AuthProvider extends BaseProvider {
  DeviceCodeModel _deviceCode;
  AuthStatus _authStatus = AuthStatus.unauthenticated;

  DeviceCodeModel get deviceCode => _deviceCode;
  AuthStatus get authStatus => _authStatus;

  void setStatusAuthenticated() {
    _authStatus = AuthStatus.authenticated;
    notifyListeners();
  }

  void setStatusUnauthenticated() {
    _authStatus = AuthStatus.unauthenticated;
    notifyListeners();
  }

  Future<bool> getDeviceCode() async {
    await AuthService.getDeviceToken().then((value) {
      if (value.data['device_code'] != null) {
        _deviceCode = DeviceCodeModel.fromJson(value.data);
        _authStatus = AuthStatus.authenticating;
        notifyListeners();
        return true;
      }
      return false;
    });
    return false;
  }
}
