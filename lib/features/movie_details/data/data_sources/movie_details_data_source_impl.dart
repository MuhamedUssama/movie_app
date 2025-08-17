import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app_new_design/core/network/exceptions.dart';
import 'package:movie_app_new_design/core/network/retrofit_client.dart';
import 'package:movie_app_new_design/features/movie_details/data/data_sources/movie_deatils_data_source.dart';
import 'package:movie_app_new_design/features/movie_details/data/models/movie_details_models/movie_details_model.dart';
import 'package:movie_app_new_design/features/movie_details/data/models/movie_details_models/movie_details_params.dart';
import 'package:movie_app_new_design/features/movie_details/data/models/similar_movies_models/movie_suggestions_response.dart';
import 'package:movie_app_new_design/features/movie_details/data/models/similar_movies_models/similar_movies_parames.dart';

@LazySingleton(as: MovieDeatilsDataSource)
class MovieDetailsDataSourceImpl implements MovieDeatilsDataSource {
  final RetrofitClient _retrofitClient;

  const MovieDetailsDataSourceImpl(this._retrofitClient);

  @override
  Future<Either<ServerException, MovieDetails>> getMovieDetails(
    MovieDetailsParams params,
  ) async {
    try {
      final MovieDetails movieDetails = await _retrofitClient.getMovieDetails(
        params.toQueryParams(),
      );
      return Right(movieDetails);
    } on DioException catch (dioException) {
      if (dioException.error is ServerException) {
        return Left(dioException.error as ServerException);
      }
      return Left(ServerException(dioException.message));
    } catch (execption) {
      return Left(ServerException(execption.toString()));
    }
  }

  @override
  Future<Either<ServerException, MovieSuggestionsResponse>> getSimilarMovies(
    SimilarMoviesParames params,
  ) async {
    try {
      final MovieSuggestionsResponse similarMovies = await _retrofitClient
          .getMovieSuggestions(params.toQueryParams());

      return Right(similarMovies);
    } on DioException catch (dioException) {
      if (dioException.error is ServerException) {
        return Left(dioException.error as ServerException);
      }
      return Left(ServerException(dioException.message));
    } catch (execption) {
      return Left(ServerException(execption.toString()));
    }
  }
}
