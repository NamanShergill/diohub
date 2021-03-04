import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onehub/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:onehub/common/auth_popup/widgets/codeInfoBox.dart';
import 'package:onehub/common/auth_popup/widgets/error_popup.dart';
import 'package:onehub/common/auth_popup/widgets/login_popup.dart';
import 'package:onehub/common/auth_popup/widgets/success_popup.dart';
import 'package:onehub/style/colors.dart';

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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        backgroundColor: AppColor.background,
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: BlocConsumer<AuthenticationBloc, AuthenticationState>(
              listener: (context, state) async {
                if (state is AuthenticationInitialized) {
                  BlocProvider.of<AuthenticationBloc>(context).add(
                      RequestAccessToken(state.deviceCodeModel.deviceCode,
                          state.deviceCodeModel.interval));
                }
              },
              builder: (context, state) {
                if (state is AuthenticationUnauthenticated) {
                  return LoginPopup();
                } else if (state is AuthenticationInitialized)
                  return CodeInfoBox(state.deviceCodeModel);
                else if (state is AuthenticationSuccessful) {
                  return SuccessPopup();
                } else if (state is AuthenticationError) {
                  return ErrorPopup(state.error);
                }
                return Container();
              },
            ),
          ),
        ),
      ),
    );
  }
}
