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
          width: $checkedConvert('width', (v) => (v as num).toDouble()),
        );
        return val;
      },
    );

Map<String, dynamic> _$TplBorderSideToJson(TplBorderSide instance) =>
    <String, dynamic>{
      'width': instance.width,
    };
