import 'package:flutter/widgets.dart';
import 'package:movie_app_new_design/core/widgets/movie_card.dart';

class LoadMoviesLoadingWidget extends StatelessWidget {
  const LoadMoviesLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        itemCount: 6,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 9 / 14,
          crossAxisSpacing: 20,
          mainAxisSpacing: 16,
        ),
        itemBuilder: (context, index) => const CardPlaceHolder(),
      ),
    );
  }
}
