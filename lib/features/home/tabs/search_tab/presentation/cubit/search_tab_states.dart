import 'package:movie_app_new_design/core/network/exceptions.dart';
import 'package:movie_app_new_design/core/models/movies/movie_model.dart';

sealed class SearchTabStates {
  const SearchTabStates();
}

class SearchTabInitialState extends SearchTabStates {
  const SearchTabInitialState();
}

class SearchTabEmptyState extends SearchTabStates {
  const SearchTabEmptyState();
}

class SearchTabLoadingState extends SearchTabStates {
  const SearchTabLoadingState();
}

class SearchTabSuccessState extends SearchTabStates {
  final Movie movie;
  const SearchTabSuccessState(this.movie);
}

class SearchTabFailureState extends SearchTabStates {
  final ServerException exception;
  const SearchTabFailureState(this.exception);
}
