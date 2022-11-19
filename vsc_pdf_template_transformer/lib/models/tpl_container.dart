import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:vsc_pdf_template_transformer/models/tpl_box_constraints.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_box_decoration.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_edge_insets.dart';
import 'package:vsc_pdf_template_transformer/utils/alignment_json_converter.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';
import 'package:vsc_pdf_template_transformer/utils/widget_json_converter.dart';

import '../utils/alignment.dart' as a;
import '../utils/widget_builder.dart' as wb;

part 'tpl_container.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplContainer implements wb.WidgetBuilder {
  String className = 'TplContainer';
  @AlignmentJsonConverter()
  a.Alignment? alignment;
  TplEdgeInsets? padding;
  dynamic color;
  TplBoxDecoration? decoration;
  TplBoxDecoration? foregroundDecoration;
  dynamic width;
  dynamic height;
  TplBoxConstraints? constraints;
  TplEdgeInsets? margin;
  @WidgetJsonConverter()
  wb.WidgetBuilder? child;

  TplContainer();

  factory TplContainer.fromJson(Map<String, dynamic> json) =>
      _$TplContainerFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplContainerToJson(this);

  @override
  pw.Future<Widget> buildWidget(Map<String, dynamic> data) async {
    return pw.Container(
        alignment: alignment?.buildAlignment(data),
        padding: padding?.toPdf(data),
        color: await evaluateColor(color, data),
        decoration: decoration?.toPdf(data),
        foregroundDecoration: foregroundDecoration?.toPdf(data),
        width: await evaluateDouble(width, data),
        height: await evaluateDouble(height, data),
        constraints: constraints?.toPdf(data),
        margin: margin?.toPdf(data),
        child: await child?.buildWidget(data));
  }
}
