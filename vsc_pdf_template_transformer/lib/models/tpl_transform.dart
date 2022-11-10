import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_alignment.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_pdf_point.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';
import 'package:vsc_pdf_template_transformer/utils/widget_builder.dart' as wb;
import 'package:vector_math/vector_math_64.dart';

import '../utils/widget_json_converter.dart';

part 'tpl_transform.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplTransform implements wb.WidgetBuilder {
  TplTransform();

  String className = 'TplTransform';
  dynamic transform;
  TplPdfPoint? origin;
  TplAlignment? alignment;
  dynamic adjustLayout;
  dynamic unconstrained;
  dynamic fit;
  dynamic angle;
  TplPdfPoint? offset;
  dynamic scale;
  @WidgetJsonConverter()
  wb.WidgetBuilder? child;

  factory TplTransform.fromJson(Map<String, dynamic> json) =>
      _$TplTransformFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplTransformToJson(this);

  @override
  Widget buildWidget(Map<String, dynamic> data) {
    final transformStr = evaluateString(transform, data);
    Matrix4? matrix;
    switch (transformStr) {
      case 'rotate':
        matrix = Matrix4.rotationZ(evaluateDouble(angle, data)!);
        break;
      case 'rotateBox':
        matrix = Matrix4.rotationZ(evaluateDouble(angle, data)!);
        break;
      case 'translate':
        matrix = Matrix4.translationValues(evaluateDouble(offset?.x, data)!,
            evaluateDouble(offset?.y, data)!, 0);
        break;
      case 'scale':
        matrix = Matrix4.diagonal3Values(
            evaluateDouble(scale, data)!, evaluateDouble(scale, data)!, 1);
        break;
    }
    return Transform(
        transform: matrix!,
        origin: origin?.toPdf(data),
        alignment: alignment?.buildAlignment(data),
        adjustLayout: evaluateBool(adjustLayout, data) ?? false,
        unconstrained: evaluateBool(unconstrained, data) ?? false,
        child: child?.buildWidget(data));
  }
}
