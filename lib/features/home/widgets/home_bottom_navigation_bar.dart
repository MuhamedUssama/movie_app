import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_new_design/core/utils/app_assets.dart';
import 'package:movie_app_new_design/features/home/cubit/home_screen_view_model.dart';

import 'home_bottom_navigation_bar_item.dart';

class HomeBottomNavigationBar extends StatelessWidget {
  const HomeBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    int currentIndex = context.watch<HomeScreenViewModel>().currentIndex;

    return Theme(
      data: Theme.of(context).copyWith(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
      ),
      child: BottomAppBar(
        height: 96.h,
        color: Colors.transparent,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.r),
          child: BottomNavigationBar(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndex,
            onTap: (index) {
              context.read<HomeScreenViewModel>().changeTab(index);
            },
            elevation: 0,
            enableFeedback: false,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: <BottomNavigationBarItem>[
              HomeBottomNavigationBarItem(
                iconPath: AppIcons.home,
                activeIconPath: AppIcons.selectedHome,
                isSelected: currentIndex == 0,
              ),
              HomeBottomNavigationBarItem(
                iconPath: AppIcons.search,
                activeIconPath: AppIcons.selectedSearch,
                isSelected: currentIndex == 1,
              ),
              HomeBottomNavigationBarItem(
                iconPath: AppIcons.browse,
                activeIconPath: AppIcons.selectedBrowse,
                isSelected: currentIndex == 2,
              ),
              HomeBottomNavigationBarItem(
                iconPath: AppIcons.profile,
                activeIconPath: AppIcons.selectedProfile,
                isSelected: currentIndex == 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
