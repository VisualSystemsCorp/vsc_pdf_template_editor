// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_annotation_url.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplAnnotationUrl _$TplAnnotationUrlFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TplAnnotationUrl',
      json,
      ($checkedConvert) {
        final val = TplAnnotationUrl();
        $checkedConvert('t', (v) => val.t = v as String);
        $checkedConvert('destination', (v) => val.destination = v);
        $checkedConvert('date', (v) => val.date = v);
        $checkedConvert('subject', (v) => val.subject = v);
        $checkedConvert('author', (v) => val.author = v);
        return val;
      },
    );

Map<String, dynamic> _$TplAnnotationUrlToJson(TplAnnotationUrl instance) =>
    <String, dynamic>{
      't': instance.t,
      'destination': instance.destination,
      'date': instance.date,
      'subject': instance.subject,
      'author': instance.author,
    };
