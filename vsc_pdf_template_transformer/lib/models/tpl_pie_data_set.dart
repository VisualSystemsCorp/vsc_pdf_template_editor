import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_text_style.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';
import 'package:vsc_pdf_template_transformer/utils/widget_builder.dart' as wb;
import 'package:vsc_pdf_template_transformer/utils/widget_json_converter.dart';

part 'tpl_pie_data_set.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplPieDataSet implements wb.WidgetBuilder {
  TplPieDataSet();

  String className = 'TplPieDataSet';
  dynamic value;
  dynamic legend;
  dynamic color;
  dynamic borderColor;
  dynamic borderWidth;
  dynamic drawBorder;
  dynamic drawSurface;
  dynamic surfaceOpacity;
  dynamic offset;
  TplTextStyle? legendStyle;
  dynamic legendAlign;
  dynamic legendPosition;
  dynamic legendLineWidth;
  dynamic legendLineColor;
  @WidgetJsonConverter()
  wb.WidgetBuilder? legendWidget;
  dynamic legendOffset;
  dynamic innerRadius;

  factory TplPieDataSet.fromJson(Map<String, dynamic> json) =>
      _$TplPieDataSetFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplPieDataSetToJson(this);

  @override
  Future<Widget> buildWidget(Map<String, dynamic> data) async { 
    return PieDataSet(
        value: evaluateNum(value, data) ?? 0,
        legend: await evaluateString(legend, data),
        color: await evaluateColor(color, data) ?? PdfColors.black,
        borderColor: await evaluateColor(borderColor, data),
        borderWidth: await evaluateDouble(borderWidth, data) ?? 1.5,
        drawBorder: await evaluateBool(drawBorder, data),
        drawSurface: await evaluateBool(drawSurface, data) ?? true,
        surfaceOpacity: await evaluateDouble(surfaceOpacity, data) ?? 1,
        offset: await evaluateDouble(offset, data) ?? 0,
        legendStyle: legendStyle?.toPdf(data),
        legendAlign: evaluateTextAlign(legendAlign, data),
        legendPosition: evaluatePieLegendPosition(legendPosition, data) ??
            PieLegendPosition.auto,
        legendLineWidth: await evaluateDouble(legendLineWidth, data) ?? 1,
        legendLineColor: await evaluateColor(legendLineColor, data),
        legendWidget: legendWidget?.buildWidget(data),
        legendOffset: await evaluateDouble(legendOffset, data) ?? 20,
        innerRadius: await evaluateDouble(innerRadius, data) ?? 0);
  }
}
