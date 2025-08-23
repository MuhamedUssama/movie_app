import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app_new_design/features/home/tabs/browse_tab/data/models/broswe_params.dart';
import 'package:movie_app_new_design/features/home/tabs/browse_tab/domain/usecases/get_movies_by_genre_usecase.dart';
import 'package:movie_app_new_design/features/home/tabs/browse_tab/domain/usecases/load_genres_usecase.dart';

import 'browse_tab_states.dart';

@injectable
class BrowseTabViewModel extends Cubit<BrowseTabStates> {
  final GetMoviesByGenreUsecase _moviesByGenreUsecase;
  final LoadGenresUsecase _loadGenresUsecase;

  @factoryMethod
  BrowseTabViewModel(this._loadGenresUsecase, this._moviesByGenreUsecase)
    : super(const BrowseTabInitialState()) {
    loadGenres();
  }

  static List<String> _cachedGenres = [];
  List<String> listOfGenres = [];
  String _selectedGenre = '';
  int currnetTabIndex = 0;
  int page = 1;

  void changeTabIndex(int index) async {
    currnetTabIndex = index;
    _selectedGenre = listOfGenres[currnetTabIndex];
    emit(ChangeGenreTabIndex(currnetTabIndex));
    await getMoviesByGenre(_selectedGenre);
  }

  Future<void> loadGenres() async {
    if (_cachedGenres.isEmpty) {
      emit(const LoadGenresLoadingState());
    }

    final result = await _loadGenresUsecase();

    result.fold(
      (message) => emit(LoadGenresFailureState(message.message.toString())),
      (genres) async {
        _cachedGenres = genres;
        listOfGenres = genres;
        _selectedGenre = _cachedGenres.first;
        emit(LoadGenresSuccessState(_cachedGenres));

        await getMoviesByGenre(_selectedGenre);
      },
    );
  }

  Future<void> getMoviesByGenre(String genre) async {
    emit(const LoadMoviesLoadingState());

    final BrosweParams params = BrosweParams(genre: genre, page: page);
    final result = await _moviesByGenreUsecase(params);

    result.fold(
      (exception) {
        emit(LoadMoviesFailureState(exception));
      },
      (movie) {
        emit(LoadMoviesSuccessState(movie));
      },
    );
  }
}
