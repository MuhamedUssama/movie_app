import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import 'package:movie_app_new_design/core/network/exceptions.dart';
import 'package:movie_app_new_design/core/models/movies/movie_model.dart';
import 'package:movie_app_new_design/features/home/tabs/search_tab/data/models/search_params.dart';
import 'package:movie_app_new_design/features/home/tabs/search_tab/domain/repository/search_tab_repository.dart';

@injectable
class SearchUsecase {
  final SearchTabRepository _repository;

  @factoryMethod
  const SearchUsecase(this._repository);

  Future<Either<ServerException, Movie>> call(SearchParams params) async =>
      await _repository.serach(params);
}
