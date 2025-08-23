import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app_new_design/core/models/movies/movie_model.dart';
import 'package:movie_app_new_design/core/network/exceptions.dart';
import 'package:movie_app_new_design/core/network/retrofit_client.dart';
import 'package:movie_app_new_design/features/home/tabs/search_tab/data/models/search_params.dart';

import 'search_tab_data_source.dart';

@LazySingleton(as: SearchTabDataSource)
class SearchTabDataSourceImpl implements SearchTabDataSource {
  final RetrofitClient _retrofitClient;

  @factoryMethod
  const SearchTabDataSourceImpl(this._retrofitClient);

  @override
  Future<Either<ServerException, Movie>> serach(SearchParams params) async {
    try {
      final Movie movieList = await _retrofitClient.search(
        params.toQueryParams(),
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
