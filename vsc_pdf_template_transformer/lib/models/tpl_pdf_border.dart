import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/pdf.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_pdf_document.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';

part 'tpl_pdf_border.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplPdfBorder {
  TplPdfBorder();

  TplPdfDocument? pdfDocument;
  dynamic width;
  dynamic style;
  List<dynamic>? dash;

  factory TplPdfBorder.fromJson(Map<String, dynamic> json) =>
      _$TplPdfBorderFromJson(json);

  Map<String, dynamic> toJson() => _$TplPdfBorderToJson(this);

  PdfBorder toPdf(Map<String, dynamic> data) {
    return PdfBorder(pdfDocument!.toPdf(data), evaluateDouble(width, data) ?? 0,
        style: evaluatePdfBorderStyle(style, data) ?? PdfBorderStyle.solid,
        dash: evaluateList(dash, data));
  }
}
