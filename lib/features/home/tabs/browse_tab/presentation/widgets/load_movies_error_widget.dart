import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_app_new_design/core/network/exceptions.dart';
import 'package:movie_app_new_design/core/utils/app_assets.dart';

class LoadMoviesErrorWidget extends StatelessWidget {
  final ServerException exception;

  const LoadMoviesErrorWidget({super.key, required this.exception});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        (exception is NoInternetConnectionException)
            ? Lottie.asset(LottieAnimations.noInternetConnection)
            : Lottie.asset(LottieAnimations.error),
        Text(exception.message ?? 'Somthing went wrong'),
      ],
    );
  }
}
