import 'package:flutter/material.dart';
import 'package:movie_app_new_design/core/routes/routes_name.dart';
import 'package:movie_app_new_design/features/on_boarding/intro_screen.dart';
import 'package:movie_app_new_design/features/on_boarding/on_boarding_screen.dart';

abstract class AppRouter {
  static Route appRouter(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.introScreen:
        return MaterialPageRoute(
          builder: (_) => const IntroScreen(),
          settings: settings,
        );

      case RoutesName.onBoarding:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingScreen(),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const NotFoundScreen(),
          settings: settings,
        );
    }
  }
}

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Page not found')));
  }
}
