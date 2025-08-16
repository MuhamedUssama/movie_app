import 'package:dartz/dartz.dart';
import 'package:movie_app_new_design/core/network/exceptions.dart';
import 'package:movie_app_new_design/features/movie_details/data/models/movie_details_models/movie_details_model.dart';
import 'package:movie_app_new_design/features/movie_details/data/models/movie_details_models/movie_details_params.dart';
import 'package:movie_app_new_design/features/movie_details/data/models/similar_movies_models/movie_suggestions_response.dart';
import 'package:movie_app_new_design/features/movie_details/data/models/similar_movies_models/similar_movies_parames.dart';

abstract interface class MovieDetailsRepository {
  Future<Either<ServerException, MovieDetails>> getMovieDetails(
    MovieDetailsParams params,
  );

  Future<Either<ServerException, MovieSuggestionsResponse>> getSimilarMovies(
    SimilarMoviesParames params,
  );
}
