// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;

import '../../features/authentication/data/data_sources/remote/auth_remote_data_source.dart'
    as _i36;
import '../../features/authentication/data/data_sources/remote/auth_remote_data_source_impl.dart'
    as _i446;
import '../../features/authentication/data/repository_impl/auth_repository_impl.dart'
    as _i576;
import '../../features/authentication/domain/repository/auth_repository.dart'
    as _i170;
import '../../features/authentication/domain/usecases/forget_password_usecase.dart'
    as _i25;
import '../../features/authentication/domain/usecases/login_with_email_and_password_usecase.dart'
    as _i599;
import '../../features/authentication/domain/usecases/login_with_google_usecase.dart'
    as _i70;
import '../../features/authentication/domain/usecases/register_usecase.dart'
    as _i257;
import '../../features/authentication/domain/usecases/sign_out_usecase.dart'
    as _i749;
import '../../features/authentication/domain/usecases/vreify_account_usecase.dart'
    as _i39;
import '../../features/authentication/presentation/cubits/forget_password_cubit/forget_password_view_model.dart'
    as _i77;
import '../../features/authentication/presentation/cubits/login_cubit/login_view_model.dart'
    as _i464;
import '../../features/authentication/presentation/cubits/register_cubit/register_view_model.dart'
    as _i181;
import '../../features/home/cubit/home_screen_view_model.dart' as _i370;
import '../../features/home/tabs/browse_tab/data/data_sorces/broswe_tab_data_source_impl.dart'
    as _i569;
import '../../features/home/tabs/browse_tab/data/data_sorces/browse_tab_data_source.dart'
    as _i315;
import '../../features/home/tabs/browse_tab/data/repository_impl/browse_tab_repository_impl.dart'
    as _i673;
import '../../features/home/tabs/browse_tab/domain/repository/browse_tab_repository.dart'
    as _i352;
import '../../features/home/tabs/browse_tab/domain/usecases/get_movies_by_genre_usecase.dart'
    as _i721;
import '../../features/home/tabs/browse_tab/domain/usecases/load_genres_usecase.dart'
    as _i639;
import '../../features/home/tabs/browse_tab/presentation/cubit/browse_tab_view_model.dart'
    as _i462;
import '../../features/home/tabs/home_tab/data/data_sorces/remote/home_tab_remote_data_source.dart'
    as _i359;
import '../../features/home/tabs/home_tab/data/data_sorces/remote/home_tab_remote_data_source_impl.dart'
    as _i1010;
import '../../features/home/tabs/home_tab/data/repository_impl/home_tab_repository_impl.dart'
    as _i370;
import '../../features/home/tabs/home_tab/domain/repository/home_tab_repository.dart'
    as _i276;
import '../../features/home/tabs/home_tab/domain/usecases/get_movies_by_date.dart'
    as _i401;
import '../../features/home/tabs/home_tab/domain/usecases/get_movies_by_random_genre.dart'
    as _i993;
import '../../features/home/tabs/home_tab/presentation/cubit/home_tab_view_model.dart'
    as _i841;
import '../../features/home/tabs/search_tab/data/data_sorces/search_tab_data_source.dart'
    as _i641;
import '../../features/home/tabs/search_tab/data/data_sorces/search_tab_data_source_impl.dart'
    as _i264;
import '../../features/home/tabs/search_tab/data/repository_impl/search_tab_repository_impl.dart'
    as _i534;
import '../../features/home/tabs/search_tab/domain/repository/search_tab_repository.dart'
    as _i658;
import '../../features/home/tabs/search_tab/domain/usecases/search_usecase.dart'
    as _i645;
import '../../features/home/tabs/search_tab/presentation/cubit/search_tab_view_model.dart'
    as _i1052;
import '../../features/movie_details/data/data_sources/movie_deatils_data_source.dart'
    as _i37;
import '../../features/movie_details/data/data_sources/movie_details_data_source_impl.dart'
    as _i1031;
import '../../features/movie_details/data/repository_impl/movie_details_repository_impl.dart'
    as _i476;
import '../../features/movie_details/domain/repository/movie_details_repository.dart'
    as _i431;
import '../../features/movie_details/domain/usecases/get_movie_details_usecase.dart'
    as _i124;
import '../../features/movie_details/domain/usecases/get_similar_movies_usecase.dart'
    as _i1062;
import '../../features/movie_details/presentation/cubit/movie_details_view_model.dart'
    as _i369;
