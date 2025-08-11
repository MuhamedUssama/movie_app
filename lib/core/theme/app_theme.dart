import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

abstract class AppTheme {
  static ThemeData _getTheme({required ColorScheme colorScheme}) {
    return ThemeData(
      scaffoldBackgroundColor: colorScheme.surface,

      textTheme: TextTheme(
        bodyLarge: GoogleFonts.inter(
          color: colorScheme.onSurface,
          fontSize: 36.sp,
          fontWeight: FontWeight.w500,
        ),
        bodyMedium: GoogleFonts.inter(
          color: colorScheme.onSurface,
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          minimumSize: Size(double.infinity, 56.h),
          textStyle: GoogleFonts.inter(
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
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
