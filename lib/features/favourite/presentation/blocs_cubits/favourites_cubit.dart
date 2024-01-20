import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/enums/enums.dart';
import '../../../../core/utils/service_locator.dart';
import '../../data/models/favourite_model.dart';
import '../../data/repositories/favourtie_repo.dart';

part 'favourites_state.dart';

class FavouritesCubit extends Cubit<FavouritesState> {
  FavouritesCubit()
      : super(const FavouritesState(
          favourites: [],
          status: RequestStatusEnum.loading,
        ));

  List<FavouriteModel> get favourites => state.favourites;

  final FavouriteRepo favouriteRepo = getIt<FavouriteRepo>();

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

  void addFavourite(FavouriteModel post) {
    favouriteRepo.addFavourite(post).then((value) {
      value.fold(
        (l) => emit(state.copyWith(status: RequestStatusEnum.error)),
        (r) => emit(state.copyWith(status: RequestStatusEnum.loaded)),
      );
    });
  }

  void removeFavourite(FavouriteModel post) {
    emit(state.copyWith(status: RequestStatusEnum.loading));
    favouriteRepo.removeFavourite(post).then((value) {
      final List<FavouriteModel> favourites = state.favourites;
      favourites.removeWhere((element) => element.id == post.id);
      value.fold(
        (l) => emit(state.copyWith(status: RequestStatusEnum.error)),
        (r) => emit(state.copyWith(
          status: RequestStatusEnum.loaded,
          favourites: favourites,
        )),
      );
    });
  }
}
