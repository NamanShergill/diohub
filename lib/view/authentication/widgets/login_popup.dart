import 'dart:io';

import 'package:dio_hub/app/keys.dart';
import 'package:dio_hub/app/settings/palette.dart';
import 'package:dio_hub/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:dio_hub/common/animations/scale_expanded_widget.dart';
import 'package:dio_hub/common/misc/app_dialog.dart';
import 'package:dio_hub/common/misc/button.dart';
import 'package:dio_hub/models/authentication/access_token_model.dart';
import 'package:dio_hub/services/authentication/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:oauth2_client/github_oauth2_client.dart';
import 'package:provider/provider.dart';

class LoginPopup extends StatefulWidget {
  const LoginPopup({Key? key}) : super(key: key);

  @override
  _LoginPopupState createState() => _LoginPopupState();
}

class _LoginPopupState extends State<LoginPopup> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<PaletteSettings>(context).currentSetting;

    return ScaleExpandedSection(
      child: StringButton(
        title: 'Login with GitHub',
        listenToLoadingController: true,
        loading: loading,
        leadingIcon: Icon(
          Octicons.mark_github,
          color:
              Provider.of<PaletteSettings>(context).currentSetting.baseElements,
        ),
        color: Provider.of<PaletteSettings>(context).currentSetting.secondary,
        onTap: () async {
          showDialog(
            context: context,
            builder: (_) => AppDialog(
              title: 'Choose Login Method',
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  StringButton(
                      color: theme.secondary,
                      listenToLoadingController: false,
                      onTap: () async {
                        Navigator.pop(context);
                        try {
                          setState(() {
                            loading = true;
                          });
                          await _browserAuth().then((value) =>
                              BlocProvider.of<AuthenticationBloc>(context)
                                  .add(AuthSuccessful(value)));
                        } catch (e) {
                          BlocProvider.of<AuthenticationBloc>(context)
                              .add(AuthError(e.toString()));
                        } finally {
                          setState(() {
                            loading = false;
                          });
                        }
                      },
                      title: 'Browser'),
                  const SizedBox(
                    height: 8,
                  ),
                  StringButton(
                      color: theme.secondary,
                      listenToLoadingController: false,
                      onTap: () {
                        Navigator.pop(context);
                        BlocProvider.of<AuthenticationBloc>(context)
                            .add(RequestDeviceCode());
                      },
                      title: 'One-Time Code')
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

Future<AccessTokenModel> _browserAuth() async {
  if (Platform.isIOS) {
    return _iosAuth();
  } else if (Platform.isAndroid) {
    return _androidAuth();
  } else {
    throw Exception('Unsupported platform.');
  }
}

Future<AccessTokenModel> _iosAuth() async {
  final appAuth = GitHubOAuth2Client(
    customUriScheme: 'auth.felix.diohub',
    redirectUri: 'auth.felix.diohub://login-callback',
  );
  final result = await appAuth.getTokenWithAuthCodeFlow(
    clientId: PrivateKeys.clientID,
    clientSecret: PrivateKeys.clientSecret,
    scopes: AuthService.scopes,
  );
  return AccessTokenModel(
      accessToken: result.accessToken, scope: AuthService.scopeString);
}

Future<AccessTokenModel> _androidAuth() async {
  final appAuth = FlutterAppAuth();
  final result = await appAuth.authorizeAndExchangeCode(
    AuthorizationTokenRequest(
      PrivateKeys.clientID,
      'auth.felix.diohub://login-callback',
      clientSecret: PrivateKeys.clientSecret,
      serviceConfiguration: const AuthorizationServiceConfiguration(
          tokenEndpoint: 'https://github.com/login/oauth/access_token',
          authorizationEndpoint: 'https://github.com/login/oauth/authorize'),
      scopes: AuthService.scopes,
    ),
  );
  return AccessTokenModel(
      accessToken: result!.accessToken, scope: AuthService.scopeString);
}
//
// Future<AccessTokenModel> _browserAuth() async {
//   final authEndpoint = Uri.parse('https://github.com/login/oauth/authorize');
//   final tokenEndpoint =
//       Uri.parse('https://github.com/login/oauth/access_token');
//   final redirectUri = Uri.parse('auth.felix.diohub://login-callback');
//   final grant = AuthorizationCodeGrant(
//       PrivateKeys.clientID, authEndpoint, tokenEndpoint,
//       secret: PrivateKeys.clientSecret);
//   final authUrl = grant.getAuthorizationUrl(redirectUri);
//   return AccessTokenModel(
//       accessToken: result!.accessToken, scope: AuthService.scopeString);
// }
