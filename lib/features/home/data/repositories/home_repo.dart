import '../../../../core/common/models/post_model.dart';

abstract class HomeRepository {
  Future<List<PostModel>> fetchPostsStream({
    int? limit,
    int? skip,
    String? orderBy,
    bool? descending,
  });
}
