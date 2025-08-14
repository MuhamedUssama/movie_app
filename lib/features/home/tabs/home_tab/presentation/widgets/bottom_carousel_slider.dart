import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_new_design/core/models/movies/movies_model.dart';
import 'package:movie_app_new_design/core/utils/app_assets.dart';
import 'package:movie_app_new_design/features/home/tabs/home_tab/presentation/cubit/home_tab_view_model.dart';

class BottomCarouselSlider extends StatelessWidget {
  final List<Movies> movies;

  const BottomCarouselSlider({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      carouselController:
          context.read<HomeTabViewModel>().bottomCarouselController,
      itemCount: movies.length,
      itemBuilder: (context, index, realIndex) {
        return CachedNetworkImage(
          imageUrl:
              movies[index].largeCoverImage ?? NetworkImages.noImageAvailable,
          fit: BoxFit.cover,
          placeholder:
              (context, url) =>
                  const Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        );
      },
      options: CarouselOptions(
        height: MediaQuery.sizeOf(context).height * 0.76,
        viewportFraction: 1.0,
        autoPlay: false,
        onPageChanged: (index, reason) {
          context.read<HomeTabViewModel>().changeMovieCardIndex(index);
        },
      ),
    );
  }
}
