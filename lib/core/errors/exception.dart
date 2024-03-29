class ConnectException implements Exception {
  final String message;
  ConnectException(this.message);
}

class ServerException extends ConnectException {
  ServerException(super.message);
}

class ParseException extends ConnectException {
  ParseException(super.message);
}

class AuthenticationException extends ConnectException {
  AuthenticationException(super.message);
}

class BadRequestException extends ConnectException {
  BadRequestException(super.message);
}

class ForbiddenException extends ConnectException {
  ForbiddenException(super.message);
}

class NotFoundException extends ConnectException {
  NotFoundException(super.message);
}

class UnknownException extends ConnectException {
  UnknownException(super.message);
}

class KnownException extends ConnectException {
  KnownException(super.message);
}
