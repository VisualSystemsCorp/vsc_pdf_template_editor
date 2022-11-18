import 'package:json_annotation/json_annotation.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_text_span.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_widget_span.dart';

import '../utils/inline_span.dart' as ins;

class InlineSpanJsonConverter
    extends JsonConverter<ins.InlineSpan?, Map<String, dynamic>?> {
  const InlineSpanJsonConverter();

  @override
  ins.InlineSpan? fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      switch (json['className']) {
        case 'TplWidgetSpan':
          return TplWidgetSpan.fromJson(json);
        case 'TplTextSpan':
          return TplTextSpan.fromJson(json);
      }
      throw Exception(
          'No inline span className or unknown inline span className');
    }
    return null;
  }

  @override
  Map<String, dynamic>? toJson(ins.InlineSpan? object) {
    return object?.toJson();
  }
}
