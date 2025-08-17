import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class RatingWidget extends StatelessWidget {
  final String value;
  final String iconPth;
  const RatingWidget({super.key, required this.value, required this.iconPth});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        spacing: 12.w,
        children: <Widget>[
          SvgPicture.asset(iconPth, fit: BoxFit.scaleDown, width: 24.w),
          Text(
            value,
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontSize: 18.sp),
          ),
        ],
      ),
    );
  }
}
