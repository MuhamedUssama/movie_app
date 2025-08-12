import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app_new_design/features/authentication/domain/usecases/forget_password_usecase.dart';

import 'forget_password_states.dart';

@injectable
class ForgetPasswordViewModel extends Cubit<ForgetPasswordStates> {
  final ForgetPasswordUsecase forgetPasswordUsecase;

  @factoryMethod
  ForgetPasswordViewModel(this.forgetPasswordUsecase)
    : super(const ForgetPasswordInitialState());

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  Future<void> forgetPassword() async {
    if (formKey.currentState!.validate()) {
      emit(const ForgetPasswordLoadingState());
      final result = await forgetPasswordUsecase(email: emailController.text);

      result.fold(
        (failure) => emit(
          ForgetPasswordErrorState(failure.message ?? 'An error occurred'),
        ),
        (success) => emit(ForgetPasswordSuccessState(success)),
      );
    }
  }
}
