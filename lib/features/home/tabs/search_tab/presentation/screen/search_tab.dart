import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_new_design/core/di/di.dart';
import 'package:movie_app_new_design/features/home/tabs/search_tab/presentation/cubit/search_tab_view_model.dart';

import '../widgets/search_tab_custom_scroll_view.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<SearchTabViewModel>(),
      child: SearchTabCustomScrollView(),
    );
  }
}
