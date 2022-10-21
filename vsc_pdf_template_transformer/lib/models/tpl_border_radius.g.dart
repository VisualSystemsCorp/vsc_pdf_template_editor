// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_border_radius.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplBorderRadius _$TplBorderRadiusFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TplBorderRadius',
      json,
      ($checkedConvert) {
        final val = TplBorderRadius();
        $checkedConvert(
            'topLeft',
            (v) => val.topLeft = v == null
                ? null
                : TplRadius.fromJson(v as Map<String, dynamic>));
        $checkedConvert(
            'topRight',
            (v) => val.topRight = v == null
                ? null
                : TplRadius.fromJson(v as Map<String, dynamic>));
        $checkedConvert(
            'bottomLeft',
            (v) => val.bottomLeft = v == null
                ? null
                : TplRadius.fromJson(v as Map<String, dynamic>));
        $checkedConvert(
            'bottomRight',
            (v) => val.bottomRight = v == null
                ? null
                : TplRadius.fromJson(v as Map<String, dynamic>));
        $checkedConvert(
            'all',
            (v) => val.all = v == null
                ? null
                : TplRadius.fromJson(v as Map<String, dynamic>));
        $checkedConvert('circular', (v) => val.circular = v);
        return val;
      },
    );

Map<String, dynamic> _$TplBorderRadiusToJson(TplBorderRadius instance) =>
    <String, dynamic>{
      'topLeft': instance.topLeft?.toJson(),
      'topRight': instance.topRight?.toJson(),
      'bottomLeft': instance.bottomLeft?.toJson(),
      'bottomRight': instance.bottomRight?.toJson(),
      'all': instance.all?.toJson(),
      'circular': instance.circular,
    };
