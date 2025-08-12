import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_new_design/core/l10n/localization/app_localizations.dart';
import 'package:movie_app_new_design/core/routes/routes_name.dart';
import 'package:movie_app_new_design/features/on_boarding/models/on_boarding_model.dart';

class OnBoardingContent extends StatelessWidget {
  final int index;
  final OnBoardingModel model;
  final PageController controller;

  const OnBoardingContent({
    super.key,
    required this.index,
    required this.model,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return FadeInUp(
      duration: const Duration(milliseconds: 600),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.r),
            topRight: Radius.circular(40.r),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              model.title,
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            model.description != null
                ? SizedBox(height: 24.h)
                : const SizedBox.shrink(),
            model.description != null
                ? Text(
                  model.description!,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(fontSize: 16.sp),
                  textAlign: TextAlign.center,
                )
                : const SizedBox.shrink(),
            SizedBox(height: 24.h),
            ElevatedButton(
              onPressed: () {
                if (index < 4) {
                  controller.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                } else {
                  Navigator.pushReplacementNamed(
                    context,
                    RoutesName.loginScreen,
                  );
                }
              },
              child: Text(
                index < 4
                    ? AppLocalizations.of(context)!.next
                    : AppLocalizations.of(context)!.finish,
              ),
            ),
            index > 0 ? SizedBox(height: 16.h) : const SizedBox.shrink(),
            index > 0
                ? OutlinedButton(
                  onPressed: () {
                    controller.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: Text('Back'),
                )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
