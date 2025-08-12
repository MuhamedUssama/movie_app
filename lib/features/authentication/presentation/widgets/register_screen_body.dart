import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:movie_app_new_design/core/l10n/localization/app_localizations.dart';
import 'package:movie_app_new_design/core/routes/routes_name.dart';

import '../cubits/register_cubit/register_states.dart';
import '../cubits/register_cubit/register_view_model.dart';
import 'register_form_fields.dart';
import 'select_user_avatar.dart';

class RegisterScreenBody extends StatelessWidget {
  const RegisterScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context)!;
    final TextTheme textTheme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SelectUserAvatar(),
          Text(locale.avatar, style: textTheme.bodyMedium),
          const SizedBox(height: 12),
          const RegisterFormFields(),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              context.read<RegisterViewModel>().register();
            },
            child: BlocBuilder<RegisterViewModel, RegisterStates>(
              buildWhen:
                  (previous, current) =>
                      current is RegisterLoadingState ||
                      current is RegisterFaliureState ||
                      current is RegisterSuccessState,
              builder: (context, state) {
                return state is RegisterLoadingState
                    ? LoadingAnimationWidget.staggeredDotsWave(
                      color: Theme.of(context).colorScheme.onPrimary,
                      size: 40,
                    )
                    : Text(locale.createAccount);
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(locale.alreadyHaveAccount, style: textTheme.bodyMedium),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, RoutesName.loginScreen);
                },
                child: Text(locale.login),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
