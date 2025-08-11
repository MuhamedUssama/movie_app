import 'package:movie_app_new_design/features/authentication/domain/entities/user_entity.dart';

class UserModel {
  static const String collectionName = 'users';
  final String id;
  final String name;
  final String email;
  final String phoneNumber;

  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'email': email, 'phoneNumber': phoneNumber};
  }

  UserEntity toEntity() {
    return UserEntity(
      id: id,
      name: name,
      email: email,
      phoneNumber: phoneNumber,
    );
  }
}
