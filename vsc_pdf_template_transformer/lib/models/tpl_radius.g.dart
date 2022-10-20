// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_radius.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplRadius _$TplRadiusFromJson(Map<String, dynamic> json) => $checkedCreate(
      'TplRadius',
      json,
      ($checkedConvert) {
        final val = TplRadius(
          x: $checkedConvert('x', (v) => (v as num?)?.toDouble() ?? 0),
          y: $checkedConvert('y', (v) => (v as num?)?.toDouble() ?? 0),
          type: $checkedConvert('type', (v) => v as String? ?? 'zero'),
        );
        return val;
      },
    );

Map<String, dynamic> _$TplRadiusToJson(TplRadius instance) => <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
      'type': instance.type,
    };
