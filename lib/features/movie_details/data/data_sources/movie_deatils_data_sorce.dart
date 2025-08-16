import 'package:dartz/dartz.dart';
import 'package:movie_app_new_design/core/network/exceptions.dart';
import 'package:movie_app_new_design/features/movie_details/data/models/movie_details_models/movie_details_model.dart';
import 'package:movie_app_new_design/features/movie_details/data/models/movie_details_models/movie_details_params.dart';

abstract interface class MovieDeatilsDataSorce {
  Future<Either<ServerException, MovieDetails>> getMovieDetails(
    MovieDetailsParams params,
  );
}
