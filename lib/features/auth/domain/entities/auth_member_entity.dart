class LoginResponseEntity {
  final int id;
  final bool isAuthenticated;
  final String authenticatedOn;
  final String accessToken;
  final int invalidLogins;
  final bool isLockedOut;
  final String? lockedOutExpiresOn;
  final String password;
  final int httpErrorCode;
  final String httpErrorMessage;

  const LoginResponseEntity({
    required this.id,
    required this.isAuthenticated,
    required this.authenticatedOn,
    required this.accessToken,
    required this.invalidLogins,
    required this.isLockedOut,
    this.lockedOutExpiresOn,
    required this.password,
    required this.httpErrorCode,
    required this.httpErrorMessage,
  });
}
