import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';
import 'package:vsc_pdf_template_transformer/utils/widget_builder.dart' as wb;

part 'tpl_circle.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplCircle implements wb.WidgetBuilder {
  TplCircle();

  String className = 'TplCircle';
  dynamic fillColor;
  dynamic strokeColor;
  dynamic strokeWidth;

  factory TplCircle.fromJson(Map<String, dynamic> json) =>
      _$TplCircleFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplCircleToJson(this);

  @override
  Widget buildWidget(Map<String, dynamic> data) {
    return Circle(
        fillColor: evaluateColor(fillColor, data),
        strokeColor: evaluateColor(strokeColor, data),
        strokeWidth: evaluateDouble(strokeWidth, data) ?? 1.0);
  }
}
