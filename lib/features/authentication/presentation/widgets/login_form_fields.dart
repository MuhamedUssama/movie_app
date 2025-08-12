import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app_new_design/core/l10n/localization/app_localizations.dart';
import 'package:movie_app_new_design/core/utils/app_assets.dart';
import 'package:movie_app_new_design/core/utils/validation_utils.dart';
import 'package:movie_app_new_design/core/widgets/custom_text_field.dart';

import '../cubits/login_cubit/login_view_model.dart';

class LoginFormFields extends StatelessWidget {
  const LoginFormFields({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context)!;
    return Form(
      key: context.read<LoginViewModel>().formKey,
      child: Column(
        spacing: 24.h,
        children: [
          CustomTextField(
            controller: context.read<LoginViewModel>().emailController,
            hintText: locale.email,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            prefixIcon: SvgPicture.asset(AppIcons.email, fit: BoxFit.scaleDown),
            validator: (email) {
              return AppValidator.validateEmailAddress(
                locale: locale,
                email: email,
              );
            },
          ),
          CustomTextField(
            controller: context.read<LoginViewModel>().passwordController,
            hintText: locale.password,
            isPassword: true,
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.done,
            prefixIcon: SvgPicture.asset(
              AppIcons.password,
              fit: BoxFit.scaleDown,
            ),
            validator: (password) {
              return AppValidator.validatePassword(
                password: password,
                locale: locale,
              );
            },
          ),
        ],
      ),
    );
  }
}
