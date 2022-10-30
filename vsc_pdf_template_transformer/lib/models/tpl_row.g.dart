// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_row.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplRow _$TplRowFromJson(Map<String, dynamic> json) => $checkedCreate(
      'TplRow',
      json,
      ($checkedConvert) {
        final val = TplRow();
        $checkedConvert('className', (v) => val.className = v as String);
        $checkedConvert('mainAxisAlignment', (v) => val.mainAxisAlignment = v);
        $checkedConvert('mainAxisSize', (v) => val.mainAxisSize = v);
        $checkedConvert(
            'crossAxisAlignment', (v) => val.crossAxisAlignment = v);
        $checkedConvert('verticalDirection', (v) => val.verticalDirection = v);
        $checkedConvert('children', (v) => val.children = v as List<dynamic>?);
        return val;
      },
    );

Map<String, dynamic> _$TplRowToJson(TplRow instance) => <String, dynamic>{
      'className': instance.className,
      'mainAxisAlignment': instance.mainAxisAlignment,
      'mainAxisSize': instance.mainAxisSize,
      'crossAxisAlignment': instance.crossAxisAlignment,
      'verticalDirection': instance.verticalDirection,
      'children': instance.children,
    };
