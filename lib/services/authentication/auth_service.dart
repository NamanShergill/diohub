import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:dio_hub/app/Dio/dio.dart';
import 'package:dio_hub/app/global.dart';
import 'package:dio_hub/app/keys.dart';
import 'package:dio_hub/models/authentication/access_token_model.dart';
import 'package:dio_hub/models/authentication/device_code_model.dart';
import 'package:dio_hub/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthRepository {
  static const _storage = FlutterSecureStorage();

  final RESTHandler _restHandler = RESTHandler.external(
    baseURL: 'https://github.com/login/',
    cacheOptions: APICache.noCache(),
  );

  Future<bool> get isAuthenticated async {
    final token = await getAccessTokenFromDevice();
    debugPrint('Auth token ${token ?? 'not found.'}');
    if (token != null) {
      return true;
    }
    return false;
  }

  void storeAccessToken(AccessTokenModel accessTokenModel) async {
    await _storage.write(
        key: 'accessToken', value: accessTokenModel.accessToken);
    await _storage.write(key: 'scope', value: accessTokenModel.scope);
  }

  Future<String?> getAccessTokenFromDevice() async {
    try {
      final accessToken = await _storage.read(key: 'accessToken');
      return accessToken;
    } on PlatformException {
      // Workaround for https://github.com/mogol/flutter_secure_storage/issues/43
      logOut(sendToAuthScreen: false);
    }
    return null;
  }

  Future<Response> getDeviceToken() async {
    final formData = FormData.fromMap({
      'client_id': PrivateKeys.clientID,
      'scope': scopeString,
    });
    final response = await _restHandler.post('device/code', data: formData);
    return response;
  }

  String get scopeString => scopes.join(' ');
  List<String> get scopes => const [
        'repo',
        'public_repo',
        'repo:invite',
        'write:org',
        'gist',
        'notifications',
        'user',
        'delete_repo',
        'write:discussion',
        'read:packages',
        'delete:packages',
      ];

  Future<Response> getAccessToken({String? deviceCode}) async {
    final formData = FormData.fromMap({
      'client_id': PrivateKeys.clientID,
      'device_code': deviceCode,
      'grant_type': 'urn:ietf:params:oauth:grant-type:device_code',
    });
    try {
      final response =
          await _restHandler.post('oauth/access_token', data: formData);
      if (response.data['access_token'] != null) {
        return response;
      } else if (response.data['error'] != null &&
          response.data['error'] != 'authorization_pending' &&
          response.data['error'] != 'slow_down') {
        throw Exception(response.data['error_description']);
      }
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<DeviceCodeModel> getDeviceCode() async {
    final data = await getDeviceToken();
    if (data.data['device_code'] != null) {
      return DeviceCodeModel.fromJson(data.data);
    }
    //Exception is thrown if the response does not contain device_code.
    throw Exception('Some error occurred.');
  }

  void logOut({bool sendToAuthScreen = true}) async {
    BaseAPIHandler.clearCache();
    await _storage.deleteAll();
    if (sendToAuthScreen) {
      AutoRouter.of(currentContext).replaceAll([AuthScreenRoute()]);
    }
  }

  Future<AccessTokenModel> oauth2() async {
    const appAuth = FlutterAppAuth();
    final result = await appAuth.authorizeAndExchangeCode(
      AuthorizationTokenRequest(
        PrivateKeys.clientID,
        'auth.felix.diohub://login-callback',
        clientSecret: PrivateKeys.clientSecret,
        serviceConfiguration: const AuthorizationServiceConfiguration(
            tokenEndpoint: 'https://github.com/login/oauth/access_token',
            authorizationEndpoint: 'https://github.com/login/oauth/authorize'),
        scopes: scopes,
      ),
    );
    return AccessTokenModel(
      accessToken: result!.accessToken,
      scope: scopeString,
    );
  }
}
