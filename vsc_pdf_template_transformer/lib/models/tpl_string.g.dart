// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_string.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplString _$TplStringFromJson(Map<String, dynamic> json) => $checkedCreate(
      'TplString',
      json,
      ($checkedConvert) {
        final val = TplString(
          value: $checkedConvert('value', (v) => v as String? ?? ''),
          expression: $checkedConvert('expression', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$TplStringToJson(TplString instance) => <String, dynamic>{
      'value': instance.value,
      'expression': instance.expression,
    };
