// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tpl_watermark.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TplWatermark _$TplWatermarkFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'TplWatermark',
      json,
      ($checkedConvert) {
        final val = TplWatermark();
        $checkedConvert('className', (v) => val.className = v as String);
        $checkedConvert(
            'child',
            (v) => val.child = const WidgetJsonConverter()
                .fromJson(v as Map<String, dynamic>?));
        $checkedConvert('fit', (v) => val.fit = v);
        $checkedConvert('angle', (v) => val.angle = v);
        return val;
      },
    );

Map<String, dynamic> _$TplWatermarkToJson(TplWatermark instance) =>
    <String, dynamic>{
      'className': instance.className,
      'child': const WidgetJsonConverter().toJson(instance.child),
      'fit': instance.fit,
      'angle': instance.angle,
    };
