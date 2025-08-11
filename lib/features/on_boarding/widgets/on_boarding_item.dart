import 'package:flutter/material.dart';
import 'package:movie_app_new_design/features/on_boarding/models/on_boarding_model.dart';

import 'on_boarding_content.dart';

class OnBoardingItem extends StatelessWidget {
  final OnBoardingModel model;
  final int index;
  final PageController controller;

  const OnBoardingItem({
    super.key,
    required this.model,
    required this.index,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: Image.asset(model.imagePath, fit: BoxFit.cover)),
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  model.gradientColor.withValues(alpha: 0),
                  model.gradientColor,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: OnBoardingContent(
            index: index,
            model: model,
            controller: controller,
          ),
        ),
      ],
    );
  }
}
