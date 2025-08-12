import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../data/models/request/login_request_model.dart';
import '../../../domain/usecases/login_with_email_and_password_usecase.dart';
import '../../../domain/usecases/login_with_google_usecase.dart';
import 'login_states.dart';

@injectable
class LoginViewModel extends Cubit<LoginStates> {
  final LoginWithEmailAndPasswordUsecase _loginWithEmailAndPasswordUsecase;
  final LoginWithGoogleUsecase _loginWithGoogleUsecase;

  @factoryMethod
  LoginViewModel(
    this._loginWithEmailAndPasswordUsecase,
    this._loginWithGoogleUsecase,
  ) : super(const LoginInitialState());

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> loginWithEmailAndPassword() async {
    if (formKey.currentState!.validate()) {
      emit(const LoginLoadingState());
      final result = await _loginWithEmailAndPasswordUsecase(
        requestModel: LoginRequestModel(
          email: emailController.text,
          password: passwordController.text,
        ),
      );
      result.fold(
        (failure) => emit(LoginFaliureState(failure.message ?? 'Login failed')),
        (success) => emit(const LoginSuccessState()),
      );
    }
  }

  Future<void> loginWithGoogle() async {
    emit(const LoginWithGoogleLoadingState());
    final result = await _loginWithGoogleUsecase();
    result.fold(
      (failure) => emit(LoginFaliureState(failure.message ?? 'Login failed')),
      (success) => emit(const LoginWithGoogleSuccessState()),
    );
  }
}
