import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movie_app_new_design/core/l10n/localization/app_localizations.dart';
import 'package:movie_app_new_design/core/routes/routes_name.dart';

import '../cubits/login_cubit/login_states.dart';
import '../cubits/login_cubit/login_view_model.dart';
import '../widgets/login_screen_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context)!;
    return Scaffold(
      body: BlocListener<LoginViewModel, LoginStates>(
        listener: (context, state) {
          if (state is LoginSuccessState ||
              state is LoginWithGoogleSuccessState) {
            Fluttertoast.showToast(
              msg: locale.loginSuccessful,
              backgroundColor: Theme.of(context).colorScheme.primary,
              textColor: Theme.of(context).colorScheme.surface,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
            );
            Navigator.of(
              context,
            ).pushNamedAndRemoveUntil(RoutesName.homeScreen, (route) => false);
          } else if (state is LoginFaliureState) {
            Fluttertoast.showToast(
              msg: state.message,
              backgroundColor: Theme.of(context).colorScheme.error,
              textColor: Theme.of(context).colorScheme.onSurface,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
            );
          }
        },
        child: LoginScreenBody(),
      ),
    );
  }
}
