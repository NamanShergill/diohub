import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:onehub/models/authentication/device_code_model.dart';
import 'package:onehub/services/authentication/auth_service.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitial());

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is CheckAuthState) {
      //Check if user is authenticated and yield a state accordingly.
      bool auth = await AuthService.isAuthenticated();
      if (auth)
        yield AuthenticationSuccessful();
      else
        yield AuthenticationUnauthenticated();
    } else if (event is RequestDeviceCode) {
      // Get device code to initiate authentication.
      Response response = await AuthService.getDeviceToken();
      // ['device_code'] should not be null.
      if (response.data['device_code'] != null) {
        yield AuthenticationInitialized(
            DeviceCodeModel.fromJson(response.data));
      } else {
        yield AuthenticationError('Something went wrong, please try again.');
      }
    } else if (event is RequestAccessToken) {
      // Recurring function to request access token from Github on the supplied interval
      void requestAccessToken(String? deviceCode, int interval) async {
        // Wait the interval provided by Github before hitting the API to check the status of Authentication.
        await Future.delayed(Duration(seconds: interval));
        // Get the current Authentication state.
        AuthenticationState currentState = state;
        // Check if state is still on the code display mode before executing the (recursive) function.
        // Also checks if the request is for the same deviceCode to prevent a false positive on back to back state changes.
        // If not, the recursion will break here.
        if (currentState is AuthenticationInitialized &&
            currentState.deviceCodeModel.deviceCode == deviceCode) {
          try {
            Response response =
                await AuthService.getAccessToken(deviceCode: deviceCode);
            if (response.data['access_token'] != null) {
              // Access token received. State is set to authenticated. Function can stop executing now.
              add(AuthSuccessful());
            } else if (response.data['interval'] != null) {
              // Execute the function again with the new interval given by GitHub.
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

      // Initiate recursive function to request for access token at set intervals.
      requestAccessToken(event.deviceCode, event.interval!);
    } else if (event is AuthSuccessful) {
      yield AuthenticationSuccessful();
    } else if (event is ResetStates) {
      yield AuthenticationUnauthenticated();
    } else if (event is LogOut) {
      AuthService.logOut();
      yield AuthenticationUnauthenticated();
    } else if (event is AuthError) yield AuthenticationError(event.error);
  }
}
