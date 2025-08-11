import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_new_design/core/l10n/localization/app_localizations.dart';
import 'package:movie_app_new_design/core/routes/routes_name.dart';
import 'package:movie_app_new_design/core/theme/app_colors.dart';
import 'package:movie_app_new_design/core/utils/app_assets.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              AppImages.onBoarding1,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.darkGrey,
                    AppColors.dark.withValues(alpha: .5),
                    AppColors.dark.withValues(alpha: .91),
                    AppColors.dark,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [0.0, 0.3, 0.7, 1.0],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  AppLocalizations.of(context)!.introHeader,
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
                Row(),
                SizedBox(height: 16.h),
                Text(
                  AppLocalizations.of(context)!.introDescription,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: AppColors.white.withValues(alpha: .6),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 24.h),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                      context,
                      RoutesName.onBoarding,
                    );
                  },
                  child: Text(AppLocalizations.of(context)!.exploreNow),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
