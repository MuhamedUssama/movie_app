import 'package:flutter/material.dart';
import 'package:movie_app_new_design/core/l10n/localization/app_localizations.dart';
import 'package:movie_app_new_design/core/routes/routes_name.dart';

class DontHaveAccount extends StatelessWidget {
  const DontHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context)!;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          locale.dontHaveAccount,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, RoutesName.registerScreen);
          },
          child: Text(locale.createOne),
        ),
      ],
    );
  }
}
