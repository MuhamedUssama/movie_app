import 'package:dartz/dartz.dart';
import 'package:movie_app_new_design/core/models/movies/movie_model.dart';
import 'package:movie_app_new_design/core/network/exceptions.dart';
import 'package:movie_app_new_design/features/home/tabs/browse_tab/data/models/broswe_params.dart';

abstract interface class BrowseTabDataSource {
  Future<Either<ServerException, Movie>> getMoviesByGenre(BrosweParams params);

  Future<Either<ServerException, List<String>>> loadGenres();
}
