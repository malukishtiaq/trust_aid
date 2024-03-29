import 'package:flutter/foundation.dart';

mixin UpdatedEnvironmentApi {
  static const dbName = "DbBee";
  static const token = "14FE34B2-9547-43F5-A57C-F0DC7DE81AA9";

  Uri url(
      {required String apiName, required String controller, String? query}) {
    const baseApiHost = 'api.softsmartinc.com';
    const basePath = kDebugMode ? '/Services/v2/Bee' : '/Services/v2/Bee';

    final completeUrl = '$basePath$controller$apiName';
    final uri = Uri.https(
        baseApiHost, completeUrl, query != null ? {'query': query} : null);

    if (kDebugMode) {
      debugPrint('$uri');
    }
    return uri;
  }

  Map<String, String> header() {
    return {
      'AppName': dbName,
      'Content-Type': 'application/json; charset=utf-8',
      'Authorization': 'Bearer $token',
    };
  }

  Map<String, String> attachmentHeader() {
    return {
      "AppName": dbName,
      "Content-Type": "multipart/form-data",
      "Authorization": "Bearer $token",
    };
  }
}
