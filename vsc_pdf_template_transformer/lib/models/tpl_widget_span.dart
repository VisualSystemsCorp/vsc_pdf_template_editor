import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_text_style.dart';
import 'package:vsc_pdf_template_transformer/utils/annotation_builder_json_converter.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';
import 'package:vsc_pdf_template_transformer/utils/widget_json_converter.dart';

import '../utils/annotation_builder.dart' as ab;
import '../utils/inline_span.dart' as ins;
import '../utils/widget_builder.dart' as wb;

part 'tpl_widget_span.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplWidgetSpan implements ins.InlineSpan {
  TplWidgetSpan();

  String className = 'TplWidgetSpan';
  @WidgetJsonConverter()
  wb.WidgetBuilder? child;
  dynamic baseline;
  TplTextStyle? style;
  @AnnotationBuilderJsonConverter()
  ab.AnnotationBuilder? annotation;

  factory TplWidgetSpan.fromJson(Map<String, dynamic> json) =>
      _$TplWidgetSpanFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplWidgetSpanToJson(this);

  @override
  Future<InlineSpan> buildInlineSpan(Map<String, dynamic> data) async {
    return WidgetSpan(
        child: await child!.buildWidget(data),
        baseline: await evaluateDouble(baseline, data) ?? 0,
        style: await style?.toPdf(data),
        annotation: await annotation?.buildAnnotation(data));
  }
}
