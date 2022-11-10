// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_polygon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplPolygon _$TplPolygonFromJson(Map<String, dynamic> json) => $checkedCreate(
      'TplPolygon',
      json,
      ($checkedConvert) {
        final val = TplPolygon();
        $checkedConvert('className', (v) => val.className = v as String);
        $checkedConvert(
            'points',
            (v) => val.points = (v as List<dynamic>?)
                ?.map((e) => TplPdfPoint.fromJson(e as Map<String, dynamic>))
                .toList());
        $checkedConvert('fillColor', (v) => val.fillColor = v);
        $checkedConvert('strokeColor', (v) => val.strokeColor = v);
        $checkedConvert('strokeWidth', (v) => val.strokeWidth = v);
        $checkedConvert('close', (v) => val.close = v);
        return val;
      },
    );

Map<String, dynamic> _$TplPolygonToJson(TplPolygon instance) =>
    <String, dynamic>{
      'className': instance.className,
      'points': instance.points?.map((e) => e.toJson()).toList(),
      'fillColor': instance.fillColor,
      'strokeColor': instance.strokeColor,
      'strokeWidth': instance.strokeWidth,
      'close': instance.close,
    };
