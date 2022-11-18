import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';

import '../utils/alignment.dart' as a;

part 'tpl_fractional_offset.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplFractionalOffset extends a.Alignment {
  TplFractionalOffset();

  String className = 'TplFractionalOffset';
  dynamic dx;
  dynamic dy;

  factory TplFractionalOffset.fromJson(Map<String, dynamic> json) =>
      _$TplFractionalOffsetFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplFractionalOffsetToJson(this);

  @override
  Alignment buildAlignment(Map<String, dynamic> data) {
    return FractionalOffset(
        evaluateDouble(dx, data) ?? 0, evaluateDouble(dy, data) ?? 0);
  }
}
