// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_container.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplContainer _$TplContainerFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TplContainer',
      json,
      ($checkedConvert) {
        final val = TplContainer(
          width: $checkedConvert('width', (v) => (v as num?)?.toDouble()),
          height: $checkedConvert('height', (v) => (v as num?)?.toDouble()),
        );
        $checkedConvert('className', (v) => val.className = v as String);
        return val;
      },
    );

Map<String, dynamic> _$TplContainerToJson(TplContainer instance) =>
    <String, dynamic>{
      'className': instance.className,
      'width': instance.width,
      'height': instance.height,
    };
