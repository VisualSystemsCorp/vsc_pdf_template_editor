import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart' as ws;
import 'package:vsc_pdf_template_transformer/models/tpl_radius.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';

part 'tpl_border_radius.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplBorderRadius {
  TplBorderRadius();

  TplRadius? topLeft;
  TplRadius? topRight;
  TplRadius? bottomLeft;
  TplRadius? bottomRight;
  TplRadius? all;
  dynamic circular;

  factory TplBorderRadius.fromJson(Map<String, dynamic> json) =>
      _$TplBorderRadiusFromJson(json);

  Map<String, dynamic> toJson() => _$TplBorderRadiusToJson(this);

  ws.BorderRadius toPdf(Map<String, dynamic> data) {
    if (all != null) {
      return ws.BorderRadius.all(all!.toPdf(data));
    }

    if (circular) {
      return ws.BorderRadius.circular(evaluateDouble(circular, data) ?? 0);
    }

    return ws.BorderRadius.only(
      topLeft: topLeft?.toPdf(data) ?? ws.Radius.zero,
      topRight: topRight?.toPdf(data) ?? ws.Radius.zero,
      bottomLeft: bottomLeft?.toPdf(data) ?? ws.Radius.zero,
      bottomRight: bottomRight?.toPdf(data) ?? ws.Radius.zero,
    );
  }
}
