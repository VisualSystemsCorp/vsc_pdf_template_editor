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
        final val = TplBorderSide(
          width:
              $checkedConvert('width', (v) => (v as num?)?.toDouble() ?? 1.0),
          color: $checkedConvert('color', (v) => v as String? ?? '000000'),
          style: $checkedConvert(
              'style',
              (v) => v == null
                  ? const TplBorderStyle()
                  : TplBorderStyle.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );

Map<String, dynamic> _$TplBorderSideToJson(TplBorderSide instance) =>
    <String, dynamic>{
      'width': instance.width,
      'color': instance.color,
      'style': instance.style.toJson(),
    };
