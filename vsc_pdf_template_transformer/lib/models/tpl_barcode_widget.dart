import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_box_decoration.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_edge_insets.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_text_style.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';
import '../utils/widget_builder.dart' as wb;

part 'tpl_barcode_widget.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplBarcodeWidget implements wb.WidgetBuilder {
  TplBarcodeWidget();

  String className = 'TplBarcodeWidget';

  dynamic data;
  dynamic type;
  dynamic color;
  dynamic backgroundColor;
  TplBoxDecoration? decoration;
  TplEdgeInsets? margin;
  TplEdgeInsets? padding;
  dynamic width;
  dynamic height;
  dynamic drawText;
  TplTextStyle? textStyle;
  dynamic textPadding;

  factory TplBarcodeWidget.fromJson(Map<String, dynamic> json) =>
      _$TplBarcodeWidgetFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplBarcodeWidgetToJson(this);

  @override
  Widget buildWidget(Map<String, dynamic> data) {
    return BarcodeWidget(
        data: evaluateString(this.data, data)!,
        barcode: _buildBarcode(data),
        color: evaluateColor(color, data) ?? PdfColors.black,
        backgroundColor: evaluateColor(backgroundColor, data),
        decoration: decoration?.toPdf(data),
        margin: margin?.toPdf(data) ??
            EdgeInsets.only(bottom: 2.0 * PdfPageFormat.mm),
        padding: padding?.toPdf(data),
        width: evaluateDouble(width, data),
        height: evaluateDouble(height, data),
        drawText: evaluateBool(drawText, data) ?? true,
        textStyle: textStyle?.toPdf(data),
        textPadding: evaluateDouble(textPadding, data) ?? 0);
  }

  Barcode _buildBarcode(Map<String, dynamic> data) {
    final barcodeStr = evaluateString(type, data);
    switch (barcodeStr) {
      case 'code39':
        return Barcode.code39();
      case 'code93':
        return Barcode.code93();
      case 'code128':
        return Barcode.code128();
      case 'gs128':
        return Barcode.gs128();
      case 'itf':
        return Barcode.itf();
      case 'itf14':
        return Barcode.itf14();
      case 'itf16':
        return Barcode.itf16();
      case 'ean13':
        return Barcode.ean13();
      case 'ean8':
        return Barcode.ean8();
      case 'ean5':
        return Barcode.ean5();
      case 'ean2':
        return Barcode.ean2();
      case 'isbn':
        return Barcode.isbn();
      case 'upca':
        return Barcode.upcA();
      case 'upce':
        return Barcode.upcE();
      case 'telepen':
        return Barcode.telepen();
      case 'codabar':
        return Barcode.codabar();
      case 'rm4scc':
        return Barcode.rm4scc();
      case 'qrCode':
        return Barcode.qrCode();
      case 'pdf417':
        return Barcode.pdf417();
      case 'dataMatrix':
        return Barcode.dataMatrix();
      case 'aztec':
        return Barcode.aztec();
      default:
        throw Exception('Invalid barcode type: $barcodeStr');
    }
  }
}
