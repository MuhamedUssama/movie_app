import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app_new_design/core/utils/app_assets.dart';
import 'package:shimmer/shimmer.dart';

class MovieCard extends StatelessWidget {
  final String rating;
  final String? imagePath;
  const MovieCard({super.key, required this.rating, this.imagePath});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.r),
      child: Stack(
        children: [
          Positioned.fill(
            child: CachedNetworkImage(
              imageUrl: imagePath ?? NetworkImages.noImageAvailable,
              fit: BoxFit.cover,
              placeholder: (context, url) => const CardPlaceHolder(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: Theme.of(
                  context,
                ).colorScheme.surface.withValues(alpha: .71),
              ),
              child: Row(
                spacing: 5.w,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(rating),
                  SvgPicture.asset(AppIcons.star, height: 15.h, width: 15.w),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CardPlaceHolder extends StatelessWidget {
  const CardPlaceHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[900]!,
      highlightColor: Colors.grey[800]!,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: Container(color: Colors.grey[900]),
      ),
    );
  }
}
