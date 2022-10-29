import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart' as ws;
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';

part 'tpl_box_fit.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplBoxFit {
  TplBoxFit();

  dynamic fit;

  factory TplBoxFit.fromJson(Map<String, dynamic> json) =>
      _$TplBoxFitFromJson(json);

  Map<String, dynamic> toJson() => _$TplBoxFitToJson(this);

  ws.BoxFit? toPdf(Map<String, dynamic> data) {
    return evaluateBoxFit(fit, data);
  }
}
