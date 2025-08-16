class MoviesListParams {
  final int limit;
  final int page;
  final String? genre;
  final String? sortBy;

  const MoviesListParams({
    this.limit = 20,
    this.page = 1,
    this.genre,
    this.sortBy,
  });

  Map<String, dynamic> toQueryParams() {
    return {
      'limit': limit,
      'page': page,
      'genre': genre ?? '',
      'sort_by': sortBy ?? '',
    };
  }
}
