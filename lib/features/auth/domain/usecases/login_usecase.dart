import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/exception.dart';
import '../../../../core/usecase/i_usecase.dart';
import '../entities/auth_member_entity.dart';
import '../entities/login_entity.dart';
import '../i_repositories/i_auth_repository.dart';

@injectable
class LoginUserUseCase implements UseCase<LoginResponseEntity, LoginEntity> {
  final IAuthRepository repository;
  const LoginUserUseCase(this.repository);

  @override
  Future<Either<ConnectException, LoginResponseEntity>> call(
      LoginEntity params) async {
    if (params.userName.isNotEmpty && params.password.isNotEmpty) {
      return await repository.loginUser(params);
    } else {
      return Left(ConnectException('All fields are required'));
    }
  }
}
