import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movie_app_new_design/core/l10n/localization/app_localizations.dart';

import '../cubits/register_cubit/register_states.dart';
import '../cubits/register_cubit/register_view_model.dart';
import '../widgets/register_screen_body.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(locale.register)),
      body: BlocListener<RegisterViewModel, RegisterStates>(
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            Fluttertoast.showToast(
              msg: locale.accountCreated,
              backgroundColor: Theme.of(context).colorScheme.primary,
              textColor: Theme.of(context).colorScheme.surface,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
            );
          } else if (state is RegisterFaliureState) {
            Fluttertoast.showToast(
              msg: state.message,
              backgroundColor: Theme.of(context).colorScheme.error,
              textColor: Theme.of(context).colorScheme.onSurface,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
            );
          }
        },
        child: RegisterScreenBody(),
      ),
    );
  }
}
