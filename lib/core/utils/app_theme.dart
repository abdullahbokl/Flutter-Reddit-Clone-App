import 'package:flutter/material.dart';

import '../common/blocs_cubits/theme/theme_cubit.dart';
import '../common/enums/enums.dart';
import 'app_colors.dart';
import 'service_locator.dart';

abstract class AppTheme {
  static getTheme() {
    final ThemeModesEnum theme = getIt<ThemeCubit>().themeMode;
    if (theme.name == ThemeModesEnum.light.name) {
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
