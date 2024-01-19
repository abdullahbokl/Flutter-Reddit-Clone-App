import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/common/models/post_model.dart';
import '../models/fetch_posts_request_args.dart';

abstract class HomeRepository {
  Future<Either<FirebaseException, List<PostModel>>> fetchPosts(
    FetchPostsRequestArgs? args,
  );

  Future<Either<FirebaseException, PostModel>> addPost(PostModel post);
}
