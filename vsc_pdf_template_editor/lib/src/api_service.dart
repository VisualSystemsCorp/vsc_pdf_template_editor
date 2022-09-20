import 'dart:core';
import 'dart:convert';
import 'consts.dart';

class ApiService {

  Future<Map<String, dynamic>> getDataWidget() async {
    final result = Map<String, dynamic>.from(json.decode(widgetJson));
    return result;
  }

}