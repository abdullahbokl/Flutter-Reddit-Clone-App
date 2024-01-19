import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/common/models/post_model.dart';
import '../../../../core/services/firebase_services/firestore_services.dart';
import '../../../../core/utils/app_strings.dart';
import '../models/fetch_posts_request_args.dart';
import 'home_repo.dart';

class HomeRepositoryImpl implements HomeRepository {
  final FirestoreServices firestoreServices;

  HomeRepositoryImpl(this.firestoreServices);

  @override
  Future<Either<FirebaseException, List<PostModel>>> fetchPosts(
    FetchPostsRequestArgs? args,
  ) async {
    try {
      final QuerySnapshot<Object?> res = await firestoreServices.getData(
        collectionName: AppStrings.firebasePostsCollection,
        docId: args?.lastPostId,
        limit: args?.limit,
        orderBy: args?.orderBy,
        descending: args?.descending,
      );

      final List<PostModel> posts = res.docs
          .map(
            (e) => PostModel.fromMap(
              e.data() as Map<String, dynamic>,
            ),
          )
          .toList();

      return right(posts);
    } on FirebaseException catch (e) {
      return left(e);
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
