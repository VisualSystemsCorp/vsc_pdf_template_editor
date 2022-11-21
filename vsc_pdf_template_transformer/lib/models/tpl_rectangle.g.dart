// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_rectangle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplRectangle _$TplRectangleFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TplRectangle',
      json,
      ($checkedConvert) {
        final val = TplRectangle();
        $checkedConvert('t', (v) => val.t = v as String);
        $checkedConvert('fillColor', (v) => val.fillColor = v);
        $checkedConvert('strokeColor', (v) => val.strokeColor = v);
        $checkedConvert('strokeWidth', (v) => val.strokeWidth = v);
        return val;
      },
    );

Map<String, dynamic> _$TplRectangleToJson(TplRectangle instance) =>
    <String, dynamic>{
      't': instance.t,
      'fillColor': instance.fillColor,
      'strokeColor': instance.strokeColor,
      'strokeWidth': instance.strokeWidth,
    };
