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
        $checkedConvert('className', (v) => val.className = v as String);
        $checkedConvert(
            'child',
            (v) => val.child = const SpanningWidgetJsonConverter()
                .fromJson(v as Map<String, dynamic>?));
        $checkedConvert('width', (v) => val.width = v);
        $checkedConvert('flex', (v) => val.flex = v);
        return val;
      },
    );

Map<String, dynamic> _$TplPartitionToJson(TplPartition instance) =>
    <String, dynamic>{
      'className': instance.className,
      'child': const SpanningWidgetJsonConverter().toJson(instance.child),
      'width': instance.width,
      'flex': instance.flex,
    };
