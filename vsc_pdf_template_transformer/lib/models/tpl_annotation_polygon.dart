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

  String t = 'AnnotationPolygon';
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
  Future<AnnotationBuilder> buildAnnotation(Map<String, dynamic> data) async {
    return AnnotationPolygon(await getPdfPoints(points!, data),
        color: await evaluateColor(color, data),
        interiorColor: await evaluateColor(interiorColor, data),
        date: await evaluateDateTime(date, data),
        subject: await evaluateString(subject, data),
        author: await evaluateString(author, data),
        content: await evaluateString(content, data));
  }
}
