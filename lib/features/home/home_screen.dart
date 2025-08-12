import 'package:flutter/material.dart';

import 'widgets/home_bottom_navigation_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(bottomNavigationBar: const HomeBottomNavigationBar());
  }
}
