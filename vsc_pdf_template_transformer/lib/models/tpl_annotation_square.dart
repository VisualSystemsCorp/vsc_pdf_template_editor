import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';
import '../utils/annotation_builder.dart' as ab;

part 'tpl_annotation_square.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplAnnotationSquare implements ab.AnnotationBuilder {
  TplAnnotationSquare();

  String className = 'TplAnnotationSquare';
  dynamic color;
  dynamic interiorColor;
  dynamic date;
  dynamic subject;
  dynamic author;
  dynamic content;

  factory TplAnnotationSquare.fromJson(Map<String, dynamic> json) =>
      _$TplAnnotationSquareFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplAnnotationSquareToJson(this);

  @override
  AnnotationBuilder buildAnnotation(Map<String, dynamic> data) {
    return AnnotationSquare(
        color: evaluateColor(color, data),
        interiorColor: evaluateColor(interiorColor, data),
        date: date != null
            ? DateTime.parse(evaluateString(date, data) ?? '')
            : null,
        subject: evaluateString(subject, data),
        author: evaluateString(author, data),
        content: evaluateString(content, data));
  }
}