// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_point_chart_value.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplPointChartValue _$TplPointChartValueFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TplPointChartValue',
      json,
      ($checkedConvert) {
        final val = TplPointChartValue();
        $checkedConvert('x', (v) => val.x = v);
        $checkedConvert('y', (v) => val.y = v);
        return val;
      },
    );

Map<String, dynamic> _$TplPointChartValueToJson(TplPointChartValue instance) =>
    <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
    };
