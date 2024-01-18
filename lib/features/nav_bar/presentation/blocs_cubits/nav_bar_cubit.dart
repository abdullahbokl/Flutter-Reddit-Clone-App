import 'package:bottom_nav_bar/persistent-tab-view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/models/screen_model.dart';
import '../../../home/presentation/screens/home_screen.dart';
import '../../../settings/presentation/screens/settings_screen.dart';
import '../../../stars/presentation/screens/favorite_screen.dart';

part 'nav_bar_state.dart';

class NavBarCubit extends Cubit<NavBarState> {
  NavBarCubit() : super(NavBarInitial());

  final persistentTabController = PersistentTabController(initialIndex: 0);

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

  final List<Widget> nabBarScreens = [
    const HomeScreen(),
    const FavoriteScreen(),
    const SettingsScreen(),
  ];
  final List<PersistentBottomNavBarItem> navBarsItems = [
    PersistentBottomNavBarItem(
      inactiveColorPrimary: Colors.grey.shade600,
      iconSize: 20,
      icon: const Icon(
        CupertinoIcons.home,
      ),
      activeColorPrimary: Colors.redAccent,
      title: ("Home"),
    ),
    PersistentBottomNavBarItem(
      inactiveColorPrimary: Colors.grey.shade600,
      icon: const Icon(
        CupertinoIcons.heart_fill,
      ),
      iconSize: 20,
      activeColorPrimary: Colors.redAccent,
      title: ("Favorite"),
    ),
    PersistentBottomNavBarItem(
      inactiveColorPrimary: Colors.grey.shade600,
      icon: const Icon(
        CupertinoIcons.settings,
      ),
      iconSize: 20,
      activeColorPrimary: Colors.redAccent,
      title: ("Settings"),
    ),
  ];

  void changeIndex(int index) {
    emit(NavBarIndex(index: index));
  }
}
