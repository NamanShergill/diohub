part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent {}

class CheckAuthState extends AuthenticationEvent {}

class RequestDeviceCode extends AuthenticationEvent {}

class ResetStates extends AuthenticationEvent {}

class AuthSuccessful extends AuthenticationEvent {}

class LogOut extends AuthenticationEvent {}
