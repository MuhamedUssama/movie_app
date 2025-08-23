import 'package:movie_app_new_design/core/models/movies/movie_model.dart';
import 'package:movie_app_new_design/core/network/exceptions.dart';

sealed class BrowseTabStates {
  const BrowseTabStates();
}

class BrowseTabInitialState extends BrowseTabStates {
  const BrowseTabInitialState();
}

class LoadGenresLoadingState extends BrowseTabStates {
  const LoadGenresLoadingState();
}

class LoadGenresSuccessState extends BrowseTabStates {
  final List<String> genres;
  const LoadGenresSuccessState(this.genres);
}

class LoadGenresFailureState extends BrowseTabStates {
  final String message;
  const LoadGenresFailureState(this.message);
}

class LoadMoviesLoadingState extends BrowseTabStates {
  const LoadMoviesLoadingState();
}

class LoadMoviesSuccessState extends BrowseTabStates {
  final Movie movie;
  const LoadMoviesSuccessState(this.movie);
}

class LoadMoviesFailureState extends BrowseTabStates {
  final ServerException exception;
  const LoadMoviesFailureState(this.exception);
}
