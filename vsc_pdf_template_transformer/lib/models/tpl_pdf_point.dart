import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/pdf.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';

part 'tpl_pdf_point.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplPdfPoint {
  TplPdfPoint();

  dynamic x;
  dynamic y;

  factory TplPdfPoint.fromJson(Map<String, dynamic> json) =>
      _$TplPdfPointFromJson(json);

  Map<String, dynamic> toJson() => _$TplPdfPointToJson(this);

  Future<PdfPoint> toPdf(Map<String, dynamic> data) async {
    return PdfPoint(
        await evaluateDouble(x, data) ?? 0, await evaluateDouble(y, data) ?? 0);
  }
}
