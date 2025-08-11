import 'package:injectable/injectable.dart';
import 'package:movie_app_new_design/features/authentication/domain/repository/auth_repository.dart';

@injectable
class SignOutUsecase {
  final AuthRepository _authRepository;

  @factoryMethod
  const SignOutUsecase(this._authRepository);

  Future<void> call() => _authRepository.signOut();
}
