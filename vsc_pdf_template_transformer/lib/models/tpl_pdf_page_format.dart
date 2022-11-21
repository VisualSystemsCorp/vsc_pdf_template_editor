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

  Future<PdfPageFormat?> toPdf(Map<String, dynamic> data) async {
    final widthRes = await evaluateDouble(width, data);
    final heightRes = await evaluateDouble(height, data);
    if (widthRes != null &&
        heightRes != null &&
        widthRes > 0 &&
        heightRes > 0) {
      return PdfPageFormat(
        widthRes,
        heightRes,
        marginTop: await evaluateDouble(marginTop, data) ?? 0,
        marginBottom: await evaluateDouble(marginBottom, data) ?? 0,
        marginLeft: await evaluateDouble(marginLeft, data) ?? 0,
        marginRight: await evaluateDouble(marginRight, data) ?? 0,
        marginAll: await evaluateDouble(marginTop, data),
      );
    }
    return await evaluatePageFormat(format, data);
  }
}
