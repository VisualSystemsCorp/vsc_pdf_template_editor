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
          width: $checkedConvert('width', (v) => v as String?),
          height: $checkedConvert('height', (v) => v as String?),
          decoration: $checkedConvert(
              'decoration',
              (v) => v == null
                  ? null
                  : TplBoxDecoration.fromJson(v as Map<String, dynamic>)),
          child: $checkedConvert(
              'child',
              (v) => const WidgetJsonConverter()
                  .fromJson(v as Map<String, dynamic>?)),
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
      'decoration': instance.decoration?.toJson(),
      'child': const WidgetJsonConverter().toJson(instance.child),
    };
