import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app_new_design/features/authentication/domain/usecases/vreify_account_usecase.dart';

import '../../../data/models/request/register_request_model.dart';
import '../../../domain/usecases/register_usecase.dart';
import 'register_states.dart';

@injectable
class RegisterViewModel extends Cubit<RegisterStates> {
  final RegisterUsecase _usecase;
  final VreifyAccountUsecase _vreifyAccountUsecase;

  @factoryMethod
  RegisterViewModel(this._usecase, this._vreifyAccountUsecase)
    : super(const RegisterInitState());

  String selectedAvatar = '1';

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  Future<void> register() async {
    if (formKey.currentState!.validate()) {
      emit(const RegisterLoadingState());

      final RegisterRequestModel requestModel = RegisterRequestModel(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        confirmPassword: confirmPasswordController.text,
        phoneNumber: phoneController.text,
        imageId: selectedAvatar,
      );

      final result = await _usecase(requestModel: requestModel);

      result.fold(
        (failure) {
          emit(
            RegisterFaliureState(
              message: failure.message ?? 'Registration failed',
            ),
          );
        },
        (user) async {
          emit(const RegisterSuccessState());
          await verifyAccount();
        },
      );
    }
  }

  Future<void> verifyAccount() async {
    final result = await _vreifyAccountUsecase();

    result.fold(
      (failure) {
        emit(
          VerifyAccountFailureState(
            message: failure.message ?? 'Verification failed',
          ),
        );
      },
      (successMessage) {
        emit(VerifyAccountSuccessState(message: successMessage));
      },
    );
  }
}
