// part of 'home_cubit.dart';
//
// class HomeState extends Equatable {
//   final RequestStatusEnum status;
//   final List<PostModel> posts;
//   final String? errorMessage;
//   final bool isLastPage;
//
//   const HomeState({
//     required this.status,
//     required this.posts,
//     this.errorMessage,
//     required this.isLastPage,
//   });
//
//   HomeState copyWith({
//     RequestStatusEnum? status,
//     List<PostModel>? posts,
//     String? error,
//     bool? isLastPage,
//   }) {
//     return HomeState(
//       status: status ?? this.status,
//       posts: posts ?? this.posts,
//       errorMessage: error ?? errorMessage,
//       isLastPage: isLastPage ?? this.isLastPage,
//     );
//   }
//
//   @override
//   List<Object?> get props => [status, posts, errorMessage];
// }
