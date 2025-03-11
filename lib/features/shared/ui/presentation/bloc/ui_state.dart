part of 'ui_bloc.dart';

@immutable
abstract class UiState {
  // Checking this data - build a structure
  final bool isUserAuthenticated;
  final bool? isDarkMode;
  const UiState({required this.isUserAuthenticated, this.isDarkMode});
}

class UiInitialState extends UiState {
  const UiInitialState() : super(isUserAuthenticated: true);
}

// class UserAuthenticatedState extends UiState {
//   const UserAuthenticatedState() : super(isUserAuthenticated: true);
// }

class UserLogoutSuccessState extends UiState {
  const UserLogoutSuccessState() : super(isUserAuthenticated: false);
}

class UserLogoutFailureState extends UiState {
  const UserLogoutFailureState() : super(isUserAuthenticated: true);
}

class UiChangeAppDarkModeState extends UiState {
  final bool changeDarkMode;
  const UiChangeAppDarkModeState({required this.changeDarkMode})
    : super(isUserAuthenticated: true, isDarkMode: changeDarkMode);
}
