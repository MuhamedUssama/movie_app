import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_new_design/core/utils/app_assets.dart';
import 'package:shimmer/shimmer.dart';

class ScreenShotWidget extends StatelessWidget {
  final String? imagePath;
  const ScreenShotWidget({super.key, this.imagePath});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.r),
      child: CachedNetworkImage(
        height: 167.h,
        width: double.infinity,
        fit: BoxFit.cover,
        imageUrl: imagePath ?? NetworkImages.noImageAvailable,
        placeholder: (context, url) => const ScreenShotShimmerWidget(),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }
}

class ScreenShotShimmerWidget extends StatelessWidget {
  const ScreenShotShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[900]!,
      highlightColor: Colors.grey[800]!,
      child: Container(
        height: 167.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey[900]!,
          borderRadius: BorderRadius.circular(16.r),
        ),
      ),
    );
  }
}
