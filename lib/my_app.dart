import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/common/blocs_cubits/theme/theme_cubit.dart';
import 'core/common/widgets/adaptive_layout_widget.dart';
import 'core/common/widgets/errors/no_internet_widget.dart';
import 'core/utils/app_theme.dart';
import 'features/nav_bar/presentation/screens/nav_bar_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return ConnectivityAppWrapper(
          app: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getTheme(),
            title: 'Flutter Demo',
            home: Scaffold(
              body: ConnectivityWidgetWrapper(
                disableInteraction: true,
                offlineWidget: const NoInternetWidget(),
                child: AdaptiveLayout(
                  desktopLayout: (context) => const NavBarScreen(),
                  mobileLayout: (context) => const NavBarScreen(),
                  tabletLayout: (context) => const NavBarScreen(),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
