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

  Future<ws.BoxConstraints> toPdf(Map<String, dynamic> data) async {
    return ws.BoxConstraints(
      minWidth: await evaluateDouble(minWidth, data) ?? 0,
      maxWidth: await evaluateDouble(maxWidth, data) ?? 100000000000,
      minHeight: await evaluateDouble(minHeight, data) ?? 0,
      maxHeight: await evaluateDouble(maxHeight, data) ?? 100000000000,
    );
  }
}
