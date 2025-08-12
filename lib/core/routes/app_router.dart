import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_new_design/core/di/di.dart';
import 'package:movie_app_new_design/core/routes/routes_name.dart';
import 'package:movie_app_new_design/features/authentication/presentation/cubits/forget_password_cubit/forget_password_view_model.dart';
import 'package:movie_app_new_design/features/authentication/presentation/cubits/login_cubit/login_view_model.dart';
import 'package:movie_app_new_design/features/authentication/presentation/cubits/register_cubit/register_view_model.dart';
import 'package:movie_app_new_design/features/authentication/presentation/screens/forget_password_screen.dart';
import 'package:movie_app_new_design/features/authentication/presentation/screens/login_screen.dart';
import 'package:movie_app_new_design/features/authentication/presentation/screens/register_screen.dart';
import 'package:movie_app_new_design/features/home/home_screen.dart';
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

      case RoutesName.registerScreen:
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider(
              create: (context) => getIt.get<RegisterViewModel>(),
              child: const RegisterScreen(),
            );
          },
          settings: settings,
        );

      case RoutesName.loginScreen:
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider(
              create: (context) => getIt.get<LoginViewModel>(),
              child: const LoginScreen(),
            );
          },
          settings: settings,
        );

      case RoutesName.forgotPasswordScreen:
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider(
              create: (context) => getIt.get<ForgetPasswordViewModel>(),
              child: const ForgetPasswordScreen(),
            );
          },
          settings: settings,
        );

      case RoutesName.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
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
