import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/search_tab_view_model.dart';
import 'search_tab_body.dart';
import 'search_text_field.dart';

class SearchTabCustomScrollView extends StatelessWidget {
  const SearchTabCustomScrollView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: context.read<SearchTabViewModel>().scrollController,
      slivers: <Widget>[const SearchTextField(), const SearchTabBody()],
    );
  }
}
