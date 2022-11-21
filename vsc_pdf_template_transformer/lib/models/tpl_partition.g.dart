// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_partition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplPartition _$TplPartitionFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TplPartition',
      json,
      ($checkedConvert) {
        final val = TplPartition();
        $checkedConvert('t', (v) => val.t = v as String);
        $checkedConvert(
            'child',
            (v) => val.child = const WidgetJsonConverter()
                .fromJson(v as Map<String, dynamic>?));
        $checkedConvert('width', (v) => val.width = v);
        $checkedConvert('flex', (v) => val.flex = v);
        return val;
      },
    );

Map<String, dynamic> _$TplPartitionToJson(TplPartition instance) =>
    <String, dynamic>{
      't': instance.t,
      'child': const WidgetJsonConverter().toJson(instance.child),
      'width': instance.width,
      'flex': instance.flex,
    };
