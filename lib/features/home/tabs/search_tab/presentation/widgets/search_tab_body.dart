import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_app_new_design/core/utils/app_assets.dart';

import '../cubit/search_tab_states.dart';
import '../cubit/search_tab_view_model.dart';
import 'movies_loading_state_widget.dart';
import 'search_error_state_widget.dart';
import 'search_success_state_widget.dart';

class SearchTabBody extends StatelessWidget {
  const SearchTabBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchTabViewModel, SearchTabStates>(
      builder: (context, state) {
        if (state is SearchTabEmptyState) {
          return SliverFillRemaining(
            child: Lottie.asset(LottieAnimations.waiting),
          );
        } else if (state is SearchTabLoadingState) {
          return MoviesLoadingStateWidget();
        } else if (state is SearchTabFailureState) {
          return SearchErrorStateWidget(exception: state.exception);
        } else if (state is SearchTabSuccessState) {
          return SearchSuccessStateWidget(
            movies: state.movies ?? [],
            state: state,
          );
        } else {
          return SliverFillRemaining(
            child: Lottie.asset(LottieAnimations.waiting),
          );
        }
      },
    );
  }
}
