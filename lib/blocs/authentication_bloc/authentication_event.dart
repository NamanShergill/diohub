part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent {}

class CheckAuthState extends AuthenticationEvent {}

class RequestDeviceCode extends AuthenticationEvent {}

class RequestAccessToken extends AuthenticationEvent {
  final String deviceCode;
  final int interval;
  RequestAccessToken(this.deviceCode, this.interval);
}

class ResetStates extends AuthenticationEvent {}

class AuthSuccessful extends AuthenticationEvent {}

class LogOut extends AuthenticationEvent {}
