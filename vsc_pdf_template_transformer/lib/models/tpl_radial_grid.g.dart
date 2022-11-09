// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_radial_grid.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplRadialGrid _$TplRadialGridFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TplRadialGrid',
      json,
      ($checkedConvert) {
        final val = TplRadialGrid();
        $checkedConvert('className', (v) => val.className = v as String);
        return val;
      },
    );

Map<String, dynamic> _$TplRadialGridToJson(TplRadialGrid instance) =>
    <String, dynamic>{
      'className': instance.className,
    };
