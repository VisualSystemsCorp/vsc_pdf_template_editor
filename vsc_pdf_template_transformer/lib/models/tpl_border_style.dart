import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart' as ws;
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';

part 'tpl_border_style.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplBorderStyle {
  TplBorderStyle();

  dynamic paint;
  List<num>? pattern;
  dynamic phase;

  factory TplBorderStyle.fromJson(Map<String, dynamic> json) =>
      _$TplBorderStyleFromJson(json);

  Map<String, dynamic> toJson() => _$TplBorderStyleToJson(this);

  ws.BorderStyle toPdf(Map<String, dynamic> data) {
    return ws.BorderStyle(
        paint: await evaluateBool(paint, data) ?? true,
        pattern: evaluateList(pattern, data),
        phase: await evaluateInt(phase, data) ?? 0);
  }
}
