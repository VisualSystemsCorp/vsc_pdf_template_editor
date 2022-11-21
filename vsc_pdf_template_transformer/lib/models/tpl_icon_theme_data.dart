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

  Future<pw.IconThemeData> toPdf(Map<String, dynamic> data) async {
    return pw.IconThemeData(
        color: await evaluateColor(color, data),
        opacity: await evaluateDouble(opacity, data),
        size: await evaluateDouble(size, data),
        font: await evaluateFont(font, data));
  }
}
