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
        $checkedConvert('t', (v) => val.t = v as String);
        $checkedConvert(
            'child',
            (v) => val.child = const WidgetJsonConverter()
                .fromJson(v as Map<String, dynamic>?));
        $checkedConvert('fit', (v) => val.fit = v);
        $checkedConvert('angle', (v) => val.angle = v);
        $checkedConvert('text', (v) => val.text = v);
        $checkedConvert(
            'style',
            (v) => val.style = v == null
                ? null
                : TplTextStyle.fromJson(v as Map<String, dynamic>));
        return val;
      },
    );

Map<String, dynamic> _$TplWatermarkToJson(TplWatermark instance) =>
    <String, dynamic>{
      't': instance.t,
      'child': const WidgetJsonConverter().toJson(instance.child),
      'fit': instance.fit,
      'angle': instance.angle,
      'text': instance.text,
      'style': instance.style?.toJson(),
    };
