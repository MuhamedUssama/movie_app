import 'package:flutter/material.dart';
import 'package:movie_app_new_design/core/models/movies/movies_model.dart';
import 'package:movie_app_new_design/core/utils/app_assets.dart';

import 'bottom_carousel_slider.dart';
import 'top_carousel_slider.dart';

class LastMoviesSuccessWidget extends StatelessWidget {
  final List<Movies> movies;

  const LastMoviesSuccessWidget({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.68,
          width: double.infinity,
          child: BottomCarouselSlider(movies: movies),
        ),
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  Theme.of(context).colorScheme.surface.withValues(alpha: .8),
                  Theme.of(context).colorScheme.surface.withValues(alpha: .6),
                  Theme.of(context).colorScheme.surface,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const <double>[0, .47, 1],
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: SafeArea(
            child: Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                AppImages.availableNow,
                fit: BoxFit.cover,
                width: MediaQuery.sizeOf(context).width * .5,
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: TopCarouselSlider(movies: movies),
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              AppImages.watchNow,
              fit: BoxFit.cover,
              width: MediaQuery.sizeOf(context).width * .8,
            ),
          ),
        ),
      ],
    );
  }
}
