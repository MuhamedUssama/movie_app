import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_new_design/core/utils/app_assets.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShimmerLastMoviesWidget extends StatelessWidget {
  const ShimmerLastMoviesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height * 0.63;
    final double width = MediaQuery.sizeOf(context).width;

    return Shimmer.fromColors(
      baseColor: Colors.grey[900]!,
      highlightColor: Colors.grey[800]!,
      child: Stack(
        children: [
          SizedBox(
            height: height,
            width: double.infinity,
            child: const _ShimmerBottomCarouselSlider(),
          ),

          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    Colors.grey[900]!.withValues(alpha: 0.8),
                    Colors.grey[900]!.withValues(alpha: 0.6),
                    Colors.grey[900]!,
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
                  width: width * .42,
                ),
              ),
            ),
          ),

          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: const _ShimmerTopCarouselSlider(),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                AppImages.watchNow,
                fit: BoxFit.cover,
                width: MediaQuery.sizeOf(context).width * .7,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ShimmerTopCarouselSlider extends StatelessWidget {
  const _ShimmerTopCarouselSlider();

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[900]!,
      highlightColor: Colors.grey[800]!,
      child: CarouselSlider.builder(
        itemCount: 10,
        itemBuilder: (context, index, realIndex) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: Container(color: Colors.grey[900]),
          );
        },
        options: CarouselOptions(
          aspectRatio: 9 / 16,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 5),
          enlargeCenterPage: true,
          viewportFraction: 0.52,
          enlargeFactor: .3,
          height: 340.h,
        ),
      ),
    );
  }
}

class _ShimmerBottomCarouselSlider extends StatelessWidget {
  const _ShimmerBottomCarouselSlider();

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[900]!,
      highlightColor: Colors.grey[800]!,
      child: CarouselSlider.builder(
        itemCount: 10,
        itemBuilder: (context, index, realIndex) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.grey[900],
          );
        },
        options: CarouselOptions(
          height: double.infinity,
          viewportFraction: 1.0,
          autoPlay: false,
        ),
      ),
    );
  }
}
