import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/common/blocs_cubits/bloc_observer.dart';
import 'core/common/blocs_cubits/theme/theme_cubit.dart';
import 'core/common/enums/enums.dart';
import 'core/utils/service_locator.dart';
import 'firebase_options.dart';
import 'my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _setupApp();

  runApp(
    EasyLocalization(
      supportedLocales:
          LocalEnum.values.asNameMap().keys.map((e) => Locale(e)).toList(),
      path: 'assets/translations',
      fallbackLocale: Locale(LocalEnum.en.toString()),
      saveLocale: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => getIt<ThemeCubit>()),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

Future<void> _setupApp() async {
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await EasyLocalization.ensureInitialized();
  await initServiceLocator();
//   remove first 40 doc from AppStrings.firebasePostsCollection from firestore
//   await FirebaseFirestore.instance
//       .collection(AppStrings.firebasePostsCollection)
//       .get()
//       .then((value) {
//     for (var i = 0; i < 40; i++) {
//       value.docs[i].reference.delete();
//     }
//   });
}
