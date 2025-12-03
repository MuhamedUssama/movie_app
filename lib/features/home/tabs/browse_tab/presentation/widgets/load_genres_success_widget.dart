import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_new_design/features/home/tabs/browse_tab/presentation/cubit/browse_tab_view_model.dart';

import 'genre_tab_item.dart';

class LoadGenresSuccessWidget extends StatelessWidget {
  final List<String> genres;

  const LoadGenresSuccessWidget({super.key, required this.genres});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: TabBar(
        automaticIndicatorColorAdjustment: false,
        isScrollable: true,
        enableFeedback: false,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        onTap: (index) {
          if (context.mounted) {
            HapticFeedback.vibrate();
            context.read<BrowseTabViewModel>().changeTabIndex(index);
          }
        },
        tabs:
            genres
                .asMap()
                .entries
                .map(
                  (entry) => GenreTabItem(genre: entry.value, index: entry.key),
                )
                .toList(),
      ),
    );
  }
}
