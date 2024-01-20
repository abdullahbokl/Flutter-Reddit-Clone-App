part of 'posts_bloc.dart';

@immutable
abstract class PostsEvent {}

class FetchPostsEvent extends PostsEvent {}

//add
class AddPostEvent extends PostsEvent {
  final PostModel post;

  AddPostEvent({required this.post});
}
