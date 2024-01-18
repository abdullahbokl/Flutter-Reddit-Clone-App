import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/common/blocs_cubits/bloc_observer.dart';
import 'core/common/blocs_cubits/theme/theme_cubit.dart';
import 'core/common/widgets/errors/custom_error_widget.dart';
import 'core/utils/service_locator.dart';
import 'firebase_options.dart';
import 'my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _setupApp();
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
    runApp(CustomErrorWidget(details));
  };
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => getIt<ThemeCubit>()),
    ],
    child: const MyApp(),
  ));
}

Future<void> _setupApp() async {
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initServiceLocator();
}
