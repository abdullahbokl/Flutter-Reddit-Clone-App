import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../services/cache_services/cache_services.dart';
import '../../../utils/app_strings.dart';
import '../../../utils/service_locator.dart';
import '../../enums/enums.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState(themeMode: ThemeModesEnum.light));

  ThemeModesEnum get themeMode => state.themeMode;

  void getCachedTheme() {
    final CacheServices cacheServices = getIt<CacheServices>();

    final theme = cacheServices.getData(
      key: AppStrings.prefsThemeMode,
    );

    if (theme == ThemeModesEnum.light.toString()) {
      emit(ThemeState(themeMode: ThemeModesEnum.light));
    } else {
      emit(ThemeState(themeMode: ThemeModesEnum.dark));
    }
  }

  Future<void> toggleTheme() async {
    final newTheme = state.themeMode == ThemeModesEnum.light
        ? ThemeModesEnum.dark
        : ThemeModesEnum.light;
    emit(ThemeState(themeMode: newTheme));
    await _cacheTheme(newTheme);
  }

  _cacheTheme(ThemeModesEnum themeMode) async {
    final CacheServices cacheServices = getIt<CacheServices>();

    await cacheServices.saveData(
      key: AppStrings.prefsThemeMode,
      value: themeMode.toString(),
    );
  }
}
