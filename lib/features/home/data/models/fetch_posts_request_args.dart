class FetchPostsRequestArgs {
  final int? limit;
  final String? orderBy;
  final bool? descending;
  final String? lastPostId;

  FetchPostsRequestArgs({
    this.limit,
    this.orderBy,
    this.descending,
    this.lastPostId,
  });
}
