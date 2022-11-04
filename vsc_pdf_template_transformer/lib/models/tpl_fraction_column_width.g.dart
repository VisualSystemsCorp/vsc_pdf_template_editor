// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_fraction_column_width.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplFractionColumnWidth _$TplFractionColumnWidthFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'TplFractionColumnWidth',
      json,
      ($checkedConvert) {
        final val = TplFractionColumnWidth();
        $checkedConvert('className', (v) => val.className = v as String);
        $checkedConvert('value', (v) => val.value = v);
        return val;
      },
    );

Map<String, dynamic> _$TplFractionColumnWidthToJson(
        TplFractionColumnWidth instance) =>
    <String, dynamic>{
      'className': instance.className,
      'value': instance.value,
    };
