import '../../domain/entities/register_entity.dart';

class RegisterModel extends RegisterEntity {
  RegisterModel({
    required super.password,
    required super.userName,
    required super.emailId,
    required super.firstName,
    required super.lastName,
    required super.phoneNumber,
    required super.gender,
    required super.dateOfBirth,
    required super.deviceType,
  });

  RegisterModel.fromEntity(RegisterEntity entity)
      : super(
          password: entity.password,
          userName: entity.userName,
          emailId: entity.emailId,
          firstName: entity.firstName,
          lastName: entity.lastName,
          phoneNumber: entity.phoneNumber,
          gender: entity.gender,
          dateOfBirth: entity.dateOfBirth,
          deviceType: entity.deviceType,
        );

  Map<String, String> toMap() {
    return <String, String>{
      'password': password,
      'userName': userName,
      'email': emailId,
      'firstName': firstName,
      'lastName': lastName,
      'phone': phoneNumber,
      'sexMaleFemale': gender,
      'dateOfBirth': dateOfBirth,
      'deviceType': deviceType,
    };
  }
}
