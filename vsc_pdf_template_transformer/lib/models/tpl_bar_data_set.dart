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
  Future<Widget> buildWidget(Map<String, dynamic> data) async {
    return BarDataSet(
        data: await getPointChartValues(this.data!, data),
        legend: await evaluateString(legend, data),
        color: await evaluateColor(color, data) ?? PdfColors.black,
        borderColor: await evaluateColor(borderColor, data),
        borderWidth: await evaluateDouble(borderWidth, data) ?? 1.5,
        drawBorder: await evaluateBool(drawBorder, data),
        drawSurface: await evaluateBool(drawSurface, data) ?? true,
        surfaceOpacity: await evaluateDouble(surfaceOpacity, data) ?? 1,
        width: await evaluateDouble(width, data) ?? 10,
        offset: await evaluateDouble(offset, data) ?? 0,
        axis: await evaluateAxis(axis, data) ?? Axis.horizontal,
        pointColor: await evaluateColor(pointColor, data),
        pointSize: await evaluateDouble(pointSize, data) ?? 3,
        drawPoints: await evaluateBool(drawPoints, data) ?? false,
        valuePosition: await evaluateValuePosition(valuePosition, data) ??
            ValuePosition.auto);
  }
}
