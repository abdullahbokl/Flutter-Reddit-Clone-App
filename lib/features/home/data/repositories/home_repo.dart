import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/common/models/post_model.dart';
import '../models/fetch_posts_request_args.dart';

abstract class HomeRepository {
  final _controller = StreamController<List<PostModel>>.broadcast();

  Stream<List<PostModel>> get posts => _controller.stream.asBroadcastStream();

  @protected
  void addPostsToStream(List<PostModel> posts) => _controller.sink.add(posts);

  @protected
  void addErrorToStream(FirebaseException error) =>
      _controller.sink.addError(error);

  void dispose() => _controller.close();

  Future<void> fetchPosts(
    FetchPostsRequestArgs? args,
  );

  Future<void> addPost(PostModel post);
}
