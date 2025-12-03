import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_new_design/core/models/movies/movie_model.dart';

import '../../../../../../core/widgets/movie_card.dart';

class LoadMoviesSuccessWidget extends StatelessWidget {
  final Movie movie;
  const LoadMoviesSuccessWidget({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        itemCount: movie.data?.movies?.length,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 9 / 14,
          crossAxisSpacing: 20.w,
          mainAxisSpacing: 16.h,
        ),
        itemBuilder: (context, index) {
          return MovieCard(
            movieId: movie.data?.movies?[index].id ?? 1,
            rating: movie.data?.movies?[index].rating.toString() ?? '',
            imagePath: movie.data?.movies?[index].largeCoverImage,
          );
        },
      ),
    );
  }
}
