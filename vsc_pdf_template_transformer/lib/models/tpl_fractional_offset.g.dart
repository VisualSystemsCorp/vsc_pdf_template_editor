// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_fractional_offset.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplFractionalOffset _$TplFractionalOffsetFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TplFractionalOffset',
      json,
      ($checkedConvert) {
        final val = TplFractionalOffset();
        $checkedConvert('className', (v) => val.className = v as String);
        $checkedConvert('dx', (v) => val.dx = v);
        $checkedConvert('dy', (v) => val.dy = v);
        return val;
      },
    );

Map<String, dynamic> _$TplFractionalOffsetToJson(
        TplFractionalOffset instance) =>
    <String, dynamic>{
      'className': instance.className,
      'dx': instance.dx,
      'dy': instance.dy,
    };
