sealed class LoginStates {
  const LoginStates();
}

class LoginInitialState extends LoginStates {
  const LoginInitialState();
}

class LoginLoadingState extends LoginStates {
  const LoginLoadingState();
}

class LoginSuccessState extends LoginStates {
  const LoginSuccessState();
}

class LoginWithGoogleLoadingState extends LoginStates {
  const LoginWithGoogleLoadingState();
}

class LoginWithGoogleSuccessState extends LoginStates {
  const LoginWithGoogleSuccessState();
}

class LoginFaliureState extends LoginStates {
  final String message;

  const LoginFaliureState(this.message);
}
