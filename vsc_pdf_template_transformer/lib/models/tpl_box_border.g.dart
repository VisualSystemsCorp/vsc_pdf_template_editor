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
        final val = TplBoxBorder();
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
            'vertical',
            (v) => val.vertical = v == null
                ? null
                : TplBorderSide.fromJson(v as Map<String, dynamic>));
        $checkedConvert(
            'horizontal',
            (v) => val.horizontal = v == null
                ? null
                : TplBorderSide.fromJson(v as Map<String, dynamic>));
        return val;
      },
    );

Map<String, dynamic> _$TplBoxBorderToJson(TplBoxBorder instance) =>
    <String, dynamic>{
      'top': instance.top?.toJson(),
      'bottom': instance.bottom?.toJson(),
      'left': instance.left?.toJson(),
      'right': instance.right?.toJson(),
      'all': instance.all?.toJson(),
      'vertical': instance.vertical?.toJson(),
      'horizontal': instance.horizontal?.toJson(),
    };
