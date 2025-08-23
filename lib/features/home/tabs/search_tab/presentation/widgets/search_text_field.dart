import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app_new_design/core/l10n/localization/app_localizations.dart';
import 'package:movie_app_new_design/core/utils/app_assets.dart';
import 'package:movie_app_new_design/core/widgets/custom_text_field.dart';
import 'package:movie_app_new_design/features/home/tabs/search_tab/presentation/cubit/search_tab_view_model.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      floating: true,
      toolbarHeight: 84.h,
      backgroundColor: Theme.of(context).colorScheme.surface,
      elevation: 0,
      shadowColor: Theme.of(context).colorScheme.surface,
      scrolledUnderElevation: 0,
      title: CustomTextField(
        controller: context.watch<SearchTabViewModel>().controller,
        hintText: AppLocalizations.of(context)!.search,
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.search,
        prefixIcon: SvgPicture.asset(AppIcons.search, fit: BoxFit.scaleDown),
        onFieldSubmitted: (query) {
          context.read<SearchTabViewModel>().search(query);
        },
      ),
    );
  }
}
