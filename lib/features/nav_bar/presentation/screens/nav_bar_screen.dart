import 'package:bottom_nav_bar/persistent-tab-view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/common/models/screen_model.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_dimensions.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/locale_keys.g.dart';
import '../../../favourite/presentation/screens/favorite_screen.dart';
import '../../../home/presentation/screens/home_screen.dart';
import '../../../settings/presentation/screens/settings_screen.dart';

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
      title: LocaleKeys.home,
      screen: const HomeScreen(),
      icon: CupertinoIcons.home,
    ),
    ScreenModel(
      title: LocaleKeys.favorites,
      screen: const FavoriteScreen(),
      icon: CupertinoIcons.heart_fill,
    ),
    ScreenModel(
      title: LocaleKeys.settings,
      screen: const SettingsScreen(),
      icon: CupertinoIcons.settings,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: PersistentTabView(
        context,
        controller: persistentTabController,
        screens: screens.map((e) => e.screen).toList(),
        items: screens.map((e) {
          return _navBarItem(e.title, e.icon);
        }).toList(),
        navBarHeight: 58,
        confineInSafeArea: true,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        hideNavigationBarWhenKeyboardShows: true,
        popAllScreensOnTapOfSelectedTab: true,
        backgroundColor:
            Theme.of(context).bottomNavigationBarTheme.backgroundColor!,
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
      iconSize: AppDimensions.getResponsiveIconSize(context, iconSize: 26),
      icon: Icon(icon),
      activeColorPrimary: Colors.redAccent,
      title: title.tr(context: context),
      textStyle: AppStyles.font16SatoshiBold(context),
    );
  }
}
