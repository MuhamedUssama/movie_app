import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:movie_app_new_design/core/l10n/localization/app_localizations.dart';
import 'package:movie_app_new_design/core/routes/routes_name.dart';
import 'package:movie_app_new_design/core/utils/app_assets.dart';

import '../cubits/login_cubit/login_states.dart';
import '../cubits/login_cubit/login_view_model.dart';
import 'dont_have_account.dart';
import 'login_form_fields.dart';
import 'or_widget.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final AppLocalizations locale = AppLocalizations.of(context)!;
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          children: [
            AspectRatio(aspectRatio: 2.5, child: Image.asset(AppImages.logo)),
            SizedBox(height: height * 0.07),
            const LoginFormFields(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      RoutesName.forgotPasswordScreen,
                    );
                  },
                  child: Text(
                    '${locale.forgotPassword} ?',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
            ),
            SizedBox(height: 24.h),
            ElevatedButton(
              onPressed: () {
                context.read<LoginViewModel>().loginWithEmailAndPassword();
              },
              child: BlocBuilder<LoginViewModel, LoginStates>(
                buildWhen:
                    (previous, current) =>
                        current is LoginLoadingState ||
                        current is LoginSuccessState ||
                        current is LoginFaliureState,
                builder: (context, state) {
                  if (state is LoginLoadingState) {
                    return LoadingAnimationWidget.staggeredDotsWave(
                      color: Theme.of(context).colorScheme.onPrimary,
                      size: 40,
                    );
                  }
                  return Text(locale.login);
                },
              ),
            ),
            const SizedBox(height: 16),
            const DontHaveAccount(),
            SizedBox(height: 8.h),
            const ORWidget(),
            SizedBox(height: 24.h),
            ElevatedButton(
              onPressed: () {
                context.read<LoginViewModel>().loginWithGoogle();
              },
              child: BlocBuilder<LoginViewModel, LoginStates>(
                buildWhen:
                    (previous, current) =>
                        current is LoginWithGoogleLoadingState ||
                        current is LoginWithGoogleSuccessState ||
                        current is LoginFaliureState,

                builder: (context, state) {
                  if (state is LoginWithGoogleLoadingState) {
                    return LoadingAnimationWidget.staggeredDotsWave(
                      color: Theme.of(context).colorScheme.onPrimary,
                      size: 40,
                    );
                  }
                  return Row(
                    spacing: 12.w,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(AppIcons.google, fit: BoxFit.scaleDown),
                      Text(locale.loginWithGoogle),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
