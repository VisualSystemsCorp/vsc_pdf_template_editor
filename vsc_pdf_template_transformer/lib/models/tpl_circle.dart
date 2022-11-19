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
  Future<Widget> buildWidget(Map<String, dynamic> data) async {
    return Circle(
        fillColor: await evaluateColor(fillColor, data),
        strokeColor: await evaluateColor(strokeColor, data),
        strokeWidth: await evaluateDouble(strokeWidth, data) ?? 1.0);
  }
}
