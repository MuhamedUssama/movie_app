class MovieDetailsParams {
  final int movieId;
  final bool withImages;
  final bool withCast;

  const MovieDetailsParams({
    required this.movieId,
    this.withImages = true,
    this.withCast = true,
  });

  Map<String, dynamic> toQueryParams() {
    return {
      'movie_id': movieId,
      'with_images': withImages,
      'with_cast': withCast,
    };
  }
}
