import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app_new_design/core/helpers/connectivity_helper.dart';
import 'package:movie_app_new_design/core/network/exceptions.dart';
import 'package:movie_app_new_design/features/authentication/data/models/request/login_request_model.dart';
import 'package:movie_app_new_design/features/authentication/data/models/request/register_request_model.dart';
import 'package:movie_app_new_design/features/authentication/domain/entities/user_entity.dart';
import 'package:movie_app_new_design/features/authentication/domain/repository/auth_repository.dart';

import '../data_sources/remote/auth_remote_data_source.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;

  @factoryMethod
  const AuthRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<ServerException, UserEntity>> login({
    required LoginRequestModel requestModel,
  }) async {
    if (await ConnectivityHelper.checkInternetConnection()) {
      return await _remoteDataSource.login(requestModel: requestModel);
    } else {
      return Left(const NoInternetConnectionException());
    }
  }

  @override
  Future<Either<ServerException, UserEntity>> register({
    required RegisterRequestModel requestModel,
  }) async {
    if (await ConnectivityHelper.checkInternetConnection()) {
      return await _remoteDataSource.register(requestModel: requestModel);
    } else {
      return Left(const NoInternetConnectionException());
    }
  }

  @override
  Future<Either<ServerException, String>> forgetPassword({
    required String email,
  }) async {
    if (await ConnectivityHelper.checkInternetConnection()) {
      return await _remoteDataSource.forgetPassword(email: email);
    } else {
      return Left(const NoInternetConnectionException());
    }
  }

  @override
  Future<Either<ServerException, UserEntity>> signInWithGoogle() async {
    if (await ConnectivityHelper.checkInternetConnection()) {
      return await _remoteDataSource.signInWithGoogle();
    } else {
      return Left(const NoInternetConnectionException());
    }
  }

  @override
  Future<Either<ServerException, String>> verifyAccount() async {
    if (await ConnectivityHelper.checkInternetConnection()) {
      return await _remoteDataSource.verifyAccount();
    } else {
      return Left(const NoInternetConnectionException());
    }
  }

  @override
  Future<void> signOut() async {
    if (await ConnectivityHelper.checkInternetConnection()) {
      return await _remoteDataSource.signOut();
    } else {
      throw const NoInternetConnectionException();
    }
  }
}
