import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_new_design/core/widgets/movie_card.dart';
import 'package:movie_app_new_design/features/movie_details/presentation/cubit/movie_details_states.dart';
import 'package:movie_app_new_design/features/movie_details/presentation/cubit/movie_details_view_model.dart';

class SimilarMovies extends StatelessWidget {
  const SimilarMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsViewModel, MovieDetailsStates>(
      buildWhen:
          (previous, current) =>
              current is SimilarMoviesLoadingState ||
              current is SimilarMoviesSuccessState ||
              current is SimilarMoviesFailureState,

      builder: (context, state) {
        if (state is MovieDetailsFailureState) {
          return Center(child: Text(state.message));
        } else if (state is SimilarMoviesLoadingState) {
          return const SimilarMoviesLoadingWidget();
        } else if (state is SimilarMoviesSuccessState) {
          return SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            sliver: SliverGrid.builder(
              itemCount: state.movies.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 9 / 14,
                crossAxisSpacing: 20.w,
                mainAxisSpacing: 16.h,
              ),
              itemBuilder: (context, index) {
                return MovieCard(
                  movieId: state.movies[index].id ?? 15,
                  rating: state.movies[index].rating.toString(),
                  imagePath: state.movies[index].mediumCoverImage,
                );
              },
            ),
          );
        } else {
          return const SimilarMoviesLoadingWidget();
        }
      },
    );
  }
}

class SimilarMoviesLoadingWidget extends StatelessWidget {
  const SimilarMoviesLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      sliver: SliverGrid.builder(
        itemCount: 4,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 9 / 14,
          crossAxisSpacing: 20.w,
          mainAxisSpacing: 16.h,
        ),
        itemBuilder: (context, index) => CardPlaceHolder(),
      ),
    );
  }
}
