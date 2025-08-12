import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:movie_app_new_design/core/l10n/localization/app_localizations.dart';
import 'package:movie_app_new_design/core/utils/app_assets.dart';
import 'package:movie_app_new_design/core/utils/validation_utils.dart';
import 'package:movie_app_new_design/core/widgets/custom_text_field.dart';
import 'package:movie_app_new_design/features/authentication/presentation/cubits/forget_password_cubit/forget_password_states.dart';
import 'package:movie_app_new_design/features/authentication/presentation/cubits/forget_password_cubit/forget_password_view_model.dart';

class ForgetPasswordScreenBody extends StatelessWidget {
  const ForgetPasswordScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context)!;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Image.asset(AppImages.forgetPassword),
          Form(
            key: context.read<ForgetPasswordViewModel>().formKey,
            child: CustomTextField(
              controller:
                  context.read<ForgetPasswordViewModel>().emailController,
              hintText: locale.email,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.send,
              prefixIcon: SvgPicture.asset(
                AppIcons.email,
                fit: BoxFit.scaleDown,
              ),
              validator: (email) {
                return AppValidator.validateEmailAddress(
                  locale: locale,
                  email: email,
                );
              },
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              context.read<ForgetPasswordViewModel>().forgetPassword();
            },
            child: BlocBuilder<ForgetPasswordViewModel, ForgetPasswordStates>(
              buildWhen:
                  (previous, current) =>
                      current is ForgetPasswordSuccessState ||
                      current is ForgetPasswordErrorState ||
                      current is ForgetPasswordLoadingState,
              builder: (context, state) {
                if (state is ForgetPasswordLoadingState) {
                  return LoadingAnimationWidget.staggeredDotsWave(
                    color: Theme.of(context).colorScheme.onPrimary,
                    size: 40,
                  );
                }
                return Text(locale.verifyEmail);
              },
            ),
          ),
        ],
      ),
    );
  }
}
