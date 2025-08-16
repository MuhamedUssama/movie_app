import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app_new_design/core/network/exceptions.dart';
import 'package:movie_app_new_design/features/movie_details/data/models/movie_details_models/movie_details_model.dart';
import 'package:movie_app_new_design/features/movie_details/data/models/movie_details_models/movie_details_params.dart';
import 'package:movie_app_new_design/features/movie_details/domain/repository/movie_details_repository.dart';

@injectable
class GetMovieDetailsUsecase {
  final MovieDetailsRepository _repository;

  const GetMovieDetailsUsecase(this._repository);

  Future<Either<ServerException, MovieDetails>> call(
    MovieDetailsParams params,
  ) async => await _repository.getMovieDetails(params);
}
