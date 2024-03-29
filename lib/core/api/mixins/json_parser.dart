import 'dart:convert';
import '../../errors/exception.dart';

mixin JsonParser<T> {
  List<T> fromMapList(
      List<dynamic> list, T Function(Map<String, dynamic>) fromMap) {
    try {
      return list.map((item) => fromMap(item as Map<String, dynamic>)).toList();
    } catch (e) {
      throw ParseException('Invalid item format in the list.');
    }
  }

  T parseFirst(String jsonResponse, T Function(Map<String, dynamic>) fromMap) {
    try {
      final decoded = json.decode(jsonResponse);
      if (decoded is! List) {
        throw ParseException('Expected a list but found a different type.');
      }
      if (decoded.isNotEmpty) {
        return fromMap(decoded.first as Map<String, dynamic>);
      } else {
        throw ParseException('API response is an empty list.');
      }
    } catch (e) {
      throw ParseException('Failed to parse API response: ${e.toString()}');
    }
  }

  T parseFromMap(Map<String, dynamic>? jsonResponse,
      T Function(Map<String, dynamic>) fromMap) {
    try {
      if (jsonResponse != null) {
        return fromMap(jsonResponse);
      } else {
        throw ParseException('API response is null.');
      }
    } catch (e) {
      throw ParseException('Failed to parse API response: ${e.toString()}');
    }
  }

  List<T> parseAll(
      String jsonResponse, T Function(Map<String, dynamic>) fromMap) {
    try {
      final decoded = json.decode(jsonResponse);
      if (decoded is! List) {
        throw ParseException('Expected a list but found a different type.');
      }
      return fromMapList(decoded, fromMap);
    } catch (e) {
      throw ParseException('Failed to parse API response: ${e.toString()}');
    }
  }
}
