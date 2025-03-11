import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_example/features/shared/ui/domain/usecases/logout_usecase.dart';

part 'ui_event.dart';
part 'ui_state.dart';

class UiBloc extends Bloc<UiEvent, UiState> {
  final LogoutUserUsecase _logoutUserUsecase;

  UiBloc(this._logoutUserUsecase) : super(UiInitialState()) {
    on<UserLogoutEvent>(_logoutUserEvent);
    on<UserAuthenticatedEvent>(_userAuthenticatedEvent);
  }

  _logoutUserEvent(UserLogoutEvent event, Emitter<UiState> emit) async {
    final resp = await _logoutUserUsecase();

    resp.fold(
      (userAuthenticatedFailure) {
        debugPrint('User was not Logout - Try Again!');
        emit(UserLogoutFailureState());
      },
      (userAuthenticatedSuccess) {
        debugPrint('User was Logout successfully');
        emit(UserLogoutSuccessState());
      },
    );
  }

  _userAuthenticatedEvent(
    UserAuthenticatedEvent event,
    Emitter<UiState> emit,
  ) async {
    // emit(UserAuthenticatedState());
  }
}
