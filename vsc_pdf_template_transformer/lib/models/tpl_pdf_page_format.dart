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
  TplPdfPageFormat(
      {this.width = 0,
      this.height = 0,
      this.marginTop = 0,
      this.marginBottom = 0,
      this.marginLeft = 0,
      this.marginRight = 0,
      this.marginAll});

  final dynamic width;
  final dynamic height;
  final dynamic marginTop;
  final dynamic marginBottom;
  final dynamic marginLeft;
  final dynamic marginRight;
  final dynamic marginAll;
  dynamic format;

  factory TplPdfPageFormat.fromJson(Map<String, dynamic> json) =>
      _$TplPdfPageFormatFromJson(json);

  Map<String, dynamic> toJson() => _$TplPdfPageFormatToJson(this);

  PdfPageFormat? toPdf(Map<String, dynamic> data) {
    if (width > 0 && height > 0) {
      return PdfPageFormat(
        width,
        height,
        marginTop: marginTop,
        marginBottom: marginBottom,
        marginLeft: marginLeft,
        marginRight: marginRight,
        marginAll: marginAll,
      );
    }
    return evaluatePageFormat(format, data);
  }
}
