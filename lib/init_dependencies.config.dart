// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i20;
import 'package:get_it/get_it.dart' as _i1;
import 'package:image_picker/image_picker.dart' as _i7;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart'
    as _i4;
import 'package:trust_aid/core/api/client/simple_http.dart' as _i11;
import 'package:trust_aid/core/network/connection_checker.dart' as _i3;
import 'package:trust_aid/core/router/nevigation.dart' as _i10;
import 'package:trust_aid/core/services/image_picker/i_image_picker_service.dart'
    as _i5;
import 'package:trust_aid/core/services/image_picker/image_picker_service.dart'
    as _i6;
import 'package:trust_aid/core/services/location/i_location_service.dart'
    as _i8;
import 'package:trust_aid/core/services/location/location_service.dart' as _i9;
import 'package:trust_aid/core/services/user/i_user_repository.dart' as _i12;
import 'package:trust_aid/core/services/user/user_repository.dart' as _i13;
import 'package:trust_aid/features/auth/data/datasource/login/auth_remote_data_source.dart'
    as _i15;
import 'package:trust_aid/features/auth/data/datasource/login/i_auth_remote_data_source.dart'
    as _i14;
import 'package:trust_aid/features/auth/data/datasource/register/i_register_remote_data_source.dart'
    as _i16;
import 'package:trust_aid/features/auth/data/datasource/register/register_remote_data_source.dart'
    as _i17;
import 'package:trust_aid/features/auth/data/repositories/auth_repository.dart'
    as _i19;
import 'package:trust_aid/features/auth/domain/i_repositories/i_auth_repository.dart'
    as _i18;
import 'package:trust_aid/features/auth/domain/usecases/login_usecase.dart'
    as _i21;
import 'package:trust_aid/features/auth/domain/usecases/register_usecase.dart'
    as _i22;
import 'package:trust_aid/features/auth/presentation/bloc/auth_bloc.dart'
    as _i23;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.IConnectionChecker>(
      () => _i3.ConnectionChecker(gh<_i4.InternetConnection>()));
  gh.factory<_i5.IImagePickerService>(
      () => _i6.ImagePickerService(gh<_i7.ImagePicker>()));
  gh.factory<_i8.ILocationService>(() => _i9.LocationService());
  gh.factory<_i10.INavigationService>(() => _i10.NavigationService());
  gh.factory<_i11.ISimpleHttp>(() => _i11.SimpleHttp());
  gh.factory<_i12.IUserRepository>(() => _i13.UserRepository());
  gh.factory<_i14.IAuthRemoteDataSource>(
      () => _i15.AuthRemoteDataSource(gh<_i11.ISimpleHttp>()));
  gh.factory<_i16.IRegisterRemoteDataSource>(
      () => _i17.RegisterRemoteDataSource(gh<_i11.ISimpleHttp>()));
  gh.factory<_i18.IAuthRepository>(() => _i19.AuthRepository(
        gh<_i14.IAuthRemoteDataSource>(),
        gh<_i16.IRegisterRemoteDataSource>(),
        gh<_i3.IConnectionChecker>(),
        gh<_i20.FlutterSecureStorage>(),
      ));
  gh.factory<_i21.LoginUserUseCase>(
      () => _i21.LoginUserUseCase(gh<_i18.IAuthRepository>()));
  gh.factory<_i22.RegisterUserUseCase>(
      () => _i22.RegisterUserUseCase(gh<_i18.IAuthRepository>()));
  gh.factory<_i23.AuthBloc>(() => _i23.AuthBloc(
        userLogin: gh<_i21.LoginUserUseCase>(),
        registerUserUseCase: gh<_i22.RegisterUserUseCase>(),
      ));
  return getIt;
}
