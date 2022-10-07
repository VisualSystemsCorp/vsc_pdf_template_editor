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
          expression: $checkedConvert('expression', (v) => v as String? ?? ''),
        );
        return val;
      },
    );

Map<String, dynamic> _$TplStringToJson(TplString instance) => <String, dynamic>{
      'expression': instance.expression,
    };
