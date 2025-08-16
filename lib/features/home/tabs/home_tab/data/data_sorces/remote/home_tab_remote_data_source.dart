import 'package:dartz/dartz.dart';
import 'package:movie_app_new_design/core/models/movies/movie_model.dart';
import 'package:movie_app_new_design/core/network/exceptions.dart';
import 'package:movie_app_new_design/features/home/tabs/home_tab/data/models/movie_list_params.dart';

abstract interface class HomeTabRemoteDataSource {
  Future<Either<ServerException, Movie>> getMoviesList(
    MoviesListParams? params,
  );
}
