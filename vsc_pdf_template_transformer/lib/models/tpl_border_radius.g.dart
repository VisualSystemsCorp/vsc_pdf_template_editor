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
        final val = TplBorderRadius(
          $checkedConvert(
              'topLeft',
              (v) => v == null
                  ? null
                  : TplRadius.fromJson(v as Map<String, dynamic>)),
          $checkedConvert(
              'topRight',
              (v) => v == null
                  ? null
                  : TplRadius.fromJson(v as Map<String, dynamic>)),
          $checkedConvert(
              'bottomLeft',
              (v) => v == null
                  ? null
                  : TplRadius.fromJson(v as Map<String, dynamic>)),
          $checkedConvert(
              'bottomRight',
              (v) => v == null
                  ? null
                  : TplRadius.fromJson(v as Map<String, dynamic>)),
          type: $checkedConvert('type', (v) => v as String? ?? 'zero'),
        );
        return val;
      },
    );

Map<String, dynamic> _$TplBorderRadiusToJson(TplBorderRadius instance) =>
    <String, dynamic>{
      'topLeft': instance.topLeft?.toJson(),
      'topRight': instance.topRight?.toJson(),
      'bottomLeft': instance.bottomLeft?.toJson(),
      'bottomRight': instance.bottomRight?.toJson(),
      'type': instance.type,
    };
