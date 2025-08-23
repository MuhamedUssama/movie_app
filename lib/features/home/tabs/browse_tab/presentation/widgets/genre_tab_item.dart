import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GenreTabItem extends StatelessWidget {
  final String genre;
  final bool isSelected;

  const GenreTabItem({
    super.key,
    required this.isSelected,
    required this.genre,
  });

  @override
  Widget build(BuildContext context) {
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
