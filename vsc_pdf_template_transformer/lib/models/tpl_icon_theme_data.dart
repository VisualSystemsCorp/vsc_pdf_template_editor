import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';

part 'tpl_icon_theme_data.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplIconThemeData {
  TplIconThemeData();

  dynamic color;
  dynamic opacity;
  dynamic size;
  dynamic font;

  factory TplIconThemeData.fromJson(Map<String, dynamic> json) =>
      _$TplIconThemeDataFromJson(json);

  Map<String, dynamic> toJson() => _$TplIconThemeDataToJson(this);

  pw.IconThemeData toPdf(Map<String, dynamic> data) {
    return pw.IconThemeData(
        color: evaluateColor(color, data),
        opacity: evaluateDouble(opacity, data),
        size: evaluateDouble(size, data),
        font: evaluateFont(font, data));
  }
}
