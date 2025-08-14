import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app_new_design/core/models/movies/movie_model.dart';
import 'package:movie_app_new_design/core/network/exceptions.dart';
import 'package:movie_app_new_design/features/home/tabs/home_tab/data/models/movie_list_params.dart';

import '../repository/home_tab_repository.dart';

@injectable
class GetMoviesByRandomGenre {
  final HomeTabRepository _repository;
  static List<String> _cachedGenres = [];

  @factoryMethod
  const GetMoviesByRandomGenre(this._repository);

  Future<Either<ServerException, Movie>> call() async {
    List<String> genresList = await _loadGenres();
    final String randomGenre = (genresList..shuffle()).first;
    final MoviesListParams params = MoviesListParams(genre: randomGenre);
    return _repository.getMoviesList(params);
  }

  Future<List<String>> _loadGenres() async {
    try {
      if (_cachedGenres.isNotEmpty) return _cachedGenres;

      final String jsonString = await rootBundle.loadString(
        'assets/genres.json',
      );
      final List<dynamic> jsonList = jsonDecode(jsonString);
      _cachedGenres = jsonList.map((genre) => genre.toString()).toList();
      return _cachedGenres;
    } catch (exception) {
      throw Exception('Error loading genres: $exception');
    }
  }
}
