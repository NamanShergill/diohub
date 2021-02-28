part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationState {
  final bool authenticated = false;
}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationInitialized extends AuthenticationState {
  final DeviceCodeModel deviceCodeModel;
  AuthenticationInitialized(this.deviceCodeModel);
}

class AuthenticationSuccessful extends AuthenticationState {
  @override
  bool get authenticated => true;
}

class AuthenticationError extends AuthenticationState {
  final String error;
  AuthenticationError(this.error);
}
