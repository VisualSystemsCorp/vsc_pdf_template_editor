// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_annotation_text_field.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplAnnotationTextField _$TplAnnotationTextFieldFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'TplAnnotationTextField',
      json,
      ($checkedConvert) {
        final val = TplAnnotationTextField();
        $checkedConvert('className', (v) => val.className = v as String);
        $checkedConvert('name', (v) => val.name = v);
        $checkedConvert('color', (v) => val.color = v);
        $checkedConvert('date', (v) => val.date = v);
        $checkedConvert('backgroundColor', (v) => val.backgroundColor = v);
        $checkedConvert('maxLength', (v) => val.maxLength = v);
        $checkedConvert('subject', (v) => val.subject = v);
        $checkedConvert('author', (v) => val.author = v);
        $checkedConvert('alternateName', (v) => val.alternateName = v);
        $checkedConvert('mappingName', (v) => val.mappingName = v);
        $checkedConvert('value', (v) => val.value = v);
        $checkedConvert('defaultValue', (v) => val.defaultValue = v);
        $checkedConvert(
            'textStyle',
            (v) => val.textStyle = v == null
                ? null
                : TplTextStyle.fromJson(v as Map<String, dynamic>));
        return val;
      },
    );

Map<String, dynamic> _$TplAnnotationTextFieldToJson(
        TplAnnotationTextField instance) =>
    <String, dynamic>{
      'className': instance.className,
      'name': instance.name,
      'color': instance.color,
      'date': instance.date,
      'backgroundColor': instance.backgroundColor,
      'maxLength': instance.maxLength,
      'subject': instance.subject,
      'author': instance.author,
      'alternateName': instance.alternateName,
      'mappingName': instance.mappingName,
      'value': instance.value,
      'defaultValue': instance.defaultValue,
      'textStyle': instance.textStyle?.toJson(),
    };
