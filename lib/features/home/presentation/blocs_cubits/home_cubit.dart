import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/enums/enums.dart';
import '../../../../core/common/models/post_model.dart';
import '../../../../core/utils/service_locator.dart';
import '../../data/models/fetch_posts_request_args.dart';
import '../../data/repositories/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository homeRepository = getIt<HomeRepository>();

  HomeCubit()
      : super(HomeState(
          isGuest: false,
          posts: const [],
          requestStatus: RequestStatusEnum.initial,
        ));

  Future<void> fetchPostsStream() async {
    emit(state.copyWith(requestStatus: RequestStatusEnum.loading));
    final posts = await getIt<HomeRepository>().fetchPosts(
      FetchPostsRequestArgs(
        limit: 10,
        descending: true,
        skip: state.posts.length,
        orderBy: 'id',
        lastPostId: state.posts.isNotEmpty ? state.posts.last.id : null,
      ),
    );
    posts.fold((l) {
      emit(state.copyWith(
        requestStatus: RequestStatusEnum.error,
        error: l.message,
      ));
    }, (r) {
      emit(state.copyWith(
        requestStatus: RequestStatusEnum.loaded,
        posts: [...state.posts, ...r],
        error: '',
      ));
    });
  }

  Future<void> addPost({required PostModel post}) async {
    emit(state.copyWith(requestStatus: RequestStatusEnum.loading));
    final res = await homeRepository.addPost(post);
    res.fold((l) {
      emit(state.copyWith(requestStatus: RequestStatusEnum.error));
    }, (r) {
      emit(state.copyWith(
        requestStatus: RequestStatusEnum.loaded,
        posts: [...state.posts, r],
      ));
    });
  }
}
