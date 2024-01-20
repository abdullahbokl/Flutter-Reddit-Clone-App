import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:reddit_clone/core/utils/service_locator.dart';

import '../../../../core/common/models/post_model.dart';
import '../../../../core/services/cache_services/cache_services.dart';
import '../../../../core/services/firebase_services/firestore_services.dart';
import '../../../../core/utils/app_strings.dart';
import '../models/fetch_posts_request_args.dart';
import 'home_repo.dart';

class HomeRepositoryImpl extends HomeRepository {
  final FirestoreServices firestoreServices;
  final CacheServices cacheServices;

  HomeRepositoryImpl(this.firestoreServices, this.cacheServices);

  @override
  Future<void> fetchPosts(
    FetchPostsRequestArgs? args,
  ) async {
    List<PostModel> newPosts = [];
    try {
      if (getIt<ConnectivityResult>() == ConnectivityResult.none) {
        newPosts = await _fetchCachedData();
      } else {
        newPosts = await _fetchDataFromFirestore(args);
        _cachePosts(newPosts);
      }
      addPostsToStream(newPosts);
    } on FirebaseException catch (e) {
      addErrorToStream(e);
    } catch (e) {
      addErrorToStream(FirebaseException(plugin: '', message: e.toString()));
    }
  }

  Future<List<PostModel>> _fetchDataFromFirestore(
      FetchPostsRequestArgs? args) async {
    List<PostModel> newPosts = [];
    final QuerySnapshot<Object?> res = await firestoreServices.getData(
      collectionName: AppStrings.firebasePostsCollection,
      lastDocId: args?.lastPostId,
      limit: args?.limit,
      orderBy: args?.orderBy,
      descending: args?.descending,
    );

    newPosts = res.docs
        .map(
          (e) => PostModel.fromMap(
            e.data() as Map<String, dynamic>,
          ),
        )
        .toList();
    return newPosts;
  }

  Future<List<PostModel>> _fetchCachedData() async {
    List<PostModel> newPosts = [];
    final List<dynamic> cachedData = await cacheServices.getData(
      key: AppStrings.prefsFavourite,
    );
    final decodedData = cachedData.map((e) {
      return jsonDecode(e);
    }).toList();

    newPosts = decodedData
        .map(
          (e) => PostModel.fromMap(
            e as Map<String, dynamic>,
          ),
        )
        .toList();
    return newPosts;
  }

  Future<void> _cachePosts(List<PostModel> newPosts) async {
    final List<PostModel> oldData = await _fetchCachedData();
    final List<PostModel> allPosts = [...newPosts, ...oldData];
    // cache only 20 posts
    if (allPosts.length > 20) {
      allPosts.removeRange(20, allPosts.length);
    }

    final List<Map<String, dynamic>> listOfMaps =
        allPosts.map((e) => e.toMap()).toList();
    final List<String> list = listOfMaps.map((e) => jsonEncode(e)).toList();

    await cacheServices.saveData(
      key: AppStrings.prefsFavourite,
      value: list,
    );
  }

  @override
  Future<void> addPost(PostModel post) async {
    try {
      // await firestoreServices.saveData(
      //   collectionName: AppStrings.firebasePostsCollection,
      //   docId: post.id,
      //   data: post.toMap(),
      // );

      // final listOfMaps = _posts.map((e) => e.toMap()).toList();
      // final List<String> list = listOfMaps.map((e) => jsonEncode(e)).toList();
      //
      // try {
      //   // cache
      //   await Future.wait(
      //     [
      //       cacheServices.saveData(
      //         key: AppStrings.prefsFavourite,
      //         value: list,
      //       ),
      //       // save to firestore
      //       firestoreServices.saveData(
      //         collectionName: AppStrings.firebasePostsCollection,
      //         docId: post.id,
      //         data: post.toMap(),
      //       ),
      //     ],
      //   );

      addPostsToStream([post]);
    } on FirebaseException catch (e) {
      addErrorToStream(e);
    }
  }
}
