import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app_new_design/core/network/exceptions.dart';
import 'package:movie_app_new_design/features/home/tabs/browse_tab/domain/repository/browse_tab_repository.dart';

@injectable
class LoadGenresUsecase {
  final BrowseTabRepository _repository;

  @factoryMethod
  const LoadGenresUsecase(this._repository);

  Future<Either<ServerException, List<String>>> call() =>
      _repository.loadGenres();
}
