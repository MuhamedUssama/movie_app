import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_new_design/features/home/tabs/home_tab/presentation/cubit/home_tab_states.dart';
import 'package:movie_app_new_design/features/home/tabs/home_tab/presentation/cubit/home_tab_view_model.dart';

import 'last_movies_success_widget.dart';
import 'shimmer_last_movies_widget.dart';

class LastMoviesWidget extends StatelessWidget {
  const LastMoviesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocBuilder<HomeTabViewModel, HomeTabStates>(
        buildWhen:
            (previous, current) =>
                current is LastMoviesLoadingState ||
                current is LastMoviesFaliureState ||
                current is LastMoviesSuccessState,
        builder: (context, state) {
          if (state is LastMoviesLoadingState) {
            return const ShimmerLastMoviesWidget();
          } else if (state is LastMoviesFaliureState) {
            return Center(child: Text(state.message));
          } else if (state is LastMoviesSuccessState) {
            return LastMoviesSuccessWidget(movies: state.movies);
          } else {
            return const ShimmerLastMoviesWidget();
          }
        },
      ),
    );
  }
}
