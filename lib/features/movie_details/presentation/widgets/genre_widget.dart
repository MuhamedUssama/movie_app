import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GenreWidget extends StatelessWidget {
  final String genre;
  const GenreWidget({super.key, required this.genre});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(12.r),
      ),
      constraints: BoxConstraints(maxWidth: 122.w, minWidth: 122.w),
      child: Center(
        child: Text(genre, style: Theme.of(context).textTheme.bodyMedium),
      ),
    );
  }
}
