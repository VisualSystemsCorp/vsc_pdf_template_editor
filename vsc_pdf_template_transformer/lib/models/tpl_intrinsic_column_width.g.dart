// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_intrinsic_column_width.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplIntrinsicColumnWidth _$TplIntrinsicColumnWidthFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'TplIntrinsicColumnWidth',
      json,
      ($checkedConvert) {
        final val = TplIntrinsicColumnWidth();
        $checkedConvert('className', (v) => val.className = v as String);
        $checkedConvert('flex', (v) => val.flex = v);
        return val;
      },
    );

Map<String, dynamic> _$TplIntrinsicColumnWidthToJson(
        TplIntrinsicColumnWidth instance) =>
    <String, dynamic>{
      'className': instance.className,
      'flex': instance.flex,
    };
