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
  );
}