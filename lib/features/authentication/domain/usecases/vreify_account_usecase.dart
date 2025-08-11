import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app_new_design/core/network/exceptions.dart';
import 'package:movie_app_new_design/features/authentication/domain/repository/auth_repository.dart';

@injectable
class VreifyAccountUsecase {
  final AuthRepository _authRepository;

  @factoryMethod
  const VreifyAccountUsecase(this._authRepository);

  Future<Either<ServerException, String>> call() =>
      _authRepository.verifyAccount();
}
