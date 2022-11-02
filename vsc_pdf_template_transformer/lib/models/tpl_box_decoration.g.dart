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
        final val = TplBoxDecoration();
        $checkedConvert('color', (v) => val.color = v);
        $checkedConvert(
            'border',
            (v) => val.border = v == null
                ? null
                : TplBoxBorder.fromJson(v as Map<String, dynamic>));
        $checkedConvert(
            'borderRadius',
            (v) => val.borderRadius = v == null
                ? null
                : TplBorderRadius.fromJson(v as Map<String, dynamic>));
        $checkedConvert(
            'image',
            (v) => val.image = v == null
                ? null
                : TplDecorationGraphic.fromJson(v as Map<String, dynamic>));
        return val;
      },
    );

Map<String, dynamic> _$TplBoxDecorationToJson(TplBoxDecoration instance) =>
    <String, dynamic>{
      'color': instance.color,
      'border': instance.border?.toJson(),
      'borderRadius': instance.borderRadius?.toJson(),
      'image': instance.image?.toJson(),
    };
