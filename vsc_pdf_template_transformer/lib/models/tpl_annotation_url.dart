import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';

import '../utils/annotation_builder.dart' as ab;

part 'tpl_annotation_url.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplAnnotationUrl implements ab.AnnotationBuilder {
  TplAnnotationUrl();

  String t = 'AnnotationUrl';
  dynamic destination;
  dynamic date;
  dynamic subject;
  dynamic author;

  factory TplAnnotationUrl.fromJson(Map<String, dynamic> json) =>
      _$TplAnnotationUrlFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplAnnotationUrlToJson(this);

  @override
  Future<AnnotationBuilder> buildAnnotation(Map<String, dynamic> data) async {
    return AnnotationUrl(await evaluateString(destination, data) ?? '',
        date: await evaluateDateTime(date, data),
        subject: await evaluateString(subject, data),
        author: await evaluateString(author, data));
  }
}
