import 'package:bottom_nav_bar/persistent-tab-view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/common/blocs_cubits/theme/theme_cubit.dart';
import '../../../../core/common/models/screen_model.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/service_locator.dart';
import '../../../home/presentation/screens/home_screen.dart';
import '../../../settings/presentation/screens/settings_screen.dart';
import '../../../stars/presentation/screens/favorite_screen.dart';

class NavBarScreen extends StatefulWidget {
  const NavBarScreen({super.key});

  @override
  State<NavBarScreen> createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> {
  final PersistentTabController persistentTabController =
      PersistentTabController(initialIndex: 0);
  final List<ScreenModel> screens = [
    ScreenModel(
      title: 'Home',
      screen: const HomeScreen(),
      icon: CupertinoIcons.home,
    ),
    ScreenModel(
      title: 'Favorite',
      screen: const FavoriteScreen(),
      icon: CupertinoIcons.heart_fill,
    ),
    ScreenModel(
      title: 'Settings',
      screen: const SettingsScreen(),
      icon: CupertinoIcons.settings,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = getIt<ThemeCubit>().themeMode;
    return Center(
      child: PersistentTabView(
        context,
        controller: persistentTabController,
        screens: screens.map((e) => e.screen).toList(),
        items: screens.map((e) {
          return _navBarItem(e.title, e.icon);
        }).toList(),
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
  }

  PersistentBottomNavBarItem _navBarItem(
    String title,
    IconData icon,
  ) {
    return PersistentBottomNavBarItem(
      inactiveColorPrimary: Colors.grey.shade600,
      iconSize: 20,
      icon: Icon(icon),
      activeColorPrimary: Colors.redAccent,
      title: title,
    );
  }
}
