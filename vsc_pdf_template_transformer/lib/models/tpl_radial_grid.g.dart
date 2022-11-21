// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_radial_grid.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplRadialGrid _$TplRadialGridFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'RadialGrid',
      json,
      ($checkedConvert) {
        final val = TplRadialGrid();
        $checkedConvert('t', (v) => val.t = v as String);
        return val;
      },
    );

Map<String, dynamic> _$TplRadialGridToJson(TplRadialGrid instance) =>
    <String, dynamic>{
      't': instance.t,
    };
