import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../common/blocs_cubits/theme/theme_cubit.dart';
import '../services/cache_services.dart';
import '../services/prefs_consumer.dart';

final getIt = GetIt.instance;

Future<void> initServiceLocator() async {
  // instances
  getIt.registerSingletonAsync(() => SharedPreferences.getInstance());

  //  wait for all instances to be registered
  await getIt.allReady();

  // services
  getIt.registerLazySingleton<CacheServices>(() => PrefsConsumer(getIt()));

  // Data sources

  // repositories

  // cubits
  getIt.registerLazySingleton<ThemeCubit>(() => ThemeCubit());
}
