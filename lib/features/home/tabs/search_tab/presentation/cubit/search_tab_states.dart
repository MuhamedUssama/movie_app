import 'package:movie_app_new_design/core/network/exceptions.dart';
import 'package:movie_app_new_design/core/models/movies/movies_model.dart';

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

class PaginationLoadingState extends SearchTabSuccessState {
  const PaginationLoadingState(List<Movies> super.movies);
}

class SearchTabSuccessState extends SearchTabStates {
  final List<Movies>? movies;
  const SearchTabSuccessState(this.movies);
}

class SearchTabFailureState extends SearchTabStates {
  final ServerException exception;
  const SearchTabFailureState(this.exception);
}
