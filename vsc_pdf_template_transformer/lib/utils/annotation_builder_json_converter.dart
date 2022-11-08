import 'package:json_annotation/json_annotation.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_annotation_circle.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_annotation_ink.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_annotation_polygon.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_annotation_square.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_annotation_text_field.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_annotation_url.dart';
import '../utils/annotation_builder.dart' as ab;

class AnnotationBuilderJsonConverter
    extends JsonConverter<ab.AnnotationBuilder?, Map<String, dynamic>?> {
  const AnnotationBuilderJsonConverter();

  @override
  ab.AnnotationBuilder? fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      switch (json['className']) {
        case 'TplAnnotationUrl':
          return TplAnnotationUrl.fromJson(json);
        case 'TplAnnotationSquare':
          return TplAnnotationSquare.fromJson(json);
        case 'TplAnnotationCircle':
          return TplAnnotationCircle.fromJson(json);
        case 'TplAnnotationPolygon':
          return TplAnnotationPolygon.fromJson(json);
        case 'TplAnnotationInk':
          return TplAnnotationInk.fromJson(json);
        case 'TplAnnotationTextField':
          return TplAnnotationTextField.fromJson(json);
      }
      throw Exception(
          'No annotation builder className or unknown annotation builder className');
    }
    return null;
  }

  @override
  Map<String, dynamic>? toJson(ab.AnnotationBuilder? object) {
    return object?.toJson();
  }
}
