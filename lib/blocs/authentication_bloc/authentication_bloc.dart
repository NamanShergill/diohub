import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio_hub/models/authentication/access_token_model.dart';
import 'package:dio_hub/models/authentication/device_code_model.dart';
import 'package:dio_hub/services/authentication/auth_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({required bool authenticated})
      : super(authenticated
            ? AuthenticationSuccessful()
            : AuthenticationUnauthenticated()) {
    on<RequestDeviceCode>(_requestDeviceCode);
    on<RequestAccessToken>(_requestAccessToken);
    on<AuthError>(_authError);
    on<ResetStates>(_resetStates);
    on<AuthSuccessful>(_authSuccessful);
    on<LogOut>(_logOut);
  }

  void _requestDeviceCode(
      RequestDeviceCode event, Emitter<AuthenticationState> emit) async {
    // Get device code to initiate authentication.
    try {
      final response = await AuthService.getDeviceToken();
      // ['device_code'] should not be null.
      if (response.data['device_code'] != null) {
        final data = DeviceCodeModel.fromJson(response.data);
        add(RequestAccessToken(data.deviceCode, data.interval));
        emit(AuthenticationInitialized(data));
      } else {
        emit(AuthenticationError('Something went wrong, please try again.'));
      }
    } catch (e) {
      add(AuthError(e.toString()));
    }
  }

  void _requestAccessToken(
      RequestAccessToken event, Emitter<AuthenticationState> emit) {
    // Recurring function to request access token from Github on the supplied
    // interval.
    void requestAccessToken(String? deviceCode, int interval) async {
      // Wait the interval provided by Github before hitting the API to check
      // the status of Authentication.
      await Future.delayed(Duration(seconds: interval));
      // Get the current Authentication state.
      final currentState = state;
      // Check if state is still on the code display mode before executing
      // the (recursive) function. Also checks if the request is for the same
      // deviceCode to prevent a false positive on back to back state changes.
      // If not, the recursion will break here.
      if (currentState is AuthenticationInitialized &&
          currentState.deviceCodeModel.deviceCode == deviceCode) {
        try {
          final response =
              await AuthService.getAccessToken(deviceCode: deviceCode);
          if (response.data['access_token'] != null) {
            // Access token received. State is set to authenticated. Function
            // can stop executing now.
            add(AuthSuccessful(AccessTokenModel.fromJson(response.data)));
          } else if (response.data['interval'] != null) {
            // Execute the function again with the new interval given by
            // GitHub.
            requestAccessToken(deviceCode, response.data['interval']);
          } else {
            // Execute the function again.
            requestAccessToken(deviceCode, interval);
          }
        } catch (error) {
          add(AuthError(error.toString()));
        }
      }
    }

    // Initiate recursive function to request for access token at set
    // intervals.
    requestAccessToken(event.deviceCode, event.interval!);
  }

  void _authSuccessful(
      AuthSuccessful event, Emitter<AuthenticationState> emit) {
    AuthService.storeAccessToken(event.accessToken);
    emit(AuthenticationSuccessful());
  }

  void _resetStates(ResetStates event, Emitter<AuthenticationState> emit) {
    emit(AuthenticationUnauthenticated());
  }

  void _logOut(LogOut event, Emitter<AuthenticationState> emit) {
    AuthService.logOut();
    emit(AuthenticationUnauthenticated());
  }

  void _authError(AuthError event, Emitter<AuthenticationState> emit) {
    emit(AuthenticationError(event.error));
  }
}
