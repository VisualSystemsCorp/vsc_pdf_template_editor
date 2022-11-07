import 'package:json_annotation/json_annotation.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_rich_text.dart';
import '../utils/spanning_widget.dart' as sw;

class SpanningWidgetJsonConverter
    extends JsonConverter<sw.SpanningWidgetBuilder?, Map<String, dynamic>?> {
  const SpanningWidgetJsonConverter();

  @override
  sw.SpanningWidgetBuilder? fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      switch (json['className']) {
        case 'TplRichText':
          return TplRichText.fromJson(json);
      }
      throw Exception(
          'No spanning widget className or unknown spanning widget className');
    }
    return null;
  }

  @override
  Map<String, dynamic>? toJson(sw.SpanningWidgetBuilder? object) {
    return object?.toJson();
  }
}
