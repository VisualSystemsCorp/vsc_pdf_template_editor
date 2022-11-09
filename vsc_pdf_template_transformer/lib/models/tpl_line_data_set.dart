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
  Widget buildWidget(Map<String, dynamic> data) {
    return LineDataSet(
        data: getPointChartValues(this.data!, data),
        legend: evaluateString(legend, data),
        pointColor: evaluateColor(pointColor, data),
        pointSize: evaluateDouble(pointSize, data) ?? 3,
        lineWidth: evaluateDouble(lineWidth, data) ?? 2,
        drawLine: evaluateBool(drawLine, data) ?? true,
        lineColor: evaluateColor(lineColor, data),
        color: evaluateColor(color, data) ?? PdfColors.blue,
        drawPoints: evaluateBool(drawPoints, data) ?? true,
        valuePosition:
            evaluateValuePosition(valuePosition, data) ?? ValuePosition.auto,
        drawSurface: evaluateBool(drawSurface, data) ?? false,
        surfaceOpacity: evaluateDouble(surfaceOpacity, data) ?? 0.2,
        surfaceColor: evaluateColor(surfaceColor, data),
        isCurved: evaluateBool(isCurved, data) ?? false,
        smoothness: evaluateDouble(smoothness, data) ?? 0.35);
  }
}
