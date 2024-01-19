import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/enums/enums.dart';
import '../../../../core/common/models/post_model.dart';
import '../../../../core/utils/service_locator.dart';
import '../../data/repositories/home_repo.dart';
import '../../data/usecases/fetch_posts_stream_usecase.dart';

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
    final posts = await getIt<FetchPostsStreamUseCase>().call(
      FetchPostsStreamUseCaseArgs(
        limit: 10,
        descending: true,
        skip: state.posts.length,
        orderBy: 'id',
        lastPostId: state.posts.isNotEmpty ? state.posts.last.id : null,
      ),
    );
    emit(state.copyWith(
      requestStatus: RequestStatusEnum.loaded,
      posts: posts,
    ));
  }
}
