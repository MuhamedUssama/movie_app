import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_new_design/core/widgets/movie_card.dart';

class MoviesLoadingStateWidget extends StatelessWidget {
  const MoviesLoadingStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      sliver: SliverGrid.builder(
        itemCount: 8,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 9 / 14,
          crossAxisSpacing: 20.w,
          mainAxisSpacing: 16.h,
        ),
        itemBuilder: (context, index) => CardPlaceHolder(),
      ),
    );
  }
}
