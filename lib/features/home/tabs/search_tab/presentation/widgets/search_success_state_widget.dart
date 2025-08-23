import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_new_design/core/widgets/movie_card.dart';
import 'package:movie_app_new_design/core/models/movies/movies_model.dart';
import 'package:movie_app_new_design/features/home/tabs/search_tab/presentation/cubit/search_tab_states.dart';

class SearchSuccessStateWidget extends StatelessWidget {
  final List<Movies> movies;
  final SearchTabStates state;

  const SearchSuccessStateWidget({
    super.key,
    required this.movies,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      sliver: SliverGrid.builder(
        itemCount: movies.length + (state is PaginationLoadingState ? 1 : 0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 9 / 14,
          crossAxisSpacing: 20.w,
          mainAxisSpacing: 16.h,
        ),
        itemBuilder: (context, index) {
          if (state is PaginationLoadingState && index == movies.length) {
            return Center(child: CircularProgressIndicator());
          }
          return MovieCard(
            movieId: movies[index].id ?? 15,
            rating: movies[index].rating.toString(),
            imagePath: movies[index].largeCoverImage,
          );
        },
      ),
    );
  }
}
