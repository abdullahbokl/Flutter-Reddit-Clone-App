import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/common/models/post_model.dart';
import '../../../../core/services/firebase_services/firestore_services.dart';
import '../../../../core/utils/app_strings.dart';
import 'home_repo.dart';

class HomeRepositoryImpl implements HomeRepository {
  final FirestoreServices firestoreServices;

  HomeRepositoryImpl(this.firestoreServices);

  @override
  Future<List<PostModel>> fetchPostsStream({
    String? lastPostId,
    int? limit,
    String? orderBy,
    bool? descending,
    int? skip,
  }) async {
    try {
      final QuerySnapshot<Object?> res = await firestoreServices.getData(
        collectionName: AppStrings.firebasePostsCollection,
        docId: lastPostId,
        limit: limit,
        orderBy: orderBy,
        descending: descending,
      );

      final List<PostModel> posts = res.docs
          .map(
            (e) => PostModel.fromMap(
              e.data() as Map<String, dynamic>,
            ),
          )
          .toList();

      return posts;
    } on FirebaseException catch (_) {
      rethrow;
    }
  }
}
