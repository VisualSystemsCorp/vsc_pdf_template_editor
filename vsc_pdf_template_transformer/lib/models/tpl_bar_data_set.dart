import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_point_chart_value.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';
import 'package:vsc_pdf_template_transformer/utils/widget_builder.dart' as wb;

part 'tpl_bar_data_set.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplBarDataSet implements wb.WidgetBuilder {
  TplBarDataSet();

  String className = 'TplBarDataSet';
  List<TplPointChartValue>? data;
  dynamic value;
  dynamic legend;
  dynamic color;
  dynamic borderColor;
  dynamic borderWidth;
  dynamic drawBorder;
  dynamic drawSurface;
  dynamic surfaceOpacity;
  dynamic width;
  dynamic offset;
  dynamic axis;
  dynamic pointColor;
  dynamic pointSize;
  dynamic drawPoints;
  dynamic valuePosition;

  factory TplBarDataSet.fromJson(Map<String, dynamic> json) =>
      _$TplBarDataSetFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplBarDataSetToJson(this);

  @override
  Widget buildWidget(Map<String, dynamic> data) {
    return BarDataSet(
        data: getPointChartValues(this.data!, data),
        legend: evaluateString(legend, data),
        color: evaluateColor(color, data) ?? PdfColors.black,
        borderColor: evaluateColor(borderColor, data),
        borderWidth: evaluateDouble(borderWidth, data) ?? 1.5,
        drawBorder: evaluateBool(drawBorder, data),
        drawSurface: evaluateBool(drawSurface, data) ?? true,
        surfaceOpacity: evaluateDouble(surfaceOpacity, data) ?? 1,
        width: evaluateDouble(width, data) ?? 10,
        offset: evaluateDouble(offset, data) ?? 0,
        axis: evaluateAxis(axis, data) ?? Axis.horizontal,
        pointColor: evaluateColor(pointColor, data),
        pointSize: evaluateDouble(pointSize, data) ?? 3,
        drawPoints: evaluateBool(drawPoints, data) ?? false,
        valuePosition:
            evaluateValuePosition(valuePosition, data) ?? ValuePosition.auto);
  }
}
