import 'dart:core';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class ApiService {
  Future<Map<String, dynamic>> getDataWidget() async {
    final res = await rootBundle.loadString(
        'packages/vsc_pdf_template_editor/assets/test/sample_text.json');
    print(res);
    final result = Map<String, dynamic>.from(json.decode(res));
    return result;
  }
}
