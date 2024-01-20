// import 'dart:async';
//
// import 'package:equatable/equatable.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../../../core/common/enums/enums.dart';
// import '../../../../core/common/models/post_model.dart';
// import '../../../../core/utils/app_strings.dart';
// import '../../../../core/utils/service_locator.dart';
// import '../../data/models/fetch_posts_request_args.dart';
// import '../../data/repositories/home_repo.dart';
//
// part 'home_state.dart';
//
// class HomeCubit extends Cubit<HomeState> {
//   final HomeRepository _homeRepository;
//   late final StreamSubscription _subscription;
//   final scrollController = ScrollController();
//
//   HomeCubit()
//       : _homeRepository = getIt<HomeRepository>(),
//         super(const HomeState(
//           posts: [],
//           status: RequestStatusEnum.initial,
//           isLastPage: false,
//           errorMessage: null,
//         )) {
//     _itemsSubscription();
//     _scrollingSubscription();
//   }
//
//   void _scrollingSubscription() {
//     scrollController.addListener(() {
//       if (scrollController.position.pixels >=
//           scrollController.position.maxScrollExtent - 100) {
//         fetchPostsStream();
//       }
//     });
//   }
//
//   void _itemsSubscription() {
//     _subscription = _homeRepository.posts.listen((posts) {
//       emit(state.copyWith(
//         status: RequestStatusEnum.loaded,
//         posts: posts,
//       ));
//     }, onError: (e) {
//       emit(state.copyWith(
//         status: RequestStatusEnum.error,
//         error: e.toString(),
//       ));
//     });
//   }
//
//   Future<void> fetchPostsStream() async {
//     emit(state.copyWith(status: RequestStatusEnum.loading));
//     await getIt<HomeRepository>().fetchPosts(
//       FetchPostsRequestArgs(
//         limit: 5,
//         descending: false,
//         skip: state.posts.length,
//         orderBy: AppStrings.postModelId,
//         lastPostId: state.posts.isNotEmpty ? state.posts.last.id : null,
//       ),
//     );
//   }
//
//   Future<void> addPost({required PostModel post}) async {
//     // emit(state.copyWith(status: RequestStatusEnum.loading));
//     // final res = await homeRepository.addPost(post);
//     // res.fold((l) {
//     //   emit(state.copyWith(status: RequestStatusEnum.error));
//     // }, (r) {
//     //   emit(state.copyWith(
//     //     status: RequestStatusEnum.loaded,
//     //     posts: [...state.posts, r],
//     //   ));
//     // });
//   }
//
//   @override
//   Future<void> close() {
//     _homeRepository.dispose();
//     _subscription.cancel();
//     scrollController.dispose();
//     return super.close();
//   }
// }
