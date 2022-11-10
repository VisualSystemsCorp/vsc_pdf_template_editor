// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_circle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplCircle _$TplCircleFromJson(Map<String, dynamic> json) => $checkedCreate(
      'TplCircle',
      json,
      ($checkedConvert) {
        final val = TplCircle();
        $checkedConvert('className', (v) => val.className = v as String);
        $checkedConvert('fillColor', (v) => val.fillColor = v);
        $checkedConvert('strokeColor', (v) => val.strokeColor = v);
        $checkedConvert('strokeWidth', (v) => val.strokeWidth = v);
        return val;
      },
    );

Map<String, dynamic> _$TplCircleToJson(TplCircle instance) => <String, dynamic>{
      'className': instance.className,
      'fillColor': instance.fillColor,
      'strokeColor': instance.strokeColor,
      'strokeWidth': instance.strokeWidth,
    };
