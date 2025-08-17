import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_new_design/core/utils/app_assets.dart';
import 'package:movie_app_new_design/features/movie_details/data/models/movie_details_models/movie_model.dart';
import 'package:movie_app_new_design/features/movie_details/presentation/cubit/movie_details_view_model.dart';

class HeaderWidget extends StatelessWidget {
  final Movie? movie;
  const HeaderWidget({super.key, this.movie});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Stack(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.7,
            width: double.infinity,
            child: Hero(
              tag: context.read<MovieDetailsViewModel>().movieId,
              child: CachedNetworkImage(
                imageUrl:
                    movie?.largeCoverImage ?? NetworkImages.noImageAvailable,
                fit: BoxFit.cover,
                placeholder:
                    (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
          ),
          Positioned.fill(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    Theme.of(context).colorScheme.surface.withValues(alpha: .2),
                    Theme.of(context).colorScheme.surface,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const <double>[0, 1],
                ),
              ),
              child: SafeArea(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            size: 32.r,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.bookmark_rounded, size: 32.r),
                        ),
                      ],
                    ),
                    const Spacer(),
                    CircleAvatar(
                      radius: 50.r,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      child: CircleAvatar(
                        radius: 45.r,
                        backgroundColor:
                            Theme.of(context).colorScheme.onSecondary,
                        child: CircleAvatar(
                          radius: 32.r,
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          child: Icon(
                            Icons.play_arrow_rounded,
                            size: 40.r,
                            color: Theme.of(context).colorScheme.onSecondary,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      movie?.titleEnglish ?? '',
                      style: Theme.of(context).textTheme.displayLarge,
                      softWrap: true,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      movie?.year.toString() ?? '',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
