part of 'posts_bloc.dart';

class PostsState extends Equatable {
  final RequestStatusEnum status;
  final List<PostModel> posts;
  final String? errorMessage;
  final bool isNoMoreData;

  const PostsState({
    required this.status,
    required this.posts,
    this.errorMessage,
    required this.isNoMoreData,
  });

  PostsState copyWith({
    RequestStatusEnum? status,
    List<PostModel>? posts,
    String? error,
    bool? isNoMoreData,
  }) {
    return PostsState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      errorMessage: error ?? errorMessage,
      isNoMoreData: isNoMoreData ?? this.isNoMoreData,
    );
  }

  @override
  List<Object?> get props => [status, posts, errorMessage];
}
