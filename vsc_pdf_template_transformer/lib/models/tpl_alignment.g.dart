// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_alignment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplAlignment _$TplAlignmentFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TplAlignment',
      json,
      ($checkedConvert) {
        final val = TplAlignment();
        $checkedConvert('className', (v) => val.className = v as String);
        $checkedConvert('alignment', (v) => val.alignment = v);
        $checkedConvert('x', (v) => val.x = v);
        $checkedConvert('y', (v) => val.y = v);
        return val;
      },
    );

Map<String, dynamic> _$TplAlignmentToJson(TplAlignment instance) =>
    <String, dynamic>{
      'className': instance.className,
      'alignment': instance.alignment,
      'x': instance.x,
      'y': instance.y,
    };
