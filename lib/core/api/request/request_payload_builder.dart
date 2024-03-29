import 'dart:convert';

class ParameterPayloadBuilder {
  final Map<String, String> _params = {};
  Map<String, String> get params => _params;

  ParameterPayloadBuilder setParams(Map<String, String> params) {
    _params.addAll(params);
    return this;
  }

  ParameterPayloadBuilder addParam(String name, String value) {
    _params[name] = value;
    return this;
  }

  dynamic build() {
    return jsonEncode(_params);
  }
}
