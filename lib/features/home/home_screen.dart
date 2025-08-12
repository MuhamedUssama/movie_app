import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_new_design/features/home/cubit/home_screen_view_model.dart';

import 'widgets/home_bottom_navigation_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body:
          context.read<HomeScreenViewModel>().tabs[context
              .watch<HomeScreenViewModel>()
              .currentIndex],
      bottomNavigationBar: const HomeBottomNavigationBar(),
    );
  }
}
