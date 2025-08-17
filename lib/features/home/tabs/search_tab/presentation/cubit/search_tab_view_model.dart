import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app_new_design/features/home/tabs/search_tab/data/models/search_params.dart';
import 'package:movie_app_new_design/features/home/tabs/search_tab/domain/usecases/search_usecase.dart';

import 'search_tab_states.dart';

@injectable
class SearchTabViewModel extends Cubit<SearchTabStates> {
  final SearchUsecase _usecase;

  SearchTabViewModel(this._usecase) : super(const SearchTabInitialState());

  final TextEditingController controller = TextEditingController();

  Future<void> search() async {
    if (controller.text.isEmpty) {
      emit(const SearchTabEmptyState());
    }
    emit(const SearchTabLoadingState());

    SearchParams params = SearchParams(query: controller.text);
    final result = await _usecase.call(params);

    result.fold(
      (exception) => emit(SearchTabFailureState(exception)),
      (movie) => emit(SearchTabSuccessState(movie)),
    );
  }
}
