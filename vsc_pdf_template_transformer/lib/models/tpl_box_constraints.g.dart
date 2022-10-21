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
        final val = TplBoxConstraints();
        $checkedConvert('minWidth', (v) => val.minWidth = v);
        $checkedConvert('maxWidth', (v) => val.maxWidth = v);
        $checkedConvert('minHeight', (v) => val.minHeight = v);
        $checkedConvert('maxHeight', (v) => val.maxHeight = v);
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
