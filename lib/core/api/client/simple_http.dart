import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:injectable/injectable.dart';

abstract class ISimpleHttp {
  Future<http.Response> post(
      {required Uri url,
      required Map<String, String> header,
      required dynamic body});
  Future<http.Response> postFile({
    required Uri url,
    required Map<String, String> header,
    required dynamic body,
    required String filePath,
    required String? filename,
  });
}

@Injectable(as: ISimpleHttp)
class SimpleHttp implements ISimpleHttp {
  @override
  Future<http.Response> post(
      {required Uri url,
      required Map<String, String>? header,
      required dynamic body}) async {
    http.Response response = await http.post(
      url,
      headers: header,
      body: body,
    );
    return response;
  }

  @override
  Future<http.Response> postFile({
    required Uri url,
    required Map<String, String> header,
    required dynamic body,
    required String filePath,
    required String? filename,
  }) async {
    final multiPart = http.MultipartRequest('post', url)
      ..headers.addAll(header)
      ..fields.addAll(body)
      ..files.add(await http.MultipartFile.fromPath("File", filePath,
          filename: filename, contentType: MediaType('image', 'jpeg')));

    http.Response response =
        await http.Response.fromStream(await multiPart.send());
    return response;
  }
}
