part of 'theme_cubit.dart';

class ThemeState {
  final ThemeModes themeMode;

  ThemeState({
    required this.themeMode,
  });

  ThemeState copyWith({
    ThemeModes? themeMode,
  }) {
    return ThemeState(
      themeMode: themeMode ?? this.themeMode,
    );
  }
}
