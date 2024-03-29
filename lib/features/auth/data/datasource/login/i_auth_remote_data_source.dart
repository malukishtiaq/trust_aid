import '../../models/auth_member_model.dart';

abstract class IAuthRemoteDataSource {
  Future<LoginResponseModel> loginWithEmailPassword({
    required String email,
    required String password,
  });
}
