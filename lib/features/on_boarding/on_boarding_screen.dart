import 'package:flutter/material.dart';
import 'package:movie_app_new_design/core/l10n/localization/app_localizations.dart';
import 'package:movie_app_new_design/features/on_boarding/models/on_boarding_model.dart';
import 'package:movie_app_new_design/features/on_boarding/widgets/on_boarding_item.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController(initialPage: 0);
    final AppLocalizations locale = AppLocalizations.of(context)!;
    return Scaffold(
      body: PageView.builder(
        controller: pageController,
        itemBuilder: (context, index) {
          return OnBoardingItem(
            index: index,
            controller: pageController,
            model: OnBoardingModel.getOnBoardingData(locale)[index],
          );
        },
        physics: const NeverScrollableScrollPhysics(),
        itemCount: OnBoardingModel.getOnBoardingData(locale).length,
      ),
    );
  }
}
