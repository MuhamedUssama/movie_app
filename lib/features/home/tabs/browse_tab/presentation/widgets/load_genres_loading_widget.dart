import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class LoadGenresLoadingWidget extends StatelessWidget {
  const LoadGenresLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: SizedBox(
        height: 80.h, // Approximate height for the tab bar
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          itemCount: 5, // Show 5 dummy items
          itemBuilder: (context, index) {
            return Shimmer.fromColors(
              baseColor: Colors.grey[900]!,
              highlightColor: Colors.grey[800]!,
              child: Container(
                height: 48.h,
                width: 100.w,
                margin: EdgeInsets.only(right: 8.w),
                decoration: BoxDecoration(
                  color: Colors.grey[800]!,
                  borderRadius: BorderRadius.circular(16.r),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
