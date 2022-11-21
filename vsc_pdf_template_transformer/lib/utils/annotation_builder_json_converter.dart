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
      switch (json['t']) {
        case 'AnnotationUrl':
          return TplAnnotationUrl.fromJson(json);
        case 'AnnotationSquare':
          return TplAnnotationSquare.fromJson(json);
        case 'AnnotationCircle':
          return TplAnnotationCircle.fromJson(json);
        case 'AnnotationPolygon':
          return TplAnnotationPolygon.fromJson(json);
        case 'AnnotationInk':
          return TplAnnotationInk.fromJson(json);
        case 'AnnotationTextField':
          return TplAnnotationTextField.fromJson(json);
      }
      throw Exception(
          'No annotation builder type name or unknown annotation builder type name');
    }
    return null;
  }

  @override
  Map<String, dynamic>? toJson(ab.AnnotationBuilder? object) {
    return object?.toJson();
  }
}
