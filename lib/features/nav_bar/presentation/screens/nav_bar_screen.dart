import 'package:bottom_nav_bar/persistent-tab-view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/blocs_cubits/theme/theme_cubit.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/service_locator.dart';
import '../blocs_cubits/nav_bar_cubit.dart';

class NavBarScreen extends StatelessWidget {
  const NavBarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NavBarCubit navBarCubit = getIt();
    return BlocProvider(
      create: (context) => navBarCubit,
      child: BlocBuilder<NavBarCubit, NavBarState>(
        builder: (context, state) {
          final theme = getIt<ThemeCubit>().themeMode;
          return Center(
            child: PersistentTabView(
              context,
              controller: navBarCubit.persistentTabController,
              screens: navBarCubit.nabBarScreens,
              items: navBarCubit.navBarsItems,
              confineInSafeArea: true,
              handleAndroidBackButtonPress: true,
              resizeToAvoidBottomInset: true,
              hideNavigationBarWhenKeyboardShows: true,
              popAllScreensOnTapOfSelectedTab: true,
              backgroundColor: theme.name == ThemeMode.light.toString()
                  ? AppColors.lightPrimaryColor
                  : AppColors.darkPrimaryColor,
              navBarStyle: NavBarStyle.style6,
              margin: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              decoration: NavBarDecoration(
                borderRadius: BorderRadius.circular(10.0),
                colorBehindNavBar: AppColors.transparent,
              ),
              selectedTabScreenContext: (context) {},
              screenTransitionAnimation: const ScreenTransitionAnimation(
                animateTabTransition: true,
                curve: Curves.ease,
                duration: Duration(milliseconds: 200),
              ),
            ),
          );
        },
      ),
    );
  }
}
