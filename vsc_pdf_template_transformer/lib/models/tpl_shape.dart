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
  Future<Widget> buildWidget(Map<String, dynamic> data) async { 
    return Shape(await evaluateText(shape, data),
        fillColor: await evaluateColor(fillColor, data),
        strokeColor: await evaluateColor(strokeColor, data),
        width: await evaluateDouble(width, data),
        height: await evaluateDouble(height, data),
        fit: evaluateBoxFit(fit, data) ?? BoxFit.contain);
  }
}
