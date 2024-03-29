import 'package:dartz/dartz.dart';

import '../../../../core/errors/exception.dart';
import '../../../../core/usecase/i_usecase.dart';
import '../i_repositories/i_auth_repository.dart';

class GetSavedCredentialsUseCase implements UseCase<void, Credentials> {
  final IAuthRepository authRepository;

  const GetSavedCredentialsUseCase(this.authRepository);
  Future<void> saveCredentials(Credentials credentials) async {
    if (credentials.password.isNotEmpty && credentials.userName.isNotEmpty) {
      await authRepository.saveCredentials(credentials);
    } else {
      throw ConnectException('Credentials can not be empty');
    }
  }

  @override
  Future<Either<ConnectException, Credentials>> call(Credentials params) {
    return authRepository.getSavedCredentials();
  }
}

class Credentials {
  final String userName;
  final String password;
  Credentials({
    required this.userName,
    required this.password,
  });
}
