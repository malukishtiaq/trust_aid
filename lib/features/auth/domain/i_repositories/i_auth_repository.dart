import 'package:dartz/dartz.dart';

import '../../../../core/errors/exception.dart';
import '../entities/auth_member_entity.dart';
import '../entities/login_entity.dart';
import '../entities/register_entity.dart';
import '../usecases/get_saved_credentials_usecase.dart';

abstract class IAuthRepository {
  Future<Either<ConnectException, LoginResponseEntity>> registerUser(
      RegisterEntity params);
  Future<Either<ConnectException, LoginResponseEntity>> loginUser(
      LoginEntity entity);
  Future<void> saveCredentials(Credentials credentials);
  Future<Either<ConnectException, Credentials>> getSavedCredentials();
  Future<Either<ConnectException, void>> logOut();
}
