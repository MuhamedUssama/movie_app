import 'package:dartz/dartz.dart';
import 'package:movie_app_new_design/core/network/exceptions.dart';
import 'package:movie_app_new_design/core/models/movies/movie_model.dart';
import 'package:movie_app_new_design/features/home/tabs/search_tab/data/models/search_params.dart';

abstract interface class SearchTabRepository {
  Future<Either<ServerException, Movie>> serach(SearchParams params);
}
