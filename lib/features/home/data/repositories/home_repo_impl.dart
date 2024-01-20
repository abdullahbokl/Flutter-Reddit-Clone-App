import 'package:cloud_firestore/cloud_firestore.dart';

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

  List<PostModel> _posts = [];

  @override
  Future<void> fetchPosts(
    FetchPostsRequestArgs? args,
  ) async {
    try {
      /*cached data*/
      // final List<dynamic> cachedData = await cacheServices.getData(
      //   key: AppStrings.prefsFavourite,
      // );
      // final decodedData = cachedData.map((e) {
      //   return jsonDecode(e);
      // }).toList();
      //
      // final List<PostModel> cachedPosts = decodedData
      //     .map(
      //       (e) => PostModel.fromMap(
      //         e as Map<String, dynamic>,
      //       ),
      //     )
      //     .toList();

      final QuerySnapshot<Object?> res = await firestoreServices.getData(
        collectionName: AppStrings.firebasePostsCollection,
        lastDocId: args?.lastPostId,
        limit: args?.limit,
        orderBy: args?.orderBy,
        descending: args?.descending,
      );

      _posts = res.docs
          .map(
            (e) => PostModel.fromMap(
              e.data() as Map<String, dynamic>,
            ),
          )
          .toList();

      addPostsToStream(_posts);
    } on FirebaseException catch (e) {
      addErrorToStream(e);
    }
  }

  @override
  Future<void> addPost(PostModel post) async {
    _posts.add(post);
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

      addPostsToStream(_posts);
    } on FirebaseException catch (e) {
      addErrorToStream(e);
    }
  }
}
