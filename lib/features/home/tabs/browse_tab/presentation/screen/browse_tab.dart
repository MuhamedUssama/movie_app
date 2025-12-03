import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_new_design/core/di/di.dart';

import '../cubit/browse_tab_view_model.dart';
import '../widgets/browse_tab_body.dart';

class BrowseTab extends StatelessWidget {
  const BrowseTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<BrowseTabViewModel>(),
      child: const BrowseTabBody(),
    );
  }
}
