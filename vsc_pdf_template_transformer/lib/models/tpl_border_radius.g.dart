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
          topLeft: $checkedConvert(
              'topLeft',
              (v) => v == null
                  ? null
                  : TplRadius.fromJson(v as Map<String, dynamic>)),
          topRight: $checkedConvert(
              'topRight',
              (v) => v == null
                  ? null
                  : TplRadius.fromJson(v as Map<String, dynamic>)),
          bottomLeft: $checkedConvert(
              'bottomLeft',
              (v) => v == null
                  ? null
                  : TplRadius.fromJson(v as Map<String, dynamic>)),
          bottomRight: $checkedConvert(
              'bottomRight',
              (v) => v == null
                  ? null
                  : TplRadius.fromJson(v as Map<String, dynamic>)),
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
    };
