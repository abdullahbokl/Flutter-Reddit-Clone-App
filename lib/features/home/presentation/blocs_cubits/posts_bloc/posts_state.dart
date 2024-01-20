part of 'posts_bloc.dart';

class PostsState extends Equatable {
  final RequestStatusEnum status;
  final List<PostModel> posts;
  final String? errorMessage;
  final bool isMax;

  const PostsState({
    required this.status,
    required this.posts,
    this.errorMessage,
    required this.isMax,
  });

  PostsState copyWith({
    RequestStatusEnum? status,
    List<PostModel>? posts,
    String? error,
    bool? isMax,
  }) {
    return PostsState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      errorMessage: error ?? errorMessage,
      isMax: isMax ?? this.isMax,
    );
  }

  @override
  List<Object?> get props => [status, posts, errorMessage, isMax];
}
