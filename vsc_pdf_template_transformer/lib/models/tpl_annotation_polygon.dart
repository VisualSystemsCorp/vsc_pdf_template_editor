import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_pdf_point.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';
import '../utils/annotation_builder.dart' as ab;

part 'tpl_annotation_polygon.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplAnnotationPolygon implements ab.AnnotationBuilder {
  TplAnnotationPolygon();

  String className = 'TplAnnotationPolygon';
  List<TplPdfPoint>? points;
  dynamic color;
  dynamic interiorColor;
  dynamic date;
  dynamic subject;
  dynamic author;
  dynamic content;

  factory TplAnnotationPolygon.fromJson(Map<String, dynamic> json) =>
      _$TplAnnotationPolygonFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplAnnotationPolygonToJson(this);

  @override
  AnnotationBuilder buildAnnotation(Map<String, dynamic> data) {
    return AnnotationPolygon(getPdfPoints(points!, data),
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
