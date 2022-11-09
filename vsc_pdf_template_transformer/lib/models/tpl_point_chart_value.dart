import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';

part 'tpl_point_chart_value.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplPointChartValue {
  TplPointChartValue();

  dynamic x;
  dynamic y;

  factory TplPointChartValue.fromJson(Map<String, dynamic> json) =>
      _$TplPointChartValueFromJson(json);

  Map<String, dynamic> toJson() => _$TplPointChartValueToJson(this);

  PointChartValue toPdf(Map<String, dynamic> data) {
    return PointChartValue(evaluateDouble(x, data)!, evaluateDouble(y, data)!);
  }
}
