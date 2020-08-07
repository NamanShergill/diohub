import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:gitapp/app/Dio/dio.dart';
import 'package:gitapp/app/global.dart';
import 'package:gitapp/app/keys.dart';
import 'package:gitapp/models/authentication/access_token_model.dart';
import 'package:gitapp/models/authentication/device_code_model.dart';
import 'package:gitapp/routes/router.gr.dart';

class AuthService {
  static final String url = '/login/';

  static getDeviceToken() async {
    FormData formData = FormData.fromMap({
      'client_id': PrivateKeys.clientID,
    });
    var response =
        await GetDio.getDio(loggedIn: false, baseURL: 'https://github.com/')
            .post("${url}device/code", data: formData);
    print(response.toString());
    if (response.data['device_code'] != null) {
      ExtendedNavigator.named('rootNav').push(Routes.enterCodeScreen,
          arguments: EnterCodeScreenArguments(
              deviceCodeModel: DeviceCodeModel.fromJson(response.data)));
    }
    return response;
  }

  static Future getAccessToken({String deviceCode}) async {
    FormData formData = FormData.fromMap({
      'client_id': PrivateKeys.clientID,
      'device_code': deviceCode,
      'grant_type': 'urn:ietf:params:oauth:grant-type:device_code',
    });
    var response =
        await GetDio.getDio(loggedIn: false, baseURL: 'https://github.com/')
            .post("${url}oauth/access_token", data: formData);
    print(response.toString());
    if (response.data['access_token'] != null) {
      Global.storeAccessTokenAndRefreshToken(
          AccessTokenModel.fromJson(response.data));
      ExtendedNavigator.named('rootNav').pop();
      ExtendedNavigator.named('rootNav').popAndPush(Routes.dashboardScreen);
      return true;
    }
    return false;
  }
}
