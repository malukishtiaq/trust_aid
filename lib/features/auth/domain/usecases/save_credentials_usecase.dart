import 'package:dartz/dartz.dart';

import '../../../../core/errors/exception.dart';
import '../../../../core/usecase/i_usecase.dart';
import '../i_repositories/i_auth_repository.dart';
import 'get_saved_credentials_usecase.dart';

class SaveCredentialsUseCase implements UseCase<void, Credentials> {
  final IAuthRepository authRepository;

  SaveCredentialsUseCase(this.authRepository);

  @override
  Future<Either<ConnectException, void>> call(Credentials credentials) async {
    if (credentials.password.isNotEmpty && credentials.userName.isNotEmpty) {
      await authRepository.saveCredentials(credentials);
      return const Right(null);
    } else {
      return Left(ConnectException('Credentials can not be empty'));
    }
  }
}
