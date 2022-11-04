// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_table_border.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplTableBorder _$TplTableBorderFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TplTableBorder',
      json,
      ($checkedConvert) {
        final val = TplTableBorder();
        $checkedConvert(
            'top',
            (v) => val.top = v == null
                ? null
                : TplBorderSide.fromJson(v as Map<String, dynamic>));
        $checkedConvert(
            'bottom',
            (v) => val.bottom = v == null
                ? null
                : TplBorderSide.fromJson(v as Map<String, dynamic>));
        $checkedConvert(
            'left',
            (v) => val.left = v == null
                ? null
                : TplBorderSide.fromJson(v as Map<String, dynamic>));
        $checkedConvert(
            'right',
            (v) => val.right = v == null
                ? null
                : TplBorderSide.fromJson(v as Map<String, dynamic>));
        $checkedConvert(
            'all',
            (v) => val.all = v == null
                ? null
                : TplBorderSide.fromJson(v as Map<String, dynamic>));
        $checkedConvert(
            'horizontalInside',
            (v) => val.horizontalInside = v == null
                ? null
                : TplBorderSide.fromJson(v as Map<String, dynamic>));
        $checkedConvert(
            'verticalInside',
            (v) => val.verticalInside = v == null
                ? null
                : TplBorderSide.fromJson(v as Map<String, dynamic>));
        $checkedConvert(
            'inside',
            (v) => val.inside = v == null
                ? null
                : TplBorderSide.fromJson(v as Map<String, dynamic>));
        $checkedConvert(
            'outside',
            (v) => val.outside = v == null
                ? null
                : TplBorderSide.fromJson(v as Map<String, dynamic>));
        return val;
      },
    );

Map<String, dynamic> _$TplTableBorderToJson(TplTableBorder instance) =>
    <String, dynamic>{
      'top': instance.top?.toJson(),
      'bottom': instance.bottom?.toJson(),
      'left': instance.left?.toJson(),
      'right': instance.right?.toJson(),
      'all': instance.all?.toJson(),
      'horizontalInside': instance.horizontalInside?.toJson(),
      'verticalInside': instance.verticalInside?.toJson(),
      'inside': instance.inside?.toJson(),
      'outside': instance.outside?.toJson(),
    };
