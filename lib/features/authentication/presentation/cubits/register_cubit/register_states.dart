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

class VerifyAccountSuccessState extends RegisterStates {
  final String message;
  const VerifyAccountSuccessState({required this.message});
}

class VerifyAccountFailureState extends RegisterStates {
  final String message;
  const VerifyAccountFailureState({required this.message});
}
