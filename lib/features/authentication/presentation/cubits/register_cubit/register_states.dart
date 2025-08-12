sealed class RegisterStates {
  const RegisterStates();
}

class RegisterInitState extends RegisterStates {
  const RegisterInitState();
}

class RegisterLoadingState extends RegisterStates {
  const RegisterLoadingState();
}

class RegisterFaliureState extends RegisterStates {
  final String message;
  const RegisterFaliureState({required this.message});
}

class RegisterSuccessState extends RegisterStates {
  const RegisterSuccessState();
}
