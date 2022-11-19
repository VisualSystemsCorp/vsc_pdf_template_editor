import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart' as ws;
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';

part 'tpl_radius.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplRadius {
  TplRadius();

  dynamic x;
  dynamic y;
  dynamic circular;

  factory TplRadius.fromJson(Map<String, dynamic> json) =>
      _$TplRadiusFromJson(json);

  Map<String, dynamic> toJson() => _$TplRadiusToJson(this);

  ws.Radius toPdf(Map<String, dynamic> data) {
    if (circular != null) {
      return ws.Radius.circular(await evaluateDouble(circular, data) ?? 0);
    }

    return ws.Radius.elliptical(
      await evaluateDouble(x, data) ?? 0,
      await evaluateDouble(y, data) ?? 0,
    );
  }
}
