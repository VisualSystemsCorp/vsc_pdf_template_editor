// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_flex_column_width.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplFlexColumnWidth _$TplFlexColumnWidthFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TplFlexColumnWidth',
      json,
      ($checkedConvert) {
        final val = TplFlexColumnWidth();
        $checkedConvert('className', (v) => val.className = v as String);
        $checkedConvert('flex', (v) => val.flex = v);
        return val;
      },
    );

Map<String, dynamic> _$TplFlexColumnWidthToJson(TplFlexColumnWidth instance) =>
    <String, dynamic>{
      'className': instance.className,
      'flex': instance.flex,
    };
