// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_border_style.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplBorderStyle _$TplBorderStyleFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TplBorderStyle',
      json,
      ($checkedConvert) {
        final val = TplBorderStyle(
          paint: $checkedConvert('paint', (v) => v as bool? ?? true),
          pattern: $checkedConvert('pattern',
              (v) => (v as List<dynamic>?)?.map((e) => e as num).toList()),
          phase: $checkedConvert('phase', (v) => v as int? ?? 0),
        );
        return val;
      },
    );

Map<String, dynamic> _$TplBorderStyleToJson(TplBorderStyle instance) =>
    <String, dynamic>{
      'paint': instance.paint,
      'pattern': instance.pattern,
      'phase': instance.phase,
    };
