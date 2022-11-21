import 'package:json_annotation/json_annotation.dart';
import 'package:pdf/widgets.dart';
import 'package:vsc_pdf_template_transformer/models/tpl_text_style.dart';
import 'package:vsc_pdf_template_transformer/utils/evaluator.dart';

import '../utils/annotation_builder.dart' as ab;

part 'tpl_annotation_text_field.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TplAnnotationTextField implements ab.AnnotationBuilder {
  TplAnnotationTextField();

  String t = 'AnnotationTextField';
  dynamic name;
  dynamic color;
  dynamic date;
  dynamic backgroundColor;
  dynamic maxLength;
  dynamic subject;
  dynamic author;
  dynamic alternateName;
  dynamic mappingName;
  dynamic value;
  dynamic defaultValue;
  TplTextStyle? textStyle;

  factory TplAnnotationTextField.fromJson(Map<String, dynamic> json) =>
      _$TplAnnotationTextFieldFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TplAnnotationTextFieldToJson(this);

  @override
  Future<AnnotationBuilder> buildAnnotation(Map<String, dynamic> data) async {
    return AnnotationTextField(
        name: await evaluateString(name, data),
        color: await evaluateColor(color, data),
        date: await evaluateDateTime(date, data),
        backgroundColor: await evaluateColor(backgroundColor, data),
        maxLength: await evaluateInt(maxLength, data),
        alternateName: await evaluateString(alternateName, data),
        mappingName: await evaluateString(mappingName, data),
        subject: await evaluateString(subject, data),
        author: await evaluateString(author, data),
        value: await evaluateString(value, data),
        defaultValue: await evaluateString(defaultValue, data),
        textStyle: await textStyle?.toPdf(data));
  }
}
