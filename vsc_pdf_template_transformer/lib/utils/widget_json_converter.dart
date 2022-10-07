import 'package:json_annotation/json_annotation.dart';
import 'package:vsc_pdf_template_transformer/vsc_pdf_template_transformer.dart';
import '../utils/widget_builder.dart' as wb;

class WidgetJsonConverter
    extends JsonConverter<wb.WidgetBuilder?, Map<String, dynamic>?> {
  const WidgetJsonConverter();

  @override
  wb.WidgetBuilder? fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      return Transformer.getWidgetBuilder(json);
    }
    return null;
  }

  @override
  Map<String, dynamic>? toJson(wb.WidgetBuilder? object) {
    return object?.toJson();
  }
}
