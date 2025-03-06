import 'package:flutter/material.dart';
import 'package:flutter_firebase_example/core/theme/app_colors.dart';

class AppTheme {
  // Dark Mode
  static final darkThemeMode = ThemeData.dark(
    useMaterial3: true,
  ).copyWith(scaffoldBackgroundColor: AppColors.backgroundScaffoldDarkColor);

  // Light Mode
  static final lightThemeMode = ThemeData.light(
    useMaterial3: true,
  ).copyWith(scaffoldBackgroundColor: AppColors.backgroundScaffoldLightColor);
}
