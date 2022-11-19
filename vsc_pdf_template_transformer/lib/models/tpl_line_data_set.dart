import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_point_chart_value.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';
import 'package:vsc_pdf_template_transformer/utils/widget_builder.dart' as wb;

part 'tpl_line_data_set.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplLineDataSet implements wb.WidgetBuilder {
  TplLineDataSet();

  String className = 'TplLineDataSet';
  List<TplPointChartValue>? data;
  dynamic legend;
  dynamic pointColor;
  dynamic pointSize;
  dynamic lineWidth;
  dynamic drawLine;
  dynamic lineColor;
  dynamic color;
  dynamic drawPoints;
  dynamic valuePosition;
  dynamic drawSurface;
  dynamic surfaceOpacity;
  dynamic surfaceColor;
  dynamic isCurved;
  dynamic smoothness;

  factory TplLineDataSet.fromJson(Map<String, dynamic> json) =>
      _$TplLineDataSetFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplLineDataSetToJson(this);

  @override
  Future<Widget> buildWidget(Map<String, dynamic> data) async { 
    return LineDataSet(
        data: getPointChartValues(this.data!, data),
        legend: await evaluateString(legend, data),
        pointColor: await evaluateColor(pointColor, data),
        pointSize: await evaluateDouble(pointSize, data) ?? 3,
        lineWidth: await evaluateDouble(lineWidth, data) ?? 2,
        drawLine: await evaluateBool(drawLine, data) ?? true,
        lineColor: await evaluateColor(lineColor, data),
        color: await evaluateColor(color, data) ?? PdfColors.blue,
        drawPoints: await evaluateBool(drawPoints, data) ?? true,
        valuePosition:
            evaluateValuePosition(valuePosition, data) ?? ValuePosition.auto,
        drawSurface: await evaluateBool(drawSurface, data) ?? false,
        surfaceOpacity: await evaluateDouble(surfaceOpacity, data) ?? 0.2,
        surfaceColor: await evaluateColor(surfaceColor, data),
        isCurved: await evaluateBool(isCurved, data) ?? false,
        smoothness: await evaluateDouble(smoothness, data) ?? 0.35);
  }
}
