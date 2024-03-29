import '../../models/auth_member_model.dart';
import '../../models/register_model.dart';

abstract class IRegisterRemoteDataSource {
  Future<LoginResponseModel> registerUser({required RegisterModel params});
}
