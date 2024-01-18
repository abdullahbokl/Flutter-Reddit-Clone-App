import 'package:flutter/material.dart';

import '../common/blocs_cubits/theme/theme_cubit.dart';
import '../common/enums/enums.dart';
import 'service_locator.dart';

abstract class AppColors {
  // light theme colors
  static const Color lightPrimaryColor = Color(0xFFE5E5E5);
  static const Color lightPrimaryVariantColor = Color(0xFFBDBDBD);
  static const Color lightSecondaryColor = Color(0xFFE5E5E5);
  static const Color lightOnPrimaryColor = Color(0xFF000000);
  static const Color lightOnSecondaryColor = Color(0xFF000000);
  static const Color lightBackgroundColor = Color(0xFFFFFFFF);

  // dark theme colors
  static const Color darkPrimaryColor = Color(0xFF121212);
  static const Color darkPrimaryVariantColor = Color(0xFF1E1E1E);
  static const Color darkSecondaryColor = Color(0xFF121212);
  static const Color darkOnPrimaryColor = Color(0xFFFFFFFF);
  static const Color darkOnSecondaryColor = Color(0xFFFFFFFF);
  static const Color darkBackgroundColor = Color(0xFF000000);

  // common colors
  static const Color errorColor = Color(0xFFCF6679);
  static const Color successColor = Color(0xFF4CAF50);
  static const Color warningColor = Color(0xFFFF9800);
  static const Color infoColor = Color(0xFF2196F3);
  static const Color onPrimaryColor = Color(0xFFFFFFFF);
  static const Color onSecondaryColor = Color(0xFF000000);
  static const Color onBackgroundColor = Color(0xFF000000);
  static const Color surfaceColor = Color(0xFFFFFFFF);
  static const Color onSurfaceColor = Color(0xFF000000);
  static const Color primaryColor = Color(0xFFE5E5E5);
  static const Color primaryVariantColor = Color(0xFFBDBDBD);

  // other colors
  static const Color transparent = Color(0x00000000);
}

abstract class AppTheme {
  static getTheme() {
    final ThemeModes theme = getIt<ThemeCubit>().themeMode;
    if (theme.name == ThemeModes.light.name) {
      return lightTheme;
    }
    return darkTheme;
  }

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      primary: AppColors.lightPrimaryColor,
      secondary: AppColors.lightSecondaryColor,
      background: AppColors.lightBackgroundColor,
      surface: AppColors.surfaceColor,
      onPrimary: AppColors.onPrimaryColor,
      onSecondary: AppColors.onSecondaryColor,
      onBackground: AppColors.onBackgroundColor,
      onSurface: AppColors.onSurfaceColor,
      brightness: Brightness.light,
    ),
    appBarTheme: const AppBarTheme(
      color: AppColors.lightPrimaryColor,
      iconTheme: IconThemeData(color: AppColors.lightOnPrimaryColor),
      foregroundColor: AppColors.lightOnPrimaryColor,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.lightPrimaryColor,
      selectedItemColor: AppColors.lightOnPrimaryColor,
      unselectedItemColor: AppColors.lightPrimaryVariantColor,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.darkPrimaryColor,
      secondary: AppColors.darkSecondaryColor,
      background: AppColors.darkBackgroundColor,
      surface: AppColors.surfaceColor,
      onPrimary: AppColors.onPrimaryColor,
      onSecondary: AppColors.onSecondaryColor,
      onBackground: AppColors.onBackgroundColor,
      onSurface: AppColors.onSurfaceColor,
    ),
    appBarTheme: const AppBarTheme(
      color: AppColors.darkPrimaryColor,
      iconTheme: IconThemeData(color: AppColors.darkOnPrimaryColor),
      foregroundColor: AppColors.darkOnPrimaryColor,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.darkPrimaryColor,
      selectedItemColor: AppColors.darkOnPrimaryColor,
      unselectedItemColor: AppColors.darkPrimaryVariantColor,
    ),
  );
}
