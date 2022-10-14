// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_box_border.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplBoxBorder _$TplBoxBorderFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TplBoxBorder',
      json,
      ($checkedConvert) {
        final val = TplBoxBorder(
          top: $checkedConvert(
              'top',
              (v) => v == null
                  ? null
                  : TplBorderSide.fromJson(v as Map<String, dynamic>)),
          right: $checkedConvert(
              'right',
              (v) => v == null
                  ? null
                  : TplBorderSide.fromJson(v as Map<String, dynamic>)),
          bottom: $checkedConvert(
              'bottom',
              (v) => v == null
                  ? null
                  : TplBorderSide.fromJson(v as Map<String, dynamic>)),
          left: $checkedConvert(
              'left',
              (v) => v == null
                  ? null
                  : TplBorderSide.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );

Map<String, dynamic> _$TplBoxBorderToJson(TplBoxBorder instance) =>
    <String, dynamic>{
      'top': instance.top?.toJson(),
      'right': instance.right?.toJson(),
      'bottom': instance.bottom?.toJson(),
      'left': instance.left?.toJson(),
    };
