import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app_new_design/core/l10n/localization/app_localizations.dart';
import 'package:movie_app_new_design/core/utils/app_assets.dart';
import 'package:movie_app_new_design/features/home/tabs/home_tab/presentation/cubit/home_tab_view_model.dart';

class GenreRowWidget extends StatelessWidget {
  const GenreRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context)!;
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              context.watch<HomeTabViewModel>().randomGenre,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(fontSize: 20.sp),
            ),
            GestureDetector(
              onTap: () {},
              child: Row(
                spacing: 4,
                children: [
                  Text(
                    locale.seeMore,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  SvgPicture.asset(AppIcons.arrowForward),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
