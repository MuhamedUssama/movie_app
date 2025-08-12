import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movie_app_new_design/core/l10n/localization/app_localizations.dart';
import 'package:movie_app_new_design/features/authentication/presentation/cubits/forget_password_cubit/forget_password_states.dart';
import 'package:movie_app_new_design/features/authentication/presentation/cubits/forget_password_cubit/forget_password_view_model.dart';

import '../widgets/forget_password_screen_body.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(locale.forgotPassword)),
      body: BlocListener<ForgetPasswordViewModel, ForgetPasswordStates>(
        listener: (context, state) {
          if (state is ForgetPasswordSuccessState) {
            Fluttertoast.showToast(
              msg: state.message,
              backgroundColor: Theme.of(context).colorScheme.primary,
              textColor: Theme.of(context).colorScheme.surface,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
            );
          } else if (state is ForgetPasswordErrorState) {
            Fluttertoast.showToast(
              msg: state.message,
              backgroundColor: Theme.of(context).colorScheme.error,
              textColor: Theme.of(context).colorScheme.onSurface,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
            );
          }
        },
        child: ForgetPasswordScreenBody(),
      ),
    );
  }
}
