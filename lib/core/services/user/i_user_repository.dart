import '../../../features/auth/domain/entities/auth_member_entity.dart';

abstract class IUserRepository {
  void setUser(LoginResponseEntity user);
  LoginResponseEntity? getUser();
  String getMemberId();

  bool isLoggedIn();
}
