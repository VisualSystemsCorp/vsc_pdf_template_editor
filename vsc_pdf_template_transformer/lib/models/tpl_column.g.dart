// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_column.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplColumn _$TplColumnFromJson(Map<String, dynamic> json) => $checkedCreate(
      'TplColumn',
      json,
      ($checkedConvert) {
        final val = TplColumn();
        $checkedConvert('t', (v) => val.t = v as String);
        $checkedConvert('mainAxisAlignment', (v) => val.mainAxisAlignment = v);
        $checkedConvert('mainAxisSize', (v) => val.mainAxisSize = v);
        $checkedConvert(
            'crossAxisAlignment', (v) => val.crossAxisAlignment = v);
        $checkedConvert('verticalDirection', (v) => val.verticalDirection = v);
        $checkedConvert('children', (v) => val.children = v as List<dynamic>?);
        return val;
      },
    );

Map<String, dynamic> _$TplColumnToJson(TplColumn instance) => <String, dynamic>{
      't': instance.t,
      'mainAxisAlignment': instance.mainAxisAlignment,
      'mainAxisSize': instance.mainAxisSize,
      'crossAxisAlignment': instance.crossAxisAlignment,
      'verticalDirection': instance.verticalDirection,
      'children': instance.children,
    };
