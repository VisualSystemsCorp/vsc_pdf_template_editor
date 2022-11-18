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

  String className = 'TplAnnotationTextField';
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
  AnnotationBuilder buildAnnotation(Map<String, dynamic> data) {
    return AnnotationTextField(
        name: evaluateString(name, data),
        color: evaluateColor(color, data),
        date: evaluateDateTime(date, data),
        backgroundColor: evaluateColor(backgroundColor, data),
        maxLength: evaluateInt(maxLength, data),
        alternateName: evaluateString(alternateName, data),
        mappingName: evaluateString(mappingName, data),
        subject: evaluateString(subject, data),
        author: evaluateString(author, data),
        value: evaluateString(value, data),
        defaultValue: evaluateString(defaultValue, data),
        textStyle: textStyle?.toPdf(data));
  }
}
