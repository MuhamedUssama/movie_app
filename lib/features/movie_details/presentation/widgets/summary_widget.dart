import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_new_design/core/l10n/localization/app_localizations.dart';
import 'package:movie_app_new_design/features/movie_details/data/models/movie_details_models/movie_model.dart';

class SummaryWidget extends StatelessWidget {
  final Movie? movie;
  const SummaryWidget({super.key, this.movie});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context)!;
    final TextTheme textTheme = Theme.of(context).textTheme;
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          spacing: 16.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(locale.summary, style: textTheme.displayLarge),
            Text(movie?.descriptionFull ?? '', style: textTheme.bodyMedium),
            Text(locale.cast, style: textTheme.displayLarge),
          ],
        ),
      ),
    );
  }
}
