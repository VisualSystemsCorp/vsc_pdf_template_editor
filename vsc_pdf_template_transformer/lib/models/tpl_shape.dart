import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';
import 'package:vsc_pdf_template_transformer/utils/widget_builder.dart' as wb;

part 'tpl_shape.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplShape implements wb.WidgetBuilder {
  TplShape();

  String className = 'TplShape';
  dynamic shape;
  dynamic fillColor;
  dynamic strokeColor;
  dynamic width;
  dynamic height;
  dynamic fit;

  factory TplShape.fromJson(Map<String, dynamic> json) =>
      _$TplShapeFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplShapeToJson(this);

  @override
  Widget buildWidget(Map<String, dynamic> data) {
    return Shape(evaluateString(shape, data)!,
        fillColor: evaluateColor(fillColor, data),
        strokeColor: evaluateColor(strokeColor, data),
        width: evaluateDouble(width, data),
        height: evaluateDouble(height, data),
        fit: evaluateBoxFit(fit, data) ?? BoxFit.contain);
  }
}
