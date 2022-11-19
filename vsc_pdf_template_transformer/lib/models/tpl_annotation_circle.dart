import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';

import '../utils/annotation_builder.dart' as ab;

part 'tpl_annotation_circle.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplAnnotationCircle implements ab.AnnotationBuilder {
  TplAnnotationCircle();

  String className = 'TplAnnotationCircle';
  dynamic color;
  dynamic interiorColor;
  dynamic date;
  dynamic subject;
  dynamic author;
  dynamic content;

  factory TplAnnotationCircle.fromJson(Map<String, dynamic> json) =>
      _$TplAnnotationCircleFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplAnnotationCircleToJson(this);

  @override
  AnnotationBuilder buildAnnotation(Map<String, dynamic> data) {
    return AnnotationCircle(
        color: await evaluateColor(color, data),
        interiorColor: await evaluateColor(interiorColor, data),
        date: evaluateDateTime(date, data),
        subject: await evaluateString(subject, data),
        author: await evaluateString(author, data),
        content: await evaluateString(content, data));
  }
}
