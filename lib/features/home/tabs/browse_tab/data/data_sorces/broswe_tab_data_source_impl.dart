import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app_new_design/core/models/movies/movie_model.dart';
import 'package:movie_app_new_design/core/network/exceptions.dart';
import 'package:movie_app_new_design/core/network/retrofit_client.dart';
import 'package:movie_app_new_design/features/home/tabs/browse_tab/data/data_sorces/browse_tab_data_source.dart';
import 'package:movie_app_new_design/features/home/tabs/browse_tab/data/models/broswe_params.dart';

@Injectable(as: BrowseTabDataSource)
class BrosweTabDataSourceImpl implements BrowseTabDataSource {
  final RetrofitClient _retrofitClient;

  @factoryMethod
  const BrosweTabDataSourceImpl(this._retrofitClient);

  @override
  Future<Either<ServerException, Movie>> getMoviesByGenre(
    BrosweParams params,
  ) async {
    try {
      final Movie movieList = await _retrofitClient.getMoviesList(
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

  @override
  Future<Either<ServerException, List<String>>> loadGenres() async {
    try {
      List<String> genres = [];
      final String jsonString = await rootBundle.loadString(
        'assets/genres.json',
      );
      final List<dynamic> jsonList = jsonDecode(jsonString);
      genres = jsonList.map((genre) => genre.toString()).toList();
      return Right(genres);
    } catch (exception) {
      return Left(ServerException(exception.toString()));
    }
  }
}
