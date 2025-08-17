import 'package:movie_app_new_design/features/movie_details/data/models/movie_details_models/movie_model.dart'
    as details;
import 'package:movie_app_new_design/features/movie_details/data/models/similar_movies_models/movie.dart'
    as similar;

sealed class MovieDetailsStates {
  const MovieDetailsStates();
}

class MovieDetailsScreenInitialState extends MovieDetailsStates {
  const MovieDetailsScreenInitialState();
}

class MovieDetailsLoadingState extends MovieDetailsStates {
  const MovieDetailsLoadingState();
}

class MovieDeatialsSuccessState extends MovieDetailsStates {
  final details.Movie movie;
  const MovieDeatialsSuccessState(this.movie);
}

class MovieDetailsFailureState extends MovieDetailsStates {
  final String message;
  const MovieDetailsFailureState(this.message);
}

class SimilarMoviesLoadingState extends MovieDetailsStates {
  const SimilarMoviesLoadingState();
}

class SimilarMoviesSuccessState extends MovieDetailsStates {
  final List<similar.Movie> movies;
  const SimilarMoviesSuccessState(this.movies);
}

class SimilarMoviesFailureState extends MovieDetailsStates {
  final String message;
  const SimilarMoviesFailureState(this.message);
}
