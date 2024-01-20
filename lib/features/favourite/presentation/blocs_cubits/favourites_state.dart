part of 'favourites_cubit.dart';

class FavouritesState extends Equatable {
  final List<FavouriteModel> favourites;
  final RequestStatusEnum status;
  final String errorMessage;

  const FavouritesState({
    required this.favourites,
    required this.status,
    this.errorMessage = '',
  });

  FavouritesState copyWith({
    List<FavouriteModel>? favourites,
    RequestStatusEnum? status,
    String? errorMessage,
  }) {
    print(favourites?.length);
    print(this.favourites.length);
    return FavouritesState(
      favourites: favourites ?? this.favourites,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        favourites,
        status,
        errorMessage,
      ];
}
