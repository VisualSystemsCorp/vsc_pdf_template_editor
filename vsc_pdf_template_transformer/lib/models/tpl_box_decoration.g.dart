// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_box_decoration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplBoxDecoration _$TplBoxDecorationFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TplBoxDecoration',
      json,
      ($checkedConvert) {
        final val = TplBoxDecoration(
          color: $checkedConvert('color', (v) => v as String?),
          border: $checkedConvert(
              'border',
              (v) => v == null
                  ? const TplBoxBorder()
                  : TplBoxBorder.fromJson(v as Map<String, dynamic>)),
          borderRadius: $checkedConvert(
              'borderRadius',
              (v) => v == null
                  ? TplBorderRadius.zero
                  : TplBorderRadius.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );

Map<String, dynamic> _$TplBoxDecorationToJson(TplBoxDecoration instance) =>
    <String, dynamic>{
      'color': instance.color,
      'border': instance.border?.toJson(),
      'borderRadius': instance.borderRadius?.toJson(),
    };
