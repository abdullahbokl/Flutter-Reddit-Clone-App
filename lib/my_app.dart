import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/common/blocs_cubits/theme/theme_cubit.dart';
import 'core/common/widgets/adaptive_layout_widget.dart';
import 'core/config/app_theme.dart';
import 'core/config/size_config.dart';
import 'features/nav_bar/presentation/screens/nav_bar_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        // generateList();
        return ConnectivityAppWrapper(
          app: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Reddit Clone',
            theme: AppTheme.getTheme(),
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            home: Scaffold(
              body: ConnectivityWidgetWrapper(
                disableInteraction: false,
                // offlineWidget: const NoInternetWidget(),
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
