class SimilarMoviesParames {
  final int movieId;

  const SimilarMoviesParames(this.movieId);

  Map<String, dynamic> toQueryParams() => {'movie_id': movieId};
}
