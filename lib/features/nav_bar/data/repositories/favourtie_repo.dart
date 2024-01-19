import 'package:dartz/dartz.dart';

import '../../../../core/errors/cache_exceptions.dart';
import '../models/favourite_model.dart';

abstract class FavouriteRepo {
  Future<Either<CacheExceptions, List<FavouriteModel>>> fetchFavourites();

  Future<Either<CacheExceptions, void>> addFavourite(FavouriteModel post);

  Future<Either<CacheExceptions, void>> removeFavourite(FavouriteModel post);
}
