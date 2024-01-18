part of 'nav_bar_cubit.dart';

@immutable
abstract class NavBarState {}

class NavBarInitial extends NavBarState {}

class NavBarIndex extends NavBarState {
  final int index;

  NavBarIndex({required this.index});
}
