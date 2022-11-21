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

  String t = 'BarcodeWidget';

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
  Future<Widget> buildWidget(Map<String, dynamic> data) async {
    final type = await evaluateBarcodeType(this.type, data);
    return BarcodeWidget(
        data: await evaluateText(this.data, data),
        barcode: Barcode.fromType(type!),
        color: await evaluateColor(color, data) ?? PdfColors.black,
        backgroundColor: await evaluateColor(backgroundColor, data),
        decoration: await decoration?.toPdf(data),
        margin: await margin?.toPdf(data) ??
            EdgeInsets.only(bottom: 2.0 * PdfPageFormat.mm),
        padding: await padding?.toPdf(data),
        width: await evaluateDouble(width, data),
        height: await evaluateDouble(height, data),
        drawText: await evaluateBool(drawText, data) ?? true,
        textStyle: await textStyle?.toPdf(data),
        textPadding: await evaluateDouble(textPadding, data) ?? 0);
  }
}
