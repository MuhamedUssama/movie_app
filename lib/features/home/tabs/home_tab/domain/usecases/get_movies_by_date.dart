import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app_new_design/core/models/movies/movie_model.dart';
import 'package:movie_app_new_design/core/network/exceptions.dart';
import 'package:movie_app_new_design/features/home/tabs/home_tab/data/models/movie_list_params.dart';
import 'package:movie_app_new_design/features/home/tabs/home_tab/domain/repository/home_tab_repository.dart';

@injectable
class GetMoviesByDate {
  final HomeTabRepository _repository;

  @factoryMethod
  const GetMoviesByDate(this._repository);

  Future<Either<ServerException, Movie>> call() async {
    final MoviesListParams params = MoviesListParams(sortBy: 'year');
    return _repository.getMoviesList(params);
  }
}
