import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/common/models/post_model.dart';
import '../../../../core/services/firebase_services/firestore_services.dart';
import '../../../../core/utils/app_strings.dart';
import '../models/fetch_posts_request_args.dart';
import 'home_repo.dart';

class HomeRepositoryImpl extends HomeRepository {
  final FirestoreServices firestoreServices;

  HomeRepositoryImpl(this.firestoreServices);

  List<PostModel> _posts = [];

  @override
  Future<void> fetchPosts(
    FetchPostsRequestArgs? args,
  ) async {
    try {
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

      addPostToStream(_posts);
    } on FirebaseException catch (e) {
      addErrorToStream(e);
    }
  }

  @override
  Future<Either<FirebaseException, PostModel>> addPost(PostModel post) async {
    try {
      final res = await firestoreServices.saveData(
        collectionName: AppStrings.firebasePostsCollection,
        docId: post.id,
        data: post.toMap(),
      );
      return right(res);
    } on FirebaseException catch (e) {
      return left(e);
    }
  }
}