import '../network/error_handler.dart' as _i925;
import '../network/network_module.dart' as _i200;
import '../network/retrofit_client.dart' as _i74;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final networkModule = _$NetworkModule();
    gh.factory<_i925.ErrorHandlingInterceptor>(
      () => _i925.ErrorHandlingInterceptor(),
    );
    gh.factory<_i528.PrettyDioLogger>(() => networkModule.prettyDioLogger());
    gh.factory<_i370.HomeScreenViewModel>(() => _i370.HomeScreenViewModel());
    gh.lazySingleton<_i36.AuthRemoteDataSource>(
      () => _i446.AuthRemoteDataSourceImpl(),
    );
    gh.lazySingleton<_i361.Dio>(
      () => networkModule.provideDio(
        gh<_i528.PrettyDioLogger>(),
        gh<_i925.ErrorHandlingInterceptor>(),
      ),
    );
    gh.singleton<_i74.RetrofitClient>(
      () => _i74.RetrofitClient(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i359.HomeTabRemoteDataSource>(
      () => _i1010.HomeTabRemoteDataSourceImpl(gh<_i74.RetrofitClient>()),
    );
    gh.lazySingleton<_i641.SearchTabDataSource>(
      () => _i264.SearchTabDataSourceImpl(gh<_i74.RetrofitClient>()),
    );
    gh.factory<_i170.AuthRepository>(
      () => _i576.AuthRepositoryImpl(gh<_i36.AuthRemoteDataSource>()),
    );
    gh.factory<_i315.BrowseTabDataSource>(
      () => _i569.BrosweTabDataSourceImpl(gh<_i74.RetrofitClient>()),
    );
    gh.factory<_i658.SearchTabRepository>(
      () => _i534.SearchTabRepositoryImpl(gh<_i641.SearchTabDataSource>()),
    );
    gh.factory<_i276.HomeTabRepository>(
      () => _i370.HomeTabRepositoryImpl(gh<_i359.HomeTabRemoteDataSource>()),
    );
    gh.factory<_i352.BrowseTabRepository>(
      () => _i673.BrowseTabRepositoryImpl(gh<_i315.BrowseTabDataSource>()),
    );
    gh.factory<_i25.ForgetPasswordUsecase>(
      () => _i25.ForgetPasswordUsecase(gh<_i170.AuthRepository>()),
    );
    gh.factory<_i599.LoginWithEmailAndPasswordUsecase>(
      () => _i599.LoginWithEmailAndPasswordUsecase(gh<_i170.AuthRepository>()),
    );
    gh.factory<_i70.LoginWithGoogleUsecase>(
      () => _i70.LoginWithGoogleUsecase(gh<_i170.AuthRepository>()),
    );
    gh.factory<_i257.RegisterUsecase>(
      () => _i257.RegisterUsecase(gh<_i170.AuthRepository>()),
    );
    gh.factory<_i749.SignOutUsecase>(
      () => _i749.SignOutUsecase(gh<_i170.AuthRepository>()),
    );
    gh.factory<_i39.VreifyAccountUsecase>(
      () => _i39.VreifyAccountUsecase(gh<_i170.AuthRepository>()),
    );
    gh.factory<_i181.RegisterViewModel>(
      () => _i181.RegisterViewModel(
        gh<_i257.RegisterUsecase>(),
        gh<_i39.VreifyAccountUsecase>(),
      ),
    );
    gh.lazySingleton<_i37.MovieDeatilsDataSource>(
      () => _i1031.MovieDetailsDataSourceImpl(gh<_i74.RetrofitClient>()),
    );
    gh.factory<_i77.ForgetPasswordViewModel>(
      () => _i77.ForgetPasswordViewModel(gh<_i25.ForgetPasswordUsecase>()),
    );
    gh.factory<_i645.SearchUsecase>(
      () => _i645.SearchUsecase(gh<_i658.SearchTabRepository>()),
    );
    gh.factory<_i431.MovieDetailsRepository>(
      () => _i476.MovieDetailsRepositoryImpl(gh<_i37.MovieDeatilsDataSource>()),
    );
    gh.factory<_i639.LoadGenresUsecase>(
      () => _i639.LoadGenresUsecase(gh<_i352.BrowseTabRepository>()),
    );
    gh.factory<_i721.GetMoviesByGenreUsecase>(
      () => _i721.GetMoviesByGenreUsecase(gh<_i352.BrowseTabRepository>()),
    );
    gh.factory<_i464.LoginViewModel>(
      () => _i464.LoginViewModel(
        gh<_i599.LoginWithEmailAndPasswordUsecase>(),
        gh<_i70.LoginWithGoogleUsecase>(),
      ),
    );
    gh.factory<_i462.BrowseTabViewModel>(
      () => _i462.BrowseTabViewModel(
        gh<_i639.LoadGenresUsecase>(),
        gh<_i721.GetMoviesByGenreUsecase>(),
      ),
    );
    gh.factory<_i401.GetMoviesByDate>(
      () => _i401.GetMoviesByDate(gh<_i276.HomeTabRepository>()),
    );
    gh.factory<_i993.GetMoviesByRandomGenre>(
      () => _i993.GetMoviesByRandomGenre(gh<_i276.HomeTabRepository>()),
    );
    gh.factory<_i841.HomeTabViewModel>(
      () => _i841.HomeTabViewModel(
        gh<_i401.GetMoviesByDate>(),
        gh<_i993.GetMoviesByRandomGenre>(),
      ),
    );
    gh.factory<_i1052.SearchTabViewModel>(
      () => _i1052.SearchTabViewModel(gh<_i645.SearchUsecase>()),
    );
    gh.factory<_i124.GetMovieDetailsUsecase>(
      () => _i124.GetMovieDetailsUsecase(gh<_i431.MovieDetailsRepository>()),
    );
    gh.factory<_i1062.GetSimilarMoviesUsecase>(
      () => _i1062.GetSimilarMoviesUsecase(gh<_i431.MovieDetailsRepository>()),
    );
    gh.factory<_i369.MovieDetailsViewModel>(
      () => _i369.MovieDetailsViewModel(
        gh<_i124.GetMovieDetailsUsecase>(),
        gh<_i1062.GetSimilarMoviesUsecase>(),
      ),
    );
    return this;
  }
}

class _$NetworkModule extends _i200.NetworkModule {}
