import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as ws;
import 'package:vsc_pdf_template_transformer/models/tpl_border_style.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';

part 'tpl_border_side.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplBorderSide {
  TplBorderSide();

  dynamic width;
  dynamic color;
  TplBorderStyle? style;

  factory TplBorderSide.fromJson(Map<String, dynamic> json) =>
      _$TplBorderSideFromJson(json);

  Map<String, dynamic> toJson() => _$TplBorderSideToJson(this);

  ws.BorderSide toPdf(Map<String, dynamic> data) {
    return ws.BorderSide(
        width: await evaluateDouble(width, data) ?? 1.0,
        color: await evaluateColor(color, data) ?? PdfColors.black,
        style: style?.toPdf(data) ?? const ws.BorderStyle());
  }
}
