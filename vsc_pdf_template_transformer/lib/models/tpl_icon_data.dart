import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';

part 'tpl_icon_data.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplIconData {
  TplIconData();

  String className = 'TplIconData';
  dynamic codePoint;
  dynamic matchTextDirection;

  factory TplIconData.fromJson(Map<String, dynamic> json) =>
      _$TplIconDataFromJson(json);

  Map<String, dynamic> toJson() => _$TplIconDataToJson(this);

  IconData toPdf(Map<String, dynamic> data) {
    return IconData(evaluateInt(codePoint, data)!,
        matchTextDirection: evaluateBool(matchTextDirection, data) ?? false);
  }
}
