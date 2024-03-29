part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

final class AuthLoginEvent extends AuthEvent {
  final String email;
  final String password;

  const AuthLoginEvent({
    required this.email,
    required this.password,
  });
}

final class AuthRegisterEvent extends AuthEvent {
  final String password;
  final String userName;
  final String emailId;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String gender;
  final String dateOfBirth;
  final String deviceType;
  const AuthRegisterEvent({
    required this.password,
    required this.userName,
    required this.emailId,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.gender,
    required this.dateOfBirth,
    required this.deviceType,
  });
}

final class AuthForgotPasswordEvent extends AuthEvent {}
