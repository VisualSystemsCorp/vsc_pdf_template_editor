// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_fixed_column_width.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplFixedColumnWidth _$TplFixedColumnWidthFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TplFixedColumnWidth',
      json,
      ($checkedConvert) {
        final val = TplFixedColumnWidth();
        $checkedConvert('className', (v) => val.className = v as String);
        $checkedConvert('width', (v) => val.width = v);
        return val;
      },
    );

Map<String, dynamic> _$TplFixedColumnWidthToJson(
        TplFixedColumnWidth instance) =>
    <String, dynamic>{
      'className': instance.className,
      'width': instance.width,
    };
