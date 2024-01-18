import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../services/cache_services.dart';
import '../../../utils/app_strings.dart';
import '../../../utils/service_locator.dart';
import '../../enums/enums.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState(themeMode: ThemeModes.light));

  ThemeModes get themeMode => state.themeMode;

  Future<void> getCachedTheme() async {
    final CacheServices cacheServices = getIt<CacheServices>();

    final theme = await cacheServices.getData(
      key: AppStrings.prefsThemeMode,
    );

    if (theme == ThemeModes.light.toString()) {
      emit(ThemeState(themeMode: ThemeModes.light));
    } else {
      emit(ThemeState(themeMode: ThemeModes.dark));
    }
  }

  Future<void> toggleTheme() async {
    final newTheme = state.themeMode == ThemeModes.light
        ? ThemeModes.dark
        : ThemeModes.light;
    emit(ThemeState(themeMode: newTheme));
    await _cacheTheme(newTheme);
  }

  _cacheTheme(ThemeModes themeMode) async {
    final CacheServices cacheServices = getIt<CacheServices>();

    await cacheServices.saveData(
      key: AppStrings.prefsThemeMode,
      value: themeMode.toString(),
    );
  }
}
