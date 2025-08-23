import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/browse_tab_states.dart';
import '../cubit/browse_tab_view_model.dart';
import 'load_genres_loading_widget.dart';
import 'load_genres_success_widget.dart';

class BrowseTabBody extends StatelessWidget {
  const BrowseTabBody({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: context.watch<BrowseTabViewModel>().listOfGenres.length,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 16),
          BlocBuilder<BrowseTabViewModel, BrowseTabStates>(
            buildWhen:
                (previous, current) =>
                    current is LoadGenresLoadingState ||
                    current is LoadGenresSuccessState ||
                    current is LoadGenresFailureState,

            builder: (context, state) {
              if (state is LoadGenresLoadingState) {
                return const LoadGenresLoadingWidget();
              } else if (state is LoadGenresFailureState) {
                return Center(child: Text(state.message));
              } else if (state is LoadGenresSuccessState) {
                return LoadGenresSuccessWidget(genres: state.genres);
              } else {
                return const LoadGenresLoadingWidget();
              }
            },
          ),
        ],
      ),
    );
  }
}
