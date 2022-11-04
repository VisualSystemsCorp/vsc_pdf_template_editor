// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_table_row.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplTableRow _$TplTableRowFromJson(Map<String, dynamic> json) => $checkedCreate(
      'TplTableRow',
      json,
      ($checkedConvert) {
        final val = TplTableRow();
        $checkedConvert('children', (v) => val.children = v as List<dynamic>?);
        $checkedConvert('repeat', (v) => val.repeat = v);
        $checkedConvert('verticalAlignment', (v) => val.verticalAlignment = v);
        $checkedConvert(
            'decoration',
            (v) => val.decoration = v == null
                ? null
                : TplBoxDecoration.fromJson(v as Map<String, dynamic>));
        return val;
      },
    );

Map<String, dynamic> _$TplTableRowToJson(TplTableRow instance) =>
    <String, dynamic>{
      'children': instance.children,
      'repeat': instance.repeat,
      'verticalAlignment': instance.verticalAlignment,
      'decoration': instance.decoration?.toJson(),
    };
