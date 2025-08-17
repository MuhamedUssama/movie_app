import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/movie_details_states.dart';
import '../cubit/movie_details_view_model.dart';
import '../widgets/movie_details_screen_loading_widget.dart';
import '../widgets/movie_details_success_widget.dart';

class MovieDetailsScreen extends StatefulWidget {
  const MovieDetailsScreen({super.key});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final int movieId = ModalRoute.of(context)!.settings.arguments as int;
    context.read<MovieDetailsViewModel>().movieId = movieId;
    context.read<MovieDetailsViewModel>().getMovieDetails(movieId);
    Future.delayed(const Duration(seconds: 1), () {
      // ignore: use_build_context_synchronously
      context.read<MovieDetailsViewModel>().getSimilarMovies(movieId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MovieDetailsViewModel, MovieDetailsStates>(
        buildWhen:
            (previous, current) =>
                current is MovieDetailsLoadingState ||
                current is MovieDeatialsSuccessState ||
                current is MovieDetailsFailureState,
        builder: (context, state) {
          if (state is MovieDetailsLoadingState) {
            return const MovieDetailsScreenLoadingWidget();
          } else if (state is MovieDetailsFailureState) {
            return Center(child: Text(state.message));
          } else if (state is MovieDeatialsSuccessState) {
            return MovieDetailsSuccessWidget(movie: state.movie);
          } else {
            return const MovieDetailsScreenLoadingWidget();
          }
        },
      ),
    );
  }
}
