part of 'theme_cubit.dart';

class ThemeState {
  final ThemeModesEnum themeMode;

  ThemeState({
    required this.themeMode,
  });

  ThemeState copyWith({
    ThemeModesEnum? themeMode,
  }) {
    return ThemeState(
      themeMode: themeMode ?? this.themeMode,
    );
  }
}
