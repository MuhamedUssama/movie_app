import 'package:flutter/material.dart';
import 'package:movie_app_new_design/core/l10n/localization/app_localizations.dart';
import 'package:movie_app_new_design/core/theme/app_colors.dart';
import 'package:movie_app_new_design/core/utils/app_assets.dart';

class OnBoardingModel {
  final String title;
  final String? description;
  final String imagePath;
  final Color gradientColor;

  const OnBoardingModel({
    required this.title,
    this.description,
    required this.imagePath,
    required this.gradientColor,
  });

  static List<OnBoardingModel> getOnBoardingData(AppLocalizations locale) {
    return [
      OnBoardingModel(
        title: locale.onBoardingHeader1,
        description: locale.onBoardingDescription1,
        imagePath: AppImages.onBoarding2,
        gradientColor: AppColors.onBoarding1,
      ),
      OnBoardingModel(
        title: locale.onBoardingHeader2,
        description: locale.onBoardingDescription2,
        imagePath: AppImages.onBoarding3,
        gradientColor: AppColors.onBoarding2,
      ),
      OnBoardingModel(
        title: locale.onBoardingHeader3,
        description: locale.onBoardingDescription3,
        imagePath: AppImages.onBoarding4,
        gradientColor: AppColors.onBoarding3,
      ),
      OnBoardingModel(
        title: locale.onBoardingHeader4,
        description: locale.onBoardingDescription4,
        imagePath: AppImages.onBoarding5,
        gradientColor: AppColors.onBoarding4,
      ),
      OnBoardingModel(
        title: locale.onBoardingHeader5,
        imagePath: AppImages.onBoarding6,
        gradientColor: AppColors.onBoarding5,
      ),
    ];
  }
}
