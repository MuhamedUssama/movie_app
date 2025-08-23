class BrosweParams {
  final String genre;
  final int page;
  final int limit;

  const BrosweParams({required this.genre, this.page = 1, this.limit = 50});

  Map<String, dynamic> toQueryParams() => {
    'genre': genre,
    'page': page,
    'limit': limit,
  };
}
