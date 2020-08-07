import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gitapp/app/Dio/dio.dart';
import 'package:gitapp/app/keys.dart';
import 'package:gitapp/models/authentication/access_token_model.dart';
import 'package:gitapp/routes/router.gr.dart';

class Global {
  static final storage = new FlutterSecureStorage();

  static Future<bool> isAuthenticated() async {
    var res = await storage.read(key: "isAuthenticated");
    print("Auth Status $res");
    if (res != null) {
      return true;
    }
    return false;
  }

  static void storeAccessTokenAndRefreshToken(
      AccessTokenModel accessTokenModel) async {
    await storage.write(
        key: "accessToken", value: accessTokenModel.accessToken);
    await storage.write(
        key: "refreshToken", value: accessTokenModel.refreshToken);
    await storage.write(
        key: "accessTokenExpire",
        value: (DateTime.now().millisecondsSinceEpoch +
                accessTokenModel.expiresIn * 1000)
            .toString());
    await storage.write(
        key: "refreshTokenExpire",
        value: (DateTime.now().millisecondsSinceEpoch +
                accessTokenModel.refreshTokenExpiresIn * 1000)
            .toString());
    await storage.write(key: "isAuthenticated", value: "true");
  }

  static Future<String> getAccessToken() async {
    String accessToken = await storage.read(key: "accessToken");
    int accessTokenExpire =
        int.parse(await storage.read(key: "accessTokenExpire"));
    if (accessToken != null) {
      if (accessTokenExpire > DateTime.now().millisecondsSinceEpoch) {
        return accessToken;
      }
    }
    return updateAccessToken();
  }

  static Future<String> updateAccessToken() async {
    String refreshToken = await storage.read(key: "refreshToken");
    int refreshTokenExpire =
        int.parse(await storage.read(key: "refreshTokenExpire"));

    if (refreshToken != null) {
      FormData formData = new FormData.fromMap({
        'refresh_token': refreshToken,
        'grant_type': 'refresh_token',
        'client_id': PrivateKeys.clientID,
        'client_secret': PrivateKeys.clientSecret,
        'redirect_uri': PrivateKeys.redirectUri,
      });

      if (refreshTokenExpire > DateTime.now().millisecondsSinceEpoch) {
        GetDio.getDio(loggedIn: false, baseURL: "https://github.com")
            .post(
          "/login/oauth/access_token",
          data: formData,
        )
            .then(
          (v) {
            print(v);
            if (v.statusCode == 200) {
              storeAccessTokenAndRefreshToken(
                  AccessTokenModel.fromJson(v.data));
              return v.data["access_token"];
            }
          },
        );
      } else {
        storage.deleteAll();
        ExtendedNavigator.named('rootNav').replace(Routes.loginScreen);
      }
    } else {
      storage.deleteAll();
      ExtendedNavigator.named('rootNav').replace(Routes.loginScreen);
    }
    return null;
  }

  static void logOut() async {
    await storage.deleteAll();
    ExtendedNavigator.named('rootNav').replace(Routes.loginScreen);
  }
}
