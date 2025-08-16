import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_new_design/core/models/movies/movies_model.dart';
import 'package:movie_app_new_design/core/widgets/movie_card.dart';
import 'package:movie_app_new_design/core/widgets/shimmer_movie_card.dart';
import 'package:movie_app_new_design/features/home/tabs/home_tab/presentation/cubit/home_tab_states.dart';
import 'package:movie_app_new_design/features/home/tabs/home_tab/presentation/cubit/home_tab_view_model.dart';

class MoviesByGenreList extends StatelessWidget {
  const MoviesByGenreList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 220.h,
        child: BlocBuilder<HomeTabViewModel, HomeTabStates>(
          buildWhen:
              (previous, current) =>
                  current is MoviesByGenereLoadingState ||
                  current is MoviesByGenereSuccessState ||
                  current is MoviesByGenereFalireState,

          builder: (context, state) {
            if (state is MoviesByGenereLoadingState) {
              return ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return SizedBox(width: 146.w, child: ShimmerMovieCard());
                },
                separatorBuilder: (context, index) => const SizedBox(width: 16),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: 10,
              );
            } else if (state is MoviesByGenereFalireState) {
              return Center(child: Text(state.message));
            } else if (state is MoviesByGenereSuccessState) {
              return ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final Movies? movie = state.movie.data?.movies?[index];
                  return SizedBox(
                    width: 146.w,
                    child: MovieCard(
                      imagePath: movie?.largeCoverImage ?? '',
                      rating: movie?.rating.toString() ?? '',
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(width: 16),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: state.movie.data?.movies?.length ?? 0,
              );
            } else {
              return ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return SizedBox(width: 146.w, child: ShimmerMovieCard());
                },
                separatorBuilder: (context, index) => const SizedBox(width: 16),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: 10,
              );
            }
          },
        ),
      ),
    );
  }
}
