// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_partitions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplPartitions _$TplPartitionsFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TplPartitions',
      json,
      ($checkedConvert) {
        final val = TplPartitions();
        $checkedConvert('t', (v) => val.t = v as String);
        $checkedConvert(
            'children',
            (v) => val.children = (v as List<dynamic>?)
                ?.map((e) => TplPartition.fromJson(e as Map<String, dynamic>))
                .toList());
        $checkedConvert('mainAxisSize', (v) => val.mainAxisSize = v);
        return val;
      },
    );

Map<String, dynamic> _$TplPartitionsToJson(TplPartitions instance) =>
    <String, dynamic>{
      't': instance.t,
      'children': instance.children?.map((e) => e.toJson()).toList(),
      'mainAxisSize': instance.mainAxisSize,
    };
