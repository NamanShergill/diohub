import 'dart:async';

import 'package:diohub/models/authentication/access_token_model.dart';
import 'package:diohub/models/authentication/device_code_model.dart';
import 'package:diohub/services/authentication/auth_service.dart';
import 'package:diohub/utils/type_cast.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({required final bool authenticated})
      : super(
          authenticated
              ? AuthenticationSuccessful()
              : AuthenticationUnauthenticated(),
        ) {
    on<RequestDeviceCode>(_requestDeviceCode);
    on<RequestAccessToken>(_requestAccessToken);
    on<AuthError>(_authError);
    on<ResetStates>(_resetStates);
    on<AuthSuccessful>(_authSuccessful);
    on<LogOut>(_logOut);
  }

  final AuthRepository authRepository = AuthRepository();

  Future<void> _requestDeviceCode(
    final RequestDeviceCode event,
    final Emitter<AuthenticationState> emit,
  ) async {
    // Get device code to initiate authentication.
    try {
      final TypeMap map = await authRepository.getDeviceToken();
      // ['device_code'] should not be null.
      if (map['device_code'] != null) {
        final DeviceCodeModel data = DeviceCodeModel.fromJson(map);
        add(RequestAccessToken(data.deviceCode, data.interval));
        emit(AuthenticationInitialized(data));
      } else {
        emit(AuthenticationError('Something went wrong, please try again.'));
      }
    } on Exception catch (e) {
      add(AuthError(e.toString()));
    }
  }

  Future<void> _requestAccessToken(
    final RequestAccessToken event,
    final Emitter<AuthenticationState> emit,
  ) async {
    // Recurring function to request access token from Github on the supplied
    // interval.
    Future<void> requestAccessToken(
      final String? deviceCode,
      final int interval,
    ) async {
      // Wait the interval provided by Github before hitting the API to check
      // the status of Authentication.
      await Future<void>.delayed(Duration(seconds: interval));
      // Get the current Authentication state.
      final AuthenticationState currentState = state;
      // Check if state is still on the code display mode before executing
      // the (recursive) function. Also checks if the request is for the same
      // deviceCode to prevent a false positive on back to back state changes.
      // If not, the recursion will break here.
      if (currentState is AuthenticationInitialized &&
          currentState.deviceCodeModel.deviceCode == deviceCode) {
        try {
          final TypeMap data =
              await authRepository.getAccessToken(deviceCode: deviceCode);
          if (data['access_token'] != null) {
            // Access token received. State is set to authenticated. Function
            // can stop executing now.
            add(AuthSuccessful(AccessTokenModel.fromJson(data)));
          } else if (data['interval'] != null) {
            // Execute the function again with the new interval given by
            // GitHub.
            await requestAccessToken(deviceCode, data['interval']);
          } else {
            // Execute the function again.
            await requestAccessToken(deviceCode, interval);
          }
        } on Exception catch (error) {
          add(AuthError(error.toString()));
        }
      }
    }

    // Initiate recursive function to request for access token at set
    // intervals.
    await requestAccessToken(event.deviceCode, event.interval!);
  }

  Future<void> _authSuccessful(
    final AuthSuccessful event,
    final Emitter<AuthenticationState> emit,
  ) async {
    await authRepository.storeAccessToken(event.accessToken);
    emit(AuthenticationSuccessful());
  }

  void _resetStates(
    final ResetStates event,
    final Emitter<AuthenticationState> emit,
  ) {
    emit(AuthenticationUnauthenticated());
  }

  Future<void> _logOut(
    final LogOut event,
    final Emitter<AuthenticationState> emit,
  ) async {
    await authRepository.logOut();
    emit(AuthenticationUnauthenticated());
  }

  void _authError(
    final AuthError event,
    final Emitter<AuthenticationState> emit,
  ) {
    emit(AuthenticationError(event.error));
  }
}
