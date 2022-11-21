import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_text_style.dart';
import 'package:vsc_pdf_template_transformer/utils/annotation_builder_json_converter.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';
import 'package:vsc_pdf_template_transformer/utils/inline_span_json_converter.dart';

import '../utils/annotation_builder.dart' as ab;
import '../utils/inline_span.dart' as ins;

part 'tpl_text_span.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplTextSpan implements ins.InlineSpan {
  TplTextSpan();

  String t = 'TextSpan';
  @InlineSpanJsonConverter()
  List<ins.InlineSpan?>? children;
  dynamic text;
  dynamic baseline;
  TplTextStyle? style;
  @AnnotationBuilderJsonConverter()
  ab.AnnotationBuilder? annotation;

  factory TplTextSpan.fromJson(Map<String, dynamic> json) =>
      _$TplTextSpanFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplTextSpanToJson(this);

  @override
  Future<InlineSpan> buildInlineSpan(Map<String, dynamic> data) async {
    return TextSpan(
        children: children == null
            ? []
            : await getInlineSpanChildren(children!, data),
        baseline: await evaluateDouble(baseline, data) ?? 0,
        text: await evaluateString(text, data),
        style: await style?.toPdf(data),
        annotation: await annotation?.buildAnnotation(data));
  }
}
