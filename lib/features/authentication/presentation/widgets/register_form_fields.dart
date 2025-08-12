import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app_new_design/core/l10n/localization/app_localizations.dart';
import 'package:movie_app_new_design/core/utils/app_assets.dart';
import 'package:movie_app_new_design/core/utils/validation_utils.dart';
import 'package:movie_app_new_design/core/widgets/custom_text_field.dart';
import 'package:movie_app_new_design/features/authentication/presentation/cubits/register_cubit/register_view_model.dart';

class RegisterFormFields extends StatelessWidget {
  const RegisterFormFields({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context)!;
    return Form(
      key: context.read<RegisterViewModel>().formKey,
      child: Column(
        spacing: 24.h,
        children: <Widget>[
          CustomTextField(
            hintText: locale.name,
            controller: context.read<RegisterViewModel>().nameController,
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            validator: (name) {
              return AppValidator.validateFieldIsNotEmpty(
                value: name,
                message: locale.emptyName,
              );
            },
            prefixIcon: SvgPicture.asset(AppIcons.name, fit: BoxFit.scaleDown),
          ),
          CustomTextField(
            hintText: locale.email,
            controller: context.read<RegisterViewModel>().emailController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            prefixIcon: SvgPicture.asset(AppIcons.email, fit: BoxFit.scaleDown),
            validator: (email) {
              return AppValidator.validateFieldIsNotEmpty(
                value: email,
                message: locale.emptyEmailAddress,
              );
            },
          ),
          CustomTextField(
            hintText: locale.password,
            isPassword: true,
            controller: context.read<RegisterViewModel>().passwordController,
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.next,
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
          CustomTextField(
            hintText: locale.confirmPassword,
            isPassword: true,
            controller:
                context.read<RegisterViewModel>().confirmPasswordController,
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.next,
            prefixIcon: SvgPicture.asset(
              AppIcons.password,
              fit: BoxFit.scaleDown,
            ),
            validator: (confirmPassword) {
              return AppValidator.validateConfirmPassword(
                password:
                    context.read<RegisterViewModel>().passwordController.text,
                confirmPassword: confirmPassword,
                locale: locale,
              );
            },
          ),

          CustomTextField(
            hintText: locale.phoneNumber,
            controller: context.read<RegisterViewModel>().phoneController,
            keyboardType: TextInputType.phone,
            textInputAction: TextInputAction.done,
            prefixIcon: SvgPicture.asset(AppIcons.phone, fit: BoxFit.scaleDown),
            validator: (phone) {
              return AppValidator.validateFieldIsNotEmpty(
                value: phone,
                message: locale.emptyPhoneNumber,
              );
            },
          ),
        ],
      ),
    );
  }
}
