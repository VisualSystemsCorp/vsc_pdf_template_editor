import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_pdf_point.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';
import '../utils/annotation_builder.dart' as ab;

part 'tpl_annotation_ink.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplAnnotationInk implements ab.AnnotationBuilder {
  TplAnnotationInk();

  String className = 'TplAnnotationInk';
  List<List<TplPdfPoint>>? points;
  dynamic color;
  dynamic date;
  dynamic subject;
  dynamic author;
  dynamic content;

  factory TplAnnotationInk.fromJson(Map<String, dynamic> json) =>
      _$TplAnnotationInkFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplAnnotationInkToJson(this);

  @override
  AnnotationBuilder buildAnnotation(Map<String, dynamic> data) {
    return AnnotationInk(getListOfPdfPoints(points!, data),
        color: evaluateColor(color, data),
        date: date != null
            ? DateTime.parse(evaluateString(date, data) ?? '')
            : null,
        subject: evaluateString(subject, data),
        author: evaluateString(author, data),
        content: evaluateString(content, data));
  }
}
