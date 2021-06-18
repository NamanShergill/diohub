part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationState {
  final bool authenticated = false;
}

/// User unauthenticated.
class AuthenticationUnauthenticated extends AuthenticationState {}

/// Authentication initialized.
class AuthenticationInitialized extends AuthenticationState {
  AuthenticationInitialized(this.deviceCodeModel);
  final DeviceCodeModel deviceCodeModel;
}

/// Authenticated.
class AuthenticationSuccessful extends AuthenticationState {
  @override
  bool get authenticated => true;
}

/// Error.
class AuthenticationError extends AuthenticationState {
  AuthenticationError(this.error);
  final String error;
}
