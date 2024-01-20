import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
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
  late final StreamSubscription<List<PostModel>> _subscription;

  PostsBloc()
      : _homeRepository = getIt<HomeRepository>(),
        super(const PostsState(
          posts: [],
          status: RequestStatusEnum.initial,
          isNoMoreData: false,
          errorMessage: null,
        )) {
    _subscription = _homeRepository.posts.listen((posts) {});
    // transformer for infinite scroll >> debounce time
    on<FetchPostsEvent>(_onFetchPostsEvent, transformer: droppable());
    on<AddPostEvent>(_onAddPostEvent, transformer: sequential());
  }

  _onFetchPostsEvent(
    FetchPostsEvent event,
    Emitter<PostsState> emit,
  ) async {
    if (state.isNoMoreData) return;
    if (state.status != RequestStatusEnum.initial) {
      emit(state.copyWith(status: RequestStatusEnum.loading));
    }

    await getIt<HomeRepository>().fetchPosts(
      FetchPostsRequestArgs(
        limit: 5,
        descending: false,
        orderBy: AppStrings.postModelId,
        lastPostId: state.posts.isNotEmpty ? state.posts.last.id : null,
      ),
    );

    _subscription.onData((data) {
      emit(state.copyWith(
        status: RequestStatusEnum.loaded,
        posts: data,
        isNoMoreData: data.isEmpty,
      ));
    });
    await emit.onEach(_subscription.asFuture().asStream(), onData: (data) {
      emit(state.copyWith(
        status: RequestStatusEnum.loaded,
        posts: data,
        isNoMoreData: data.isEmpty,
      ));
    }, onError: (error, stackTrace) {
      emit(state.copyWith(
        status: RequestStatusEnum.error,
        error: error.toString(),
      ));
    });
  }

  Future<void> _onAddPostEvent(
    AddPostEvent event,
    Emitter<PostsState> emit,
  ) async {
    emit(state.copyWith(status: RequestStatusEnum.loading));
    await _homeRepository.addPost(event.post);
    await emit.forEach(
      _homeRepository.posts,
      onData: (data) => state.copyWith(
        status: RequestStatusEnum.loaded,
        posts: data,
      ),
      onError: (error, stackTrace) => state.copyWith(
        status: RequestStatusEnum.error,
        error: error.toString(),
      ),
    );
  }

  @override
  Future<void> close() {
    _homeRepository.dispose();
    // _subscription.cancel();
    return super.close();
  }
}
