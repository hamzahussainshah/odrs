import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../common/app_colors.dart';
import '../common/text_styles.dart';

ThemeData appTheme(BuildContext context) {
  return ThemeData(
    textTheme: TextTheme(
      displayLarge: TextStyles.largeBold, // Large heading
      displayMedium: TextStyles.mediumLarge, // Medium-large heading
      displaySmall: TextStyles.medium, // Medium heading
      bodyLarge: TextStyles.regular, // Primary body text
      bodyMedium: TextStyles.small, // Secondary body text
      bodySmall: TextStyles.extraSmall, // Smallest text
      titleMedium: TextStyles.smallLight,
      labelMedium: TextStyles.smallVeryLight,
      titleSmall: TextStyles.small,
      // Title text
    ),
    brightness: Brightness.light,
    primaryColor: AppColors.blueDark,
    scaffoldBackgroundColor: AppColors.white,
    checkboxTheme: CheckboxThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
    ),
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.blueDark,
      onPrimary: AppColors.white,
      secondary: AppColors.blue,
      onSecondary: AppColors.white,
      error: Colors.red,
      onError: AppColors.white,
      surface: AppColors.white,
      onSurface: AppColors.textColor,
      outline: AppColors.gray300,
      shadow: AppColors.gray200,
      surfaceContainerHighest: AppColors.gray100,
      onSurfaceVariant: AppColors.black,

    ),
  );
}


// Dark Theme
ThemeData appDarkTheme(BuildContext context) {
  return ThemeData(
    textTheme: TextTheme(
      displayLarge: TextStyles.largeBold.copyWith(color: Colors.white),
      displayMedium: TextStyles.mediumLarge.copyWith(color: Colors.white),
      displaySmall: TextStyles.medium.copyWith(color: Colors.white),
      bodyLarge: TextStyles.regular.copyWith(color: Colors.white70),
      bodyMedium: TextStyles.small.copyWith(color: Colors.white60),
      bodySmall: TextStyles.extraSmall.copyWith(color: Colors.white54),
      titleMedium: TextStyles.smallLight.copyWith(color: Colors.white70),
      labelMedium: TextStyles.smallVeryLight.copyWith(color: Colors.white54),
      titleSmall: TextStyles.small.copyWith(color: Colors.white60),
    ),
    brightness: Brightness.dark,
    primaryColor: AppColors.blue,
    scaffoldBackgroundColor: const Color(0xFF121212),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1E1E1E),
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    checkboxTheme: CheckboxThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
    ),
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.blue,
      onPrimary: Colors.black,
      secondary: AppColors.blue,
      onSecondary: Colors.black,
      error: Colors.redAccent,
      onError: Colors.black,
      surface: Color(0xFF1E1E1E),
      onSurface: Colors.white,
      outline: Color(0xFF484848),
      shadow: Color(0xFF000000),
      surfaceContainerHighest: Color(0xFF2A2A2A),
      onSurfaceVariant: Color(0xFFB0B0B0),
    ),
  );
}
