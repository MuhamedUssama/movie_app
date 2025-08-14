import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/usecases/get_movies_by_date.dart';
import '../../domain/usecases/get_movies_by_random_genre.dart';
import 'home_tab_states.dart';

@injectable
class HomeTabViewModel extends Cubit<HomeTabStates> {
  final GetMoviesByDate _moviesByDate;
  final GetMoviesByRandomGenre _moviesByRandomGenre;

  @factoryMethod
  HomeTabViewModel(this._moviesByDate, this._moviesByRandomGenre)
    : super(const HomeTabInitialState());

  static List<String> _cachedGenres = [];

  Future<void> getMoviesByDate() async {
    emit(const LastMoviesLoadingState());

    final result = await _moviesByDate();

    result.fold(
      (error) {
        emit(LastMoviesFaliureState(error.message ?? 'Somthing went wrong'));
      },
      (movies) {
        emit(LastMoviesSuccessState(movies: movies.data?.movies ?? []));
      },
    );
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

  Future<void> getMoviesByRandomGenre() async {
    emit(const MoviesByGenereLoadingState());

    List<String> genres = await _loadGenres();

    final result = await _moviesByRandomGenre.call(genres);

    result.fold(
      (error) {
        emit(MoviesByGenereFalireState(error.message ?? 'Somthing went wrong'));
      },
      (movie) {
        emit(MoviesByGenereSuccessState(movie: movie));
      },
    );
  }
}
