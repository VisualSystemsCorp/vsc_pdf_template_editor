import 'dart:core';
import 'dart:convert';

import 'consts.dart';
class DataService {

  Future<Map<String, dynamic>> getData() async {
    final result = Map<String, dynamic>.from(json.decode(widgetJson));
    return result;
  }

}