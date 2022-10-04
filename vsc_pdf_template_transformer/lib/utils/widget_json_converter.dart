import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_string.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_text.dart';
import '../utils/widget_builder.dart' as wb;

class WidgetJsonConverter
    extends JsonConverter<wb.WidgetBuilder?, Map<String, dynamic>?> {
  const WidgetJsonConverter();

  @override
  wb.WidgetBuilder? fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      final res = TplText.fromJson(json);
      return res;
      res.buildWidget({});
    }
    return null;
  }

  @override
  Map<String, dynamic>? toJson(wb.WidgetBuilder? object) {
    if (object != null && object is TplText) {
      return TplText(text: TplString(value: object.text.value))
          .toJson(); //TplText(text: TplString(value: object.text.toString())).toJson();
    }
    return null;
  }
}
