import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_example/features/auth/domain/usecases/authenticate_user_with_email_usecase.dart';
import 'package:flutter_firebase_example/features/auth/domain/usecases/forgot_password_usecase.dart';
import 'package:flutter_firebase_example/features/auth/domain/usecases/register_user_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthenticateUserWithEmailUsecase _authenticateUserWithEmailUsecase;
  final ForgotPasswordUsecase _forgotPasswordUsecase;
  final RegisterUserUsecase _registerUserUsecase;

  AuthBloc(
    this._authenticateUserWithEmailUsecase,
    this._forgotPasswordUsecase,
    this._registerUserUsecase,
    // this._logoutUsecase,
  ) : super(AuthInitialState()) {
    on<AuthenticateUserWithEmailEvent>(_authenticateUserWithEmailEvent);
    on<RegisterUserWithEmailEvent>(_registerUserEvent);
    on<ForgotPasswordEvent>(_forgotPasswordEvent);
    // on<LogoutUserEvent>(_logoutUserEvent);
  }

  _authenticateUserWithEmailEvent(
    AuthenticateUserWithEmailEvent event,
    Emitter<AuthState> emit,
  ) async {
    final resp = await _authenticateUserWithEmailUsecase(
      event.email,
      event.password,
    );

    resp.fold(
      (userAuthenticatedFailure) {
        debugPrint('User was not Authenticated - Try Again!');
        emit(AuthFailureState());
      },
      (userAuthenticatedSuccess) {
        debugPrint(
          'User was Authenticated successfully, ${userAuthenticatedSuccess.email}',
        );
        // TODO : Save user data
        //add(SomeUserEvent());
        emit(AuthSuccessState());
      },
    );
  }

  _registerUserEvent(
    RegisterUserWithEmailEvent event,
    Emitter<AuthState> emit,
  ) async {
    final resp = await _registerUserUsecase(
      event.email,
      event.email,
      event.password,
      DateTime.now(),
    );

    resp.fold(
      (userAuthenticatedFailure) {
        debugPrint('User was not Register - Try Again!');
        emit(AuthFailureState());
      },
      (userAuthenticatedSuccess) {
        debugPrint(
          'User was Authenticated successfully, ${userAuthenticatedSuccess.email}',
        );

        // TODO Save user data
        //add(SomeUserEvent());
        emit(AuthSuccessState());
      },
    );
  }

  _forgotPasswordEvent(
    ForgotPasswordEvent event,
    Emitter<AuthState> emit,
  ) async {
    final resp = await _forgotPasswordUsecase(event.email);

    resp.fold(
      (userAuthenticatedFailure) {
        debugPrint('Password was not changed - Try Again!');
        emit(AuthFailureState());
      },
      (passwordChangedSuccess) {
        debugPrint(
          'Password was changed successfully, $passwordChangedSuccess',
        );
        //add(SomeUserEvent());
        //emit();
        emit(RecorveryPasswordState());
      },
    );
  }
}

/*


  _changePasswordEvent(
    ChangePasswordEvent event,
    Emitter<UserState> emit,
  ) async {
    final resp = await _changePasswordUsecase(event.email);

    resp.fold(
      (userAuthenticatedFailure) {
        debugPrint('Password was not changed - Try Again!');
        emit(UserAuthenticateFailureState());
      },
      (passwordChangedSuccess) {
        debugPrint(
          'Password was changed successfully, $passwordChangedSuccess',
        );
        //add(SomeUserEvent());
        //emit();
      },
    );
  }
*/
