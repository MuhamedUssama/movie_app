import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app_new_design/features/movie_details/data/models/similar_movies_models/similar_movies_parames.dart';
import 'package:movie_app_new_design/features/movie_details/domain/usecases/get_movie_details_usecase.dart';
import 'package:movie_app_new_design/features/movie_details/domain/usecases/get_similar_movies_usecase.dart';

import '../../data/models/movie_details_models/movie_details_params.dart';
import 'movie_details_states.dart';

@injectable
class MovieDetailsViewModel extends Cubit<MovieDetailsStates> {
  final GetMovieDetailsUsecase _movieDetailsUsecase;
  final GetSimilarMoviesUsecase _similarMoviesUsecase;

  @factoryMethod
  MovieDetailsViewModel(this._movieDetailsUsecase, this._similarMoviesUsecase)
    : super(const MovieDetailsScreenInitialState());

  late int movieId;

  Future<void> getMovieDetails(int movieId) async {
    emit(const MovieDetailsLoadingState());
    final MovieDetailsParams params = MovieDetailsParams(movieId: movieId);
    final result = await _movieDetailsUsecase(params);

    result.fold(
      (message) => emit(
        MovieDetailsFailureState(message.message ?? 'Somthing went wrong'),
      ),
      (movieDetails) {
        emit(MovieDeatialsSuccessState(movieDetails.data.movie));
      },
    );
  }

  Future<void> getSimilarMovies(int movieId) async {
    emit(const SimilarMoviesLoadingState());

    final SimilarMoviesParames params = SimilarMoviesParames(movieId);
    final result = await _similarMoviesUsecase(params);

    result.fold(
      (error) => emit(
        SimilarMoviesFailureState(error.message ?? 'Somthing went wrong'),
      ),
      (movies) {
        emit(SimilarMoviesSuccessState(movies.data?.movies ?? []));
      },
    );
  }
}
