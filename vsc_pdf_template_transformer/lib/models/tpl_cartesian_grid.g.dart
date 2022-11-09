// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_cartesian_grid.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplCartesianGrid _$TplCartesianGridFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TplCartesianGrid',
      json,
      ($checkedConvert) {
        final val = TplCartesianGrid();
        $checkedConvert('className', (v) => val.className = v as String);
        $checkedConvert(
            'xAxis',
            (v) => val.xAxis = v == null
                ? null
                : TplFixedAxis.fromJson(v as Map<String, dynamic>));
        $checkedConvert(
            'yAxis',
            (v) => val.yAxis = v == null
                ? null
                : TplFixedAxis.fromJson(v as Map<String, dynamic>));
        return val;
      },
    );

Map<String, dynamic> _$TplCartesianGridToJson(TplCartesianGrid instance) =>
    <String, dynamic>{
      'className': instance.className,
      'xAxis': instance.xAxis?.toJson(),
      'yAxis': instance.yAxis?.toJson(),
    };
