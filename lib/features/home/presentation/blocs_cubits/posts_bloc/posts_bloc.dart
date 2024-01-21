import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/enums/enums.dart';
import '../../../../../core/common/models/post_model.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/service_locator.dart';
import '../../../data/models/fetch_posts_request_args.dart';
import '../../../data/repositories/home_repo.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final HomeRepository _homeRepository;

  PostsBloc()
      : _homeRepository = getIt<HomeRepository>(),
        super(const PostsState(
          posts: [],
          status: RequestStatusEnum.initial,
          isMax: false,
          errorMessage: null,
        )) {
    _handleListeners();
    on<FetchPostsEvent>(_onFetchPostsEvent, transformer: droppable());
    on<AddPostEvent>(_onAddPostEvent, transformer: sequential());
  }

  /* bloc listeners */
  void _handleListeners() {
    _homeRepository.multiPosts.listen((posts) {
      _onMultiPostsData(posts);
    }, onError: (error, stackTrace) {
      _onMultiPostsError(error);
    });
    _homeRepository.singlePost.listen((post) {
      _onSinglePostData(post);
    }, onError: (error, stackTrace) {
      _onSinlePostError(error);
    });
  }

  void _onSinglePostData(PostModel post) {
    emit(state.copyWith(
      posts: [post, ...state.posts],
      status: RequestStatusEnum.loaded,
    ));
  }

  void _onSinlePostError(error) {
    emit(state.copyWith(
      status: RequestStatusEnum.error,
      error: error.toString(),
    ));
  }

  void _onMultiPostsError(error) {
    _onSinlePostError(error);
  }

  void _onMultiPostsData(List<PostModel> posts) {
    bool isMax = state.isMax;
    if (posts.isEmpty) {
      isMax = true;
    }

    emit(state.copyWith(
      posts: [...state.posts, ...posts],
      status: RequestStatusEnum.loaded,
      isMax: isMax,
    ));
  }

  /* bloc events */
  _onFetchPostsEvent(
    FetchPostsEvent event,
    Emitter<PostsState> emit,
  ) async {
    if (!_canContinue()) {
      return emit(state.copyWith(
        status: RequestStatusEnum.loaded,
        isMax: true,
      ));
    }
    if (state.status != RequestStatusEnum.initial) {
      emit(state.copyWith(status: RequestStatusEnum.loading));
    }
    await getIt<HomeRepository>().fetchPosts(
      FetchPostsRequestArgs(
        limit: 5,
        descending: true,
        orderBy: AppStrings.postModelId,
        lastPostId: state.posts.isNotEmpty ? state.posts.last.id : null,
      ),
    );
  }

  bool _canContinue() {
    if (state.isMax) return false;
    if (getIt<ConnectivityResult>() == ConnectivityResult.none &&
        state.posts.isNotEmpty) {
      return false;
    }
    return true;
  }

  Future<void> _onAddPostEvent(
    AddPostEvent event,
    Emitter<PostsState> emit,
  ) async {
    emit(state.copyWith(status: RequestStatusEnum.loading));
    await _homeRepository.addPost(event.post);
  }

  @override
  Future<void> close() {
    _homeRepository.dispose();
    return super.close();
  }
}
