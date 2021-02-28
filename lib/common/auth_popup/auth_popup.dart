import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onehub/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:onehub/common/auth_popup/widgets/codeInfoBox.dart';
import 'package:onehub/services/authentication/auth_service.dart';
import 'package:onehub/style/colors.dart';

import '../button.dart';

class AuthPopup extends StatefulWidget {
  AuthPopup({Key key}) : super(key: key);

  @override
  _AuthPopupState createState() => _AuthPopupState();
}

class _AuthPopupState extends State<AuthPopup> {
  // Recurring function to request access token from Github on the supplied interval
  void requestAccessToken(String deviceCode, int interval) async {
    // Wait the interval provided by Github before hitting the API to check the status of Authentication.
    await Future.delayed(Duration(seconds: interval));
    // Get the current Authentication state.
    AuthenticationState state =
        BlocProvider.of<AuthenticationBloc>(context).state;
    // Check if state is still on the code display mode before executing the (recursive) function.
    // Also checks if the request is for the same deviceCode to prevent a false positive on back to back state changes.
    // If not, the recursion will break here.
    if (state is AuthenticationInitialized &&
        state.deviceCodeModel.deviceCode == deviceCode) {
      Response response =
          await AuthService.getAccessToken(deviceCode: deviceCode);
      if (response.data['access_token'] != null) {
        // Access token received. State is set to authenticated. Function can stop executing now.
        BlocProvider.of<AuthenticationBloc>(context).add(AuthSuccessful());
      } else if (response.data['interval'] != null) {
        // Execute the function again with the new interval given by GitHub.
        requestAccessToken(deviceCode, response.data['interval']);
      } else {
        // Execute the function again.
        requestAccessToken(deviceCode, interval);
      }
    }
  }

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
                  requestAccessToken(state.deviceCodeModel.deviceCode,
                      state.deviceCodeModel.interval);
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
