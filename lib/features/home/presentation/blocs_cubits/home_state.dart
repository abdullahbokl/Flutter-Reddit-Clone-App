part of 'home_cubit.dart';

class HomeState extends Equatable {
  RequestStatusEnum requestStatus;
  List<PostModel> posts;
  bool isGuest;
  String? errorMessage;

  HomeState({
    required this.requestStatus,
    required this.posts,
    required this.isGuest,
    this.errorMessage,
  });

  HomeState copyWith({
    RequestStatusEnum? requestStatus,
    List<PostModel>? posts,
    bool? isGuest,
    String? error,
  }) {
    return HomeState(
      requestStatus: requestStatus ?? this.requestStatus,
      posts: posts ?? this.posts,
      isGuest: isGuest ?? this.isGuest,
      errorMessage: error ?? errorMessage,
    );
  }

  @override
  List<Object?> get props => [requestStatus, posts, isGuest, errorMessage];
}
