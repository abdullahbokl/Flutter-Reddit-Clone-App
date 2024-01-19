part of 'home_cubit.dart';

class HomeState {
  RequestStatusEnum requestStatus;
  List<PostModel> posts;
  bool isGuest;

  HomeState({
    required this.requestStatus,
    required this.posts,
    required this.isGuest,
  });

  HomeState copyWith({
    RequestStatusEnum? requestStatus,
    List<PostModel>? posts,
    int? page,
    bool? isGuest,
  }) {
    return HomeState(
      requestStatus: requestStatus ?? this.requestStatus,
      posts: posts ?? this.posts,
      isGuest: isGuest ?? this.isGuest,
    );
  }
}
