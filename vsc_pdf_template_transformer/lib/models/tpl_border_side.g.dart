// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_border_side.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplBorderSide _$TplBorderSideFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TplBorderSide',
      json,
      ($checkedConvert) {
        final val = TplBorderSide();
        $checkedConvert('width', (v) => val.width = v);
        $checkedConvert('color', (v) => val.color = v);
        $checkedConvert(
            'style',
            (v) => val.style = v == null
                ? null
                : TplBorderStyle.fromJson(v as Map<String, dynamic>));
        return val;
      },
    );

Map<String, dynamic> _$TplBorderSideToJson(TplBorderSide instance) =>
    <String, dynamic>{
      'width': instance.width,
      'color': instance.color,
      'style': instance.style?.toJson(),
    };
