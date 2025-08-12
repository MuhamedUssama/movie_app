import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app_new_design/core/network/exceptions.dart';
import 'package:movie_app_new_design/features/authentication/domain/entities/user_entity.dart';
import 'package:movie_app_new_design/features/authentication/domain/repository/auth_repository.dart';

@injectable
class LoginWithGoogleUsecase {
  final AuthRepository _authRepository;

  @factoryMethod
  const LoginWithGoogleUsecase(this._authRepository);

  Future<Either<ServerException, UserEntity>> call() =>
      _authRepository.signInWithGoogle();
}
