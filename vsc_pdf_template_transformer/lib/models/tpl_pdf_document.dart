import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/pdf.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';

part 'tpl_pdf_document.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplPdfDocument {
  TplPdfDocument();

  dynamic pageMode;
  dynamic compress;
  dynamic verbose;
  dynamic version;

  factory TplPdfDocument.fromJson(Map<String, dynamic> json) =>
      _$TplPdfDocumentFromJson(json);

  Map<String, dynamic> toJson() => _$TplPdfDocumentToJson(this);

  PdfDocument toPdf(Map<String, dynamic> data) {
    return PdfDocument(
        pageMode: evaluatePdfPageMode(version, data) ?? PdfPageMode.none,
        compress: evaluateBool(compress, data) ?? true,
        verbose: evaluateBool(verbose, data) ?? false,
        version: evaluatePdfVersion(version, data) ?? PdfVersion.pdf_1_5);
  }
}
