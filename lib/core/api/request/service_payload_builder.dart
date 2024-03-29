class ServicePayloadBuilder {
  final Map<String, dynamic> _fields = {};

  ServicePayloadBuilder setField(String key, dynamic value) {
    _fields[key] = value;
    return this;
  }

  Map<String, dynamic> build() {
    return Map<String, dynamic>.from(_fields);
  }
}
