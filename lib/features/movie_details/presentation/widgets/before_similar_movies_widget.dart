import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_new_design/core/l10n/localization/app_localizations.dart';
import 'package:movie_app_new_design/core/utils/app_assets.dart';
import 'package:movie_app_new_design/features/movie_details/data/models/movie_details_models/movie_model.dart';

import 'rating_widget.dart';
import 'screen_shot_widget.dart';

class BeforeSimilarMoviesWidget extends StatelessWidget {
  final Movie? movie;
  const BeforeSimilarMoviesWidget({super.key, this.movie});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context)!;
    final TextTheme textTheme = Theme.of(context).textTheme;
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          spacing: 16.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            FilledButton(
              onPressed: () {},
              child: Text(locale.watch, style: textTheme.titleMedium),
            ),
            Row(
              spacing: 16.w,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RatingWidget(
                  value: movie?.likeCount.toString() ?? '',
                  iconPth: AppIcons.favorite,
                ),
                RatingWidget(
                  value: movie?.runtime.toString() ?? '',
                  iconPth: AppIcons.watch,
                ),
                RatingWidget(
                  value: movie?.rating.toString() ?? '',
                  iconPth: AppIcons.star,
                ),
              ],
            ),
            Text(locale.screenShots, style: textTheme.displayLarge),
            Column(
              spacing: 12.h,
              children: [
                ScreenShotWidget(imagePath: movie!.largeScreenshotImage1),
                ScreenShotWidget(imagePath: movie!.largeScreenshotImage2),
                ScreenShotWidget(imagePath: movie!.largeScreenshotImage3),
              ],
            ),
            Text(locale.similar, style: textTheme.displayLarge),
          ],
        ),
      ),
    );
  }
}
