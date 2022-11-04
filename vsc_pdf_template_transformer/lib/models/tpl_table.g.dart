// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_table.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplTable _$TplTableFromJson(Map<String, dynamic> json) => $checkedCreate(
      'TplTable',
      json,
      ($checkedConvert) {
        final val = TplTable();
        $checkedConvert('className', (v) => val.className = v as String);
        $checkedConvert(
            'children',
            (v) => val.children = (v as List<dynamic>?)
                ?.map((e) => TplTableRow.fromJson(e as Map<String, dynamic>))
                .toList());
        $checkedConvert(
            'border',
            (v) => val.border = v == null
                ? null
                : TplTableBorder.fromJson(v as Map<String, dynamic>));
        $checkedConvert('defaultVerticalAlignment',
            (v) => val.defaultVerticalAlignment = v);
        $checkedConvert(
            'columnWidths', (v) => val.columnWidths = v as List<dynamic>?);
        $checkedConvert(
            'defaultColumnWidth',
            (v) => val.defaultColumnWidth =
                const TableColumnWidthJsonConverter()
                    .fromJson(v as Map<String, dynamic>?));
        $checkedConvert('tableWidth', (v) => val.tableWidth = v);
        return val;
      },
    );

Map<String, dynamic> _$TplTableToJson(TplTable instance) => <String, dynamic>{
      'className': instance.className,
      'children': instance.children?.map((e) => e.toJson()).toList(),
      'border': instance.border?.toJson(),
      'defaultVerticalAlignment': instance.defaultVerticalAlignment,
      'columnWidths': instance.columnWidths,
      'defaultColumnWidth': const TableColumnWidthJsonConverter()
          .toJson(instance.defaultColumnWidth),
      'tableWidth': instance.tableWidth,
    };
