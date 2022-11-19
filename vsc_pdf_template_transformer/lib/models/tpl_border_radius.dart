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

  Future<ws.BorderRadius> toPdf(Map<String, dynamic> data) async {
    if (all != null) {
      return ws.BorderRadius.all(await all!.toPdf(data));
    }

    if (circular) {
      return ws.BorderRadius.circular(
          await evaluateDouble(circular, data) ?? 0);
    }

    return ws.BorderRadius.only(
      topLeft: await topLeft?.toPdf(data) ?? ws.Radius.zero,
      topRight: await topRight?.toPdf(data) ?? ws.Radius.zero,
      bottomLeft: await bottomLeft?.toPdf(data) ?? ws.Radius.zero,
      bottomRight: await bottomRight?.toPdf(data) ?? ws.Radius.zero,
    );
  }
}
