class UserEntity {
  final String id;
  final String name;
  final String email;
  final String phoneNumber;
  final String imageId;

  const UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    this.imageId = '1',
  });

  @override
  String toString() {
    return 'UserEntity(id: $id, name: $name, email: $email, phoneNumber: $phoneNumber)';
  }
}
