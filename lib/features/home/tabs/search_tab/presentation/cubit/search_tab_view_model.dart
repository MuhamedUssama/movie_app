import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app_new_design/core/models/movies/movies_model.dart';
import 'package:movie_app_new_design/features/home/tabs/search_tab/data/models/search_params.dart';
import 'package:movie_app_new_design/features/home/tabs/search_tab/domain/usecases/search_usecase.dart';

import 'search_tab_states.dart';

@injectable
class SearchTabViewModel extends Cubit<SearchTabStates> {
  final SearchUsecase _usecase;

  SearchTabViewModel(this._usecase) : super(const SearchTabInitialState()) {
    scrollController = ScrollController();

    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        bool isTop = scrollController.position.pixels == 0;
        if (!isTop && page < totalPages) {
          page++;
          // emit(PaginationLoadingState());
          search();
        }
      }
    });
  }

  final TextEditingController controller = TextEditingController();
  late ScrollController scrollController;
  List<Movies> newMovies = [];
  int page = 1;
  int totalPages = 1;
  String? _lastQuery;

  Future<void> search([String? query]) async {
    if (query != null && query != _lastQuery) {
      newMovies.clear();
      page = 1;
      totalPages = 1;
      _lastQuery = query;
    }

    if (controller.text.isEmpty) {
      emit(const SearchTabEmptyState());
    }

    if (newMovies.isEmpty && page == 1) {
      emit(const SearchTabLoadingState());
    }

    if (page > 1) {
      emit(PaginationLoadingState(newMovies));
    }

    SearchParams params = SearchParams(query: controller.text, page: page);
    final result = await _usecase.call(params);

    result.fold((exception) => emit(SearchTabFailureState(exception)), (movie) {
      newMovies.addAll(movie.data?.movies ?? []);

      final int movieCount = movie.data?.movieCount ?? 0;
      final int limit = movie.data?.limit ?? 20;
      totalPages = (movieCount / limit).ceil();

      emit(SearchTabSuccessState(newMovies));
    });
  }

  @override
  Future<void> close() {
    scrollController.dispose();
    controller.dispose();
    return super.close();
  }
}
