import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onehub/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:onehub/common/auth_popup/widgets/codeInfoBox.dart';
import 'package:onehub/style/colors.dart';

import '../button.dart';

class AuthPopup extends StatefulWidget {
  AuthPopup({Key key}) : super(key: key);

  @override
  _AuthPopupState createState() => _AuthPopupState();
}

class _AuthPopupState extends State<AuthPopup> {
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Dialog(
        backgroundColor: AppColor.background,
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlocConsumer<AuthenticationBloc, AuthenticationState>(
              listener: (context, state) async {
                if (state is AuthenticationInitialized) {
                  BlocProvider.of<AuthenticationBloc>(context).add(
                      RequestAccessToken(state.deviceCodeModel.deviceCode,
                          state.deviceCodeModel.interval));
                }
              },
              builder: (context, state) {
                if (state is AuthenticationInitial) {
                  return Container(
                    width: 500,
                    height: 80,
                    child: Button(
                      title: 'Login with github',
                      onTap: () async {
                        BlocProvider.of<AuthenticationBloc>(context)
                            .add(RequestDeviceCode());
                      },
                    ),
                  );
                } else if (state is AuthenticationInitialized)
                  return CodeInfoBox(state.deviceCodeModel);
              },
            ),
          ),
        ),
      ),
    );
  }
}
