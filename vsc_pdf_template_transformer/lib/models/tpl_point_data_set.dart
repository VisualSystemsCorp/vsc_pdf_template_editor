import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_point_chart_value.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';
import 'package:vsc_pdf_template_transformer/utils/widget_builder.dart' as wb;

part 'tpl_point_data_set.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplPointDataSet implements wb.WidgetBuilder {
  TplPointDataSet();

  String className = 'TplPointDataSet';
  List<TplPointChartValue>? data;
  dynamic legend;
  dynamic pointSize;
  dynamic color;
  dynamic drawPoints;
  dynamic valuePosition;

  factory TplPointDataSet.fromJson(Map<String, dynamic> json) =>
      _$TplPointDataSetFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplPointDataSetToJson(this);

  @override
  Widget buildWidget(Map<String, dynamic> data) {
    return PointDataSet(
        data: getPointChartValues(this.data!, data),
        legend: evaluateString(legend, data),
        pointSize: evaluateDouble(pointSize, data) ?? 3,
        color: evaluateColor(color, data) ?? PdfColors.blue,
        drawPoints: evaluateBool(drawPoints, data) ?? true,
        valuePosition:
            evaluateValuePosition(valuePosition, data) ?? ValuePosition.auto);
  }
}
