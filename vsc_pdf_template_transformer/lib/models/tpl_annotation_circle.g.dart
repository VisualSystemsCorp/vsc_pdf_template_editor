// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_annotation_circle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplAnnotationCircle _$TplAnnotationCircleFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TplAnnotationCircle',
      json,
      ($checkedConvert) {
        final val = TplAnnotationCircle();
        $checkedConvert('className', (v) => val.className = v as String);
        $checkedConvert('color', (v) => val.color = v);
        $checkedConvert('interiorColor', (v) => val.interiorColor = v);
        $checkedConvert('date', (v) => val.date = v);
        $checkedConvert('subject', (v) => val.subject = v);
        $checkedConvert('author', (v) => val.author = v);
        $checkedConvert('content', (v) => val.content = v);
        return val;
      },
    );

Map<String, dynamic> _$TplAnnotationCircleToJson(
        TplAnnotationCircle instance) =>
    <String, dynamic>{
      'className': instance.className,
      'color': instance.color,
      'interiorColor': instance.interiorColor,
      'date': instance.date,
      'subject': instance.subject,
      'author': instance.author,
      'content': instance.content,
    };
