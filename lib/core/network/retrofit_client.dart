import 'package:dio/dio.dart';

import 'package:injectable/injectable.dart';
import 'package:movie_app_new_design/core/models/movies/movie_model.dart';
import 'package:movie_app_new_design/core/network/end_points.dart';
import 'package:movie_app_new_design/features/movie_details/data/models/movie_details_models/movie_details_model.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/error_logger.dart';

part 'retrofit_client.g.dart';

@singleton
@RestApi(baseUrl: EndPoints.baseUrl)
abstract class RetrofitClient {
  @factoryMethod
  factory RetrofitClient(Dio dio) = _RetrofitClient;

  @GET(EndPoints.listMovies)
  Future<Movie> getMoviesList(@Queries() Map<String, dynamic> query);

  @GET(EndPoints.movieDetails)
  Future<MovieDetails> getMovieDetails(@Queries() Map<String, dynamic> query);
}
