import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/exception.dart';
import '../../../../core/usecase/i_usecase.dart';
import '../entities/auth_member_entity.dart';
import '../entities/register_entity.dart';
import '../i_repositories/i_auth_repository.dart';

@Injectable()
class RegisterUserUseCase
    implements UseCase<LoginResponseEntity, RegisterEntity> {
  final IAuthRepository repository;
  const RegisterUserUseCase(this.repository);

  @override
  Future<Either<ConnectException, LoginResponseEntity>> call(
      RegisterEntity params) async {
    try {
      if (params.firstName.isNotEmpty &&
          params.lastName.isNotEmpty &&
          params.phoneNumber.isNotEmpty &&
          params.dateOfBirth.isNotEmpty &&
          params.emailId.isNotEmpty &&
          params.password.isNotEmpty &&
          params.gender.isNotEmpty) {
        return await repository.registerUser(params);
      } else {
        return Left(ConnectException('All fields are required'));
      }
    } catch (e) {
      return Left(ConnectException(e.toString()));
    }
  }
}
