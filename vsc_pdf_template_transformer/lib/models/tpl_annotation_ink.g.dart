// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_annotation_ink.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplAnnotationInk _$TplAnnotationInkFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TplAnnotationInk',
      json,
      ($checkedConvert) {
        final val = TplAnnotationInk();
        $checkedConvert('className', (v) => val.className = v as String);
        $checkedConvert(
            'points',
            (v) => val.points = (v as List<dynamic>?)
                ?.map((e) => (e as List<dynamic>)
                    .map((e) => TplPdfPoint.fromJson(e as Map<String, dynamic>))
                    .toList())
                .toList());
        $checkedConvert('color', (v) => val.color = v);
        $checkedConvert('date', (v) => val.date = v);
        $checkedConvert('subject', (v) => val.subject = v);
        $checkedConvert('author', (v) => val.author = v);
        $checkedConvert('content', (v) => val.content = v);
        return val;
      },
    );

Map<String, dynamic> _$TplAnnotationInkToJson(TplAnnotationInk instance) =>
    <String, dynamic>{
      'className': instance.className,
      'points': instance.points
          ?.map((e) => e.map((e) => e.toJson()).toList())
          .toList(),
      'color': instance.color,
      'date': instance.date,
      'subject': instance.subject,
      'author': instance.author,
      'content': instance.content,
    };
