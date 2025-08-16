import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_new_design/core/di/di.dart';

import '../cubit/home_tab_view_model.dart';
import '../widgets/genre_row_widget.dart';
import '../widgets/last_movies_widget.dart';
import '../widgets/movies_by_genre_list.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<HomeTabViewModel>(),
      child: CustomScrollView(
        slivers: <Widget>[
          LastMoviesWidget(),
          GenreRowWidget(),
          MoviesByGenreList(),
          SliverToBoxAdapter(child: SizedBox(height: 24)),
        ],
      ),
    );
  }
}
