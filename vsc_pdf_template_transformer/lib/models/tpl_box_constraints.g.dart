// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_box_constraints.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplBoxConstraints _$TplBoxConstraintsFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TplBoxConstraints',
      json,
      ($checkedConvert) {
        final val = TplBoxConstraints(
          minWidth: $checkedConvert(
              'minWidth', (v) => (v as num?)?.toDouble() ?? 0.0),
          maxWidth: $checkedConvert(
              'maxWidth', (v) => (v as num?)?.toDouble() ?? 100000000000.0),
          minHeight: $checkedConvert(
              'minHeight', (v) => (v as num?)?.toDouble() ?? 0.0),
          maxHeight: $checkedConvert(
              'maxHeight', (v) => (v as num?)?.toDouble() ?? 10000000000.0),
        );
        return val;
      },
    );

Map<String, dynamic> _$TplBoxConstraintsToJson(TplBoxConstraints instance) =>
    <String, dynamic>{
      'minWidth': instance.minWidth,
      'maxWidth': instance.maxWidth,
      'minHeight': instance.minHeight,
      'maxHeight': instance.maxHeight,
    };
