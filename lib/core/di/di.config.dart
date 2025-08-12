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
import '../../features/authentication/presentation/cubits/login_cubit/login_view_model.dart'
    as _i464;
import '../../features/authentication/presentation/cubits/register_cubit/register_view_model.dart'
    as _i181;
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
    gh.factory<_i528.PrettyDioLogger>(() => networkModule.prettyDioLogger());
    gh.lazySingleton<_i361.Dio>(() => networkModule.provideDio());
    gh.lazySingleton<_i36.AuthRemoteDataSource>(
      () => _i446.AuthRemoteDataSourceImpl(),
    );
    gh.singleton<_i74.RetrofitClient>(
      () => _i74.RetrofitClient(gh<_i361.Dio>()),
    );
    gh.factory<_i170.AuthRepository>(
      () => _i576.AuthRepositoryImpl(gh<_i36.AuthRemoteDataSource>()),
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
    gh.factory<_i464.LoginViewModel>(
      () => _i464.LoginViewModel(
        gh<_i599.LoginWithEmailAndPasswordUsecase>(),
        gh<_i70.LoginWithGoogleUsecase>(),
      ),
    );
    gh.factory<_i181.RegisterViewModel>(
      () => _i181.RegisterViewModel(gh<_i257.RegisterUsecase>()),
    );
    return this;
  }
}

class _$NetworkModule extends _i200.NetworkModule {}
