import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../data/models/request/register_request_model.dart';
import '../../../domain/usecases/register_usecase.dart';
import 'register_states.dart';

@injectable
class RegisterViewModel extends Cubit<RegisterStates> {
  final RegisterUsecase _usecase;

  @factoryMethod
  RegisterViewModel(this._usecase) : super(const RegisterInitState());

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

      result.fold((failure) {
        emit(
          RegisterFaliureState(
            message: failure.message ?? 'Registration failed',
          ),
        );
      }, (user) => emit(const RegisterSuccessState()));
    }
  }
}
