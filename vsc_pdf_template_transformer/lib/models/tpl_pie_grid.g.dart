// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_pie_grid.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplPieGrid _$TplPieGridFromJson(Map<String, dynamic> json) => $checkedCreate(
      'TplPieGrid',
      json,
      ($checkedConvert) {
        final val = TplPieGrid();
        $checkedConvert('t', (v) => val.t = v as String);
        $checkedConvert('startAngle', (v) => val.startAngle = v);
        return val;
      },
    );

Map<String, dynamic> _$TplPieGridToJson(TplPieGrid instance) =>
    <String, dynamic>{
      't': instance.t,
      'startAngle': instance.startAngle,
    };
