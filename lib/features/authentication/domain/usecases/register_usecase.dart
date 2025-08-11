import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app_new_design/core/network/exceptions.dart';
import 'package:movie_app_new_design/features/authentication/data/models/request/register_request_model.dart';
import 'package:movie_app_new_design/features/authentication/domain/entities/user_entity.dart';
import 'package:movie_app_new_design/features/authentication/domain/repository/auth_repository.dart';

@injectable
class RegisterUsecase {
  final AuthRepository _authRepository;

  @factoryMethod
  const RegisterUsecase(this._authRepository);

  Future<Either<ServerException, UserEntity>> call({
    required RegisterRequestModel requestModel,
  }) {
    return _authRepository.register(requestModel: requestModel);
  }
}
