import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reddit_clone/core/utils/service_locator.dart';
import 'package:reddit_clone/features/nav_bar/data/repositories/favourtie_repo.dart';

import '../../../../core/common/enums/enums.dart';
import '../../data/models/favourite_model.dart';

part 'favourites_state.dart';

class FavouritesCubit extends Cubit<FavouritesState> {
  FavouritesCubit()
      : super(const FavouritesState(
          favourites: [],
          status: RequestStatusEnum.loading,
        ));

  List<FavouriteModel> get favourites => state.favourites;

  final FavouriteRepo favouriteRepo = getIt<FavouriteRepo>();

  void addFavourite(FavouriteModel post) {
    favouriteRepo.addFavourite(post).then((value) {
      value.fold(
        (l) => emit(state.copyWith(status: RequestStatusEnum.error)),
        (r) => emit(state.copyWith(status: RequestStatusEnum.loaded)),
      );
    });
  }

  void removeFavourite(FavouriteModel post) {
    favouriteRepo.removeFavourite(post).then((value) {
      state.favourites.removeWhere((element) => element.id == post.id);
      value.fold(
        (l) => emit(state.copyWith(status: RequestStatusEnum.error)),
        (r) => emit(state.copyWith(status: RequestStatusEnum.loaded)),
      );
    });
  }

  void fetchFavourites() {
    favouriteRepo.fetchFavourites().then((value) {
      value.fold(
        (l) => emit(state.copyWith(status: RequestStatusEnum.error)),
        (r) => emit(state.copyWith(
          favourites: r,
          status: RequestStatusEnum.loaded,
        )),
      );
    });
  }
}
