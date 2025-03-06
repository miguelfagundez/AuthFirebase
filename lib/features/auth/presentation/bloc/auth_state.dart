part of 'auth_bloc.dart';

@immutable
abstract class AuthState {
  final bool isUseAuthenticated;
  final bool recoveryPasswordWasSent;
  const AuthState({
    required this.isUseAuthenticated,
    required this.recoveryPasswordWasSent,
  });
}

class AuthInitialState extends AuthState {
  const AuthInitialState()
    : super(isUseAuthenticated: false, recoveryPasswordWasSent: false);
}

class AuthFailureState extends AuthState {
  const AuthFailureState()
    : super(isUseAuthenticated: false, recoveryPasswordWasSent: false);
}

class AuthSuccessState extends AuthState {
  const AuthSuccessState()
    : super(isUseAuthenticated: true, recoveryPasswordWasSent: false);
}

class RecorveryPasswordState extends AuthState {
  const RecorveryPasswordState()
    : super(isUseAuthenticated: false, recoveryPasswordWasSent: true);
}
