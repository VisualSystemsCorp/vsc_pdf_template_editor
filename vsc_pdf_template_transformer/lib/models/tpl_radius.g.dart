// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_radius.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplRadius _$TplRadiusFromJson(Map<String, dynamic> json) => $checkedCreate(
      'TplRadius',
      json,
      ($checkedConvert) {
        final val = TplRadius();
        $checkedConvert('x', (v) => val.x = v);
        $checkedConvert('y', (v) => val.y = v);
        $checkedConvert('circular', (v) => val.circular = v);
        return val;
      },
    );

Map<String, dynamic> _$TplRadiusToJson(TplRadius instance) => <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
      'circular': instance.circular,
    };
