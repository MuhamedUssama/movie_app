import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app_new_design/core/helpers/connectivity_helper.dart';
import 'package:movie_app_new_design/core/network/exceptions.dart';
import 'package:movie_app_new_design/features/movie_details/data/data_sources/movie_deatils_data_source.dart';
import 'package:movie_app_new_design/features/movie_details/data/models/movie_details_models/movie_details_model.dart';
import 'package:movie_app_new_design/features/movie_details/data/models/movie_details_models/movie_details_params.dart';
import 'package:movie_app_new_design/features/movie_details/domain/repository/movie_details_repository.dart';

@Injectable(as: MovieDetailsRepository)
class MovieDetailsRepositoryImpl implements MovieDetailsRepository {
  final MovieDeatilsDataSource _dataSource;

  const MovieDetailsRepositoryImpl(this._dataSource);

  @override
  Future<Either<ServerException, MovieDetails>> getMovieDetails(
    MovieDetailsParams params,
  ) async {
    if (await ConnectivityHelper.checkInternetConnection()) {
      return await _dataSource.getMovieDetails(params);
    } else {
      return const Left(NoInternetConnectionException());
    }
  }
}
