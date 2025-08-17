import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_new_design/core/l10n/localization/app_localizations.dart';
import 'package:movie_app_new_design/features/movie_details/data/models/movie_details_models/movie_model.dart';

import 'before_similar_movies_widget.dart';
import 'cast_widget.dart';
import 'genre_widget.dart';
import 'header_widget.dart';
import 'similar_movies.dart';
import 'summary_widget.dart';

class MovieDetailsSuccessWidget extends StatelessWidget {
  final Movie? movie;
  const MovieDetailsSuccessWidget({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context)!;
    final TextTheme textTheme = Theme.of(context).textTheme;
    return CustomScrollView(
      slivers: <Widget>[
        HeaderWidget(movie: movie),
        BeforeSimilarMoviesWidget(movie: movie),
        const SimilarMovies(),
        SummaryWidget(movie: movie),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          sliver: SliverList.builder(
            itemCount: movie?.cast.length ?? 0,
            itemBuilder: (context, index) {
              return CastWidget(
                cast: movie!.cast[index],
                isLast: index == movie!.cast.length - 1,
              );
            },
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              spacing: 16.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(locale.genres, style: textTheme.displayLarge),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Wrap(
              spacing: 16.w,
              runSpacing: 8.h,
              children: List.generate(
                movie?.genres.length ?? 0,
                (index) => GenreWidget(genre: movie?.genres[index] ?? ''),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(child: const SizedBox(height: 16)),
      ],
    );
  }
}
