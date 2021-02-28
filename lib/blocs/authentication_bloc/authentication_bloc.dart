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
      bool auth = await AuthService.isAuthenticated();
      if (auth) yield AuthenticationSuccessful();
    } else if (event is RequestDeviceCode) {
      Response response = await AuthService.getDeviceToken();
      if (response.data['device_code'] != null) {
        yield AuthenticationInitialized(
            DeviceCodeModel.fromJson(response.data));
      } else {
        yield AuthenticationError('Something went wrong, please try again');
      }
    } else if (event is AuthSuccessful) {
      yield AuthenticationSuccessful();
    } else if (event is ResetStates) {
      yield AuthenticationInitial();
    } else if (event is LogOut) {
      AuthService.logOut();
      yield AuthenticationInitial();
    }
  }
}
