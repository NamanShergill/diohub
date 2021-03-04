part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationState {
  final bool authenticated = false;
}

/// Initial state.
class AuthenticationInitial extends AuthenticationState {}

/// User unauthenticated.
class AuthenticationUnauthenticated extends AuthenticationState {}

/// Authentication initialized.
class AuthenticationInitialized extends AuthenticationState {
  final DeviceCodeModel deviceCodeModel;
  AuthenticationInitialized(this.deviceCodeModel);
}

/// Authenticated.
class AuthenticationSuccessful extends AuthenticationState {
  @override
  bool get authenticated => true;
}

/// Error.
class AuthenticationError extends AuthenticationState {
  final String error;
  AuthenticationError(this.error);
}
