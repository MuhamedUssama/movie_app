import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract class AppTheme {
  static ThemeData _getTheme({required ColorScheme colorScheme}) {
    return ThemeData(scaffoldBackgroundColor: colorScheme.surface);
  }

  static ThemeData getDarkThemeData() {
    return _getTheme(
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: AppColors.yellow,
        onPrimary: AppColors.dark,
        secondary: AppColors.grey,
        onSecondary: AppColors.white,
        error: AppColors.red,
        onError: AppColors.white,
        surface: AppColors.dark,
        onSurface: AppColors.white,
      ),
    );
  }
}
