import 'package:movie_app_new_design/core/models/movies/movie_model.dart';
import 'package:movie_app_new_design/core/models/movies/movies_model.dart';

sealed class HomeTabStates {
  const HomeTabStates();
}

class HomeTabInitialState extends HomeTabStates {
  const HomeTabInitialState();
}

class LastMoviesLoadingState extends HomeTabStates {
  const LastMoviesLoadingState();
}

class LastMoviesSuccessState extends HomeTabStates {
  final List<Movies> movies;
  const LastMoviesSuccessState({required this.movies});
}

class LastMoviesFaliureState extends HomeTabStates {
  final String message;
  const LastMoviesFaliureState(this.message);
}

class ChangeMovieCard extends HomeTabStates {
  final int index;
  const ChangeMovieCard(this.index);
}

class MoviesByGenereLoadingState extends HomeTabStates {
  const MoviesByGenereLoadingState();
}

class MoviesByGenereSuccessState extends HomeTabStates {
  final Movie movie;
  const MoviesByGenereSuccessState({required this.movie});
}

class MoviesByGenereFalireState extends HomeTabStates {
  final String message;
  const MoviesByGenereFalireState(this.message);
}
