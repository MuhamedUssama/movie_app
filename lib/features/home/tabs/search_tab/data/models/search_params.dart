class SearchParams {
  final String query;

  const SearchParams({required this.query});

  Map<String, dynamic> toQueryParams() => {'query_term': query};
}
