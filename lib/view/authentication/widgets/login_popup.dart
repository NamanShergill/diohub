import 'package:dio_hub/app/settings/palette.dart';
import 'package:dio_hub/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:dio_hub/common/animations/scale_expanded_widget.dart';
import 'package:dio_hub/common/misc/app_dialog.dart';
import 'package:dio_hub/common/misc/button.dart';
import 'package:dio_hub/services/authentication/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';

class LoginPopup extends StatefulWidget {
  const LoginPopup({Key? key}) : super(key: key);

  @override
  LoginPopupState createState() => LoginPopupState();
}

class LoginPopupState extends State<LoginPopup> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<PaletteSettings>(context).currentSetting;

    return ScaleExpandedSection(
      child: StringButton(
        title: 'Login with GitHub',
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
                      onTap: () async {
                        Navigator.pop(context);
                        try {
                          setState(() {
                            loading = true;
                          });
                          await AuthRepository().oauth2().then(
                                (value) =>
                                    BlocProvider.of<AuthenticationBloc>(context)
                                        .add(
                                  AuthSuccessful(value),
                                ),
                              );
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
