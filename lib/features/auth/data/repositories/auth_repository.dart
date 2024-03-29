import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/constants/general_messages.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/network/connection_checker.dart';
import '../../domain/entities/auth_member_entity.dart';

import '../../domain/entities/login_entity.dart';
import '../../domain/entities/register_entity.dart';
import '../../domain/i_repositories/i_auth_repository.dart';
import '../../domain/usecases/get_saved_credentials_usecase.dart';
import '../datasource/login/i_auth_remote_data_source.dart';
import '../datasource/register/i_register_remote_data_source.dart';
import '../models/register_model.dart';

@Injectable(as: IAuthRepository)
class AuthRepository implements IAuthRepository {
  static const String _keyToken = 'user_token';
  static const String _keyUsername = 'user_name';
  final FlutterSecureStorage secureStorage;
  final IAuthRemoteDataSource authRemoteDataSource;
  final IRegisterRemoteDataSource registerRemoteDataSource;

  final IConnectionChecker connectionChecker;
  const AuthRepository(
    this.authRemoteDataSource,
    this.registerRemoteDataSource,
    this.connectionChecker,
    this.secureStorage,
  );

  @override
  Future<Either<ConnectException, LoginResponseEntity>> registerUser(
      RegisterEntity params) async {
    if (!await (connectionChecker.isConnected)) {
      return Left(ConnectException(GeneralConstants.noConnectionErrorMessage));
    }
    try {
      final result = await registerRemoteDataSource.registerUser(
        params: RegisterModel.fromEntity(params),
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(ConnectException(e.message));
    }
  }

  @override
  Future<Either<ConnectException, LoginResponseEntity>> loginUser(
      LoginEntity entity) async {
    if (!await (connectionChecker.isConnected)) {
      return Left(ConnectException(GeneralConstants.noConnectionErrorMessage));
    }
    try {
      final result = await authRemoteDataSource.loginWithEmailPassword(
        email: entity.userName,
        password: entity.password,
      );
      return Right(result);
    } catch (e) {
      return Left(ConnectException(e.toString()));
    }
  }

  @override
  Future<Either<ConnectException, Credentials>> getSavedCredentials() async {
    String? token = await secureStorage.read(key: _keyToken);
    String? username = await secureStorage.read(key: _keyUsername);

    if (token != null && username != null) {
      return Right(Credentials(userName: username, password: token));
    }
    return Left(ConnectException('Could not retrieve saved credentials'));
  }

  @override
  Future<void> saveCredentials(Credentials credentials) async {
    await secureStorage.write(key: _keyToken, value: credentials.password);
    await secureStorage.write(key: _keyUsername, value: credentials.userName);
  }

  @override
  Future<Either<ConnectException, void>> logOut() async {
    await secureStorage.delete(key: _keyUsername);
    await secureStorage.delete(key: _keyToken);

    bool isUsernameCleared = await _isCleared(_keyUsername);
    bool isTokenCleared = await _isCleared(_keyToken);

    if (!isUsernameCleared || !isTokenCleared) {
      return Left(ConnectException('Failed to clear all credentials'));
    }

    return const Right(null);
  }

  Future<bool> _isCleared(String key) async {
    String? value = await secureStorage.read(key: key);
    if (value != null) {
      return false;
    }
    return true;
  }
}
