part of 'auth_bloc.dart';

@immutable
abstract class AuthState {
  final bool isUseAuthenticated;
  const AuthState({required this.isUseAuthenticated});
}

class AuthInitialState extends AuthState {
  const AuthInitialState() : super(isUseAuthenticated: false);
}

class AuthFailureState extends AuthState {
  const AuthFailureState() : super(isUseAuthenticated: false);
}

class AuthSuccessState extends AuthState {
  const AuthSuccessState() : super(isUseAuthenticated: true);
}
