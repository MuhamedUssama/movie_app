import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app_new_design/core/models/movies/movie_model.dart';
import 'package:movie_app_new_design/core/network/exceptions.dart';
import 'package:movie_app_new_design/features/home/tabs/home_tab/data/models/movie_list_params.dart';

import '../repository/home_tab_repository.dart';

@injectable
class GetMoviesByRandomGenre {
  final HomeTabRepository _repository;

  @factoryMethod
  const GetMoviesByRandomGenre(this._repository);

  Future<Either<ServerException, Movie>> call(String randomGenre) async {
    final MoviesListParams params = MoviesListParams(genre: randomGenre);
    return _repository.getMoviesList(params);
  }
}
