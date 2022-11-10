import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';
import 'package:vsc_pdf_template_transformer/utils/widget_builder.dart' as wb;

part 'tpl_rectangle.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplRectangle implements wb.WidgetBuilder {
  TplRectangle();

  String className = 'TplRectangle';
  dynamic fillColor;
  dynamic strokeColor;
  dynamic strokeWidth;

  factory TplRectangle.fromJson(Map<String, dynamic> json) =>
      _$TplRectangleFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplRectangleToJson(this);

  @override
  Widget buildWidget(Map<String, dynamic> data) {
    return Rectangle(
        fillColor: evaluateColor(fillColor, data),
        strokeColor: evaluateColor(strokeColor, data),
        strokeWidth: evaluateDouble(strokeWidth, data) ?? 1.0);
  }
}
