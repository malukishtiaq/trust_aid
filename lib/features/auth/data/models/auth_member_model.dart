import '../../domain/entities/auth_member_entity.dart';

class LoginResponseModel extends LoginResponseEntity {
  LoginResponseModel({
    required super.id,
    required super.isAuthenticated,
    required super.authenticatedOn,
    required super.accessToken,
    required super.invalidLogins,
    required super.isLockedOut,
    super.lockedOutExpiresOn,
    required super.password,
    required super.httpErrorCode,
    required super.httpErrorMessage,
  });

  factory LoginResponseModel.fromMap(Map<String, dynamic> map) {
    return LoginResponseModel(
      id: map['id'] as int,
      isAuthenticated: map['isAuthenticated'] as bool,
      authenticatedOn: map['authenticatedOn'] as String,
      accessToken: map['accessToken'] as String,
      invalidLogins: map['invalidLogins'] as int,
      isLockedOut: map['isLockedOut'] as bool,
      lockedOutExpiresOn: map['lockedOutExpiresOn'] != null
          ? map['lockedOutExpiresOn'] as String
          : null,
      password: map['password'] as String,
      httpErrorCode: map['httpErrorCode'] as int,
      httpErrorMessage: map['httpErrorMessage'] as String,
    );
  }
}
