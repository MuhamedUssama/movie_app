import 'package:dartz/dartz.dart';
import 'package:movie_app_new_design/core/network/exceptions.dart';
import 'package:movie_app_new_design/features/authentication/data/models/request/login_request_model.dart';
import 'package:movie_app_new_design/features/authentication/data/models/request/register_request_model.dart';
import 'package:movie_app_new_design/features/authentication/domain/entities/user_entity.dart';

abstract interface class AuthRepository {
  Future<Either<ServerException, UserEntity>> login({
    required LoginRequestModel requestModel,
  });

  Future<Either<ServerException, UserEntity>> register({
    required RegisterRequestModel requestModel,
  });

  Future<Either<ServerException, UserEntity>> signInWithGoogle();

  Future<Either<ServerException, String>> verifyAccount();

  Future<Either<ServerException, String>> forgetPassword({
    required String email,
  });

  Future<void> signOut();
}
