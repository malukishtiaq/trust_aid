import '../../domain/entities/login_entity.dart';

class LoginModel extends LoginEntity {
  LoginModel({
    required super.password,
    required super.userName,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'password': password,
      'userName': userName,
    };
  }
}
