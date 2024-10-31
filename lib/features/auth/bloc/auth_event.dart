part of 'auth_bloc.dart';

abstract base class AuthEvent extends BaseEvent {}

final class SignInRequested extends AuthEvent {
  final String email;
  final String password;

  SignInRequested({required this.email, required this.password});
}

final class CheckAuthentication extends AuthEvent {}

final class SignUpRequested extends AuthEvent {
  final String email;
  final String password;

  SignUpRequested({required this.email, required this.password});
}

final class SignOutRequested extends AuthEvent {}

final class ResetPasswordRequested extends AuthEvent {
  final String email;

  ResetPasswordRequested({required this.email});
}

final class SignInWithGoogleRequested extends AuthEvent {}
