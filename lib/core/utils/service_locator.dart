import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:reddit_clone/features/home/data/usecases/fetch_posts_stream_usecase.dart';
import 'package:reddit_clone/features/home/presentation/blocs_cubits/home_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/home/data/repositories/home_repo.dart';
import '../../features/home/data/repositories/home_repo_impl.dart';
import '../common/blocs_cubits/theme/theme_cubit.dart';
import '../services/cache_services/cache_services.dart';
import '../services/cache_services/prefs_consumer.dart';
import '../services/firebase_services/firestore_services.dart';

final getIt = GetIt.instance;

Future<void> initServiceLocator() async {
  // instances
  getIt.registerSingletonAsync(() => SharedPreferences.getInstance());

  //  wait for all instances to be registered
  await getIt.allReady();

  // services
  getIt.registerLazySingleton<CacheServices>(() => PrefsConsumer(getIt()));
  getIt.registerLazySingleton<FirestoreServices>(
      () => FirestoreServices(firestore: FirebaseFirestore.instance));

  // Data sources

  // repositories
  getIt.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(getIt()),
  );

  // use cases
  getIt.registerLazySingleton(() => FetchPostsStreamUseCase(getIt()));
  // getIt.registerLazySingleton(() => AddPostUseCase(getIt()));

  // cubits
  getIt.registerSingleton<ThemeCubit>(ThemeCubit()..getCachedTheme());
  getIt.registerLazySingleton<HomeCubit>(() => HomeCubit()..fetchPostsStream());
}
