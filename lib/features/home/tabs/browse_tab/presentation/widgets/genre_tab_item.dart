import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_new_design/features/home/tabs/browse_tab/presentation/cubit/browse_tab_view_model.dart';

class GenreTabItem extends StatelessWidget {
  final String genre;
  final int index;

  const GenreTabItem({super.key, required this.index, required this.genre});

  @override
  Widget build(BuildContext context) {
    final bool isSelected = context.select<BrowseTabViewModel, bool>(
      (viewModel) => viewModel.currentTabIndex == index,
    );
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: isSelected ? colorScheme.primary : colorScheme.onPrimary,
        border: Border.all(color: colorScheme.primary, width: 1),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Text(
        genre,
        style:
            isSelected
                ? Theme.of(context).tabBarTheme.labelStyle
                : Theme.of(context).tabBarTheme.unselectedLabelStyle,
      ),
    );
  }
}
