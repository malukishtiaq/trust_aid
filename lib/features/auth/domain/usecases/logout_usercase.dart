import 'package:dartz/dartz.dart';

import '../../../../core/errors/exception.dart';
import '../../../../core/usecase/i_usecase.dart';
import '../i_repositories/i_auth_repository.dart';

class LogOutUseCase implements UseCase<void, NoParams> {
  final IAuthRepository authRepository;

  LogOutUseCase(this.authRepository);

  @override
  Future<Either<ConnectException, void>> call(NoParams params) async {
    return await authRepository.logOut();
  }
}
