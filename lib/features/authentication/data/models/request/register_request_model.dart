class RegisterRequestModel {
  final String name;
  final String email;
  final String password;
  final String confirmPassword;
  final String phoneNumber;
  final String imageId;

  const RegisterRequestModel({
    required this.name,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.phoneNumber,
    this.imageId = '1',
  });
}
