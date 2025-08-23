import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../cubit/browse_tab_view_model.dart';

class LoadGenresLoadingWidget extends StatelessWidget {
  const LoadGenresLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: TabBar(
        automaticIndicatorColorAdjustment: false,
        isScrollable: true,
        enableFeedback: false,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16),
        tabs: List.generate(
          context.watch<BrowseTabViewModel>().listOfGenres.length,
          (index) => Shimmer.fromColors(
            baseColor: Colors.grey[900]!,
            highlightColor: Colors.grey[800]!,
            child: Container(
              height: 48.h,
              width: 100.w,
              margin: EdgeInsets.symmetric(horizontal: 4.w),
              decoration: BoxDecoration(
                color: Colors.grey[800]!,
                borderRadius: BorderRadius.circular(16.r),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
