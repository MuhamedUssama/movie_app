import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app_new_design/core/network/exceptions.dart';
import 'package:movie_app_new_design/features/authentication/data/models/request/login_request_model.dart';
import 'package:movie_app_new_design/features/authentication/domain/entities/user_entity.dart';
import 'package:movie_app_new_design/features/authentication/domain/repository/auth_repository.dart';

@injectable
class LoginWithEmailAndPasswordUsecase {
  final AuthRepository _authRepository;
  @factoryMethod
  const LoginWithEmailAndPasswordUsecase(this._authRepository);

  Future<Either<ServerException, UserEntity>> call({
    required LoginRequestModel requestModel,
  }) {
    return _authRepository.login(requestModel: requestModel);
  }
}
