import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/pdf.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';

part 'tpl_pdf_page_format.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplPdfPageFormat {
  TplPdfPageFormat();

  dynamic width;
  dynamic height;
  dynamic marginTop;
  dynamic marginBottom;
  dynamic marginLeft;
  dynamic marginRight;
  dynamic marginAll;
  dynamic format;

  factory TplPdfPageFormat.fromJson(Map<String, dynamic> json) =>
      _$TplPdfPageFormatFromJson(json);

  Map<String, dynamic> toJson() => _$TplPdfPageFormatToJson(this);

  PdfPageFormat? toPdf(Map<String, dynamic> data) {
    final widthRes = evaluateDouble(width, data);
    final heightRes = evaluateDouble(height, data);
    if (widthRes != null &&
        heightRes != null &&
        widthRes > 0 &&
        heightRes > 0) {
      return PdfPageFormat(
        widthRes,
        heightRes,
        marginTop: evaluateDouble(marginTop, data) ?? 0,
        marginBottom: evaluateDouble(marginBottom, data) ?? 0,
        marginLeft: evaluateDouble(marginLeft, data) ?? 0,
        marginRight: evaluateDouble(marginRight, data) ?? 0,
        marginAll: evaluateDouble(marginTop, data),
      );
    }
    return evaluatePageFormat(format, data);
  }
}
