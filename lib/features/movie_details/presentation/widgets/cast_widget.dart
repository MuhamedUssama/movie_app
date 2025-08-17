import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_new_design/core/utils/app_assets.dart';
import 'package:movie_app_new_design/features/movie_details/data/models/movie_details_models/cast_model.dart';
import 'package:shimmer/shimmer.dart';

class CastWidget extends StatelessWidget {
  final Cast cast;
  final bool isLast;
  const CastWidget({super.key, required this.cast, required this.isLast});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: EdgeInsets.only(bottom: isLast ? 0 : 8.h),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        spacing: 10.w,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: CachedNetworkImage(
              height: 70.h,
              width: 70.w,
              fit: BoxFit.cover,
              imageUrl: cast.urlSmallImage ?? NetworkImages.noImageAvailable,
              placeholder: (context, url) => const CastShimmerWidget(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          Flexible(
            child: Column(
              spacing: 10.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Name: ${cast.name}'),
                Text('Character: ${cast.characterName}'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CastShimmerWidget extends StatelessWidget {
  const CastShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[900]!,
      highlightColor: Colors.grey[800]!,
      child: Container(
        height: 70.h,
        width: 70.w,
        decoration: BoxDecoration(
          color: Colors.grey[900]!,
          borderRadius: BorderRadius.circular(16.r),
        ),
      ),
    );
  }
}
