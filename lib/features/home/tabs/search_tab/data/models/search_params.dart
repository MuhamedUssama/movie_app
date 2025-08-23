class SearchParams {
  final String query;
  final int page;

  const SearchParams({required this.query, this.page = 1});

  Map<String, dynamic> toQueryParams() => {'query_term': query, 'page': page};
}
