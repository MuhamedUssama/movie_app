import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app_new_design/core/helpers/connectivity_helper.dart';
import 'package:movie_app_new_design/core/models/movies/movie_model.dart';
import 'package:movie_app_new_design/core/network/exceptions.dart';
import 'package:movie_app_new_design/features/home/tabs/search_tab/data/data_sorces/search_tab_data_source.dart';
import 'package:movie_app_new_design/features/home/tabs/search_tab/data/models/search_params.dart';
import 'package:movie_app_new_design/features/home/tabs/search_tab/domain/repository/search_tab_repository.dart';

@Injectable(as: SearchTabRepository)
class SearchTabRepositoryImpl implements SearchTabRepository {
  final SearchTabDataSource _dataSource;

  @factoryMethod
  const SearchTabRepositoryImpl(this._dataSource);

  @override
  Future<Either<ServerException, Movie>> serach(SearchParams params) async {
    if (await ConnectivityHelper.checkInternetConnection()) {
      return await _dataSource.serach(params);
    } else {
      return const Left(NoInternetConnectionException());
    }
  }
}
