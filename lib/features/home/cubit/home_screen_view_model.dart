import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app_new_design/features/home/tabs/browse_tab/presentation/screen/browse_tab.dart';
import 'package:movie_app_new_design/features/home/tabs/home_tab/presentation/screen/home_tab.dart';
import 'package:movie_app_new_design/features/home/tabs/profile_tab/presentation/screen/profile_tab.dart';
import 'package:movie_app_new_design/features/home/tabs/search_tab/presentation/screen/search_tab.dart';

import 'home_screen_states.dart';

@injectable
class HomeScreenViewModel extends Cubit<HomeScreenState> {
  HomeScreenViewModel() : super(const HomeScreenInitial());

  int currentIndex = 0;

  List<Widget> tabs = [
    const HomeTab(),
    const SearchTab(),
    const BrowseTab(),
    const ProfileTab(),
  ];

  void changeTab(int index) {
    if (currentIndex != index) {
      currentIndex = index;
      emit(ChangeTabState(currentIndex));
    }
  }
}
