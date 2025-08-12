import 'package:movie_app_new_design/features/authentication/domain/entities/user_entity.dart';

class UserModel {
  static const String collectionName = 'users';
  final String id;
  final String name;
  final String email;
  final String phoneNumber;
  final String? imageId;

  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    this.imageId = '1',
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      imageId: json['imageId'] as String? ?? '1',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'imageId': imageId ?? '1',
    };
  }

  UserEntity toEntity() {
    return UserEntity(
      id: id,
      name: name,
      email: email,
      phoneNumber: phoneNumber,
      imageId: imageId ?? '1',
    );
  }
}
