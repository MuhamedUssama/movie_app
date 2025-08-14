import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app_new_design/core/models/movies/movie_model.dart';
import 'package:movie_app_new_design/core/network/exceptions.dart';
import 'package:movie_app_new_design/core/network/retrofit_client.dart';
import 'package:movie_app_new_design/features/home/tabs/home_tab/data/data_sorces/remote/home_tab_remote_data_source.dart';
import 'package:movie_app_new_design/features/home/tabs/home_tab/data/models/movie_list_params.dart';

@LazySingleton(as: HomeTabRemoteDataSource)
class HomeTabRemoteDataSourceImpl implements HomeTabRemoteDataSource {
  final RetrofitClient _retrofitClient;

  @factoryMethod
  const HomeTabRemoteDataSourceImpl(this._retrofitClient);

  @override
  Future<Either<ServerException, Movie>> getMoviesList(
    MoviesListParams? params,
  ) async {
    try {
      final Movie movieList = await _retrofitClient.getMoviesList(
        params?.toQueryParams() ?? {},
      );
      return Right(movieList);
    } on DioException catch (dioException) {
      if (dioException.error is ServerException) {
        return Left(dioException.error as ServerException);
      }
      return Left(ServerException(dioException.message));
    } catch (execption) {
      return Left(ServerException(execption.toString()));
    }
  }
}
