// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_annotation_square.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplAnnotationSquare _$TplAnnotationSquareFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TplAnnotationSquare',
      json,
      ($checkedConvert) {
        final val = TplAnnotationSquare();
        $checkedConvert('t', (v) => val.t = v as String);
        $checkedConvert('color', (v) => val.color = v);
        $checkedConvert('interiorColor', (v) => val.interiorColor = v);
        $checkedConvert('date', (v) => val.date = v);
        $checkedConvert('subject', (v) => val.subject = v);
        $checkedConvert('author', (v) => val.author = v);
        $checkedConvert('content', (v) => val.content = v);
        return val;
      },
    );

Map<String, dynamic> _$TplAnnotationSquareToJson(
        TplAnnotationSquare instance) =>
    <String, dynamic>{
      't': instance.t,
      'color': instance.color,
      'interiorColor': instance.interiorColor,
      'date': instance.date,
      'subject': instance.subject,
      'author': instance.author,
      'content': instance.content,
    };
