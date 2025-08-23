import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app_new_design/core/helpers/connectivity_helper.dart';
import 'package:movie_app_new_design/core/models/movies/movie_model.dart';
import 'package:movie_app_new_design/core/network/exceptions.dart';
import 'package:movie_app_new_design/features/home/tabs/browse_tab/data/data_sorces/browse_tab_data_source.dart';
import 'package:movie_app_new_design/features/home/tabs/browse_tab/data/models/broswe_params.dart';
import 'package:movie_app_new_design/features/home/tabs/browse_tab/domain/repository/browse_tab_repository.dart';

@Injectable(as: BrowseTabRepository)
class BrowseTabRepositoryImpl implements BrowseTabRepository {
  final BrowseTabDataSource _dataSource;

  @factoryMethod
  const BrowseTabRepositoryImpl(this._dataSource);

  @override
  Future<Either<ServerException, Movie>> getMoviesByGenre(
    BrosweParams params,
  ) async {
    if (await ConnectivityHelper.checkInternetConnection()) {
      return await _dataSource.getMoviesByGenre(params);
    } else {
      return const Left(NoInternetConnectionException());
    }
  }

  @override
  Future<Either<ServerException, List<String>>> loadGenres() async {
    if (await ConnectivityHelper.checkInternetConnection()) {
      return await _dataSource.loadGenres();
    } else {
      return const Left(NoInternetConnectionException());
    }
  }
}
