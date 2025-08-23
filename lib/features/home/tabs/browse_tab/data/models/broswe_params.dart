class BrosweParams {
  final String query;
  final int page;

  const BrosweParams({required this.query, this.page = 1});

  Map<String, dynamic> toQueryParams() => {'query_term': query, 'page': page};
}
