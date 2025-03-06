part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class InitialAuthEvent extends AuthEvent {
  InitialAuthEvent();
}

class AuthenticateUserWithEmailEvent extends AuthEvent {
  final String email;
  final String password;

  AuthenticateUserWithEmailEvent({required this.email, required this.password});
}

class RegisterUserWithEmailEvent extends AuthEvent {
  final String email;
  final String password;

  RegisterUserWithEmailEvent({required this.email, required this.password});
}

class ForgotPasswordEvent extends AuthEvent {
  final String email;

  ForgotPasswordEvent({required this.email});
}
