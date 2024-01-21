import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/common/models/post_model.dart';
import '../models/fetch_posts_request_args.dart';

abstract class HomeRepository {
  // multi posts
  final _multiPostsController = StreamController<List<PostModel>>.broadcast();

  Stream<List<PostModel>> get multiPosts => _multiPostsController.stream;

  @protected
  void addMultiPostsToStream(List<PostModel> posts) =>
      _multiPostsController.sink.add(posts);

  @protected
  void addErrorToMultiStream(FirebaseException error) =>
      _multiPostsController.sink.addError(error);

  void dispose() => _multiPostsController.close();

  // single post
  final _singlePostController = StreamController<PostModel>.broadcast();

  Stream<PostModel> get singlePost => _singlePostController.stream;

  @protected
  void addSinglePostToStream(PostModel post) =>
      _singlePostController.sink.add(post);

  @protected
  void addErrorToSingleStream(FirebaseException error) =>
      _singlePostController.sink.addError(error);

  void disposePost() => _singlePostController.close();

  Future<void> fetchPosts(
    FetchPostsRequestArgs? args,
  );

  Future<void> addPost(PostModel post);
}
