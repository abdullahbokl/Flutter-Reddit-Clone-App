import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:reddit_clone/features/home/presentation/blocs_cubits/posts_bloc/posts_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/favourite/data/repositories/favourtie_repo.dart';
import '../../features/favourite/data/repositories/favourtie_repo_impl.dart';
import '../../features/favourite/presentation/blocs_cubits/favourites_cubit.dart';
import '../../features/home/data/repositories/home_repo.dart';
import '../../features/home/data/repositories/home_repo_impl.dart';
import '../common/blocs_cubits/theme/theme_cubit.dart';
import '../services/cache_services/cache_services.dart';
import '../services/cache_services/prefs_consumer.dart';
import '../services/firebase_services/firestore_services.dart';

final getIt = GetIt.instance;

Future<void> initServiceLocator() async {
  // instances
  final prefs = await SharedPreferences.getInstance();

  getIt.registerLazySingleton<SharedPreferences>(() => prefs);

  await getIt.allReady();
  // services
  getIt.registerLazySingleton<CacheServices>(
    () => PrefsConsumer(getIt()),
  );
  getIt.registerLazySingleton<FirestoreServices>(
    () => FirestoreServices(firestore: FirebaseFirestore.instance),
  );

  // Data sources

  // repositories
  getIt.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(getIt()),
  );
  getIt.registerLazySingleton<FavouriteRepo>(
    () => FavouriteRepoImpl(getIt(), getIt()),
  );

  // cubits
  getIt.registerSingleton<ThemeCubit>(ThemeCubit()..getCachedTheme());
  getIt.registerSingleton<PostsBloc>(PostsBloc()..add(FetchPostsEvent()));
  getIt.registerSingleton<FavouritesCubit>(
    FavouritesCubit()..fetchFavourites(),
  );
}
