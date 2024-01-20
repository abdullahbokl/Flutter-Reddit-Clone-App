import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/common/models/post_model.dart';
import '../../../../core/errors/cache_exceptions.dart';
import '../../../../core/services/cache_services/cache_services.dart';
import '../../../../core/services/firebase_services/firestore_services.dart';
import '../../../../core/utils/app_strings.dart';
import '../models/favourite_model.dart';
import 'favourtie_repo.dart';

class FavouriteRepoImpl implements FavouriteRepo {
  final CacheServices cacheServices;
  final FirestoreServices firestoreServices;

  FavouriteRepoImpl(
    this.cacheServices,
    this.firestoreServices,
  );

  @override
  Future<Either<CacheExceptions, void>> addFavourite(
    FavouriteModel post,
  ) async {
    try {
      final List<FavouriteModel> favourites = _fetchCachedFavourites();
      // add to cache
      favourites.add(post);
      await cacheServices.saveData(
        key: AppStrings.prefsFavourite,
        value: favourites.map((e) => e.toMap()).toList(),
      );
      // add to firestore
      await firestoreServices.saveData(
        collectionName: AppStrings.firebasePostsCollection,
        docId: post.id,
        data: post.toMap(),
      );

      return right(null);
    } on CacheExceptions catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<CacheExceptions, void>> removeFavourite(
    FavouriteModel post,
  ) async {
    try {
      final List<FavouriteModel> favourites = _fetchCachedFavourites();
      // remove from cache
      favourites.removeWhere((element) => element.id == post.id);
      await _cacheFavourites(favourites);
      // remove from firestore
      await firestoreServices.deleteData(
        collectionName: AppStrings.firebasePostsCollection,
        docId: post.id,
      );

      return right(null);
    } on CacheExceptions catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<CacheExceptions, List<FavouriteModel>>>
      fetchFavourites() async {
    try {
      List<FavouriteModel> favourites = _fetchCachedFavourites();
      if (favourites.isEmpty) {
        favourites = await _fetchDataFromFirestore();
        // cache as a json
        await _cacheFavourites(favourites);
      }

      return right(favourites);
    } on CacheExceptions catch (e) {
      debugPrint(e.toString());
      return left(e);
    }
  }

  List<FavouriteModel> _fetchCachedFavourites() {
    try {
      final List? favourites =
          cacheServices.getData(key: AppStrings.prefsFavourite);
      if (favourites == null || favourites.isEmpty) {
        return [];
      }
      // json decode
      final List<dynamic> json = favourites.map((e) => jsonDecode(e)).toList();

      if (json.isEmpty) {
        return [];
      }

      final List<FavouriteModel> allFavourites =
          json.map((e) => FavouriteModel.fromMap(e)).toList();

      return allFavourites;
    } on CacheExceptions catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

  Future<List<FavouriteModel>> _fetchDataFromFirestore() async {
    try {
      final List<PostModel> allFavourites =
          await _getAllFavouritesFromFirestore();

      final List<FavouriteModel> favourites =
          _convertToFavouriteModel(allFavourites);

      await _cacheFavourites(favourites);

      return favourites;
    } catch (e) {
      return [];
    }
  }

  _cacheFavourites(List<FavouriteModel> favourites) async {
    final List<String> json =
        favourites.map((e) => jsonEncode(e.toMap())).toList();
    await cacheServices.saveData(
      key: AppStrings.prefsFavourite,
      value: json,
    );
  }

  List<FavouriteModel> _convertToFavouriteModel(List<PostModel> favourites) {
    final data = favourites
        .map((e) => FavouriteModel(
              id: e.id,
              title: e.title,
              image: e.link ?? '',
              description: e.description ?? '',
            ))
        .toList();
    return data;
  }

  Future<List<PostModel>> _getAllFavouritesFromFirestore() async {
    final posts = await FirebaseFirestore.instance
        .collection(AppStrings.firebasePostsCollection)
        .where('isFavourite', isEqualTo: true)
        .get();

    final allFavourites =
        posts.docs.map((e) => PostModel.fromMap(e.data())).toList();
    return allFavourites;
  }
}
