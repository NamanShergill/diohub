import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gitapp/app/Dio/dio.dart';
import 'package:gitapp/app/keys.dart';
import 'package:gitapp/models/authentication/access_token_model.dart';
import 'package:gitapp/routes/router.gr.dart';

class AuthService {
  static final String url = '/login/';
  static final storage = new FlutterSecureStorage();

  static Future<bool> isAuthenticated() async {
    var res = await storage.read(key: "isAuthenticated");
    print("Auth Status $res");
    if (res != null) {
      return true;
    }
    return false;
  }

  static void storeAccessToken(AccessTokenModel accessTokenModel) async {
    await storage.write(
        key: "accessToken", value: accessTokenModel.accessToken);
    await storage.write(key: 'scope', value: accessTokenModel.scope);
    await storage.write(key: "isAuthenticated", value: "true");
  }

  static Future<String> getAccessTokenFromDevice() async {
    String accessToken = await storage.read(key: "accessToken");
    if (accessToken != null) {
      return accessToken;
    }
    ExtendedNavigator.named('rootNav').replace(Routes.loginScreen);
    return null;
  }

  static Future<Response> getDeviceToken() async {
    FormData formData = FormData.fromMap({
      'client_id': PrivateKeys.clientID,
      'scope': scope,
    });
    var response =
        await GetDio.getDio(loggedIn: false, baseURL: 'https://github.com/')
            .post("${url}device/code", data: formData);
    print(response.toString());
    return response;
  }

  static String scope =
      'repo repo:status repo_deployment public_repo repo:invite '
      'security_events admin:repo_hook write:repo_hook read:repo_hook admin:org'
      ' write:org read:org admin:public_key write:public_key read:public_key '
      'admin:org_hook gist notifications user read:user user:email user:follow '
      'delete_repo write:discussion read:discussion write:packages read:packages'
      ' delete:packages admin:gpg_key write:gpg_key read:gpg_key workflow';

  static Future getAccessToken({String deviceCode}) async {
    FormData formData = FormData.fromMap({
      'client_id': PrivateKeys.clientID,
      'device_code': deviceCode,
      'grant_type': 'urn:ietf:params:oauth:grant-type:device_code',
    });
    var response =
        await GetDio.getDio(loggedIn: false, baseURL: 'https://github.com/')
            .post("${url}oauth/access_token", data: formData);
    print(response.data);
    if (response.data['access_token'] != null) {
      storeAccessToken(AccessTokenModel.fromJson(response.data));
      return true;
    }
    return false;
  }

  static void logOut() async {
    await storage.deleteAll();
    ExtendedNavigator.named('rootNav').replace(Routes.loginScreen);
  }
}
