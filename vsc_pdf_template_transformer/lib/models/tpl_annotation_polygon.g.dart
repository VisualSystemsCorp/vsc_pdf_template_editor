// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_annotation_polygon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplAnnotationPolygon _$TplAnnotationPolygonFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'TplAnnotationPolygon',
      json,
      ($checkedConvert) {
        final val = TplAnnotationPolygon();
        $checkedConvert('t', (v) => val.t = v as String);
        $checkedConvert(
            'points',
            (v) => val.points = (v as List<dynamic>?)
                ?.map((e) => TplPdfPoint.fromJson(e as Map<String, dynamic>))
                .toList());
        $checkedConvert('color', (v) => val.color = v);
        $checkedConvert('interiorColor', (v) => val.interiorColor = v);
        $checkedConvert('date', (v) => val.date = v);
        $checkedConvert('subject', (v) => val.subject = v);
        $checkedConvert('author', (v) => val.author = v);
        $checkedConvert('content', (v) => val.content = v);
        return val;
      },
    );

Map<String, dynamic> _$TplAnnotationPolygonToJson(
        TplAnnotationPolygon instance) =>
    <String, dynamic>{
      't': instance.t,
      'points': instance.points?.map((e) => e.toJson()).toList(),
      'color': instance.color,
      'interiorColor': instance.interiorColor,
      'date': instance.date,
      'subject': instance.subject,
      'author': instance.author,
      'content': instance.content,
    };
