sealed class ForgetPasswordStates {
  const ForgetPasswordStates();
}

class ForgetPasswordInitialState extends ForgetPasswordStates {
  const ForgetPasswordInitialState();
}

class ForgetPasswordLoadingState extends ForgetPasswordStates {
  const ForgetPasswordLoadingState();
}

class ForgetPasswordSuccessState extends ForgetPasswordStates {
  final String message;
  const ForgetPasswordSuccessState(this.message);
}

class ForgetPasswordErrorState extends ForgetPasswordStates {
  final String message;

  const ForgetPasswordErrorState(this.message);
}
