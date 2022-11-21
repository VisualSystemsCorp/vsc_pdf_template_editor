import 'package:json_annotation/json_annotation.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_alignment.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_fractional_offset.dart';

import '../utils/alignment.dart' as a;

class AlignmentJsonConverter
    extends JsonConverter<a.Alignment?, Map<String, dynamic>?> {
  const AlignmentJsonConverter();

  @override
  a.Alignment? fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      switch (json['t']) {
        case 'Alignment':
          return TplAlignment.fromJson(json);
        case 'FractionalOffset':
          return TplFractionalOffset.fromJson(json);
      }
      throw Exception('No alignment type name or unknown alignment type name');
    }
    return null;
  }

  @override
  Map<String, dynamic>? toJson(a.Alignment? object) {
    return object?.toJson();
  }
}
