import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart' as ws;
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';

part 'tpl_box_constraints.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplBoxConstraints {
  TplBoxConstraints();

  dynamic minWidth;
  dynamic maxWidth;
  dynamic minHeight;
  dynamic maxHeight;

  factory TplBoxConstraints.fromJson(Map<String, dynamic> json) =>
      _$TplBoxConstraintsFromJson(json);

  Map<String, dynamic> toJson() => _$TplBoxConstraintsToJson(this);

  ws.BoxConstraints toPdf(Map<String, dynamic> data) {
    return ws.BoxConstraints(
      minWidth: evaluateDouble(minWidth, data) ?? 0,
      maxWidth: evaluateDouble(maxWidth, data) ?? 100000000000,
      minHeight: evaluateDouble(minHeight, data) ?? 0,
      maxHeight: evaluateDouble(maxHeight, data) ?? 100000000000,
    );
  }
}
