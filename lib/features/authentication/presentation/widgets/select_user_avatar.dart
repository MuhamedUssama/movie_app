import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_new_design/core/models/avarats/avatars_model.dart';
import 'package:movie_app_new_design/features/authentication/presentation/cubits/register_cubit/register_view_model.dart';

class SelectUserAvatar extends StatelessWidget {
  const SelectUserAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: AvatarsModel.avatars.length,
      itemBuilder: (context, index, realIndex) {
        return Image.asset(AvatarsModel.avatars[index].imagePath);
      },
      options: CarouselOptions(
        viewportFraction: 0.38,
        initialPage: 3,
        enableInfiniteScroll: false,
        enlargeCenterPage: true,
        aspectRatio: 2.4,
        pageSnapping: true,
        animateToClosest: true,
        enlargeFactor: .48,
        onPageChanged: (index, reason) {
          context.read<RegisterViewModel>().selectedAvatar =
              AvatarsModel.avatars[index].id;
        },
      ),
    );
  }
}
