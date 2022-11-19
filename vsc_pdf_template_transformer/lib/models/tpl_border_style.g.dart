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
        final val = TplBorderStyle();
        $checkedConvert('paint', (v) => val.paint = v);
        $checkedConvert(
            'pattern',
            (v) => val.pattern =
                (v as List<dynamic>?)?.map((e) => e as num).toList());
        $checkedConvert('phase', (v) => val.phase = v);
        return val;
      },
    );

Map<String, dynamic> _$TplBorderStyleToJson(TplBorderStyle instance) =>
    <String, dynamic>{
      'paint': instance.paint,
      'pattern': instance.pattern,
      'phase': instance.phase,
    };
