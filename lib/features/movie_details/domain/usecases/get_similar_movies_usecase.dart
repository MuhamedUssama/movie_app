import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app_new_design/core/network/exceptions.dart';
import 'package:movie_app_new_design/features/movie_details/data/models/similar_movies_models/movie_suggestions_response.dart';
import 'package:movie_app_new_design/features/movie_details/data/models/similar_movies_models/similar_movies_parames.dart';
import 'package:movie_app_new_design/features/movie_details/domain/repository/movie_details_repository.dart';

@injectable
class GetSimilarMoviesUsecase {
  final MovieDetailsRepository _repository;

  @factoryMethod
  const GetSimilarMoviesUsecase(this._repository);

  Future<Either<ServerException, MovieSuggestionsResponse>> call(
    SimilarMoviesParames params,
  ) async => await _repository.getSimilarMovies(params);
}
