class UserEntity {
  final String id;
  final String name;
  final String email;
  final String phoneNumber;

  const UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
  });

  @override
  String toString() {
    return 'UserEntity(id: $id, name: $name, email: $email, phoneNumber: $phoneNumber)';
  }
}
