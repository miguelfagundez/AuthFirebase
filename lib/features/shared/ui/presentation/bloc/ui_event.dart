part of 'ui_bloc.dart';

@immutable
abstract class UiEvent {}

class InitialUiEvent extends UiEvent {
  InitialUiEvent();
}

class UserAuthenticatedEvent extends UiEvent {
  UserAuthenticatedEvent();
}

class UserLogoutEvent extends UiEvent {
  UserLogoutEvent();
}
