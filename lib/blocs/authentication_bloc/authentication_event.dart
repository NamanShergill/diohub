part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent {}

///Check auth state.
class CheckAuthState extends AuthenticationEvent {}

/// Request Device code for authentication initialisation.
class RequestDeviceCode extends AuthenticationEvent {}

/// Request access token from GitHub.
class RequestAccessToken extends AuthenticationEvent {
  // Device code received in previous step.
  final String? deviceCode;
  // The intervals in which the requests are to be made.
  final int? interval;
  RequestAccessToken(this.deviceCode, this.interval);
}

/// Error handling.
class AuthError extends AuthenticationEvent {
  final String error;
  AuthError(this.error);
}

/// Reset states to unauthenticated.
/// To be used when the timer runs out or user cancels authentication, for
/// example.
class ResetStates extends AuthenticationEvent {}

/// Successfully authenticated.
class AuthSuccessful extends AuthenticationEvent {}

/// LogOut the user.
class LogOut extends AuthenticationEvent {}
