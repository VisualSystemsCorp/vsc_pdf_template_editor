import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_alignment.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_pdf_point.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';
import 'package:vsc_pdf_template_transformer/utils/widget_builder.dart' as wb;

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
  Future<Widget> buildWidget(Map<String, dynamic> data) async {
    final transformStr = await evaluateString(transform, data);
    switch (transformStr) {
      case 'rotate':
        return Transform.rotate(
            angle: angle,
            origin: origin?.toPdf(data),
            alignment: alignment?.buildAlignment(data),
            child: await child?.buildWidget(data));

      case 'rotateBox':
        return Transform.rotateBox(
            angle: angle,
            child: await child?.buildWidget(data),
            unconstrained: false);

      case 'translate':
        return Transform.translate(
            offset: offset!.toPdf(data), child: await child?.buildWidget(data));

      case 'scale':
        return Transform.scale(
            scale: scale,
            origin: origin?.toPdf(data),
            alignment: alignment?.buildAlignment(data),
            child: await child?.buildWidget(data));
      default:
        throw Exception('Invalid transform: $transformStr');
    }
  }
}
