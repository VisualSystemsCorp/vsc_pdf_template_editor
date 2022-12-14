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

  String t = 'AnnotationSquare';
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
  Future<AnnotationBuilder> buildAnnotation(Map<String, dynamic> data) async {
    return AnnotationSquare(
        color: await evaluateColor(color, data),
        interiorColor: await evaluateColor(interiorColor, data),
        date: await evaluateDateTime(date, data),
        subject: await evaluateString(subject, data),
        author: await evaluateString(author, data),
        content: await evaluateString(content, data));
  }
}
