import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app_new_design/core/helpers/connectivity_helper.dart';
import 'package:movie_app_new_design/core/models/movies/movie_model.dart';
import 'package:movie_app_new_design/core/network/exceptions.dart';
import 'package:movie_app_new_design/features/home/tabs/home_tab/data/models/movie_list_params.dart';
import 'package:movie_app_new_design/features/home/tabs/home_tab/domain/repository/home_tab_repository.dart';

import '../data_sorces/remote/home_tab_remote_data_source.dart';

@Injectable(as: HomeTabRepository)
class HomeTabRepositoryImpl implements HomeTabRepository {
  final HomeTabRemoteDataSource _dataSource;

  const HomeTabRepositoryImpl(this._dataSource);

  @override
  Future<Either<ServerException, Movie>> getMoviesList(
    MoviesListParams? params,
  ) async {
    if (await ConnectivityHelper.checkInternetConnection()) {
      return await _dataSource.getMoviesList(params);
    } else {
      return const Left(NoInternetConnectionException());
    }
  }
}
