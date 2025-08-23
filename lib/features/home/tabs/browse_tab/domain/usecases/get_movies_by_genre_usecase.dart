import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app_new_design/core/models/movies/movie_model.dart';
import 'package:movie_app_new_design/core/network/exceptions.dart';
import 'package:movie_app_new_design/features/home/tabs/browse_tab/data/models/broswe_params.dart';
import 'package:movie_app_new_design/features/home/tabs/browse_tab/domain/repository/browse_tab_repository.dart';

@injectable
class GetMoviesByGenreUsecase {
  final BrowseTabRepository _repository;

  @factoryMethod
  const GetMoviesByGenreUsecase(this._repository);

  Future<Either<ServerException, Movie>> call(BrosweParams params) async =>
      _repository.getMoviesByGenre(params);
}
