import 'dart:convert';

import 'package:injectable/injectable.dart';
import '../../../../../core/api/request/request_payload_builder.dart';

import '../../../../../core/api/client/simple_http.dart';
import '../../../../../core/api/interface/data_interface.dart';
import '../../../../../core/api/mixins/environment_api.dart';
import '../../../../../core/errors/exception.dart';
import '../../../../../core/tools/functions/api_success.dart';
import '../../models/auth_member_model.dart';
import 'i_auth_remote_data_source.dart';

@Injectable(as: IAuthRemoteDataSource)
class AuthRemoteDataSource extends DataInterface
    with UpdatedEnvironmentApi
    implements IAuthRemoteDataSource {
  final ISimpleHttp simpleHttp;
  const AuthRemoteDataSource(this.simpleHttp);
  @override
  String get apiName => '/Authenticate';
  @override
  String get controller => '/Members';

  @override
  Future<LoginResponseModel> loginWithEmailPassword(
      {required String email, required String password}) async {
    final requestPayload = ParameterPayloadBuilder()
        .addParam('Email', email)
        .addParam('Password', password)
        .build();

    final response = await simpleHttp.post(
      body: requestPayload,
      header: header(),
      url: url(
        apiName: apiName,
        controller: controller,
      ),
    );

    return _apiCalls(response);
  }

  LoginResponseModel _apiCalls(response) {
    final isSuccess = isSuccessResponse(response);
    if (isSuccess) {
      var decodedJson = json.decode(response.body) as Map<String, dynamic>;
      final inMap = decodedJson['Authentication'] as Map<String, dynamic>;
      {
        try {
          return LoginResponseModel.fromMap(inMap);
        } catch (e) {
          throw ParseException('Failed to parse API response: ${e.toString()}');
        }
      }
    } else {
      throw ConnectException('Failed to log in ${response.statusCode}');
    }
  }
}
