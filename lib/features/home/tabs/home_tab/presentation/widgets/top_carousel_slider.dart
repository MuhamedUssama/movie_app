import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_new_design/core/models/movies/movies_model.dart';
import 'package:movie_app_new_design/core/widgets/movie_card.dart';
import 'package:movie_app_new_design/features/home/tabs/home_tab/presentation/cubit/home_tab_view_model.dart';

class TopCarouselSlider extends StatelessWidget {
  final List<Movies> movies;

  const TopCarouselSlider({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: movies.length,
      carouselController:
          context.read<HomeTabViewModel>().topCarouselController,
      itemBuilder: (context, index, realIndex) {
        return MovieCard(
          imagePath: movies[index].largeCoverImage,
          rating: movies[index].rating.toString(),
        );
      },
      options: CarouselOptions(
        aspectRatio: 9 / 16,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 5),
        enlargeCenterPage: true,
        onPageChanged: (index, reason) {
          context.read<HomeTabViewModel>().changeMovieCardIndex(index);
        },
        viewportFraction: 0.52,
        enlargeFactor: .3,
        height: 340.h,
      ),
    );
  }
}
