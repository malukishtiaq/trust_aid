import 'package:injectable/injectable.dart';

import '../../../features/auth/domain/entities/auth_member_entity.dart';
import 'i_user_repository.dart';

@Injectable(as: IUserRepository)
class UserRepository implements IUserRepository {
  LoginResponseEntity? _currentUser;

  @override
  void setUser(LoginResponseEntity user) {
    _currentUser = user;
  }

  @override
  LoginResponseEntity? getUser() {
    return _currentUser;
  }

  @override
  String getMemberId() {
    return _currentUser?.id.toString() ?? '';
  }

  @override
  bool isLoggedIn() {
    return _currentUser != null;
  }
}
