import '../../../../core/common/models/post_model.dart';
import '../repositories/home_repo.dart';

class FetchPostsStreamUseCase {
  final HomeRepository _homeRepository;

  const FetchPostsStreamUseCase(this._homeRepository);

  Future<List<PostModel>> call(FetchPostsStreamUseCaseArgs args) {
    final Future<List<PostModel>> posts = _homeRepository.fetchPostsStream(
      limit: args.limit,
      skip: args.skip,
      orderBy: args.orderBy,
      descending: args.descending,
    );

    return posts;
  }
}

class FetchPostsStreamUseCaseArgs {
  final String? lastPostId;
  final int? limit;
  final int? skip;
  final String? orderBy;
  final bool? descending;

  FetchPostsStreamUseCaseArgs({
    this.lastPostId,
    this.limit,
    this.skip,
    this.orderBy,
    this.descending,
  });
}
